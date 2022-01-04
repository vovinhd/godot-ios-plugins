#include "web_view.h"

#import <UIKit/UIKit.h>
#import <WebKit/WKWebView.h>

WebView *instance = NULL; 

@interface GodotWebView : UIViewController

@property(strong,nonatomic) WKWebView *webView;

 - (void) load_url: (const char *) url;
 - (void) close;
@end 

@implementation GodotWebView

- (void)load_url:(const char*)url {
    NSString *ns_url_str = [[NSString alloc] initWithUTF8String: url ];
    NSLog(@"[GodotWebView] Opening URL: %@", ns_url_str);

    NSURL *ns_url = [NSURL URLWithString: ns_url_str];
    NSURLRequest *request = [NSURLRequest requestWithURL: ns_url];

    _webView = [[WKWebView alloc] initWithFrame:self.view.frame];
    [_webView loadRequest:request];
    _webView.frame = CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_webView];
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
    // https://github.com/godotengine/godot/blob/master/modules/gdnative/gdnative/string.cpp#L132
    const char * _url = url.utf8().get_data();
    [godot_web_view load_url:_url];
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