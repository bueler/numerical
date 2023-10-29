{% assign data = include.data %}
<table class="asst-table">
{% for ws in data.worksheets %}
<tr>
	<td>
		<table class="inner">
			<tr>
			    <td><a href="{{ data.home }}/{{ ws.blank }}">{{ ws.name }}</a></td>
			</tr>
			{% if ws.description %}
			<tr>
			    <td>{{ ws.description }}</td>
			</tr>
			{% endif %}
			{% if ws.more %}
			<tr>
			    <td>{{ ws.more }}</td>
			</tr>
			{% endif %}
			{% if ws.solutions %}
			<tr>
			    <td><a href="{{ data.home }}/{{ ws.solutions }}">solutions</a></td>
			</tr>
			{% endif %}
			{% if ws.file %}
		  <tr>
			    <td>code: <a href="{{ data.home }}/{{ ws.file }}">{{ ws.file }}</a></td>
			</tr>
			{% endif %}
			{% if ws.image %}
		  <tr>
			    <td>output image: <a href="{{ data.home }}/{{ ws.image }}">{{ ws.image }}</a></td>
			</tr>
			{% endif %}
		</table>
	</td>
</tr>
{% endfor %}
</table>
