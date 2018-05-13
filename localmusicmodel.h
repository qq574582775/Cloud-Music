#ifndef LOCALMUSICMODEL_H
#define LOCALMUSICMODEL_H

#include <QObject>
#include <QSqlTableModel>
#include <QMediaPlayer>
#include "libzplay.h"
using namespace libZPlay;

struct songInfo
{
    QString Artist;
    QString title;
    QString album;
    qint32 duration = 0;
    QString path;

};

class LocalMusicModel : public QSqlTableModel
{
    Q_OBJECT
    Q_PROPERTY(int m_musicNum READ musicNum WRITE setMusicNum NOTIFY musicNumChanged)



public:
    explicit LocalMusicModel(QObject *parent = nullptr);
    QVariant data(const QModelIndex &index, int role) const Q_DECL_OVERRIDE;
    QHash<int, QByteArray> roleNames() const Q_DECL_OVERRIDE;

    Q_INVOKABLE void reloadMusicRecord(const QString &path);
    int musicNum(){return m_musicNum;}
    void setMusicNum(int val){
        m_musicNum = val;
        emit musicNumChanged();
    }

signals:
    void musicNumChanged();

private:
    void parseMusicInfo(QString path);
    void clearDb();

private:
    ZPlay *player;
    int m_musicNum = 0;

};

#endif // LOCALMUSICMODEL_H
