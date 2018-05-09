#include "localmusicmodel.h"

#include <QDateTime>
#include <QSqlRecord>
#include <QDebug>
#include <QSqlError>
#include <QSqlQuery>
#include <QDir>


static const char *localMusicTableName = "LocalMusicInfo";

static void createTable()
{
    if (QSqlDatabase::database().tables().contains(localMusicTableName)) {
        // The table already exists; we don't need to do anything.
        return;
    }

    QSqlQuery query;
    QString sql_ = QStringLiteral("CREATE TABLE IF NOT EXISTS [LocalMusicInfo] (         \
                                  [title] VARCHAR2 , \
                                  [singer] VARCHAR2 , \
                                  [album] VARCHAR2 , \
                                  [duration] INTEGER ,\
                                  [path] VARCHAR2 NOT NULL ,          \
                                  UNIQUE([path]) ON CONFLICT REPLACE \
                                  )");


    if (!query.exec(sql_)) {
        qFatal("Failed to query database: %s", qPrintable(query.lastError().text()));
    }

    query.exec("INSERT INTO LocalMusicInfo VALUES('title', 'singer', 'album', 123,'c://')");
}


LocalMusicModel::LocalMusicModel(QObject *parent)
    : QSqlTableModel(parent)
{
    createTable();
    setTable(localMusicTableName);
    /*可以看到这个模型很强大，而且完全脱离了SQL语句，就算你不怎么懂数据库，
     * 也可以利用它进行大部分常用的操作。这个模型提供了缓冲区，可以将所有修改先保存到model中，
     * 只有当我们执行提交修改后，才会真正写入数据库。当然这也是因为我们在最开始设置了它的保存策略：
    submitAll();   revertAll();*/
    setEditStrategy(QSqlTableModel::OnManualSubmit);
    player = CreateZPlay();
}

QVariant LocalMusicModel::data(const QModelIndex &index, int role) const
{
    if (role < Qt::UserRole)
            return QSqlTableModel::data(index, role);

    const QSqlRecord sqlRecord = record(index.row());
    return sqlRecord.value(role - Qt::UserRole);
}

QHash<int, QByteArray> LocalMusicModel::roleNames() const
{
    QHash<int, QByteArray> names;
    names[Qt::UserRole] = "title";
    names[Qt::UserRole + 1] = "singer";
    names[Qt::UserRole + 2] = "album";
    names[Qt::UserRole + 3] = "duration";
    names[Qt::UserRole + 4] = "path";
    return names;
}

void LocalMusicModel::reloadMusicRecord(const QString &path_)
{
//
//    if(zplayer->OpenFile("f:\\music\\Justin Bieber-Love Yourself.mp3", sfAutodetect) == 0)
//       {
//          return;
//       }
//    zplayer->Play();

//    QString path = path_.right(path_.length()-8);
//    QDir dir(path);
//    if(!dir.exists())
//        return;

//    QFileInfoList list = dir.entryInfoList();
//    qDebug() << "     Bytes Filename";
//    for (int i = 0; i < list.size(); ++i) {
//      QFileInfo fileInfo = list.at(i);
//      qDebug() << fileInfo.absoluteFilePath();

//    }

    parseMusicInfo(path_);
}

//获取指定目录下所有歌曲信息
void LocalMusicModel::parseMusicInfo(QString path)
{
    QList<songInfo> songRecords;
    QStringList dirList=path.split(",");
    QString temp;
    foreach (temp, dirList) {
        temp=temp.right(temp.length()-8);
        QDir dir(temp);
        dir.setNameFilters(QStringList() << "*.mp3" << "*.flac" << "*.wav");
        QFileInfoList fileList=dir.entryInfoList();
        QFileInfo fileInfo;

        foreach (fileInfo, fileList) {
            TID3InfoEx id3_info;
            //如果直接使用LoadFileID3Ex函数，会得不到时长信息
            if(player->OpenFile((const char*) fileInfo.absoluteFilePath().toLocal8Bit(),sfAutodetect))
                if(player->LoadID3Ex(&id3_info,1))
                {
                    songInfo tempSongInfo;
                    tempSongInfo.title = QString::fromLocal8Bit(id3_info.Title);    //音乐标题
                    tempSongInfo.Artist = QString::fromLocal8Bit(id3_info.Artist);  //歌手
                    tempSongInfo.path = fileInfo.absoluteFilePath();                //路径
                    tempSongInfo.album = QString::fromLocal8Bit(id3_info.Album);    //专辑
                    // get stream info,获取时长信息
                    TStreamInfo pInfo;
                    player->GetStreamInfo(&pInfo);
                    tempSongInfo.duration =pInfo.Length.sec;
                    songRecords.append(tempSongInfo);
                }
                else
                {
                    qDebug() << QString("No ID3 data:%1\r\n\r\n").arg(QString::fromLocal8Bit(player->GetError()));
                }
            else
            {
                qDebug() << "LoadID3Ex faild";
            }
        }
    }


    QSqlRecord newRecord = record();
    for(auto songItem : songRecords)
    {
        newRecord.setValue("title", songItem.title);
        newRecord.setValue("singer", songItem.Artist);
        newRecord.setValue("album", songItem.album);
        newRecord.setValue("duration", songItem.duration);
        newRecord.setValue("path", songItem.path);

        if (!insertRecord(rowCount(), newRecord)) {
            qWarning() << "Failed to send message:" << lastError().text();
            return;
        }
    }

    submitAll();//提交数据库
}



//unsigned int sec=pInfo.Length.sec;
//QString minute=sec/60>=10?QString::number(sec/60):"0"+QString::number(sec/60);
//QString secs=sec%60>=10?QString::number(sec%60):"0"+QString::number(sec%60);
//tmpList.append("\"duration\":\""+QString(minute+":"+secs)+"\",");

//if(fileInfo.size()<1024*1024)    //KB
//    tmpList.append("\"size\":\""+QString(QString::number(fileInfo.size()/1024.0,'f',1)+"KB")+"\",");
//else    //MB
//    tmpList.push_back("\"size\":\""+QString(QString::number((float)fileInfo.size()/(1024*1024),'f',1)+"MB")+"\",");

//                if(songList.length()==0)
//            printf("Title:   %s\r\n", id3_info.Title);
//            printf("Artist:  %s\r\n", id3_info.Artist);
//            printf("Album:   %s\r\n", id3_info.Album);
//            printf("Year:    %s\r\n", id3_info.Year);
//            printf("Comment: %s\r\n", id3_info.Comment);
//            printf("Genre:   %s\r\n", id3_info.Genre);
//            printf("Track:   %s\r\n", id3_info.TrackNum);

//            printf("Artist1 :  %s\r\n", id3_info.AlbumArtist );
//            printf("Composer:  %s\r\n", id3_info.Composer );
//            printf("Original:  %s\r\n", id3_info.OriginalArtist );
//            printf("Copyright: %s\r\n", id3_info.Copyright );
//            printf("URL:       %s\r\n", id3_info.URL );
//            printf("Encoder:   %s\r\n", id3_info.Encoder );
//            printf("Publisher: %s\r\n", id3_info.Publisher );
//            printf("BPM:       %u\r\n", id3_info.BPM);
//            printf("MIME:      %s\r\n", id3_info.Picture.MIMEType);
//            printf("TYPE:      %u\r\n", id3_info.Picture.PictureType);
//            printf("Desc:      %s\r\n", id3_info.Picture.Description);
//printf("Size:      %u\r\n\r\n", id3_info.Picture.PictureDataSize);

