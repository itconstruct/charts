apiVersion: v1
kind: Service
metadata:
  name: {{ include "fullname" . }}
  labels:
    app: {{ include "name" . }}
spec:
  ports:
    - port: {{ .Values.netprobe_lite.ports.containerPort }}
      targetPort: {{ .Values.netprobe_lite.ports.containerPort }}
      protocol: TCP
      name: http
  selector:
    app: {{ include "name" . }}
