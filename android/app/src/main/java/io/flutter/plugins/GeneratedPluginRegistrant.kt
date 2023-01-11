package io.flutter.plugins

import androidx.annotation.Keep

/**
 * Generated file. Do not edit.
 * This file is generated by the Flutter tool based on the
 * plugins that support the Android platform.
 */
@Keep
object GeneratedPluginRegistrant {
    private const val TAG = "GeneratedPluginRegistrant"
    fun registerWith(@NonNull flutterEngine: FlutterEngine) {
        try {
            flutterEngine.getPlugins().add(FlutterFirebaseFirestorePlugin())
        } catch (e: Exception) {
            Log.e(
                TAG,
                "Error registering plugin cloud_firestore, io.flutter.plugins.firebase.firestore.FlutterFirebaseFirestorePlugin",
                e
            )
        }
        try {
            flutterEngine.getPlugins().add(FlutterFirebaseCorePlugin())
        } catch (e: Exception) {
            Log.e(
                TAG,
                "Error registering plugin firebase_core, io.flutter.plugins.firebase.core.FlutterFirebaseCorePlugin",
                e
            )
        }
        try {
            flutterEngine.getPlugins().add(FlutterFirebaseMessagingPlugin())
        } catch (e: Exception) {
            Log.e(
                TAG,
                "Error registering plugin firebase_messaging, io.flutter.plugins.firebase.messaging.FlutterFirebaseMessagingPlugin",
                e
            )
        }
        try {
            flutterEngine.getPlugins().add(FlutterEmailSenderPlugin())
        } catch (e: Exception) {
            Log.e(
                TAG,
                "Error registering plugin flutter_email_sender, com.sidlatau.flutteremailsender.FlutterEmailSenderPlugin",
                e
            )
        }
        try {
            flutterEngine.getPlugins().add(FlutterLocalNotificationsPlugin())
        } catch (e: Exception) {
            Log.e(
                TAG,
                "Error registering plugin flutter_local_notifications, com.dexterous.flutterlocalnotifications.FlutterLocalNotificationsPlugin",
                e
            )
        }
        try {
            flutterEngine.getPlugins().add(FlutterAndroidLifecyclePlugin())
        } catch (e: Exception) {
            Log.e(
                TAG,
                "Error registering plugin flutter_plugin_android_lifecycle, io.flutter.plugins.flutter_plugin_android_lifecycle.FlutterAndroidLifecyclePlugin",
                e
            )
        }
        try {
            flutterEngine.getPlugins().add(FlutterSmsPlugin())
        } catch (e: Exception) {
            Log.e(
                TAG,
                "Error registering plugin flutter_sms, com.example.flutter_sms.FlutterSmsPlugin",
                e
            )
        }
        try {
            flutterEngine.getPlugins().add(ImagePickerPlugin())
        } catch (e: Exception) {
            Log.e(
                TAG,
                "Error registering plugin image_picker_android, io.flutter.plugins.imagepicker.ImagePickerPlugin",
                e
            )
        }
        try {
            flutterEngine.getPlugins().add(SharedPreferencesPlugin())
        } catch (e: Exception) {
            Log.e(
                TAG,
                "Error registering plugin shared_preferences_android, io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin",
                e
            )
        }
        try {
            flutterEngine.getPlugins().add(UrlLauncherPlugin())
        } catch (e: Exception) {
            Log.e(
                TAG,
                "Error registering plugin url_launcher_android, io.flutter.plugins.urllauncher.UrlLauncherPlugin",
                e
            )
        }
    }
}