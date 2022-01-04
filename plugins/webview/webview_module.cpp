#include "webview_module.h"

#include "core/engine.h"
#include "core/version.h"

#include "web_view.h"

WebView *webview;

void godot_webview_init() {
	webview = memnew(WebView);
	Engine::get_singleton()->add_singleton(Engine::Singleton("WebView", webview));
}

void godot_webview_deinit() {
	if (webview) {
		memdelete(webview);
	}
}