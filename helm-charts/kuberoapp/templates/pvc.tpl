{{- range .Values.extraVolumes }}
{{- if not .emptyDir }}
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: {{ .name }}
spec:
  storageClassName: {{ .storageClass }}
  accessModes:
    {{- toYaml .accessModes | nindent 4 }}
  resources:
    requests:
      storage: {{ .size }}
{{- end }}
{{- end }}
