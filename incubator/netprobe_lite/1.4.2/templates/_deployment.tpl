apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ include "fullname" . }}
  labels:
    app: {{ include "name" . }}
spec:
  replicas: {{ .Values.replicaCount }}
  selector:
    matchLabels:
      app: {{ include "name" . }}
  template:
    metadata:
      labels:
        app: {{ include "name" . }}
    spec:
      containers:
        - name: {{ include "name" . }}
          image: "{{ .Values.netprobe_lite.image.repository }}:{{ .Values.netprobe_lite.image.tag }}"
          ports:
            - name: http
              containerPort: {{ .Values.netprobe_lite.ports.containerPort }}
          env:
            - name: SOME_ENV_VARIABLE
              value: "{{ .Values.netprobe_lite.env.SOME_ENV_VARIABLE }}"
          # Add other container configurations as needed
