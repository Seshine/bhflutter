package com.example.bhcare;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

/** MyBrowserPlugin */
public class MyBrowserPlugin implements MethodChannel.MethodCallHandler {
    private final PluginRegistry.Registrar mRegistrar;
    private MyBrowserPlugin(PluginRegistry.Registrar registrar) {
        this.mRegistrar = registrar;
    }
    /** Plugin registration. */
    public static void registerWith(PluginRegistry.Registrar registrar) {
        final MethodChannel channel = new MethodChannel(registrar.messenger(),
                "my_browser");
        MyBrowserPlugin instance = new MyBrowserPlugin(registrar);
        channel.setMethodCallHandler(instance);
    }
    @Override
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
        String url = call.argument("url");
        if (call.method.equals("getPlatformVersion")) {
            result.success("Android " + android.os.Build.VERSION.RELEASE);
        } else if (call.method.equals("openBrowser")) {
            openBrowser(call, result, url);
        } else {
            result.notImplemented();
        }
    }
    private void openBrowser(MethodCall call, MethodChannel.Result result, String url) {
        Activity activity = mRegistrar.activity();
        if (activity == null) {
            result.error("ACTIVITY_NOT_AVAILABLE",
                    "Browser cannot be opened without foreground activity",
                    null);
            return;

        }

        Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.setData(Uri.parse(url));
        activity.startActivity(intent);
        result.success((Object) true);
    }
}

