{{- define "testId" }}
{{- if .Values.test.id }}
{{- printf "--tag testId=%s-%s" .Values.test.id (now | date "20060102150405") }}
{{- end }}
{{- end }}

{{- define "arguments" }}
{{- if .Values.test.config}}
{{- printf "%s %s %s" (printf "--config /repo/%s" .Values.test.config) (include "testId" .) (.Values.test.extraArgs) }}
{{- else }}
{{- printf "%s %s" (include "testId" .) (.Values.test.extraArgs) }}
{{- end }}
{{- end }}
