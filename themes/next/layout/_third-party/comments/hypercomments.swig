{% if not (theme.duoshuo and theme.duoshuo.shortname) and not theme.duoshuo_shortname and not theme.disqus_shortname %}

	{% if theme.hypercomments_id %}

		{% if page.comments %}
		<script type="text/javascript" src="/js/src/hypercomments.js"></script>
		{% endif %}

		<script type="text/javascript">
		_hcwp = window._hcwp || [];

		_hcwp.push({widget:"Bloggerstream", widget_id: {{ theme.hypercomments_id }}, selector:".hc-comment-count", label: "{\%COUNT%\}" });

		{% if page.comments %}
		_hcwp.push({widget:"Stream", widget_id: {{ theme.hypercomments_id }}, xid: "{{ page.path }}", texts: _hcwp_texts, callback: function(app) {
			if (_clipboard_buttons_add) {
				$(".hc__messages").bind('DOMNodeInserted', function(e) {
					e = $(e.target);
					if (e.hasClass("hc__message")){
						_clipboard_buttons_add(e.find(".hc__message__txt pre"));
					} else if (e.parent().hasClass("hc__message__txt")) {
						_clipboard_buttons_add(e.filter("pre").add(e.find("pre")));
					}
				});
			}
		}});
		{% endif %}

		(function() {
		if("HC_LOAD_INIT" in window)return;
		HC_LOAD_INIT = true;
		var lang = "zh";
		var hcc = document.createElement("script"); hcc.type = "text/javascript"; hcc.async = true;
		hcc.src = ("https:" == document.location.protocol ? "https" : "http")+"://w.hypercomments.com/widget/hc/{{ theme.hypercomments_id }}/"+lang+"/widget.js";
		var s = document.getElementsByTagName("script")[0];
		s.parentNode.insertBefore(hcc, s.nextSibling);
		})();
		</script>

	{% endif %}

{% endif %}
