{{- define "dockereg" -}}
{{- $regs := list -}}
{{- range $reg := . -}}
{{- $regs = append $regs (print "\n      \"" $reg.url "\": {\n        \"auth\": \"" ((print $reg.name ":" $reg.password) | b64enc) "\"\n      }") -}}
{{- end -}}
{
    "auths": {
       {{- join  "," $regs }}
    }
}
{{- end -}}
