
# Automation Project with Robot Framework and Selenium

This project is designed for running automated end-to-end acceptance tests on the front-end using Robot Framework and Selenium technologies. The tests can be executed both locally and within a CI/CD pipeline.

## Robot and Selenium Template
> A repository of tests dedicated to utilizing various Robot Framework libraries with Selenium.

## Environment Setup

### Install Python 3.12
Make sure you have Python 3.12 installed on your system. You can download it from the [official Python website](https://www.python.org/).

### Clear pip cache
> pip cache remove *

### Deactivate Virtual Environment
> deactivate

### Install Python Dependencies
First, activate the virtual environment to avoid version conflicts with other installed libraries.
> pip install -r requirements.txt

### Install nvm:
This is necessary to switch the Node version used in the project.
> https://github.com/nvm-sh/nvm/blob/master/README.md

### Install Node.js:
When installing, various additional packages may be installed, such as Chocolatey, etc.
> https://nodejs.org/en/download

### Set the default Node version to the one used in the project:
> nvm use

### Install chromedriver
Visit the website:
> https://chromedriver.chromium.org/downloads
After downloading the file, extract it from the zip folder and add the path of the chromedriver executable to the PATH variable.

### Code Linting
> robotidy src

---

### ---- Project Highlights ----
- Page Object Model
- Robot Framework Integration
- Selenium for Web Testing
- Data Management
- Report Generation

---

### ---- Commands to Run Tests: ----
**Run regression test**
> npm run test
# robot-selenium-demo
