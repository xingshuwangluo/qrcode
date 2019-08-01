<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>
        详情
    </title>
    <script src="/js/qrcode.min.js"></script>
</head>
<body>
详情

内容:
<br>

<textarea rows="30" cols="100" name="yuan">{{ info.yuan }}</textarea>

<br>

分享用二维码:

<div id="qrcode"></div>

<script type="text/javascript">
    new QRCode(document.getElementById("qrcode"), window.location.href);
</script>


</body>
</html>