<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>
        最近生成

    </title>
</head>
<body>


<h2>最近的二维码</h2>

<div>
    <table class="table table-bordered">
        <thead>
        <tr>

            <th> 短码</th>
            <th>操作</th>

        </tr>
        </thead>
        <tbody>
        {% for erweima in list %}
            <tr>
                <th>
                    {{ erweima.duan }}
                </th>
                <td>

                    <a href="/index/info/{{ erweima.duan }}">
                        点击进入详情
                    </a>
                </td>

            </tr>
        {% endfor %}
        </tbody>
    </table>
</div>
</body>
</html>