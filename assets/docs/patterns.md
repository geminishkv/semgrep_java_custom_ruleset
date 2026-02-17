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

***