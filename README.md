# TITAN

TITAN is a high-performance reverse proxy and security gateway written in Zig.  
It combines transport-level efficiency with Layer 7 inspection and security controls, designed for modern backend infrastructure.

---

## Overview

TITAN is structured as a modular system:

- Transport Engine (Event Loop, TCP lifecycle, zero-copy buffers)
- HTTP Protocol Parser (HTTP/1.1 and HTTP/2 ready)
- Web Application Firewall (WAF)
- Rate Limiting & IP Blacklisting
- Upstream Load Balancer
- Structured JSON Logging

The architecture separates networking, protocol handling, security, and backend management into clearly defined layers.

---

## Project Structure


---

## Features

- High-performance event-driven architecture
- Zero-copy buffer pool design
- HTTP request parsing
- SQL Injection, XSS, and Path Traversal detection
- Token Bucket / Sliding Window rate limiting
- IP reputation blacklist
- Round Robin / Least Connections load balancing
- Backend health checks
- Structured JSON logging

---

## Build & Run

Make sure Zig is installed.

### Build
`zig build run`

### Run
`zig run src/main.zig`

### Run Tests
`...`

---

## Configuration

Security rules and backend definitions are stored in: 

### config/rules.json

This file contains:

- WAF signatures
- Backend IP addresses
- Security policies

---

## Philosophy

TITAN focuses on:

- Performance first
- Explicit memory management
- Clear module boundaries
- Security by default
- Production-grade architecture

---

## License

This project is licensed under the MIT License.