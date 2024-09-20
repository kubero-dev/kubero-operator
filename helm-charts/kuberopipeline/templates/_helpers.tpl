{{- define "kubero.registryUsername" -}}
{{- $mainnamespace := .Values.mainnamespace | default "kubero" -}}
{{- $secretObj := (lookup "v1" "Secret" $mainnamespace "registry-login") | default dict }}
{{- $secretData := (get $secretObj "data") | default dict }}
{{- $registryUsername := (get $secretData "username") | default "" }}
{{- $registryUsername }}
{{- end }}

{{- define "kubero.registryPassword" -}}
{{- $mainnamespace := .Values.mainnamespace | default "kubero" -}}
{{- $secretObj := (lookup "v1" "Secret" $mainnamespace "registry-login") | default dict }}
{{- $secretData := (get $secretObj "data") | default dict }}
{{- $registryPassword := (get $secretData "password") | default "" }}
{{- $registryPassword }}
{{- end }}

{{- define "kubero.dockerconfigjson" -}}
{{- $mainnamespace := .Values.mainnamespace | default "kubero" -}}
{{- $secretObj := (lookup "v1" "Secret" $mainnamespace "registry-login") | default dict }}
{{- $secretData := (get $secretObj "data") | default dict }}
{{- $dockerconfigjson := (get $secretData ".dockerconfigjson") | default "" }}
{{- $dockerconfigjson }}
{{- end }}

