# BR TV NEWS APK V10 FLASH

Esta versão foi criada porque a V9 ficou pesada.

## Estratégia

A V10 mantém a base que já compila no GitHub Actions, mas remove a parte pesada da V9:

- Sem MutationObserver permanente.
- Sem setInterval infinito.
- Sem varredura pesada do DOM.
- CSS injetado de forma leve.
- Bloqueio nativo de anúncios/rastreadores no WebView.
- Mantém ?m=0 porque ?m=1 cai na tela padrão do Blogger.
- Mantém botão instalar oculto.
- Mantém ícone premium.
- Mantém players/iframes liberados.

## O que acelera

- Bloqueio nativo de DoubleClick, AdSense, Analytics, Tag Manager, Facebook Pixel e trackers.
- Bridge JS leve executada poucas vezes.
- Layout responsivo sem ficar reprocessando a tela a cada segundo.
- User-Agent mobile.
- Mixed content permitido para streams antigos.
