.POSIX:

BIN_FOLDER=/usr/bin

${BIN_FOLDER}:
	@echo "Creating ${BIN_FOLDER} folder ..."
	mkdir ${BIN_FOLDER}

audio_control: ${BIN_FOLDER}
	@echo "Installing audio_control ..."
	install -m 555 audio_control ${BIN_FOLDER}
	@echo "done!"

brightness_control: ${BIN_FOLDER}
	@echo "Installing brightness_control ..."
	install -m 555 brightness_control ${BIN_FOLDER}
	@echo "done!"

gaming_mode: ${BIN_FOLDER}
	@echo "Installing gaming_mode script ..."
	install -m 555 gaming_mode ${BIN_FOLDER}
	@echo "done!"

passmenu: ${BIN_FOLDER}
	@echo "Installing passmenu script ..."
	install -m 555 passmenu ${BIN_FOLDER}
	@echo "done!"

dmenu_run_history: ${BIN_FOLDER}
	@echo "Installing dmenu_run_history script ..."]
	install -m 555 dmenu_run_history ${BIN_FOLDER}
	@echo "done!"

calc: ${BIN_FOLDER}
	@echo "Installing calc(=) script..."
	install -m 555 = ${BIN_FOLDER}
	@echo "done!"

dws: ${BIN_FOLDER}
	@echo "Installing dws(dmenu window switcher) script..."
	install -m 555 dws ${BIN_FOLDER}
	@echo "done!"

uninstall:
	@echo "Removing scripts..."
	rm -f ${BIN_FOLDER}/audio_control
	rm -f ${BIN_FOLDER}/brightness_control
	rm -f ${BIN_FOLDER}/passmenu
	rm -f ${BIN_FOLDER}/dmenu_run_history
	rm -f ${BIN_FOLDER}/gaming_mode
	rm -f ${BIN_FOLDER}/=
	rm -f ${BIN_FOLDER}/dws
	@echo "done!"

install: audio_control brightness_control gaming_mode passmenu dmenu_run_history calc dws
	@echo "scripts installed successfully!"

.PHONY: install audio_control brightness_control gaming_mode dws
