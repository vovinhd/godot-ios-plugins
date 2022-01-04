#ifndef WEB_VIEW_H 
#define WEB_VIEW_H

#include "core/version.h"
#include "core/object.h"

#ifdef __OBJC__
@class GodotWebView;
#else
typedef void GodotWebView;
#endif

class WebView : public Object {
    GDCLASS(WebView, Object);
    static void _bind_methods(); 

    GodotWebView *godot_web_view; 

public: 
    static WebView *get_singleton(); 

    void load_url(String url);
    void close();

    WebView();
    ~WebView();

};

#endif
