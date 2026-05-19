import QtQuick
import Quickshell
import qs
import qs.services
import qs.modules.common
import qs.modules.common.functions
import qs.modules.common.widgets

QuickToggleModel {
    name: Translation.tr("LocalSend")
    statusText: LocalSend.serverRunning ? Translation.tr("Active") : Translation.tr("Offline")

    toggled: LocalSend.serverRunning
    icon: "share"
    hasMenu: true
    
    mainAction: () => {
        if (LocalSend.serverRunning) {
            LocalSend.stopServer();
        } else {
            LocalSend.startServer();
        }
    }

    tooltipText: Translation.tr("LocalSend File Share")
}
