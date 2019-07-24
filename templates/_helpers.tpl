{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "mum.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "mum.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "mum.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "mum.labels" -}}
helm.sh/chart: {{ include "mum.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Names and addresses of the deployments and services
*/}}

{{- define "mum.deployment.name" -}}
{{- printf "%s-%s" .Release.Name .Values.mum.deployment.name -}}
{{- end -}}

{{- define "mum.service.name" -}}
{{- printf "%s-%s" .Release.Name .Values.mum.service.name -}}
{{- end -}}

{{- define "mariadb.service.name" -}}
{{- printf "%s-mariadb" .Release.Name -}}
{{- end -}}

{{- define "mariadb.service.address" -}}
{{- printf "%s-mariadb.%s.svc.cluster.local" .Release.Name .Values.namespace -}}
{{- end -}}

{{- define "postfix.deployment.name" -}}
{{- printf "%s-%s" .Release.Name .Values.postfix.deployment.name -}}
{{- end -}}

{{- define "postfix.service.name" -}}
{{- printf "%s-%s" .Release.Name .Values.postfix.service.name -}}
{{- end -}}

{{- define "dovecot.deployment.name" -}}
{{- printf "%s-%s" .Release.Name .Values.dovecot.deployment.name -}}
{{- end -}}

{{- define "dovecot.service.name" -}}
{{- printf "%s-%s" .Release.Name .Values.dovecot.service.name -}}
{{- end -}}

{{- define "dovecot.internalService.name" -}}
{{- printf "%s-%s" .Release.Name .Values.dovecot.internalService.name -}}
{{- end -}}

{{- define "dovecot.service.address" -}}
{{- printf "%s-%s.%s.svc.cluster.local" .Release.Name .Values.dovecot.service.name .Values.namespace -}}
{{- end -}}

{{- define "dovecot.internalService.address" -}}
{{- printf "%s-%s.%s.svc.cluster.local" .Release.Name .Values.dovecot.internalService.name .Values.namespace -}}
{{- end -}}

{{- define "dovecot.pvc.name" -}}
{{- printf "%s-%s" .Release.Name .Values.dovecot.persistentVolumeClaim.name -}}
{{- end -}}

