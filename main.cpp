#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "localmusicmodel.h"
#include "player.h"

#include <QStandardPaths>
#include <QSqlDatabase>
#include <QSqlError>
#include <QtQml>

static void connectToDatabase()
{
    QSqlDatabase database = QSqlDatabase::database();
    if (!database.isValid()) {
        database = QSqlDatabase::addDatabase("QSQLITE");
        if (!database.isValid())
            qFatal("Cannot add database: %s", qPrintable(database.lastError().text()));
    }

    const QDir writeDir = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
    if (!writeDir.mkpath("."))
        qFatal("Failed to create writable directory at %s", qPrintable(writeDir.absolutePath()));

    // Ensure that we have a writable location on all devices.
    const QString fileName = writeDir.absolutePath() + "/music-database.db";
    // When using the SQLite driver, open() will create the SQLite database if it doesn't exist.
    database.setDatabaseName(fileName);
    if (!database.open()) {
        qFatal("Cannot open database: %s", qPrintable(database.lastError().text()));
        QFile::remove(fileName);
    }
}


int main(int argc, char *argv[])
{
#if defined(Q_OS_WIN)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    //qmlRegisterType<Player>("qt.Player", 1, 0, "Player");

    QGuiApplication app(argc, argv);
    connectToDatabase();
    QQmlApplicationEngine engine;

    qmlRegisterType<LocalMusicModel>("io.qt.CloudMusic", 1, 0, "LocalMusicModel");
    Player mPlayer;
    engine.rootContext()->setContextProperty("Player",&mPlayer);



    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
