FROM golang:1.15-alpine

# Add all files to app folder
ADD . app
# Enter app folder
WORKDIR app

# Installation dependencies
RUN go mod download

# Enter folder which including main go file
WORKDIR cmd
# Build app from main go file
RUN go build -ldflags="-w -s" -o main

# Expose app with 8080 port
EXPOSE 8080

# Run app [ You can choose --> ENTRYPOINT ["./main"]  ]
CMD ["./main"]

