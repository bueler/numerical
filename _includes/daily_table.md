{% assign data = include.data %}

<ul>
{% for material in data.daily %}
<li style="margin-bottom: 10px;"><b>{{ material.name }}</b> {{ material.description }}
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
    {% if material.doc %}
        <br><a href="{{ data.home }}/{{ material.doc }}">{{ material.docname }}</a>
    {% endif %}
    {% if material.otherurl %}
        <br><a href="{{ material.otherurl }}">{{ material.otherurlname }}</a>
    {% endif %}
</li>
{% endfor %}
</ul>
