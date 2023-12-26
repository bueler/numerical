{% assign data = include.data %}
<table class="asst-table">
{% for material in data.daily %}
<tr>
	<td>
		<table class="inner">
			<tr>
			    <td>{{ material.name }}</td>
			</tr>
			{% if material.description %}
			<tr>
			    <td>{{ material.description }}</td>
			</tr>
			{% endif %}
			{% if material.more %}
			<tr>
			    <td>{{ material.more }}</td>
			</tr>
			{% endif %}
		</table>
	</td>
	<td>
		<table class="inner">
			{% if material.slides %}
		  <tr>
			    <td><a href="{{ material.slides }}">slides</a></td>
			</tr>
			{% endif %}
			{% if material.handout %}
		    <tr>
			    <td><a href="{{ material.handout }}">handout</a></td>
			</tr>
			{% endif %}
			{% if material.worksheet %}
		    <tr>
			    <td><a href="{{ material.worksheet }}">worksheet</a></td>
			</tr>
			{% endif %}
			{% if material.solutions %}
			<tr>
			    <td><a href="{{ material.solutions }}">worksheet solutions</a></td>
			</tr>
			{% endif %}
			{% if material.mfile %}
		  <tr>
			    <td><a href="{{ material.mfile }}">Matlab code</a></td>
			</tr>
			{% endif %}
			{% if material.image %}
		  <tr>
			    <td><a href="{{ material.image }}">output image</a></td>
			</tr>
			{% endif %}
		</table>
	</td>
</tr>
{% endfor %}
</table>
