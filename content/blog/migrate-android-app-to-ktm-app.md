+++
title = 'Migrate Android App to Ktm App'
date = 2025-04-29T13:24:27+02:00
Tags = ['kotlin', 'android']
Categories = ['tech', 'tutorial']
+++


# 📚 Migrating an Android App Module to Kotlin Multiplatform: Full Technical Guide

⸻

## 🛠 1. Objective

Transform a standard Android application module into a Kotlin Multiplatform module, while:
	•	Preserving Android application functionality
	•	Preparing clean future expansion for other platforms (e.g., iOS, Desktop)
	•	Aligning to Kotlin 1.9+ and Android SourceSet Layout V2

⸻

## 📂 2. Initial Module Setup

A typical Android-only app module looks like:

sampleapp/
 └── src/
     ├── main/
     │    ├── java/
     │    ├── res/
     │    └── AndroidManifest.xml
     ├── androidTest/
     └── test/

with build.gradle.kts based on com.android.application plugin.

⸻

## 🧩 3. Apply Plugins

Replace the plugins block in build.gradle.kts:

plugins {
    kotlin("multiplatform")
    id("com.android.application")
}



⸻

## ✍️ 4. Define Multiplatform Targets

Inside kotlin {}, configure:

kotlin {
    androidTarget()

    iosArm64()
    iosSimulatorArm64()

    sourceSets {
        val commonMain by getting
        val commonTest by getting
        val androidMain by getting
        val androidUnitTest by getting
        val androidInstrumentedTest by getting
    }
}

Important:
	•	androidTarget() is for Android
	•	iosArm64(), iosSimulatorArm64() prepare for iOS native later
	•	SourceSets renamed for Kotlin 1.9+: androidUnitTest, androidInstrumentedTest

⸻

## ## 🔥 5. Restructure Dependencies

Inside each source set, use only implementation():

sourceSets {
    val commonMain by getting {
        dependencies {
            // Common/shared dependencies
        }
    }
    val commonTest by getting {
        dependencies {
            implementation(kotlin("test"))
        }
    }
    val androidMain by getting {
        dependencies {
            implementation(libs.androidx.core.ktx)
            implementation(libs.androidx.appcompat)
            implementation(libs.material)
            implementation(libs.androidx.constraintlayout)
            implementation(libs.androidx.navigation.fragment.ktx)
            implementation(libs.androidx.navigation.ui.ktx)
        }
    }
    val androidUnitTest by getting {
        dependencies {
            implementation(libs.junit)
        }
    }
    val androidInstrumentedTest by getting {
        dependencies {
            implementation(libs.androidx.junit)
            implementation(libs.androidx.espresso.core)
        }
    }
}

🚫 Do not use testImplementation inside sourceSets{} (wrong in KMP).

⸻

## 🛠 6. Refactor Source Folder Layout

Move and rename folders to match KMP expectations:

# Create androidMain structure
mkdir -p src/androidMain/kotlin
mkdir -p src/androidMain/res

# Move app code
git mv src/main/java/* src/androidMain/kotlin/
git mv src/main/res/* src/androidMain/res/
git mv src/main/AndroidManifest.xml src/androidMain/AndroidManifest.xml

# Move unit tests
git mv src/test src/androidUnitTest

# Move instrumentation tests
git mv src/androidTest src/androidInstrumentedTest

# Create shared code skeletons
mkdir -p src/commonMain/kotlin
mkdir -p src/commonTest/kotlin



⸻

## 🛠 7. Update gradle.properties

Explicitly opt-in for Android SourceSet Layout V2:

kotlin.android.sourceSetLayoutVersion=2

(Prevents future Gradle warnings.)

⸻

## 🛠 8. Android Block

Keep your android {} configuration as it was, fully preserved:

android {
    namespace = "your.package.name"
    compileSdk = 35

    defaultConfig {
        applicationId = "your.package.name"
        minSdk = 24
        targetSdk = 35
        versionCode = 1
        versionName = "1.0"
        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
    }

    buildTypes {
        release {
            isMinifyEnabled = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = "11"
    }

    buildFeatures {
        viewBinding = true
    }
}



⸻

## 🐛 9. Common Pitfalls & Errors

Error	Cause	Fix
Unresolved reference: androidTarget()	Missing/incorrect KMP plugin	Ensure kotlin("multiplatform") applied
Unresolved reference: testImplementation inside sourceSets	Wrong usage inside KMP	Replace with implementation()
KotlinSourceSet with name 'androidTest' not found	Kotlin 1.9+ layout change	Rename androidTest → androidUnitTest
Gradle sync fails due to missing folders	Incorrect move commands	Create required folders manually
Android app not runnable after migration	Misplaced Manifest or missing androidMain setup	Check src/androidMain/AndroidManifest.xml



⸻

## ✅ 10. Final Folder Structure

sampleapp/
 └── src/
     ├── androidMain/
     │    ├── kotlin/
     │    ├── res/
     │    └── AndroidManifest.xml
     ├── androidUnitTest/
     │    └── kotlin/
     ├── androidInstrumentedTest/
     │    └── kotlin/
     ├── commonMain/
     │    └── kotlin/
     └── commonTest/
         └── kotlin/



⸻

## 📈 11. Result
	•	The Android app remains fully runnable (no loss of execution).
	•	Future platform expansions (iOS, Desktop) now only require adding code under commonMain/.
	•	Android-specific code isolated under androidMain/.

⸻

## 🎯 Conclusion

Migrating from Android-only to Kotlin Multiplatform is highly structured and fully achievable without breaking your app, provided you:
	•	Update plugins and sourceSets correctly
	•	Move folders following KMP conventions
	•	Adjust dependencies inside the right sourceSet

✅ Migration lays a robust foundation for truly multi-platform mobile development.

⸻

## ✍️ Bonus Tip (Optional Next Steps)
	•	Set up CocoaPods plugin (id("org.jetbrains.kotlin.native.cocoapods")) if you plan to integrate iOS directly.
	•	Add Desktop target with jvm() if you want a Desktop client.

⸻
