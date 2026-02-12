.PHONY: help init update-rules scan scan-official scan-custom validate stats status clean

# Конфигурация
JAVA_RULES_DIR = rules/official-java-semgrep/java
CUSTOM_RULES_DIR = rules/custom
SRC_DIR = src
REPORT_DIR = reports

# Цвета для вывода
GREEN = \033[0;32m
YELLOW = \033[0;33m
NC = \033[0m

# Setup

## init: Инициализация submodule с Java правилами
init:
	@echo "$(GREEN) Initializing Java rules submodule...$(NC)"
	git submodule update --init
	@echo "$(YELLOW)⚠️ Configuring sparse checkout for Java only...$(NC)"
	cd rules/official-java-semgrep && \
		git sparse-checkout init --cone && \
		git sparse-checkout set java && \
		git sparse-checkout reapply && \
		git reset --hard HEAD && \
		cd ../..
	@echo "$(GREEN)✅ Java rules initialized$(NC)"
	@ls -la rules/official-java-semgrep/

# Update

## update-rules: Обновить Java правила до последней версии
update-rules:
	@echo "$(GREEN) Updating Java rules from upstream...$(NC)"
	cd rules/official-java-semgrep && \
		git fetch origin && \
		git checkout main && \
		git pull origin main && \
		git sparse-checkout set java && \
		cd ../..
	@echo "$(YELLOW)⚠️ Staging changes...$(NC)"
	git add rules/official-java-semgrep
	@if ! git diff-index --quiet HEAD rules/official-java-semgrep 2>/dev/null; then \
		echo "$(GREEN)✅ Java rules updated$(NC)"; \
		echo "$(YELLOW)⚠️ Run 'git commit -m \"chore: update Java rules\"' to commit$(NC)"; \
	else \
		echo "$(GREEN)✅ Java rules already up to date$(NC)"; \
	fi

## commit-rules: Закоммитить обновленные правила
commit-rules:
	@if ! git diff-index --quiet HEAD rules/official-java-semgrep 2>/dev/null; then \
		git commit -m "chore: update Semgrep Java rules from official repository"; \
		echo "$(GREEN)✅ Changes committed$(NC)"; \
	else \
		echo "$(YELLOW)⚠️ No changes to commit$(NC)"; \
	fi

# Scan

## scan: Полное сканирование Java (официальные + кастомные правила)
scan:
	@echo "$(GREEN) Scanning with all rules...$(NC)"
	@mkdir -p $(REPORT_DIR)
	semgrep --config $(JAVA_RULES_DIR)/ \
		--config $(CUSTOM_RULES_DIR)/ \
		--json -o $(REPORT_DIR)/semgrep-full.json \
		--verbose \
		$(SRC_DIR)
	@echo "$(GREEN)✅ Report saved: $(REPORT_DIR)/semgrep-full.json$(NC)"

## scan-official: Сканирование только официальными Java правилами
scan-official:
	@echo "$(GREEN) Scanning with official Java rules...$(NC)"
	semgrep --config $(JAVA_RULES_DIR)/ $(SRC_DIR)

## scan-custom: Сканирование только кастомными Java правилами
scan-custom:
	@echo "$(GREEN) Scanning with custom rules...$(NC)"
	semgrep --config $(CUSTOM_RULES_DIR)/ $(SRC_DIR)

## scan-critical: Сканирование только критичных уязвимостей
scan-critical:
	@echo "$(GREEN)⚠️ Scanning for CRITICAL issues...$(NC)"
	semgrep --config $(JAVA_RULES_DIR)/ \
		--config $(CUSTOM_RULES_DIR)/ \
		--severity ERROR \
		$(SRC_DIR)

## scan-ci: Сканирование для CI/CD (JSON и SARIF)
scan-ci:
	@echo "$(GREEN) Running CI scan...$(NC)"
	@mkdir -p $(REPORT_DIR)
	semgrep --config $(JAVA_RULES_DIR)/ \
		--config $(CUSTOM_RULES_DIR)/ \
		--json -o $(REPORT_DIR)/semgrep.json \
		$(SRC_DIR)
	@echo "$(YELLOW)📄 Generating SARIF format...$(NC)"
	semgrep --config $(JAVA_RULES_DIR)/ \
		--config $(CUSTOM_RULES_DIR)/ \
		--sarif -o $(REPORT_DIR)/semgrep.sarif \
		$(SRC_DIR)
	@echo "$(GREEN)✅ Reports: semgrep.json, semgrep.sarif$(NC)"

# Maintenance

## validate: Проверить валидность кастомных правил
validate:
	@echo "$(GREEN)✓ Validating custom rules...$(NC)"
	@if [ -d "$(CUSTOM_RULES_DIR)" ]; then \
		semgrep --validate --config $(CUSTOM_RULES_DIR)/; \
	else \
		echo "$(YELLOW)⚠️  No custom rules directory found$(NC)"; \
	fi

## stats: Показать статистику по правилам
stats:
	@echo "$(GREEN)📄 Rules Statistics$(NC)"
	@echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	@echo "Official Java rules: $$(find $(JAVA_RULES_DIR) -name '*.yml' -o -name '*.yaml' 2>/dev/null | wc -l | tr -d ' ')"
	@if [ -d "$(CUSTOM_RULES_DIR)" ]; then \
		echo "Custom rules: $$(find $(CUSTOM_RULES_DIR) -name '*.yml' -o -name '*.yaml' 2>/dev/null | wc -l | tr -d ' ')"; \
	else \
		echo "Custom rules: 0"; \
	fi
	@echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	@echo "Paths:"
	@echo "  Java rules: $(JAVA_RULES_DIR)"
	@echo "  Custom rules: $(CUSTOM_RULES_DIR)"
	@echo "  Source code: $(SRC_DIR)"

## status: Показать статус submodule
status:
	@echo "$(GREEN)📄 Submodule Status$(NC)"
	@git submodule status rules/official-java-semgrep
	@echo ""
	@echo "Current commit:"
	@cd rules/official-java-semgrep && git log -1 --oneline

## clean: Удалить отчеты
clean:
	@echo "$(GREEN) Cleaning reports...$(NC)"
	rm -rf $(REPORT_DIR)
	@echo "$(GREEN)✅ Reports cleaned$(NC)"

# Help

## help: Показать справку
help:
	@echo "$(GREEN)Semgrep Java Rules Management$(NC)"
	@echo ""
	@echo "$(YELLOW)Setup:$(NC)"
	@echo "  make init           - Initialize Java rules submodule (first time)"
	@echo ""
	@echo "$(YELLOW)Update:$(NC)"
	@echo "  make update-rules   - Update Java rules to latest version"
	@echo "  make commit-rules   - Commit updated rules"
	@echo ""
	@echo "$(YELLOW)Scan:$(NC)"
	@echo "  make scan           - Full scan with all rules (JSON report)"
	@echo "  make scan-official  - Scan with official Java rules only"
	@echo "  make scan-custom    - Scan with custom rules only"
	@echo "  make scan-critical  - Scan for CRITICAL issues only"
	@echo "  make scan-ci        - Scan for CI/CD (SARIF format)"
	@echo ""
	@echo "$(YELLOW)Maintenance:$(NC)"
	@echo "  make validate       - Validate custom rules syntax"
	@echo "  make stats          - Show rules statistics"
	@echo "  make status         - Show submodule status"
	@echo "  make clean          - Remove reports directory"
	@echo ""
	@echo "$(YELLOW)Configuration:$(NC)"
	@echo "  JAVA_RULES_DIR = $(JAVA_RULES_DIR)"
	@echo "  CUSTOM_RULES_DIR = $(CUSTOM_RULES_DIR)"
	@echo "  SRC_DIR = $(SRC_DIR)"
	@echo "  REPORT_DIR = $(REPORT_DIR)"

.DEFAULT_GOAL := help