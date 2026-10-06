# Robot Framework · Selenium · SauceDemo

[Versão em português](README.md)

Two scenarios for [SauceDemo](https://www.saucedemo.com/): login and a login-to-checkout journey. The suite uses Robot Framework and SeleniumLibrary.

## Structure

`src/Clients/Login.robot` is the entry point. Scenarios compose keywords from the pages, resources and helpers under `src`.

## Run

With Python and Chrome installed, create and activate a virtual environment:

```sh
python -m venv .venv
```

PowerShell: `.venv\Scripts\Activate.ps1`. Linux/macOS: `source .venv/bin/activate`.

```sh
python -m pip install -r requirements.txt
robot -d Results src/Clients/Login.robot
```

`npm test` is a shortcut for the same Robot command; npm is not required to run it directly.

## Data and results

Scenarios use the public SauceDemo demo account. Review test data and browser options in the test files and `src/resources/webdriver.robot`.

`report.html`, `log.html` and `output.xml` are written to `Results`. The repository includes an old `chromedriver.exe`; check compatibility with Chrome before using it. Python dependencies are unpinned. This README review did not rerun the scenarios or establish compatibility with current environments.
