#ifndef LOCALMUSICMODEL_H
#define LOCALMUSICMODEL_H

#include <QObject>
#include <QSqlTableModel>

class LocalMusicModel : public QSqlTableModel
{
    Q_OBJECT

public:
    explicit LocalMusicModel(QObject *parent = nullptr);
    QVariant data(const QModelIndex &index, int role) const Q_DECL_OVERRIDE;
    QHash<int, QByteArray> roleNames() const Q_DECL_OVERRIDE;

    Q_INVOKABLE void reloadMusicRecord(const QString &path);

private:
};

#endif // LOCALMUSICMODEL_H
