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

***