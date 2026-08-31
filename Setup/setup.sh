#!/bin/sh

# --------------------------------------------------------
# environment
scriptpath=$(cd $(dirname $0) ; pwd)
username=${SUDO_USER}
userhome=$(getent passwd "${SUDO_USER}" | cut -d: -f6)


# --------------------------------------------------------
# root check
if [ "$(id -u)" != "0" ]; then
	echo must be run using sudo
	exit 1
fi


# --------------------------------------------------------
# confirm
echo "AUTD3 Kit PC setup start ok? (y/N)"
read ans
case $ans in
	[yY] | tes | YES )
		;;
	*)
		echo "about"
		exit 1
esac


# --------------------------------------------------------
# unmanage NetworkManager
nmconf=/etc/NetworkManager/NetworkManager.conf
ifname=eno1
if nmcli device status | grep "enp1s0" > /dev/null; then
	ifname="enp1s0"
fi
if grep -q "\[keyfile\]" "${nmconf}"; then
	echo "[skip] update ${nmconf}"
else
	echo "* unmanage ${ifname} from NetowrkManager" 

	# add section
	cat << EOS >> ${nmconf}

[keyfile]
unmanaged-devices=interface-name:${ifname}

EOS
	
	# restart Networkmanager 
	systemctl restart NetworkManager
fi


# --------------------------------------------------------
# add NIC up service
svsname=nic-up.service
svsfile=/etc/systemd/system/${svsname}
if [ -f ${svsfile} ]; then
	echo "[skip] register NIC start service"
else
	echo "* register ${svsname}" 

	# create servie file
	cat << EOS >> ${svsfile}
[Unit]
Description=EtherCAT NIC Start

[Service]
Type=oneshot
ExecStart=/usr/bin/ip link set ${ifname} up

[Install]
WantedBy=multi-user.target
EOS

	# add service
	systemctl daemon-reload > /dev/null
	systemctl enable ${svsname} > /dev/null
	systemctl start ${svsname} > /dev/null
fi


# --------------------------------------------------------
# allow python use raw socket
pypath=/usr/bin/python3.12
capval=cap_net_admin,cap_net_raw=eip
if getcap "${pypath}" | grep -q "${capval}"; then
	echo "[skip] setcap ${pypath}"
else
	echo "* setcap ${pypath}"
	setcap ${capval} ${pypath}
fi


# --------------------------------------------------------
# install japanese language package
if dpkg-query -W -f='${Status}' "language-pack-ja" 2> /dev/null | grep -q "ok"; then
	echo "[skip] install japanese language pack"
else
	echo "* install japanese language package"
	
	# install japanese language pack
	dpkg -i ${scriptpath}/base_packages_japanese/*.deb > /dev/null
	update-locale LANG=ja_JP.UTF-8
fi


# --------------------------------------------------------
# install python package
if dpkg-query -W -f='${Status}' "python3-pip" 2> /dev/null | grep -q "ok"; then
	echo "[skip] install Python pack"
else
	echo "* install Python package"
	
	# install python pack
	dpkg -i ${scriptpath}/python_packages/*.deb > /dev/null
fi


# --------------------------------------------------------
# install rust package
if dpkg-query -W -f='${Status}' "libpcap-dev" 2> /dev/null | grep -q "ok"; then
	echo "[skip] install Rust package"
else
	echo "* install Rust package"
	
	# install python pack
	dpkg -i ${scriptpath}/rust_packages/*.deb > /dev/null
fi


# --------------------------------------------------------
# install Rust
if type "rustc" > /dev/null 2>&1; then
	echo "[skip] install Rust"
else
	echo "* install Rust"

	# install Rust
	(
		cd
		mkdir install
		cd install
		tar -xvf ${scriptpath}/rust_install/rust-* > /dev/null
		cd rust-*
		sudo ./install.sh > /dev/null
		cd
		rm -rf install
	)
fi


# --------------------------------------------------------
# boot nomodeset
grubfile=/etc/default/grub
if [ "${ifname}" = "enp1s0" ]; then

	# for CONTEC BX-U200

	if grep -i "nomodeset" ${grubfile} >> /dev/null; then
		echo "[skip] update grub"
	else
		echo "* update grub"

		# add 'nomodeset'
		sed -i 's/quiet splash/quiet splash nomodeset/' ${grubfile}

		# update
		update-grub2
	fi
fi


# --------------------------------------------------------
# --------------------------------------------------------


# --------------------------------------------------------
# run as original user
venvdir=${userhome}/autd3env
termname="${userhome}/Desktop/AUTD3Terminal.desktop"
pythonsampledir="~/Desktop/PythonSample"
rustnsampledir="~/Desktop/RustSample"
sbus="unix:path=/run/user/`id -u ${username}`/bus"
su -l ${username} -c sh << EOS


# --------------------------------------------------------
# create python virtual environment
if [ -d ${venvdir} ]; then
	echo "[skip] create python virtual env"
else
	echo "* create python virtual environment : ${venvdir}"

	# create venv
	python3 -m venv ${venvdir} > /dev/null
fi


# --------------------------------------------------------
# install autd3 python module
. ${venvdir}/bin/activate
if python3 -m pip show "pyautd3" > /dev/null 2>&1; then
	echo "[skip] install autd3 Python module"
else
	echo "* install autd3 Python module"
	
	# install python autd3 module
	python3 -m pip install --no-index --find-links=${scriptpath}/python_autd3 numpy pyautd3 pyautd3_link_ethercrab > /dev/null
	
fi


# --------------------------------------------------------
# copy Python sample
if [ -d ${pythonsampledir} ]; then
	echo "[skip] copy Python sample"
else
	echo "* copy Python sample"

	# copy sample
	mkdir ${pythonsampledir}
	cp -r ${scriptpath}/python_sample/*.py ${pythonsampledir}
fi


# --------------------------------------------------------
# install autd3 Rust module
if [ -f ${scriptpath}/rust_autd3/cache.zip ]; then
	if [ -d ~/.cargo ]; then
		echo "[skip] install autd3 Rust module"
	else
		echo "* install autd3 Rust module"
		
		# install autd3 Rust module
		unzip ${scriptpath}/rust_autd3/cache.zip -d ~/ > /dev/null
	fi
fi

# --------------------------------------------------------
# copy Rust sample
if [ -d ${rustnsampledir} ]; then
	echo "[skip] copy Rust sample"
else
	echo "* copy Rust sample"

	# copy sample
	mkdir ${rustnsampledir}
	cp -r ${scriptpath}/rust_sample/* ${rustnsampledir}
fi


# --------------------------------------------------------
# create terminal icon
if [ -f "${termname}" ]; then
	echo "[skip] create desktop icon"
else
	echo "* create desktop icon : '${termname}'"
	
	# create icon file
	cat << EEE >> "${termname}"
[Desktop Entry]
Version=1.0
Type=Application
Name=AUTD3 Terminal
Exec=gnome-terminal -- bash -c ". ${venvdir}/bin/activate; cd Desktop; exec bash"
Icon=utilities-terminal
Terminal=true
Categories=Application;
EEE

	# make executable
	chmod +x "${termname}"
	#gio set "${termname}" metadata::trusted true

fi


# --------------------------------------------------------
# disable display blank
echo "* display blank disable"
export DBUS_SESSION_BUS_ADDRESS=${sbus}
if gsettings get org.gnome.desktop.session idle-delay | grep -q "uint32 0"; then
	echo "[skip] disable display blank"
else
	echo "* disable display blank"

	# disable display blank
	gsettings set org.gnome.desktop.session idle-delay 0
fi


# --------------------------------------------------------
# tool install
if [ -d "${scriptpath}/Tool" ]; then
	echo "* copy tools"

	# copy
	cp -r "${scriptpath}/Tool" ~/

fi


EOS


# --------------------------------------------------------
# Finish
echo "setup complete"
exit 0

