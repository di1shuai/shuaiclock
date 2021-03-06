package main

import (
	"github.com/go-flutter-desktop/go-flutter"
	"github.com/go-flutter-desktop/plugins/shared_preferences"
)

var options = []flutter.Option{
	flutter.WindowInitialDimensions(1280, 800),
	flutter.AddPlugin(&shared_preferences.SharedPreferencesPlugin{
		VendorName:      "di1shuai",
		ApplicationName: "ShuaiClock",
	}),
}
