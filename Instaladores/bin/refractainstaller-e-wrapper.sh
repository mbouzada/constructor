#!/usr/bin/env bash
#
# New wrapper for refractainstaller-gui/yad 9.1.2


#******************************************************************

# Comentado para MiniNo
# Commented for MiniNo

#if [[ -f /usr/bin/yad ]]; then
#	yadversion=$(yad --version | cut -d. -f2)
#	if (( $yadversion >= 17 )); then
		installer="/usr/bin/refractainstaller-e"
#	fi
#elif
#	[[ -f /usr/bin/zenity ]]; then
#		installer="/usr/bin/refractainstaller-gui"
#else
#	xterm -hold -fa monaco -fs 14 -geometry 80x20+0+0 -e echo "
#  Neither Yad nor Zenity is installed, or the version of Yad is too old.
#  You can't run the GUI version of Refracta Installer without one of 
#  those. Instead, you can run 'refractainstaller' from a terminal 
#  or console for the CLI version.
#  " &
#fi

case $LANG in
	ca*)
		TIT="Mode administrador"
		TEXT="
	<b>Quin mètode s'utilitza per convertir-se en 
			administrador / root?</b>

	<i><b> Nota </b>: L'únic propòsit d'això és iniciar aquesta 
	seqüència d'ordres.
	No canvia res.
	Més endavant Se't demanarà que seleccionis el 
	mètode que vols utilitzar en el sistema instal·lat. 
	</i> "
		BUT_SU="Utilitzar <b>su</b>"
		BUT_SUDO="Utilitzar <b>sudo</b>"
		BUT_EXIT="Sortir"
	;;
	es*)
		TIT="Modo administrador"
		TEXT="
	<b>¿Qué método se utiliza para convertirse en 
			administrador / root?</b> 

	<i><b>Nota</b>: El único propósito de esto es iniciar esta 
	secuencia de órdenes. 
	No cambia nada.
	Más adelante Se le pedirá que elija el método que 
	desea utilizar en el sistema instalado. 
	</i>"
		BUT_SU="Usar <b>su</b>"
		BUT_SUDO="Usar <b>sudo</b>"
		BUT_EXIT="Salir"
	;;
	eu*)
		TIT="Administratzaile moduan"
		TEXT="
	<b>Zein metodo erabiltzen da administratzailea
			bihurtzeko / root?</b> 

	<i><b>Oharra</b>: Honen helburu bakarra agindu sekuentzia
	hau abiaraztea da. 
	Ez da aldatzen ezer.
	Geroago instalatutako sisteman erabili nahi den metodoa
	hautatzeko aukera emango zaizu. 
	</i>"
		BUT_SU="Erabili <b>su</b>"
		BUT_SUDO="Erabili <b>sudo</b>"
		BUT_EXIT="Irten"
    ;;
	gl*)
		TIT="Modo administrador"
		TEXT="
	<b>Que método se emprega para converterse en 
			administrador / root?</b> 

	<i><b>Nota</b>: O único propósito disto é iniciar esta 
	secuencia de ordes. 
	Non cambia nada.
	Máis adiante pediráselle que escolla o método que 
	quere empregar no sistema instalado. 
	</i>"
		BUT_SU="Usar <b>su</b>"
		BUT_SUDO="Usar <b>sudo</b>"
		BUT_EXIT="Saír"
	;;
	*)
		TIT="Admin Mode"
		TEXT="
		<b>Wath metd do you use to become 
			Administrator / root?</b> 

	<i><b>Note</b>: This is only for the purpose of starting this script. 
	It does not change anything.
	You will be asked later to choose the method you want 
	to use in the installed system.
	</i>"
		BUT_SU="Use <b>su</b>"
		BUT_SUDO="Use <b>sudo</b>"
		BUT_EXIT="Exit"
	;;
esac

yad --question --title="${TIT}"  --button="${BUT_SU}":0 \
	--button="${BUT_SUDO}":1 --button="${BUT_EXIT}":2 \
	--text="${TEXT}"
	
	ans="$?"
	if [[ $ans -eq 0 ]] ; then
		xterm -fa mono -fs 12 -e su -c "$installer"
	elif [[ $ans -eq 1 ]] ;then
		xterm -fa mono -fs 12 -e  "sudo $installer"
	elif [[ $ans -eq 2 ]]; then
		echo "Good-bye."
		exit 0
	fi

echo "Done."
exit 0

