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

public:
    explicit LocalMusicModel(QObject *parent = nullptr);
    QVariant data(const QModelIndex &index, int role) const Q_DECL_OVERRIDE;
    QHash<int, QByteArray> roleNames() const Q_DECL_OVERRIDE;

    Q_INVOKABLE void reloadMusicRecord(const QString &path);

public slots:

private:
    void parseMusicInfo(QString path);

private:
    ZPlay *player;
};

#endif // LOCALMUSICMODEL_H
