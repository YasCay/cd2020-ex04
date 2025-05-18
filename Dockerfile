FROM golang:1.21-alpine

# Set maintainer label: maintainer=[YOUR-EMAIL]
LABEL maintainer="yasar.cayir@hotmail.com"

# Set working directory: `/src`
WORKDIR /src

# Copy local file `main.go` to the working directory
COPY main.go .

# List items in the working directory (ls)
RUN ls -la

# Build the GO app as myapp binary and move it to /usr/
RUN go build -o /usr/myapp main.go

# Create a non-root user
RUN adduser -D -g '' appuser

# Change ownership of the application binary
RUN chown appuser:appuser /usr/myapp

# Switch to non-root user
USER appuser

# Expose port 8888
EXPOSE 8888

# Run the service myapp when a container of this image is launched
CMD ["/usr/myapp"]