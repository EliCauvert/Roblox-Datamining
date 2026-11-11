local CorePackages = game:GetService("CorePackages")
local Theme = require(CorePackages.Packages.Foundation).Enums.Theme
local ThemeOverridesBuilderModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Themes.ThemeOverridesBuilder)
local FFlagEnableCoreContentThemeUpdates = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableCoreContentThemeUpdates
local config = {
	Kids = {
		[Theme.Dark] = {
			["Surface.Surface_0"] = "Color.Extended.Blue.Blue_1400",
			["Surface.Surface_100"] = "Color.Extended.Blue.Blue_1300",
			["Surface.Surface_200"] = "Color.Extended.Blue.Blue_1200",
			["Surface.Surface_300"] = "Color.Extended.Blue.Blue_1100",
			["OverMedia.OverMedia_0.Color3"] = "Color.Extended.Blue.Blue_1400.Color3",
			["OverMedia.OverMedia_100.Color3"] = "Color.Extended.Blue.Blue_1300.Color3",
			["OverMedia.OverMedia_200.Color3"] = "Color.Extended.Blue.Blue_1200.Color3",
			["OverMedia.OverMedia_300.Color3"] = "Color.Extended.Blue.Blue_1100.Color3",
			["Content.Default"] = "Color.Extended.Gray.Gray_300",
			["Content.Muted"] = "Color.Extended.Gray.Gray_400",
			["Content.Link"] = "Color.Extended.Blue.Blue_200",
			["System.Neutral"] = "Color.Extended.Gray.Gray_400",
			["System.Alert"] = "Color.Extended.Red.Red_700",
			["ActionEmphasis.Background"] = "Color.Extended.Gray.Gray_100",
			["ActionEmphasis.Foreground"] = "Color.Extended.Blue.Blue_1400",
			["ActionSoftEmphasis.Background.Color3"] = "Color.Extended.Gray.Gray_100.Color3",
			["ActionSoftEmphasis.Background.Transparency"] = "Color.Extended.Black.Black_20.Transparency",
			["ActionSoftEmphasis.Foreground"] = "Color.Extended.Gray.Gray_100",
			["ActionOverMedia.Foreground"] = "Color.Extended.Gray.Gray_1100",
			["ActionAlert.Foreground"] = "Color.Extended.Red.Red_600",
			["ActionSubEmphasis.Background"] = "Color.Extended.Blue.Blue_700",
			["ActionSubEmphasis.Foreground"] = "Color.Extended.Gray.Gray_100",
			["ActionSubtle.Background"] = "Color.Shift.Shift_300",
			["ActionSubtle.Foreground"] = "Color.Extended.Gray.Gray_100",
			["ActionSubtle.Border"] = "Color.Extended.Black.Black_0",
			["Common.NavigationBar"] = "Color.Extended.Blue.Blue_1400"
		},
		[Theme.Light] = {
			["Surface.Surface_0"] = "Color.Extended.Blue.Blue_100",
			["Surface.Surface_100"] = "Color.Extended.Blue.Blue_200",
			["Surface.Surface_200"] = "Color.Extended.Blue.Blue_100",
			["Surface.Surface_300"] = "Color.Extended.Blue.Blue_200",
			["OverMedia.OverMedia_0.Color3"] = "Color.Extended.Blue.Blue_100.Color3",
			["OverMedia.OverMedia_100.Color3"] = "Color.Extended.Blue.Blue_200.Color3",
			["OverMedia.OverMedia_200.Color3"] = "Color.Extended.Blue.Blue_100.Color3",
			["OverMedia.OverMedia_300.Color3"] = "Color.Extended.Blue.Blue_200.Color3",
			["Content.Emphasis"] = "Color.Extended.Gray.Gray_1100",
			["Content.Default"] = "Color.Extended.Gray.Gray_800",
			["Content.Muted"] = "Color.Extended.Gray.Gray_700",
			["Content.Link"] = "Color.Extended.Blue.Blue_1000",
			["System.Contrast"] = "Color.Extended.Gray.Gray_1100",
			["System.Neutral"] = "Color.Extended.Gray.Gray_800",
			["System.Success"] = "Color.Extended.Green.Green_800",
			["System.Warning"] = "Color.Extended.Yellow.Yellow_600",
			["ActionOverMedia.Background"] = "Color.Extended.Gray.Gray_1100",
			["ActionStandard.Foreground"] = "Color.Extended.Gray.Gray_1100",
			["ActionUtility.Foreground"] = "Color.Extended.Gray.Gray_1100",
			["ActionLink.Foreground"] = "Color.Extended.Gray.Gray_1100",
			["ActionAlert.Foreground"] = "Color.Extended.Red.Red_1000",
			["ActionSubtle.Background"] = "Color.Shift.Shift_300",
			["ActionSubtle.Foreground"] = "Color.Extended.Gray.Gray_1100",
			["ActionSubtle.Border"] = "Color.Extended.Black.Black_0",
			["Common.NavigationBar"] = "Color.Extended.Blue.Blue_100"
		}
	}
}
local config1 = {
	Kids = {
		[Theme.Dark] = {
			["Semantic.Color.Background.Default"] = "Color.Extended.Blue.Blue_1400",
			["Semantic.Color.Background.Contrast"] = "Color.Extended.Blue.Blue_1300",
			["Semantic.Color.Background.Muted"] = "Color.Extended.Blue.Blue_1200",
			["Semantic.Color.BackgroundUi.Default"] = "Color.Extended.Blue.Blue_1100",
			["Semantic.Color.Text.Default"] = "Color.Extended.Gray.Gray_300",
			["Semantic.Color.Text.Muted"] = "Color.Extended.Gray.Gray_400",
			["Semantic.Color.Text.Link"] = "Color.Extended.Blue.Blue_200",
			["Semantic.Color.Icon.Default"] = "Color.Extended.Gray.Gray_300"
		},
		[Theme.Light] = {
			["Semantic.Color.Background.Default"] = "Color.Extended.Blue.Blue_100",
			["Semantic.Color.Background.Contrast"] = "Color.Extended.Blue.Blue_200",
			["Semantic.Color.Background.Muted"] = "Color.Extended.Blue.Blue_100",
			["Semantic.Color.BackgroundUi.Default"] = "Color.Extended.Blue.Blue_200",
			["Semantic.Color.Text.Emphasis"] = "Color.Extended.Gray.Gray_1100",
			["Semantic.Color.Text.Default"] = "Color.Extended.Gray.Gray_800",
			["Semantic.Color.Text.Muted"] = "Color.Extended.Gray.Gray_700",
			["Semantic.Color.Text.Link"] = "Color.Extended.Blue.Blue_1000",
			["Semantic.Color.Icon.Emphasis"] = "Color.Extended.Gray.Gray_1100",
			["Semantic.Color.Icon.Default"] = "Color.Extended.Gray.Gray_800"
		}
	}
}
local Config = if FFlagEnableCoreContentThemeUpdates then {
	Kids = {
		[Theme.Dark] = {
			["Surface.Surface_0.Color3"] = Color3.fromHex("#001357"),
			["Surface.Surface_100.Color3"] = Color3.fromHex("#00176B"),
			["Surface.Surface_200.Color3"] = Color3.fromHex("#011B79"),
			["Surface.Surface_300.Color3"] = Color3.fromHex("#02208D"),
			["OverMedia.OverMedia_0.Color3"] = Color3.fromHex("#001357"),
			["OverMedia.OverMedia_100.Color3"] = Color3.fromHex("#00176B"),
			["OverMedia.OverMedia_200.Color3"] = Color3.fromHex("#011B79"),
			["OverMedia.OverMedia_300.Color3"] = Color3.fromHex("#02208D"),
			["Content.Link"] = "Color.Extended.Blue.Blue_500",
			["ActionAlert.Foreground"] = "Color.Extended.Red.Red_600",
			["Common.NavigationBar.Color3"] = Color3.fromHex("#001357")
		},
		[Theme.Light] = {
			["Surface.Surface_0.Color3"] = "Color.Extended.Blue.Blue_200.Color3",
			["Surface.Surface_100.Color3"] = Color3.fromHex("#B9CFFF"),
			["Surface.Surface_200.Color3"] = "Color.Extended.Blue.Blue_200.Color3",
			["Surface.Surface_300.Color3"] = Color3.fromHex("#B9CFFF"),
			["OverMedia.OverMedia_0.Color3"] = "Color.Extended.Blue.Blue_200.Color3",
			["OverMedia.OverMedia_100.Color3"] = Color3.fromHex("#B9CFFF"),
			["OverMedia.OverMedia_200.Color3"] = "Color.Extended.Blue.Blue_200.Color3",
			["OverMedia.OverMedia_300.Color3"] = Color3.fromHex("#B9CFFF"),
			["Content.Default"] = "Color.Extended.Gray.Gray_800",
			["Content.Emphasis"] = "Color.Extended.Gray.Gray_1100",
			["Content.Muted"] = "Color.Extended.Gray.Gray_700",
			["Content.Link"] = "Color.Extended.Blue.Blue_1000",
			["System.Alert"] = "Color.Extended.Red.Red_900",
			["System.Contrast"] = "Color.Extended.Gray.Gray_1100",
			["System.Neutral"] = "Color.Extended.Gray.Gray_800",
			["System.Success"] = "Color.Extended.Green.Green_900",
			["System.Warning"] = "Color.Extended.Yellow.Yellow_900",
			["ActionAlert.Background.Color3"] = Color3.fromHex("#0C176F"),
			["ActionAlert.Foreground"] = "Color.Extended.Red.Red_1100",
			["ActionLink.Foreground"] = "Color.Extended.Gray.Gray_1100",
			["ActionOverMedia.Background"] = "Color.Extended.Gray.Gray_1100",
			["ActionStandard.Background.Color3"] = Color3.fromHex("#0C176F"),
			["ActionStandard.Foreground"] = "Color.Extended.Gray.Gray_1100",
			["ActionUtility.Foreground"] = "Color.Extended.Gray.Gray_1100",
			["Shift.Shift_100.Color3"] = Color3.fromHex("#0C176F"),
			["Shift.Shift_200.Color3"] = Color3.fromHex("#0C176F"),
			["Shift.Shift_300.Color3"] = Color3.fromHex("#0C176F"),
			["Shift.Shift_400.Color3"] = Color3.fromHex("#0C176F"),
			["Stroke.Default.Color3"] = Color3.fromHex("#0C176F"),
			["Stroke.Emphasis.Color3"] = Color3.fromHex("#0C176F"),
			["Stroke.Muted.Color3"] = Color3.fromHex("#0C176F"),
			["Common.HeavyDivider.Color3"] = Color3.fromHex("#0C176F"),
			["Common.NavigationBar.Color3"] = "Color.Extended.Blue.Blue_200.Color3",
			["Common.Shimmer.Color3"] = Color3.fromHex("#0C176F")
		}
	}
} else config
local Config1 = if FFlagEnableCoreContentThemeUpdates then {
	Kids = {
		[Theme.Dark] = {
			["Semantic.Color.Background.Default.Color3"] = Color3.fromHex("#001357"),
			["Semantic.Color.Background.Contrast.Color3"] = Color3.fromHex("#00176B"),
			["Semantic.Color.Background.Muted.Color3"] = Color3.fromHex("#011B79"),
			["Semantic.Color.BackgroundUi.Default.Color3"] = Color3.fromHex("#02208D"),
			["Semantic.Color.BackgroundUi.Contrast.Color3"] = Color3.fromHex("#001357")
		},
		[Theme.Light] = {
			["Semantic.Color.Background.Default.Color3"] = "Color.Extended.Blue.Blue_200.Color3",
			["Semantic.Color.Background.Contrast.Color3"] = Color3.fromHex("#B9CFFF"),
			["Semantic.Color.Background.Muted.Color3"] = "Color.Extended.Blue.Blue_200.Color3",
			["Semantic.Color.BackgroundUi.Default.Color3"] = Color3.fromHex("#B9CFFF"),
			["Semantic.Color.BackgroundUi.Contrast.Color3"] = "Color.Extended.Blue.Blue_200.Color3"
		}
	}
} else config1

return {
	Kids = {
		[Theme.Dark] = ThemeOverridesBuilderModule(Theme.Dark, Config.Kids[Theme.Dark], Config.Kids[Theme.Light], Config1.Kids[Theme.Dark]),
		[Theme.Light] = ThemeOverridesBuilderModule(Theme.Light, Config.Kids[Theme.Light], Config.Kids[Theme.Dark], Config1.Kids[Theme.Light])
	}
}