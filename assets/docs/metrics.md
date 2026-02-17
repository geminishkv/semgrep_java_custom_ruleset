## **Metrics**

```bash
$ make stats # Количество правил

# История изменений правил
$ cd rules/official-java-semgrep
$ git log --oneline -10 -- java/

$ semgrep --config rules/ src/ --json | jq '.results | group_by(.extra.severity) | map({severity: ..extra.severity, count: length})' # Количество находок по severity
```

***