
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