#include "web_view.h"

#import <UIKit/UIKit.h>

WebView *instance = NULL; 

@interface GodotWebView : UIViewController
 - (void) load_url: (String) url;
 - (void) close;
@end 

@implementation GodotWebView

- (void)load_url:(String)url {
    // NSString *ns_url = [[NSString alloc] initWithUTF8String:url.c_str()];
    NSLog(@"[GodotWebView] Opening URL: %@", &url);
}

- (void)close {
    NSLog(@"[GodotWebView] closing");
}

@end

WebView *WebView::get_singleton() {
	return instance;
}

void WebView::_bind_methods() {
    ClassDB::bind_method(D_METHOD("load_url", "url"), &WebView::load_url);
    ClassDB::bind_method(D_METHOD("close"), &WebView::close);
}

void WebView::load_url(String url) {
    [godot_web_view load_url:url];
}

void WebView::close() {
    [godot_web_view close];
}

WebView::WebView() { 
    instance = this; 
    godot_web_view = [[GodotWebView alloc] init];

    NSLog(@"Hello from WebView");
}

WebView::~WebView() {
    instance = NULL;
    godot_web_view = nil;
}