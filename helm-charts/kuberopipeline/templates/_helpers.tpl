{{- define "kubero.registryUsername" -}}
{{- if eq .Values.registry.createSecret "create" }}
{{- $registryUsername := .Values.registry.username | b64enc }}
{{- $registryUsername }}
{{- end }}

{{- if or (not .Values.registry.createSecret) (eq .Values.registry.createSecret "copy") }}
{{- $mainnamespace := .Values.mainnamespace | default "kubero" -}}
{{- $secretObj := (lookup "v1" "Secret" $mainnamespace "registry-login") | default dict }}
{{- $secretData := (get $secretObj "data") | default dict }}
{{- $registryUsername := (get $secretData "username") | default "empty" }}
{{- $registryUsername }}
{{- end }}
{{- end }}

{{- define "kubero.registryPassword" -}}
{{- if eq .Values.registry.createSecret "create" }}
{{- $registryPassword := .Values.registry.password | b64enc }}
{{- $registryPassword }}
{{- end }}

{{- if or (not .Values.registry.createSecret) (eq .Values.registry.createSecret "copy") }}
{{- $mainnamespace := .Values.mainnamespace | default "kubero" -}}
{{- $secretObj := (lookup "v1" "Secret" $mainnamespace "registry-login") | default dict }}
{{- $secretData := (get $secretObj "data") | default dict }}
{{- $registryPassword := (get $secretData "password") | default "empty" }}
{{- $registryPassword }}
{{- end }}
{{- end }}

{{- define "kubero.dockerconfigjson" -}}
{{- if eq .Values.registry.createSecret "create" }}
{{- $dockerconfigjson := .Values.registry.dockerconfigjson | b64enc }}
{{- $dockerconfigjson }}
{{- end }}

{{- if or (not .Values.registry.createSecret) (eq .Values.registry.createSecret "copy") }}
{{- $mainnamespace := .Values.mainnamespace | default "kubero" -}}
{{- $secretObj := (lookup "v1" "Secret" $mainnamespace "registry-login") | default dict }}
{{- $secretData := (get $secretObj "data") | default dict }}
{{- $dockerconfigjson := (get $secretData ".dockerconfigjson") | default "empty" }}
{{- $dockerconfigjson }}
{{- end }}
{{- end }}