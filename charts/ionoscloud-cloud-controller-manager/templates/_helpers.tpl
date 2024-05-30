{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "ionoscloud-ccm.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "ionoscloud-ccm.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "ionoscloud-ccm.labels" -}}
helm.sh/chart: {{ include "ionoscloud-ccm.chart" . }}
{{ include "ionoscloud-ccm.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "ionoscloud-ccm.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ionoscloud-ccm.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Render entry for credentials secret
*/}}
{{- define "ionoscloud-ccm.cloudConfigContent" -}}
{
  "tokens": [{{ .Values.cloudConfig.token | quote }}]
}
{{- end }}

{{/*
Render container args from extraArgs.
*/}}
{{- define "ionoscloud-ccm.extraArgs" -}}
{{- range $key, $value := .extraArgs }}
{{- if not (kindIs "invalid" $value) }}
- --{{ $key | mustRegexFind "^[^_]+" }}={{ $value }}
{{- else }}
- --{{ $key | mustRegexFind "^[^_]+" }}
{{- end }}
{{- end }}
{{- end }}
