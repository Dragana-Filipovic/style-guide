---
title: Webfonts
template: development.jade
order: 6
---

> Go throught the following presentation to get a detailed understanding
> about FOUT, FOIT and web fonts loading in general.
> 
> [The Consequences of Web Fonts // Speacker Deck](https://speakerdeck.com/bramstein/the-consequences-of-web-fonts)

# Webfont is a progressive enhancement

We must treat web fonts as a progressive enhancement since they may not be loaded
at page load or may never be loaded (not supported, timeout, etc.).

Since the [support of the JavaScript API for font loading](http://caniuse.com/#feat=font-loading) is currently not that great, we fall back to [Font Face Observer](https://github.com/bramstein/fontfaceobserver).

# Detect when the web font is loaded

Use the following JavaScript to add the `has-webfont` modifier to the body element and therefore display the web font.

```js
var fontFamily = 'ITC Franklin Gothic W01';

var observerNormal = new FontFaceObserver(fontFamily, {
  weight: 400
});
var observerMedium = new FontFaceObserver(fontFamily, {
  weight: 600
});
var observerBold = new FontFaceObserver(fontFamily, {
  weight: 700
});

Promise.all([ 
  observerNormal,
  observerMedium,
  observerBold
]).then(function () {
  $("body").addClass('has-webfont');
}, function () {
  // noop
});
```

This requires the Promise API (you may use a [polyfill](https://www.npmjs.com/package/promis)) and the [Font Face Observer](https://github.com/bramstein/fontfaceobserver)

# Make use of progressive enhancement in your own CSS/LESS

Use the global `has-webfont` modifier. See the example below, extracted from the typography section of the AXA Web Style Guide:

```css
TBD
```



<!-- Copyright AXA Versicherungen AG 2015 -->
