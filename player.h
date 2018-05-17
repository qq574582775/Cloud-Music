#ifndef PLAYER_H
#define PLAYER_H

#include <QObject>
#include <QMediaPlayer>

class Player : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int currentPosition READ getCurrentPosition WRITE setCurrentPosition)
public:
    explicit Player(QObject *parent = nullptr);
    int getCurrentPosition() {return currentPosition;}
    void setCurrentPosition(int val){currentPosition = val;}

signals:
    void currentPositionChanged(QString);
    void updateTotalTime(int);
    void musicChanged(QString);

public slots:
    void playSL(QString);


private slots:
    void positionChanged(qint64);
    void durationChanged(qint64);

private:
    QMediaPlayer m_player;
    int m_currentTotalTime;
    int currentPosition;
};

#endif // PLAYER_H
