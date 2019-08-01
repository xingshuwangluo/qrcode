
{%- macro breadcrumb(links) %}

<div>
    <ol class="breadcrumb">
        {% for link in links %}
        
        {% if loop.last %}
        <li class="active">
            <a href="{{ link['href']|default('#') }}">{{ link['name'] }}</a>
        </li>
        {% else %}
        <li>
            <a  href="{{ link['href']|default('#') }}">{{ link['name'] }}</a>
        </li>
        {% endif %}
        
        {% endfor %}
        
    </ol>
</div>

{%- endmacro %}
