/*
  Copyright (C) 2015-2016 jollailija
  Contact: jollailija <jollailija@gmail.com>
  Copyright (C) 2019 Matti Viljanen
  Contact: Matti Viljanen <matti.viljanen@kapsi.fi>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * The names of the contributors may not be used to endorse or promote products
      derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

// AlphaMenu by r0kk3rz https://github.com/r0kk3rz/sailfish-alphabet-sort

import QtQuick 2.0
import Sailfish.Silica 1.0
import "StationLists"
import "functions.js" as TheFunctions

SilicaFlickable {   

    anchors.fill: parent
    clip: true
    VerticalScrollDecorator {}
    contentHeight: alphaMenu.height + Theme.paddingLarge *2

    PulleyMenu {
        MenuItem {
            text: qsTr("Valikko")
            onClicked: pageStack.push(Qt.resolvedUrl("Menu.qml"))
        }
    }

    AlphaMenu {

        id: alphaMenu
        dataSource: qmlListModel
        listDelegate:  BackgroundItem {
            width: parent.width
            onClicked: {
                lib.musicSource = (Qt.resolvedUrl(source))
                lib.radioStation = title
                //listPress.play()
                playStream()
                lib.website = (Qt.resolvedUrl(site))
                lib.panelOpen = true
            }

            Row {
                spacing: 20

                Label {
                    text: "   "
                    height: Theme.itemSizeHuge
                    font.pixelSize: Theme.fontSizeExtraLarge
                    color: Theme.secondaryColor
                }

                Column{
                    Label {
                        text: title
                        font.pixelSize: Theme.fontSizeMedium
                        color: highlighted
                               ? Theme.highlightColor
                               : Theme.primaryColor
                    }
                    Label {
                        text: section
                        font.pixelSize: Theme.fontSizeExtraSmall
                        color: highlighted
                               ? Theme.highlightColor
                               : Theme.primaryColor
                    }
                }
            }
        }
    }
}
