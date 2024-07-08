{%for i in range(19)%}
select {{i}} as number {% if not loop.last %} union all {% endif %}
{% endfor %}