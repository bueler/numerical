{% assign data = include.data %}

<ul>
{% for material in data.daily %}
<li style=" margin-bottom: 10px;">{{ material.name }}: {{ material.description }}
    {% if material.due %}
        <br><b>due: {{ material.due }}</b>
    {% endif %}
    {% if material.more %}
        <br>{{ material.more }}
    {% endif %}
    {% if material.chapter %}
        <br>(Chapter {{ material.chapter }})
    {% endif %}
    {% if material.chapters %}
        <br>(Chapters {{ material.chapters }})
    {% endif %}
    {% if material.handout %}
        <br><a href="{{ data.home }}/{{ material.handout }}">{{ material.handoutname }}</a>
    {% endif %}
</li>
{% endfor %}
</ul>
