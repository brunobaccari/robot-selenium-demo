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

O checkout verifica jaqueta, quantidade, subtotal de $49.99, imposto de $4.00, total de $53.99, confirmação e carrinho vazio. As esperas seguem elementos e navegação; não há pausas fixas ou retries. A cobertura é da interface do site de demonstração, sem pagamento real.

As dependências diretas estão fixadas. Selenium Manager resolve o driver; o executável histórico não é usado explicitamente. `HEADLESS=False` abre o navegador. As preferências do gerenciador de senhas se aplicam apenas ao perfil temporário de teste.

O Actions executa os dois cenários e publica summary, JUnit, HTML e screenshots em artifacts. Para o mesmo formato local, use `robot -d results --xunit junit.xml src/Clients/Login.robot`. Outputs são ignorados pelo Git.
