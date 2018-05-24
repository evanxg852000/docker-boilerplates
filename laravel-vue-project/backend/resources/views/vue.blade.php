<!DOCTYPE html>
<!doctype html>
<html lang="{{ app()->getLocale() }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no">
    <meta name="theme-color" content="#000000">
    <link rel="shortcut icon" href="/favicon.ico">
    <title>Laravel Vue App</title>
    @if (App::environment('developement'))
    <link rel="manifest" href="http://localhost:3000/manifest.json">
    @else
    <link rel="manifest" href="/manifest.json">
    <link type="text/css" rel="stylesheet" href="/static/css/app.css">
    @endif
</head>
<body>
    <noscript>You need to enable JavaScript to run this app.</noscript>
    <div id=app></div>
    @if (App::environment('developement'))
    <script type="text/javascript" src="http://localhost:3000/app.js"></script>
    @else
    <script type="text/javascript" src="/static/js/manifest.js"></script>
    <script type="text/javascript" src="/static/js/vendor.js"></script>
    <script type="text/javascript" src="/static/js/app.js"></script>
    @endif
</body>
</html>