<div align="center">
<h1><a id="intro"> Semgrep AppSec Java Rules </a><br></h1>
<a href="https://docs.github.com/en"><img src="https://img.shields.io/static/v1?logo=github&logoColor=fff&label=&message=Docs&color=36393f&style=flat" alt="GitHub Docs"></a>
<a href="https://symbl.cc/en/unicode-table"><img src="https://img.shields.io/static/v1?logo=unicode&logoColor=fff&label=&message=Unicode&color=36393f&style=flat" alt="Unicode"></a>
<a href="https://shields.io"><img src="https://img.shields.io/static/v1?logo=shieldsdotio&logoColor=fff&label=&message=Shields&color=36393f&style=flat" alt="Shields"></a>
<img src="https://img.shields.io/badge/git-%23F05033.svg?style=flat-square&logo=git&logoColor=white" alt="Git">
<a href="https://www.markdownguide.org/"><img src="https://img.shields.io/badge/Markdown-000000.svg?logo=markdown&logoColor=white" alt="Markdown"></a>

</div>

<div align="center">

![Repo Size](https://img.shields.io/github/repo-size/geminishkv/semgrep_java_custom_ruleset)![License](https://img.shields.io/github/license/geminishkv/semgrep_java_custom_ruleset)![Status](https://img.shields.io/badge/status-active-success)![Contributor Badge](https://img.shields.io/badge/Contributor-%D0%A8%D0%BC%D0%B0%D0%BA%D0%BE%D0%B2_%D0%98._%D0%A1.-8b9aff?style=flat)![Contributors](https://img.shields.io/github/contributors/geminishkv/semgrep_java_custom_ruleset)![Open pull requests](https://img.shields.io/github/issues-pr/geminishkv/semgrep_java_custom_ruleset)![Commit Activity](https://img.shields.io/github/commit-activity/m/geminishkv/semgrep_java_custom_ruleset)![Last commit](https://img.shields.io/github/last-commit/geminishkv/semgrep_java_custom_ruleset)

</div>

***

<br>Салют :wave:,</br>

Проект посвящен автоматизированному сканированию Java-кода на уязвимости с использованием официальных и кастомных правил Semgrep. 

Проект использует официальные Java правила из [semgrep-rules](https://github.com/returntocorp/semgrep-rules) путем использования git submodule. Кастомные правила лежат в `rules/custom/`, которые построены на базе **OWASP TOP 10 - 2024**. Отчеты формируются в форматах SARIF, JSON.

## Возможности

- **Официальные правила Community** — автоматически обновляемые правила из [semgrep-rules](https://github.com/returntocorp/semgrep-rules)
- **Кастомные правила** — расширенный набор правил дополняющих официальные и не требующие дополнительной лицензии
- **Автообновление** — правила обновляются каждые 2 недели через GitHub Actions
- **Оптимизация** — только Java правила `sparse checkout`
- **Отчёты** — JSON и SARIF форматы для интеграции с CI/CD
- **Быстрый старт** — всё настроено через Makefile, готово к использованию из коробки

## Ruleset

### **A01:2024 – Broken Access Controll (IDOR)**

> - IDOR (Insecure Direct Object References)
> - Missing Authorization (@PreAuthorize, @Secured)
> - Spring Security Misconfiguration
> - JWT Security Issues
> - Session Management
> - CORS Misconfiguration
> - File Access Control
> - URL/Referer-based Access Control
> - Privilege Escalation
> - API Key & Token Issues
> - Mass Assignment
> - GraphQL/WebSocket Access Control
> - Actuator Exposure
> - OAuth2/ SSO Issues
> - Multi-tenancy
> - Default Credentials, Rate Limiting, Error Messages

### **A02:2024 – Cryptographic Failures**

> - Слабые алгоритмы хеширования (MD5, SHA1)
> - Слабое шифрование (DES, RC4, Blowfish, ECB)
> - Управление ключами (hardcoded keys, weak key sizes, PBKDF2)
> - TLS/ SSL проблемы (старые версии, отключенная проверка сертификатов)
> - Генерация случайных чисел (Math.random vs SecureRandom)
> - Хранение паролей (plaintext, без соли, BCrypt настройки)
> - Утечка чувствительных данных (логи, исключения, URL)
> - Шифрование БД и файлов
> - HTTP безопасность (Basic Auth, HTTP вместо HTTPS)
> - Управление токенами (JWT, API keys, AWS credentials)
> - Безопасная коммуникация (FTP, Telnet, SMTP)
> - Маскирование данных (PII в логах, toString)
> - Backup и экспорт данных
> - Mobile и API безопасность

### **A03:2024 – Injection (SQL/OS/Expression)**

> - SQL Injection (JDBC, JPA, Hibernate, Spring Data, MyBatis)
> - NoSQL Injection (MongoDB)
> - OS Command Injection
> - LDAP, XPath, XML/ XXE
> - Expression Language (SpEL, OGNL, MVEL, JEXL)
> - Template Injection (FreeMarker, Velocity, Thymeleaf)
> - Log/ Header/ Path Traversal
> - JNDI/ Script/ XSS/ SSRF
> - Email/ Regex/ Format String/ JMX/ CSV/ HTML/ CRLF Injection

***

## **Tutorial**

### Команды

```bash
$ make init # Инициализировать Java правила
$ make stats # Проверить статистику правил
$ make status # Статус submodule
$ make scan # Полное сканирование
$ make scan-custom # Кастомное сканирование
$ make scan-official # Только официальные правила
$ make scan-critical # Только критичные уязвимости
$ make update-rules # Обновить правила до последней версии
$ make commit-rules # Закоммитить изменения
$ make validate # Провалидировать правила
$ make help # Помощь
$ make clean # Очистить отчеты
```

### Конфигурация

```bash
JAVA_RULES_DIR = rules/official-java-semgrep/java
CUSTOM_RULES_DIR = rules/custom
SRC_DIR = src
REPORT_DIR = reports
```

### Преднастройка

```bash
SRC_DIR = app/src/main/java      # Замени в makefile путь к коду

$ make init
$ git submodule update --remote

# Changelog Java правил

$ cd rules/official-java-semgrep
$ git log --oneline -10 -- java/

```

### Manual workflow

```bash
$ brew install semgrep
$ make update-rules
$ make stats
$ git diff rules/official-java-semgrep
$ make scan
$ make commit-rules
$ git push

$ semgrep --config rules/custom/A01:2024.yml src/ # Сканирование конкретным выделенным конфигом
```

## **Правила**

### Добавление правила

```bash
$ vi/vim/nano rules/custom/my-custom-rule.yml # Создать файл правила
$ make validate # Проверить валидность
```

### Паттерн правил

```yaml
rules:
  - id: my-custom-sqli
    languages: [java]
    severity: CRITICAL
    message: Potential SQL Injection detected
    pattern: |
      $STMT.executeQuery("SELECT * FROM users WHERE id = " + $VAR)
    meta
      owasp: ["A03:2024-Injection"]
      cwe: ["CWE-89"]
```

## **Интеграция**

### CI/CD 

```yaml
- name: Run Semgrep Scan
  run: make scan-ci

- name: Upload results
  uses: actions/upload-artifact@v4
  with:
    name: semgrep-report
    path: reports/semgrep.json
```

### Pre-commit hook

```bash
# .git/hooks/pre-commit
#!/bin/sh
make scan-critical || exit 1
```

## **Troubleshooting**

```bash
# Остались лишние правила
$ cd rules/official-java-semgrep
$ rm -rf * .[!.]*
$ git reset --hard HEAD
$ git sparse-checkout set java

# Ошибка "sparse-checkout paths not up to date”
$ cd rules/official-java-semgrep
$ git sparse-checkout reapply
$ git reset --hard HEAD
```

## **Metrics**

```bash
$ make stats # Количество правил

# История изменений правил
$ cd rules/official-java-semgrep
$ git log --oneline -10 -- java/

$ semgrep --config rules/ src/ --json | jq '.results | group_by(.extra.severity) | map({severity: ..extra.severity, count: length})' # Количество находок по severity
```

***

## **Структура репозитория**

```bash

```

***

## **Refs**

* Semgrep Documentation
* Official Semgrep Rules
* OWASP Top 10 2024
* CWE Database

***

Copyright (c) 2026 Elijah S Shmakov

![Logo](assets/logotypemd.jpg)
