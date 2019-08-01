
<ul class="nav nav-pills">
    <li role="presentation" >
        <a href="{{ url('consumer/index') }}">消费者</a>
    </li>
    <li role="presentation" >
        <a href="{{ url('alc/index') }}">权限</a>
    </li>
    <li role="presentation" >
        <a href="{{ url('project/index') }}">对象</a>
    </li>
    
    
    {% if login %}
    <li role="presentation" >
        <a href="{{ url('index/logout') }}">退出登录</a>
    </li>
    
    {% else %}
        
    <li role="presentation" >
        <a href="{{ url('index/login') }}">登录</a>
    </li>
    
    {% endif %}
</ul>