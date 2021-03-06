# As it can not overwrite the version in the layer meta-fsl-arm, we have to use
#   another file extension for new patch to the append in the meta-fsl-arm

# Append path for freescale layer to include alsa-state asound.conf
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

PACKAGE_ARCH_mx6 = "${MACHINE_ARCH}"
PACKAGE_ARCH_mx5 = "${MACHINE_ARCH}"
PACKAGE_ARCH_mxs = "${MACHINE_ARCH}"

PRINC := "${@int(PRINC) + 1}"

SRC_URI_append_mx6 = " file://asound.conf.3.10.17 \
	file://asound.state.3.10.17 \
"

do_install_append_mx6() {
    install -m 0644 ${WORKDIR}/asound.conf.3.10.17 ${D}${sysconfdir}/asound.conf
    install -m 0644 ${WORKDIR}/asound.state.3.10.17 ${D}${localstatedir}/lib/alsa/asound.state
}

