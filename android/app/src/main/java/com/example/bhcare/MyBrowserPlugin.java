package com.example.bhcare;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

/** MyBrowserPlugin */
public class MyBrowserPlugin implements FlutterPlugin, MethodChannel.MethodCallHandler {
    private MethodChannel channel;
    private Activity activity;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "openBrowser");
        channel.setMethodCallHandler(this);
    }

    public static void registerWith(PluginRegistry.Registrar registrar) {
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "openBrowser");
        MyBrowserPlugin instance = new MyBrowserPlugin();
        instance.activity = registrar.activity();
        channel.setMethodCallHandler(instance);
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        if (call.method.equals("openBrowser")) {
            String url = call.argument("url");
            openBrowser(url);
            result.success(true);
        } else {
            result.notImplemented();
        }
    }

    private void openBrowser(String url) {
        if (activity != null) {
            Intent intent = new Intent(Intent.ACTION_VIEW);
            intent.setData(Uri.parse(url));
            activity.startActivity(intent);
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }
}





