<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Qrcode二维码生成器</title>

    </head>
    <body>
        <div>

            
            <h1>首页</h1>


            <a href="/index/list1">最近的二维码</a>
            
            <h3>
                欢迎使用Qrcode二维码生成器,在下面输入你要生成的文本内容
            </h3>

            <form action="/index/qrcode" method="post">


               <textarea rows="30" cols="100" name="yuan"></textarea>

                <input type="submit" value="生成">
            </form>




        </div>


    </body>
</html>