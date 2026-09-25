FILESEXTRAPATHS:prepend := "${THISDIR}/connman:"
SRC_URI += "file://settings \
            file://connman-dbus.conf"

do_install:append() {
    install -d ${D}/var/lib/connman/
    install -m 644 ${UNPACKDIR}/settings ${D}/var/lib/connman/settings
    install -d ${D}/etc/dbus-1/system.d/
    install -m 644 ${UNPACKDIR}/connman-dbus.conf ${D}/etc/dbus-1/system.d/connman.conf
}

# Reuse OE-Core packaging with the current Asteroid/Hoki source version.
PV = "2.0"
SRC_URI[sha256sum] = "d25c2ddc0b5ad13e986ec35ad765ae8d2f4b7acb47c958a05616c943cd082527"
PR = "r7"

SRC_URI += " \
    file://0001-gsupplicant-respect-personal-authentication-capabilities.patch \
    file://0003-device-reconcile-power-requests-after-completion.patch \
"

# The supplicant fixes allow normal optional PMF policy; no Hoki override.

SRC_URI += " file://0005-technology-enforce-offline-mode-on-rfkill-add.patch"
SRC_URI += " file://0006-gsupplicant-handle-autonomous-p2p-groups.patch"

SRC_URI += " file://0001-wifi-reset-interface-readiness-on-recreation.patch"
