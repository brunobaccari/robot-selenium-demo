# Robot Framework · Selenium · SauceDemo

[English version](README.en.md)

Dois cenários para o [SauceDemo](https://www.saucedemo.com/): login e jornada de login com checkout. A suíte usa Robot Framework e SeleniumLibrary.

## Organização

`src/Clients/Login.robot` é o ponto de entrada. Os cenários compõem keywords de páginas, recursos e helpers nas demais pastas de `src`.

## Executar

Com Python e Chrome instalados, crie um ambiente virtual e ative-o:

```sh
python -m venv .venv
```

No PowerShell: `.venv\Scripts\Activate.ps1`. No Linux/macOS: `source .venv/bin/activate`.

```sh
python -m pip install -r requirements.txt
robot -d Results src/Clients/Login.robot
```

`npm test` é um atalho para o mesmo comando Robot; npm não é necessário para executar diretamente.

## Dados e resultados

Os cenários usam a conta pública de demonstração do SauceDemo. Revise os dados e opções do navegador nos arquivos de teste e em `src/resources/webdriver.robot`.

Os relatórios `report.html`, `log.html` e `output.xml` ficam em `Results`. O repositório inclui um `chromedriver.exe` antigo; confira sua compatibilidade com o Chrome antes de usá-lo. As dependências Python não estão fixadas em versões. A revisão dos READMEs não reexecutou os cenários nem confirma compatibilidade com ambientes atuais.
