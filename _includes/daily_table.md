{% assign data = include.data %}

<ul>
{% for material in data.daily %}
<li>{{ material.name }}: {{ material.description }}
{% if material.due %}
    <br><b>due: {{ material.due }}</b>
{% endif %}
{% if material.more %}
    <br>{{ material.more }}
{% endif %}
{% if material.handout %}
    <br><a href="{{ material.handout }}">handout</a>
{% endif %}
</li>
{% endfor %}
</ul>
