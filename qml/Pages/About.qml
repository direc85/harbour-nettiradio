/*
  Copyright (C) 2015-2016 jollailija
  Contact: jollailija <jollailija@gmail.com>
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

import QtQuick 2.1
import Sailfish.Silica 1.0

Page {
    id: page
    property var textAlignment: TextInput.AlignLeft
    SilicaFlickable {
        anchors.fill: parent
        clip: true
        contentHeight: header.height + version.height + text.height + links.height + flattr.height + Theme.paddingLarge * 4
        contentWidth: parent.width
        VerticalScrollDecorator {}

        PageHeader {
            id: header
            title: qsTr("Tietoa sovelluksesta") //About
        }
        Button {
            id: version
            anchors.top: header.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Versio ") + "2.0.0" + "-" + "1" //I don't know how to automate this just yet...
            onClicked: Qt.openUrlExternally("https://github.com/Jollailija/nettiradio/blob/master/rpm/harbour-nettiradio.changes")
        }

        TextArea {
            id: text
            anchors {
                top: version.bottom
                left: parent.left
                right: parent.right
            }
            readOnly: true
            text: qsTr("Tämä on sovellus kaikille suomalaisten nettiradioiden kuuntelijoille, tekijänä")+" jollailija.
Nettiradioiden streamitiedot ovat peräisin lähteestä www.mediamonitori.fi/index.php/nettiradiot
Kaikki radioasemat eivät lähetä nettistreamia Qt audioelementin ymmärtämässä formaatissa.

Lähdekoodi on saatavilla BSD-lisenssillä GitHubista ja sovelluksen uusimmat versiot löytyvät OpenRepos:ista (linkit alla).
Jos sinulla on kysymyksiä, asema- ja ominaisuustoiveita tai palautetta, voit kirjoittaa kommentin Kauppaan, OpenReposiin tai lähettää sähköpostia osoitteeseen jollailija@gmail.com

Kiitos Daxille avusta koodin kanssa, r0kk3rz:ille AlphaMenun tekemisestä, Mothille hienosta ikonista sekä coderusille, kimmolille ja monille muille, jotka ovat jakaneet neuvojaan devel-postilitalla. Suuri kiitos myös kaikille Flattr-lahjoittajille.

Thanks for all the support guys!"
            font.pixelSize: Screen.sizeCategory > Screen.Medium
                            ? Theme.fontSizeLarge * lib.fontSize
                            : Theme.fontSizeMedium * lib.fontSize
            horizontalAlignment: textAlignment
        }

        Row {
            id: links
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: text.bottom
            spacing: Theme.paddingLarge


            Button {
                text: qsTr("GitHub")
                onClicked: Qt.openUrlExternally("https://github.com/jollailija/nettiradio/")
            }
            Button {
                text: qsTr("OpenRepos")
                onClicked: Qt.openUrlExternally("https://openrepos.net/content/jollailija/finnish-net-radio-client-beta/")
            }
        }
        Button {
            anchors.top: links.bottom
            anchors.topMargin: Theme.paddingLarge * 1.5
            anchors.horizontalCenter: parent.horizontalCenter
            id: flattr
            text: qsTr("Lahjoita Flattrin kautta")
            onClicked: Qt.openUrlExternally("https://flattr.com/thing/4382591/Jollailijanettiradio-on-github")
        }
    }
}