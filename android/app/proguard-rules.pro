# Flutter Proguard Rules
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }
-keep class io.flutter.embedding.** { *; }

# Pigeon and Shared Preferences
-keep class dev.flutter.pigeon.** { *; }
-keep class **.SharedPreferencesApi* { *; }
-keep class **.SharedPreferences* { *; }
-keep class io.flutter.plugins.sharedpreferences.** { *; }
-keep interface io.flutter.plugins.sharedpreferences.** { *; }

# SQLite & Drift
-keep class org.sqlite.** { *; }
-keep class com.simonbinder.** { *; }

# Kotlin coroutines
-keepnames class kotlinx.coroutines.** { *; }
-keepclassmembers class * extends kotlin.coroutines.jvm.internal.ContinuationImpl {
    *** invokeSuspend(...);
}
