
{%- macro pagination(page,urldata) %}
<div>
    <nav aria-label="...">
        <ul class="pagination pagination-lg">
           
            
            <li {% if page.current ==1 %}class="active" {%endif %}>
                <a href="{{ url(urldata[0],array_merge(urldata[1],['page':1]))  }}">1</a>
            </li>
            
{#            前面几页#}
            {% if page.current > 4 %}
            <li>
                <a href="{{ url(urldata[0],array_merge(urldata[1],['page':2]))  }}">2</a>
            </li>
            
            <li>
                <a href="{{ url(urldata[0],array_merge(urldata[1],['page':3]))  }}">3</a>
            </li>
            
            <li>
                <a>...</a>
            </li>
            
            <li>
                <a href="{{ url(urldata[0],array_merge(urldata[1],['page':page.before]))  }}"> < </a>
            </li>
            
            {% else%}
                
                
            {% if page.current > 2 %} 
            <li>
                <a href="{{ url(urldata[0],array_merge(urldata[1],['page':2]))  }}">2</a>
            </li>
            {%endif %}
            {% if page.current > 3 %} 
            <li>
                <a href="{{ url(urldata[0],array_merge(urldata[1],['page':3]))  }}">3</a>
            </li>
            {%endif %}    
            {%endif %}
            
{#            当前页#}
            {% if page.current != 1 %}
            <li class="active">
                <a href="{{ url(urldata[0],array_merge(urldata[1],['page':page.current]))  }}">
                    {{page.current}}
                </a>
            </li>
            {% endif%}
{#            后面几页#}
            {% if page.last - page.current > 3 %}
            <li>
                <a href="{{ url(urldata[0],array_merge(urldata[1],['page':page.next]))  }}"> > </a>
            </li>
            
            
            <li>
                <a>...</a>
            </li>
             
            <li>
                <a href="{{ url(urldata[0],array_merge(urldata[1],['page':page.last-2]))  }}">{{page.last-2}}</a>
            </li>
            <li>
                <a href="{{ url(urldata[0],array_merge(urldata[1],['page':page.last-1]))  }}">{{page.last-1}}</a>
            </li>
            {% else%}
            {% if page.last-2 > page.current  %}
            <li>
                <a href="{{ url(urldata[0],array_merge(urldata[1],['page':page.last-2]))  }}">{{page.last-2}}</a>
            </li>
            {% endif%}
            {% if page.last-1 > page.current %}
            <li>
                <a href="{{ url(urldata[0],array_merge(urldata[1],['page':page.last-1]))  }}">{{page.last-1}}</a>
            </li>
            {% endif%}
            {% endif%}
            
            
            
          
            {% if page.current != page.last %}
            <li>
                <a href="{{ url(urldata[0],array_merge(urldata[1],['page':page.last]))  }}">{{page.last}}</a>
            </li>
            {% endif%}
            
            {% if page.total_pages != page.last %}
            <li><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
            {% endif %}
            
            <li>
                总条数 {{ page.total_items }}
                
            </li>
            
        </ul>
        <div>
            
        </div>
    </nav>
        
 
</div>
{%- endmacro %}

