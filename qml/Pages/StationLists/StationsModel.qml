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

import QtQuick 2.1
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0

// Okay, this is my plan: I either use a local copy or the newest version fetched from the internetz.

XmlListModel {
    id: stationsModel
    source: lib.localSource
            ? Qt.resolvedUrl("xml/asemat.xml")
            : "https://raw.githubusercontent.com/direc85/harbour-nettiradio/refs/heads/master/qml/Pages/StationLists/xml/asemat.xml"
    query: "/stationlist/item" //lib.query
    XmlRole {
        name: "source"
        query: "source/string()"
    }
    XmlRole {
        name: "title"
        query: "title/string()"
    }
    XmlRole {
        name: "site"
        query: "site/string()"
    }
    XmlRole {
        name: "section"
        query: "section/string()"
    }
    Component.onCompleted: console.log(source.toString()+" " + query)
}
