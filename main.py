import sys
import datetime
from pathlib import Path

from PySide6.QtCore import QObject, Slot
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine, QmlElement
from PySide6.QtQuickControls2 import QQuickStyle
from PySide6.QtWidgets import QApplication, QDialog, QMainWindow, QPushButton


class Hasspow(QObject):
    def __init__(self):
        QObject.__init__(self)

    @Slot()
    def sysreb(self):
        print("System Reboot")   
    @Slot()
    def syseve(self):
        print("Events")
    @Slot()
    def syssta(self):
        print("States")
    @Slot()
    def sysser(self):
        print("Services")
    @Slot()
    def syshea(self):
        print("Health")
        
if __name__ == "__main__":
    
    app = QGuiApplication(sys.argv)
    QQuickStyle.setStyle("Material")
    engine = QQmlApplicationEngine()

    backend = Hasspow()
    engine.rootContext().setContextProperty("backend", backend)
    
    qml_file = Path(__file__).parent / 'main.qml'
    engine.load(qml_file)
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec())
