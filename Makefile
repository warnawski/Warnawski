.PHONY: fast

define spinner
	( eval $(1) ) & \
	spinner_pid=$$!; \
	spin='|/-\'; \
	while kill -0 $$spinner_pid 2>/dev/null; do \
		for i in `seq 0 3`; do \
			echo -ne "\r[\033[0;33m$${spin:$$i:1}\033[0m] Выполнение..."; \
			sleep 0.1; \
		done; \
	done; \
	echo -ne "\r\033[K[\033[0;32m✓\033[0m] Готово!                \n"
endef

fast:
	@echo "🚀 Начало быстрой инициализации конфигурации проекта..."

	@if [ ! -f ./.env ]; then \
  		echo "- .ENV Файл не найден, начинаем копирование"; \
		$(call spinner, "cp .env.example .env && sleep 1"); \
	else \
	   echo "- .ENV Файл уже существует, в целях безопасности перекопируем"; \
	   $(call spinner, "mv .env .env-bak && cp .env.example .env"); \
	fi

	@echo "✅ .ENV Настроен";

	@if [ ! -d ./secrets/ ]; then \
  		echo "- SECRETS для контейнеризатора не найдены, начинаю инициализацию"; \
  		$(call spinner, "mkdir -p secrets && echo 'a25a97e2-d5f1-4fb4-a40d-c8ee0dba31b6' > secrets/db_password.txt && echo 'e13ae13b-72af-4383-95a0-c14ebae0a0f0' > secrets/storage_password.txt"); \
  	else \
  	  	echo "- SECRETS для контейнеризации найдены, пропускаем"; \
  	fi

	@echo "✅ Секреты настроены";

	@echo ""
	@echo "🎉 Всё готово!"
	@echo ""
	@echo "────────────────────────────────────────"
	@echo "     ____    ___    _   _    _____  "
	@echo "    / ___|  |_ _|  | \ | |  | ____| "
	@echo "    | |      | |   |  \| |  |  _|   "
	@echo "    | |___   | |   | |\  |  | |___  "
	@echo "    \____|  |___|  |_| \_|  |_____| "
	@echo "           by warnawski ♥"
	@echo "────────────────────────────────────────"