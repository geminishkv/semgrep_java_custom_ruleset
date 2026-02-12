<div align="center">
<h1><a id="intro"> Semgrep Java Rules </a><br></h1>
<a href="https://docs.github.com/en"><img src="https://img.shields.io/static/v1?logo=github&logoColor=fff&label=&message=Docs&color=36393f&style=flat" alt="GitHub Docs"></a>
<a href="https://symbl.cc/en/unicode-table"><img src="https://img.shields.io/static/v1?logo=unicode&logoColor=fff&label=&message=Unicode&color=36393f&style=flat" alt="Unicode"></a>
<a href="https://shields.io"><img src="https://img.shields.io/static/v1?logo=shieldsdotio&logoColor=fff&label=&message=Shields&color=36393f&style=flat" alt="Shields"></a>
<img src="https://img.shields.io/badge/Contributor-Шмаков_И._С.-8b9aff" alt="Contributor Badge">
<img src="https://img.shields.io/badge/git-%23F05033.svg?style=flat-square&logo=git&logoColor=white" alt="Git">

<a href="https://www.markdownguide.org/"><img src="https://img.shields.io/badge/Markdown-000000.svg?logo=markdown&logoColor=white" alt="Markdown"></a>

</div>

<div align="center">

![Repo Size](https://img.shields.io/github/repo-size/geminishkv/semgrep_java_custom_ruleset)![License](https://img.shields.io/github/license/geminishkv/semgrep_java_custom_ruleset)![Status](https://img.shields.io/badge/status-active-success)![Contributor Badge](https://img.shields.io/badge/Contributor-%D0%A8%D0%BC%D0%B0%D0%BA%D0%BE%D0%B2_%D0%98._%D0%A1.-8b9aff?style=flat)![Contributors](https://img.shields.io/github/contributors/geminishkv/semgrep_java_custom_ruleset)![Open pull requests](https://img.shields.io/github/issues-pr/geminishkv/semgrep_java_custom_ruleset)![Commit Activity](https://img.shields.io/github/commit-activity/m/geminishkv/semgrep_java_custom_ruleset)![Last commit](https://img.shields.io/github/last-commit/geminishkv/semgrep_java_custom_ruleset)

</div>

***

<br>Салют :wave:,</br>

Проект использует официальные Java правила из [semgrep-rules](https://github.com/returntocorp/semgrep-rules) путем использования git submodule. 

Кастомные правила лежат в `rules/custom/`, которые построены на базе **OWASP TOP 10 - 2024**. Отчеты формируются в форматах SARIF, JSON.

## Ruleset

### **A03:2024 – Injection (SQL/OS/Expression)**

> - SQL Injection (JDBC, JPA, Hibernate, Spring Data, MyBatis)
> - NoSQL Injection (MongoDB)
> - OS Command Injection
> - LDAP, XPath, XML/XXE
> - Expression Language (SpEL, OGNL, MVEL, JEXL)
> - Template Injection (FreeMarker, Velocity, Thymeleaf)
> - Log/Header/Path Traversal
> - JNDI/Script/XSS/SSRF
> - Email/Regex/Format String/JMX/CSV/HTML/CRLF Injection

### A0

## Tutorial

### Описание команд

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
$ make init
$ git submodule update --remote

# Changelog Java правил
$ cd rules/official-java-semgrep
$ git log --oneline -10 -- java/

```

### Manual workflow

```bash
$ make update-rules
$ make stats
$ git diff rules/official-java-semgrep
$ make scan
$ make commit-rules
$ git push
```

### Troubleshooting

```bash
# Остались лишние правила
$ d rules/official-java-semgrep
$ git sparse-checkout reapply
$ git reset --hard HEAD
```

***

### Структура репозитория

***

### Tutorial

***

Copyright (c) 2026 Elijah S Shmakov

![Logo](assets/logotypemd.jpg)
