## Категорий OWASP Top 10 2025

***

### A01:2025 – Broken Access Control

**Нарушение контроля доступа** — приложение не ограничивает действия пользователей за пределами их полномочий. Атакующий может обращаться к чужим данным, повышать привилегии или выполнять действия без авторизации. В 2025 году в эту категорию также включены SSRF-атаки.

```java
# пользователь меняет `id=123` на `id=124` в URL и получает информацию без каких-либо проверок на сервере

@GetMapping("/order/{id}")
public Order getOrder(@PathVariable Long id) {
    return orderRepository.findById(id)
        .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
```

***

### A02:2025 – Security Misconfiguration

**Неправильная конфигурация** — небезопасные настройки по умолчанию, открытые сервисы, ненужные функции, неверные права доступа.


```yaml
# Spring Boot Actuator доступен без аутентификации и отдаёт `/actuator/env` с паролями и токенами

management:
  endpoints:
    web:
      exposure:
        include: "*"
```

***

### A03:2025 – Software Supply Chain Failures

**Сбои цепочки поставок ПО** — охватывает уязвимые зависимости, CI/CD-пайплайны без проверок, неподписанные артефакты, скомпрометированные репозитории.

```xml
# зависимость подтягивается по HTTP без проверки контрольной суммы — MITM-атака подменяет JAR на вредоносный

<repository>
  <url>http://repo.example.com/maven</url>
  <checksumPolicy>ignore</checksumPolicy>
</repository>
```
