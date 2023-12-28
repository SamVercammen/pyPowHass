import QtQuick 6.5
import QtQuick.Controls 6.5

ApplicationWindow {
    id: root
    width: 800
    height: 480
    visible: true
    Material.theme: Material.Dark
    flags: Qt.FramelessWindowHint | Qt.Window
    x: 0
    y: 0
    title: "Hass Power Screen"
    FontLoader {source: "font/" }
    color: "#25252c"

    StackView {
        id: stack
        initialItem: mainView
        anchors.fill: parent
        pushEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to:1
                duration: 200
            }
        }
        pushExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to:0
                duration: 200
            }
        }
    }
    Component {
        id: mainView
        Grid {
            id: grid
            property url property: "This is a string"
            x: 0
            y: 91
            width: 800
            height: 389
            rowSpacing: none.none
            rightPadding: 0
            leftPadding: 0
            topPadding: 0
            spacing: 0
            rows: 3
            columns: 1
            anchors.fill: parent
            Image {
                id: design_services_FILL0_wght400_GRAD0_opsz241
                x: 36
                y: 7
                width: 36
                height: 85
                source: "images/dashboard_FILL0_wght400_GRAD0_opsz24.svg"
                sourceSize.height: 36
                sourceSize.width: 36
                fillMode: Image.PreserveAspectFit
            }
            Text {
                id: text1
                x: 50
                y: 0
                width: 250
                height: 83
                color: "#fbfbfb"
                text: qsTr("Dashboard")
                font.pixelSize: 40
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                layer.enabled: true
                leftPadding: 36
                topPadding: 24
                font.weight: Font.Bold
                font.bold: false
                font.family: "Poppins"
            }
            Button {
                id: button
                x: 560
                y: 20
                width: 184
                height: 51
                visible: true
                text: qsTr("Reboot System")
                anchors.right: parent.right
                anchors.rightMargin: 36
                transformOrigin: Item.Center
                font.bold: true
                font.family: "Poppins"
                flat: false
                icon.source: "images/dns.png"
                display: AbstractButton.TextBesideIcon
                highlighted: true
                leftInset: 0
                onClicked: {backend.sysreb(), dialog.open()}
                Material.foreground: Material.Grey
                Material.background: Material.Indigo
            }
            Dialog {
                id: dialog
                title: "Reboot?"
                standardButtons: Dialog.Ok | Dialog.Cancel
                anchors.centerIn: Overlay.overlay
                Label {
                    text: "Are you sure you want to reboot the system?"
                }
                onAccepted: console.log("Ok clicked")
                onRejected: console.log("Cancel clicked")
            }
            Grid {
                id: grid1
                property url property: "This is a string"
                x: 0
                y: 100
                width: 800
                height: 389
                rowSpacing: none.none
                rightPadding: 36
                leftPadding: 36
                topPadding: 0
                spacing: 36
                rows: 2
                columns: 2

                Rectangle {
                    id: rectangle1
                    width: 346
                    height: 128
                    color: "#181a1e"
                    radius: 20
                    border.width: 0
                    layer.enabled: true
                    z: 0
                    baselineOffset: 744

                    Rectangle {
                        id: rectangle6
                        x: 24
                        y: 26
                        width: 80
                        height: 80
                        color: "#cfe8ff"
                        radius: 10
                        border.width: 0

                        Image {
                            id: event_list_FILL0_wght400_GRAD0_opsz24
                            x: 22
                            y: 22
                            width: 36
                            height: 36
                            source: "images/event_list_FILL0_wght400_GRAD0_opsz24.svg"
                            layer.enabled: true
                            sourceSize.height: 36
                            sourceSize.width: 36
                            fillMode: Image.PreserveAspectFit
                        }

                        Text {
                            id: text2
                            x: 81
                            y: 12
                            width: 211
                            height: 29
                            color: "#fbfbfb"
                            text: qsTr("1.074")
                            font.pixelSize: 24
                            style: Text.Raised
                            leftPadding: 24
                            font.styleName: "SemiBold"
                            font.family: "Poppins"
                        }

                        Text {
                            id: text3
                            x: 81
                            y: 43
                            width: 211
                            height: 29
                            color: "#fbfbfb"
                            text: qsTr("Events")
                            font.pixelSize: 16
                            font.styleName: "Medium"
                            font.family: "Poppins"
                            leftPadding: 24
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            backend.syseve()
                            stack.push(eventView)
                        }          
                    }
                }

                Rectangle {
                    id: rectangle2
                    width: 346
                    height: 128
                    color: "#181a1e"
                    radius: 20
                    layer.enabled: true

                    Rectangle {
                        id: rectangle7
                        x: 24
                        y: 26
                        width: 80
                        height: 80
                        color: "#fff2c6"
                        radius: 10
                       border.width: 0

                        Image {
                            id: design_services_FILL0_wght400_GRAD0_opsz24
                            x: 22
                            y: 22
                            width: 36
                            height: 36
                            source: "images/design_services_FILL0_wght400_GRAD0_opsz24.svg"
                            layer.enabled: true
                            sourceSize.height: 36
                            sourceSize.width: 36
                            fillMode: Image.PreserveAspectFit
                        }

                        Text {
                            id: text4
                            x: 81
                            y: 12
                            width: 211
                            height: 29
                            color: "#fbfbfb"
                            text: qsTr("1.074")
                            font.pixelSize: 24
                            style: Text.Raised
                            leftPadding: 24
                            font.styleName: "SemiBold"
                            font.family: "Poppins"
                        }

                        Text {
                            id: text5
                            x: 81
                            y: 43
                            width: 211
                            height: 29
                            color: "#fbfbfb"
                            text: qsTr("States")
                            font.pixelSize: 16
                            leftPadding: 24
                            font.styleName: "Medium"
                            font.family: "Poppins"
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            backend.syssta()
                            stack.push(stateView)
                        }          
                    }
                }

                Rectangle {
                    id: rectangle3
                    width: 346
                    height: 128
                    color: "#181a1e"
                    radius: 20
                    layer.enabled: true

                    Rectangle {
                        id: rectangle8
                        x: 24
                        y: 27
                        width: 80
                        height: 80
                        color: "#bbf7d0"
                        radius: 10
                        border.width: 0

                        Image {
                            id: feedback_FILL0_wght400_GRAD0_opsz24
                            x: 22
                            y: 22
                            width: 36
                            height: 36
                            source: "images/feedback_FILL0_wght400_GRAD0_opsz24.svg"
                            layer.enabled: true
                            antialiasing: true
                            smooth: false
                            sourceSize.height: 36
                            sourceSize.width: 36
                            fillMode: Image.PreserveAspectFit
                        }

                        Text {
                            id: text6
                            x: 81
                            y: 12
                            width: 211
                            height: 29
                            color: "#fbfbfb"
                            text: qsTr("1.074")
                            font.pixelSize: 24
                            style: Text.Raised
                            leftPadding: 24
                            font.styleName: "SemiBold"
                            font.family: "Poppins"
                        }

                        Text {
                            id: text7
                            x: 81
                            y: 43
                            width: 211
                            height: 29
                            color: "#fbfbfb"
                            text: qsTr("Services")
                            font.pixelSize: 16
                            leftPadding: 24
                            font.styleName: "Medium"
                            font.family: "Poppins"
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            backend.sysser()
                            stack.push(serviceView)
                        }          
                    }
                }

                Rectangle {
                    id: rectangle4
                    width: 346
                    height: 128
                    color: "#181a1e"
                    radius: 20
                    layer.enabled: true

                    Rectangle {
                        id: rectangle9
                        x: 24
                        y: 27
                        width: 80
                        height: 80
                        color: "#fecdd3"
                        radius: 10
                        border.width: 0

                        Image {
                            id: favorite_FILL0_wght400_GRAD0_opsz24
                            x: 22
                            y: 22
                            width: 36
                            height: 36
                            source: "images/favorite_FILL0_wght400_GRAD0_opsz24.svg"
                            layer.enabled: true
                            sourceSize.height: 36
                            sourceSize.width: 36
                            fillMode: Image.PreserveAspectFit
                        }

                        Text {
                            id: text8
                            x: 81
                            y: 12
                            width: 211
                            height: 29
                            color: "#fbfbfb"
                            text: qsTr("1.074")
                            font.pixelSize: 24
                            style: Text.Raised
                            leftPadding: 24
                            font.styleName: "SemiBold"
                            font.family: "Poppins"
                        }

                        Text {
                            id: text9
                            x: 81
                            y: 43
                            width: 211
                            height: 29
                            color: "#fbfbfb"
                            text: qsTr("Health")
                            font.pixelSize: 16
                            leftPadding: 24
                            font.styleName: "Medium"
                            font.family: "Poppins"
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            backend.syshea()
                            stack.push(healthView)
                        }          
                    }
                }


            }
        }
    }
    Component {
        id: eventView
        Grid {
            id: gridEV
            property url property: "This is a string"
            x: 0
            y: 91
            width: 800
            height: 389
            rowSpacing: none.none
            rightPadding: 0
            leftPadding: 0
            topPadding: 0
            spacing: 0
            rows: 3
            columns: 1
            anchors.fill: parent
            Text {
                id: text1
                x: 0
                y: 0
                width: 308
                height: 85
                color: "#fbfbfb"
                text: qsTr("Events")
                font.pixelSize: 40
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                layer.enabled: true
                leftPadding: 36
                topPadding: 24
                font.weight: Font.Bold
                font.bold: false
                font.family: "Poppins"
            }
            Button {
                id: button
                x: 580
                y: 20
                width: 64
                height: 64
                visible: true
                anchors.right: parent.right
                anchors.rightMargin: 36
                transformOrigin: Item.Center
                font.bold: true
                font.family: "Poppins"
                flat: true
                icon.source: "images/cancel_FILL0_wght400_GRAD0_opsz24.svg"
                display: AbstractButton.Icon
                highlighted: false
                leftInset: 0
                onClicked: stack.push(mainView)
                Material.foreground: Material.BlueGrey
                Material.background: {Universal.Cobalt,Material.Shade200}
            }
        }
    }
    Component {
        id: stateView
        Grid {
            id: gridST
            property url property: "This is a string"
            x: 0
            y: 91
            width: 800
            height: 389
            rowSpacing: none.none
            rightPadding: 0
            leftPadding: 0
            topPadding: 0
            spacing: 0
            rows: 3
            columns: 1
            anchors.fill: parent
            Text {
                id: text1
                x: 0
                y: 0
                width: 308
                height: 85
                color: "#fbfbfb"
                text: qsTr("States")
                font.pixelSize: 40
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                layer.enabled: true
                leftPadding: 36
                topPadding: 24
                font.weight: Font.Bold
                font.bold: false
                font.family: "Poppins"
            }
            Button {
                id: button
                x: 580
                y: 20
                width: 64
                height: 64
                visible: true
                anchors.right: parent.right
                anchors.rightMargin: 36
                transformOrigin: Item.Center
                font.bold: true
                font.family: "Poppins"
                flat: true
                icon.source: "images/cancel_FILL0_wght400_GRAD0_opsz24.svg"
                display: AbstractButton.Icon
                highlighted: false
                leftInset: 0
                onClicked: stack.push(mainView)
                Material.foreground: Material.BlueGrey
                Material.background: {Universal.Cobalt,Material.Shade200}
            }
        }
    }
    Component {
        id: serviceView
        Grid {
            id: gridSE
            property url property: "This is a string"
            x: 0
            y: 91
            width: 800
            height: 389
            rowSpacing: none.none
            rightPadding: 0
            leftPadding: 0
            topPadding: 0
            spacing: 0
            rows: 3
            columns: 1
            anchors.fill: parent
            Text {
                id: text1
                x: 0
                y: 0
                width: 308
                height: 85
                color: "#fbfbfb"
                text: qsTr("Services")
                font.pixelSize: 40
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                layer.enabled: true
                leftPadding: 36
                topPadding: 24
                font.weight: Font.Bold
                font.bold: false
                font.family: "Poppins"
            }
            Button {
                id: button
                x: 580
                y: 20
                width: 64
                height: 64
                visible: true
                anchors.right: parent.right
                anchors.rightMargin: 36
                transformOrigin: Item.Center
                font.bold: true
                font.family: "Poppins"
                flat: true
                icon.source: "images/cancel_FILL0_wght400_GRAD0_opsz24.svg"
                display: AbstractButton.Icon
                highlighted: false
                leftInset: 0
                onClicked: stack.push(mainView)
                Material.foreground: Material.BlueGrey
                Material.background: {Universal.Cobalt,Material.Shade200}
            }
        }
    }
    Component {
        id: healthView
        Grid {
            id: gridHE
            property url property: "This is a string"
            x: 0
            y: 91
            width: 800
            height: 389
            rowSpacing: none.none
            rightPadding: 0
            leftPadding: 0
            topPadding: 0
            spacing: 0
            rows: 3
            columns: 1
            anchors.fill: parent
            Text {
                id: text1
                x: 0
                y: 0
                width: 308
                height: 85
                color: "#fbfbfb"
                text: qsTr("Health")
                font.pixelSize: 40
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                layer.enabled: true
                leftPadding: 36
                topPadding: 24
                font.weight: Font.Bold
                font.bold: false
                font.family: "Poppins"
            }
            Button {
                id: button
                x: 580
                y: 20
                width: 64
                height: 64
                visible: true
                anchors.right: parent.right
                anchors.rightMargin: 36
                transformOrigin: Item.Center
                font.bold: true
                font.family: "Poppins"
                flat: true
                icon.source: "images/cancel_FILL0_wght400_GRAD0_opsz24.svg"
                display: AbstractButton.Icon
                highlighted: false
                leftInset: 0
                onClicked: stack.push(mainView)
                Material.foreground: Material.BlueGrey
                Material.background: {Universal.Cobalt,Material.Shade200}
            }
        }
    }

    Rectangle {
        id: rectangle5
        x: 0
        y: 423
        width: 800
        height: 58
        color: "#181a1e"
        radius: 0
        border.width: 0
        Text {
            id: messageBox
            text: socket.status == WebSocket.Open ? qsTr("Sending...") : qsTr("Welcome!")
            anchors.centerIn: parent
            color: "#fbfbfb"
            font.pixelSize: 16
            leftPadding: 24
            font.styleName: "Medium"
            font.family: "Poppins"
            width: 211
            height: 29
        }
    }
}