import qs.services
import qs.modules.common
import QtQuick
import QtQuick.Layouts
import qs.modules.ii.bar as Bar

MouseArea {
    id: root
    property bool alwaysShowAllResources: false
    implicitHeight: columnLayout.implicitHeight + 15
    implicitWidth: columnLayout.implicitWidth
    hoverEnabled: !Config.options.bar.tooltips.clickToShow

    ColumnLayout {
        id: columnLayout
        spacing: 10
        anchors.centerIn: parent

        Resource {
            Layout.alignment: Qt.AlignHCenter
            iconName: "memory"
            shown: Config.options.bar.resources.alwaysShowRam
            percentage: ResourceUsage.memoryUsedPercentage
            warningThreshold: Config.options.bar.resources.memoryWarningThreshold
        }

        Resource {
            Layout.alignment: Qt.AlignHCenter
            iconName: "planner_review"
            shown: Config.options.bar.resources.alwaysShowCpu
            percentage: ResourceUsage.cpuUsage
            warningThreshold: Config.options.bar.resources.cpuWarningThreshold
        }

        Resource {
            Layout.alignment: Qt.AlignHCenter
            iconName: "thermostat"
            shown: Config.options.bar.resources.alwaysShowCpuTemp
            percentage: ResourceUsage.cpuTemp / 100
        }

        Resource {
            Layout.alignment: Qt.AlignHCenter
            iconName: "hard_drive"
            shown: Config.options.bar.resources.alwaysShowDisk
            percentage: ResourceUsage.diskUsedPercentage
        }

        Resource {
            Layout.alignment: Qt.AlignHCenter
            iconName: "swap_horiz"
            shown: Config.options.bar.resources.alwaysShowSwap
            percentage: ResourceUsage.swapUsedPercentage
            warningThreshold: Config.options.bar.resources.swapWarningThreshold
        }
    }

    Loader {
        active: Config.options.bar.resources.expressivePopup
        source: "../bar/ExpressiveResourcesPopup.qml"
        onLoaded: item.hoverTarget = root
    }

    Loader {
        active: !Config.options.bar.resources.expressivePopup
        source: "../bar/ResourcesPopup.qml"
        onLoaded: item.hoverTarget = root
    }
}
