
## Ruleset

### **A01:2025 – Broken Access Controll (IDOR)**

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

### **A02:2025 – Security Misconfiguration**

> - Spring Boot Misconfiguration (Actuator, Debug, CSRF, CORS, H2 Console, DevTools)
> - Security Headers (CSP, X-Frame-Options, HSTS, Cache-Control, X-Content-Type-Options)
> - Session Management (Timeout, HttpOnly, Secure, SameSite, Session ID in URL)
> - XML Parser Vulnerabilities (XXE - DocumentBuilder, SAXParser, XMLReader, Transformer, JAXB)
> - Verbose Error Messages (Stack Traces, SQLException, File Paths, Debug Logging)
> - Default Credentials (JDBC, Embedded DB, JMX)
> - Cloud Configuration (AWS, S3, DynamoDB, GCP Storage, Azure Storage)
> - Database Configuration (Hibernate, JPA DDL, Connection Pool, MongoDB)
> - Logging Sensitive Data (Passwords, Credit Cards, JWT Tokens)
> - Directory Listing, Jackson Default Typing, Servlet Errors, TrustManager

### **A03:2025 – Software Supply Chain Failures**

> - Уязвимые и устаревшие зависимости (Log4j, Spring, Jackson, Commons-Collections, Struts, MySQL, Guava, SnakeYAML, OkHttp)
> - Dependency Confusion / Typosquatting (Repository Order, SNAPSHOT, Untrusted Repositories, Wildcard Versions)
> - Отсутствие проверки целостности (Checksums, GPG Signatures, Gradle Verification, Lock Files)
> - CI/CD Pipeline Security (Secrets in Config, Insecure Scripts, Docker, GitHub Actions, Maven Deploy)
> - SBOM и Visibility (CycloneDX, Dependency-Check, Transitive Dependencies, License Compliance)
> - Runtime Dependency Loading (URLClassLoader, Maven Runtime Resolution, Groovy Grape, Plugins, JavaAgent, OSGi)
> - Build Tool Configuration (Maven Settings, Gradle Wrapper, Maven Enforcer, Init Scripts, Reproducible Builds)

### **A04:2025 – Cryptographic Failures**

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

### **A05:2025 – Injection (SQL/OS/Expression)**

> - SQL Injection (JDBC, JPA, Hibernate, Spring Data, MyBatis)
> - NoSQL Injection (MongoDB)
> - OS Command Injection
> - LDAP, XPath, XML/ XXE
> - Expression Language (SpEL, OGNL, MVEL, JEXL)
> - Template Injection (FreeMarker, Velocity, Thymeleaf)
> - Log/ Header/ Path Traversal
> - JNDI/ Script/ XSS/ SSRF
> - Email/ Regex/ Format String/ JMX/ CSV/ HTML/ CRLF Injection

### **A06:2025 – Insecure Design**

> - Отсутствие Rate Limiting (REST Endpoints, Authentication, Password Reset, Registration, API Keys, File Upload, Search, Export)
> - Небезопасная бизнес-логика (Missing Business Validation, Idempotency, Price Verification, Quantity Overflow, Discount Reuse, Workflow Skip, Race Conditions, Role Verification, Referral Fraud, Age Verification, Random Number Security, Subscription Tier)
> - Отсутствие CAPTCHA/Bot Protection (Public Forms, Voting, Like Buttons, SMS OTP, Newsletter)
> - Недостаточная изоляция (Shared Sessions, Tenant Isolation, Cache Poisoning, Error Handler Leaks, Admin/User Context, Connection Pool, File Storage)
> - Отсутствие Fail-Safe механизмов (Payment Rollback, Authentication Default Allow, Circuit Breaker, Timeout Configuration, Exception Suppression)
> - Хардкод бизнес-лимитов (Max Amount, Retry Count, Token Expiry, Page Size, Salt Rounds)
> - Отсутствие Audit Trail (Critical Operations, Financial Transactions, Permission Changes, Configuration Changes)
> - Архитектурные недостатки (Synchronous Long Operations, Missing Correlation ID, No Graceful Shutdown)

### **A07:2025 – Authentication Failures**

> - Слабые пароли и учётные данные (Weak Validation, Complexity Regex, Default Credentials, Case-Sensitive Username, Password Contains Username, Password in GET, Credentials in URL, API Key in Query, Password Expiry, Sequential Passwords)
> - Отсутствие/слабая MFA (Sensitive Operations without MFA, Backup Codes Unlimited, TOTP Rate Limiting, SMS OTP Spam, OTP Validity, MFA Enrollment, Remember Device)
> - Управление сессиями (Session Fixation, Session ID in URL, Session Timeout, Logout Invalidation, Concurrent Sessions, Sensitive Data in Session, JWT Expiry, JWT Algorithm None, Refresh Token Rotation, Remember-Me Token Predictable)
> - Защита от Brute Force (Login Rate Limiting, Account Lockout, No Delay After Failed Login, Timing Attacks, Failed Login Logging, CAPTCHA After Failures, Distributed Brute Force)
> - Небезопасное восстановление пароля (Reset Token Predictable, Long Expiry, Without Current Password, Security Questions, Token Reusable, No Notification)
> - Хранение учётных данных (Plaintext Storage, MD5/SHA-1 Hashing, Weak BCrypt Rounds, No Salt, Credentials Logged, API Key Plaintext)
> - Authentication Bypass (Bypassable Checks, SQL Injection, LDAP Injection, Null Check Flaws, Boolean Parameter Auth)
> - Account Enumeration (Different Error Messages, Registration Reveals Users, Password Reset Reveals)
> - OAuth State Parameter, Auto-Login After Registration

***
