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

Checkout checks the jacket, quantity, $49.99 subtotal, $4.00 tax, $53.99 total, confirmation and empty cart. Waits follow elements and navigation; there are no fixed sleeps or retries. Coverage is limited to the demo UI, without real payments.

Direct dependencies are pinned. Selenium Manager resolves the driver; the historical executable is not explicitly used. `HEADLESS=False` opens the browser. Password-manager preferences apply only to the temporary test profile.

Actions runs both scenarios and uploads a summary, JUnit, HTML and screenshots as artifacts. For the same local format, use `robot -d results --xunit junit.xml src/Clients/Login.robot`. Generated files are Git-ignored.

The Actions summary lists every scenario, duration, totals and blocking reason. The gate requires the count configured in the workflow, with no failures or skips; missing or invalid JUnit fails the gate. The summary is also included in the artifact.

Final-state screenshots are also captured for passing UI tests and stored in artifacts, outside Git.
