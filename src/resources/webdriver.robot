*** Variables ***
# Webdrive config
${headless}         False
${anonymousTab}     False
${sleep}            2s
@{arguments}        Create List    --disable-infobars    --disable-extensions    --ignore-certificate-errors
...                 --ignore-ssl-errors    --ignore-certificate-errors-spki-list    --no-sandbox
...                 --disable-dev-shm-usage    --disable-gpu    --allow-running-insecure-content
...                 --disable-web-security
