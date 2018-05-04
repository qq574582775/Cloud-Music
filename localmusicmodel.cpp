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

void LocalMusicModel::reloadMusicRecord(const QString &path)
{
    QDir dir(path);
    if(!dir.exists())
        return;

    QFileInfoList list = dir.entryInfoList();
    qDebug() << "     Bytes Filename";
    for (int i = 0; i < list.size(); ++i) {
      QFileInfo fileInfo = list.at(i);
      qDebug() << qPrintable(QString("%1 %2").arg(fileInfo.size(), 10)
                                              .arg(fileInfo.fileName()));
    }
    return ;

//    QSqlRecord newRecord = record();
//    newRecord.setValue("author", "Me");
//    newRecord.setValue("recipient", recipient);
//    newRecord.setValue("timestamp", timestamp);
//    newRecord.setValue("message", message);
//    if (!insertRecord(rowCount(), newRecord)) {
//        qWarning() << "Failed to send message:" << lastError().text();
//        return;
//    }

//    submitAll();//提交数据库
}

