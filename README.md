<div align="center"><h1><a id="intro"> Semgrep AppSec Java Rules </a><br></h1></div>

![Repo Size](https://img.shields.io/github/repo-size/geminishkv/semgrep_java_custom_ruleset)
![License](https://img.shields.io/github/license/geminishkv/semgrep_java_custom_ruleset)
![Status](https://img.shields.io/badge/status-active-success)
![Contributor Badge](https://img.shields.io/badge/Contributor-%D0%A8%D0%BC%D0%B0%D0%BA%D0%BE%D0%B2_%D0%98._%D0%A1.-8b9aff?style=flat)![Contributors](https://img.shields.io/github/contributors/geminishkv/semgrep_java_custom_ruleset)
![Open pull requests](https://img.shields.io/github/issues-pr/geminishkv/semgrep_java_custom_ruleset)
![Commit Activity](https://img.shields.io/github/commit-activity/m/geminishkv/semgrep_java_custom_ruleset)
![Last commit](https://img.shields.io/github/last-commit/geminishkv/semgrep_java_custom_ruleset/main?style=flat-square&color=blue)

***

<br>Салют :wave:,</br>
Проект посвящен автоматизированному сканированию Java-кода на уязвимости с использованием официальных и кастомных правил Semgrep. Проект использует официальные Java правила из [semgrep-rules](https://github.com/returntocorp/semgrep-rules) путем использования git submodule. Кастомные правила лежат в `rules/custom/`, которые построены на базе **OWASP TOP 10 - 2025**. Отчеты формируются в форматах SARIF, JSON.

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

- Всего правил: 513
- Категорий OWASP: 10
- Покрытие CWE: 112 уникальных категорий
- Включено: Java (499), Dockerfile (2), YAML (2), XML (4), Properties (6)

### Покрытие по категориям OWASP Top 10 2025

| OWASP Категория | Файл | Правил | CRITICAL | ERROR | HIGH | WARNING | MEDIUM | INFO | CWE |
|:----------------|:----:|:------:|:--------:|:-----:|:----:|:-------:|:------:|:----:|:---:|
| **A01:2025** – Broken Access Control | A01-2025.yml | 46 | 16 | 0 | 19 | 0 | 10 | 0 | 28 |
| **A02:2025** – Security Misconfiguration | A02-2025.yml | 55 | 0 | 37 | 0 | 18 | 0 | 0 | 28 |
| **A03:2025** – Software Supply Chain | A03-2025.yml | 50 | 0 | 25 | 0 | 18 | 0 | 7 | 11 |
| **A04:2025** – Cryptographic Failures | A04-2025.yml | 52 | 16 | 0 | 20 | 0 | 16 | 0 | 23 |
| **A05:2025** – Injection | A05-2025.yml | 53 | 19 | 0 | 23 | 0 | 11 | 0 | 18 |
| **A06:2025** – Insecure Design | A06-2025.yml | 50 | 0 | 27 | 0 | 20 | 0 | 3 | 21 |
| **A07:2025** – Authentication Failures | A07-2025.yml | 57 | 0 | 31 | 0 | 25 | 0 | 1 | 28 |
| **A08:2025** – Software & Data Integrity | A08-2025.yml | 50 | 20 | 0 | 19 | 7 | 4 | 0 | 12 |
| **A09:2025** – Logging & Alerting Failures | A09-2025.yml | 50 | 5 | 15 | 0 | 22 | 2 | 6 | 8 |
| **A10:2025** – Exceptional Conditions | A10-2025.yml | 50 | 8 | 18 | 1 | 15 | 6 | 2 | 10 |
| **ИТОГО** | **10 файлов** | **513** | **84** | **153** | **82** | **125** | **49** | **19** | **112** |

### Распределение по уровням серьезности

| Severity | Количество | Процент |
|:--------:|:----------:|:-------:|
| CRITICAL | 84 | 16.4% |
| ERROR | 153 | 29.8% |
| HIGH | 82 | 16.0% |
| WARNING | 125 | 24.4% |
| MEDIUM | 49 | 9.6% |
| INFO | 19 | 3.7% |
| ETC | ~ | 0.1% |
| **ИТОГО** | **513** | **100.0%** |

***

## **Сопроводительная информация**

- [Описание категорий OWASP](assets/docs/kategory.md)
- [JAVA правила](assets/docs/ruleset.md)
- [Manual](assets/docs/manual.md)
- [Integrations](assets/docs/integrations.md)
- [Patterns](assets/docs/patterns.md)
- [Metrics](assets/docs/metrics.md)

***

## **Tutorial**

### Преднастройка

```bash
SRC_DIR = app/src/main/java      # Замени в makefile путь

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
│   ├── docs
│   │   ├── integrations.md
│   │   ├── manual.md
│   │   ├── metrics.md
│   │   ├── patterns.md
│   │   └── ruleset.md
│   └── logotypemd.jpg
├── CONTRIBUTING.md
├── image.png
├── LICENSE.md
├── Makefile
├── README.md
├── rules
│   └── custom
│       ├── A01:2025.yml
│       ├── A02:2025.yml
│       ├── A03:2025.yml
│       ├── A04:2025.yml
│       ├── A05:2025.yml
│       ├── A06:2025.yml
│       ├── A07:2025.yml
│       ├── A08:2025.yml
│       ├── A09:2025.yml
│       └── A10:2025.yml
└── SECURITY.md
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
