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

Проект использует официальные Java правила из [semgrep-rules](https://github.com/returntocorp/semgrep-rules) путем использования git submodule. Кастомные правила лежат в `rules/custom/`, которые построены на базе **OWASP TOP 10 - 2025**. Отчеты формируются в форматах SARIF, JSON.

## **Возможности**

- **Официальные правила Community** — автоматически обновляемые правила из [semgrep-rules](https://github.com/returntocorp/semgrep-rules)
- **Кастомные правила** — расширенный набор правил дополняющих официальные и не требующие дополнительной лицензии
- **Автообновление** — правила обновляются каждые 2 недели через GitHub Actions
- **Оптимизация** — только Java правила `sparse checkout`
- **Отчёты** — JSON и SARIF форматы для интеграции с CI/CD
- **Быстрый старт** — всё настроено через Makefile, готово к использованию из коробки

***

## **Категории:**

- A01:2025 – Broken Access Control (Нарушение контроля доступа)
- A02:2025 – Security Misconfiguration (Неправильная конфигурация)
- A03:2025 – Software Supply Chain Failures (Сбои цепочки поставок ПО)
- A04:2025 – Cryptographic Failures (Криптографические сбои)
- A05:2025 – Injection (Инъекции)
- A06:2025 – Insecure Design (Небезопасный дизайн)
- A07:2025 – Authentication Failures (Сбои аутентификации)
- A08:2025 – Software or Data Integrity Failures (Сбои целостности)
- A09:2025 – Security Logging & Alerting Failures (Сбои логирования)
- A10:2025 – Mishandling of Exceptional Conditions (Неправильная обработка исключений)

***

## **Покрытие правил**

- Всего правил: 363
- Категорий OWASP: 7
- Покрытие CWE: 97 уникальных категорий
- Языки: Java (357), Dockerfile (2), YAML (1), XML (2), Properties (1)

### Покрытие по категориям OWASP Top 10 2025

<div align="center">

| OWASP Категория | Файл | Правил | CRITICAL | ERROR | HIGH | WARNING | MEDIUM | INFO | CWE |
|-----------------|------|--------|----------|-------|------|---------|--------|------|-----|
| **A01:2025** - Broken Access Control | A01-2025.yml | 46 | 16 | 0 | 19 | 0 | 10 | 0 | 28 |
| **A02:2025** - Security Misconfiguration | A02-2025.yml | 55 | 0 | 37 | 0 | 18 | 0 | 0 | 28 |
| **A03:2025** - Software Supply Chain | A03-2025.yml | 50 | 0 | 25 | 0 | 18 | 0 | 7 | 11 |
| **A04:2025** - Cryptographic Failures | A04-2025.yml | 52 | 16 | 0 | 20 | 0 | 16 | 0 | 23 |
| **A05:2025** - Injection | A05-2025.yml | 53 | 19 | 0 | 23 | 0 | 11 | 0 | 18 |
| **A06:2025** - Insecure Design | A06-2025.yml | 50 | 0 | 27 | 0 | 20 | 0 | 3 | 21 |
| **A07:2025** - Authentication Failures | A07-2025.yml | 57 | 0 | 31 | 0 | 25 | 0 | 1 | 28 |
| **ИТОГО** | **7 файлов** | **363** | **51** | **120** | **62** | **81** | **37** | **11** | **97** |

</div>

### Распределение по уровням серьезности

| Severity | Количество | Процент |
|----------|------------|---------|
| CRITICAL | 51 | 14.0% |
| ERROR | 120 | 33.1% |
| HIGH | 62 | 17.1% |
| WARNING | 81 | 22.3% |
| MEDIUM | 37 | 10.2% |
| INFO | 11 | 3.0% |
| **ИТОГО** | **363** | **100.0%** |

***

## **Сопроводительная информация**

- [JAVA правила](assets/docs/ruleset.md)
- [Manual](assets/docs/manual.md)
- [Integrations](assets/docs/integrations.md)
- [Patterns](assets/docs/patterns.md)
- [Metrics](assets/docs/metrics.md)

***

## **Tutorial**

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

***

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

***

## **Структура репозитория**

```bash
.
├── assets
│   └── logotypemd.jpg
├── CODE_OF_CONDUCT.md
├── CONTRIBUTING.md
├── image.png
├── LICENSE.md
├── Makefile
├── NOTICE.md
├── README.md
├── rules
│   └── custom
│       ├── A01:2024.yml
│       ├── A02:2024.yml
│       └── A03:2024.yml
└──  SECURITY.md
```

***

## **Refs**

* [Semgrep Documentation](https://semgrep.dev/docs/)
* [Semgrep Rules Registry](https://github.com/semgrep/semgrep-rules)
* [Semgrep Playground](https://semgrep.dev/playground)
* [OWASP Top 10:2021](https://owasp.org/Top10/2021/)
* [OWASP Top 10:2025](https://owasp.org/Top10/2025/)
* [CWE Database (MITRE)](https://cwe.mitre.org/)

***

Copyright (c) 2026 Elijah S Shmakov

![Logo](assets/logotypemd.jpg)
