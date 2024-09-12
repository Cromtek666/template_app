# template_app

A template for new apps.
Includes new look, providers, extended routing and json-functionality.
Also desktop usability

## Including

change_app_package_name: A new name for the template_app 
    dart run change_app_package_name:main com.new.package.name

build_runner
path
path_provider
go_router
riverpod
shared_preferences

icons_launcher:
    dart run icons_launcher:create

logger:
Logger.level = Level.warning;
logger.t("Trace log");
logger.d("Debug log");
logger.i("Info log");
logger.w("Warning log");
logger.e("Error log", error: 'Test Error');
logger.f("What a fatal log", error: error, stackTrace: stackTrace);

extra_pedantic

theme_tailor:
    dart run build_runner build --delete-conflicting-outputs

intl
intl_utils:
    dart run intl_utils:generate

flutter:
getwidget
desktop_window


## DemoContent: (Features)
HomePage
Settings

## Using:


