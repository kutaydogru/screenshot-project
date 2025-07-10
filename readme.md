# Screenshot App

**Screenshot App** is a web-based tool that allows you to capture screenshots of any website. By providing a URL through a simple interface, you get high-quality screenshots automatically saved to a folder on your computer.

The project leverages **Node.js**, **Puppeteer**, and **Nginx**, and is packaged as a Docker container for maximum portability and ease of deployment.

---

## Project Overview & Features

- Allows users to specify a website URL via the local interface
- Saves the screenshot as a PNG file in the server’s `output/` folder
- Offers a clean and intuitive web interface
- Runs entirely in Docker—no manual setup required

---

## Technology Stack and Their Roles

### Node.js
Acts as the backend application framework. It handles HTTP requests, validates/sanitizes user input (such as the target URL), and oversees screenshot management and storage.

### Puppeteer
A Node.js library for controlling a headless (no GUI) Chromium browser. Puppeteer navigates to the given URL and generates the screenshot programmatically, saving it as a PNG file.

### Nginx
Used as a reverse proxy to efficiently serve static files and forward requests to the backend. In the Docker setup, it handles all incoming HTTP requests and routes them appropriately between client and backend services.

---

## Build and Run

Use the commands below in your terminal:

```bash
# After cloning or copying the project files:
docker build -t screenshot-app .

docker run --rm -v "$(pwd)/output:/output" -p 8080:8080 screenshot-app