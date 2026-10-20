local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Workspace.Packages.RobloxAppHooks)
local _ = require(CorePackages.Workspace.Packages.Style)

return function(_, p1)
	return {
		QrSize = 200,
		LicensePanelWidthScale = 0.6,
		PageTopMargin = p1.Size.Size_300,
		BackgroundGradientOffset = p1.Size.Size_1600,
		SafeAreaMargin = Vector2.new(p1.Size.Size_1600, p1.Size.Size_600),
		ContentMargin = Vector2.new(0, 136),
		TitleHeight = p1.Size.Size_1000,
		TileSize = Vector2.new(400, 400),
		ButtonSize = Vector2.new(1024, p1.Size.Size_1200),
		UserIconSize = p1.Size.Size_900,
		UsernameTextFont = p1.Typography.TitleLarge,
		UsernameTextStyle = {
			Color = p1.Color.Content.Default.Color3,
			Transparency = p1.Color.Content.Default.Transparency
		},
		NavigationItemIconStyle = {
			Color = p1.Color.Content.Emphasis.Color3,
			Transparency = p1.Color.Content.Emphasis.Transparency
		},
		NavigationItemTitleStyle = {
			Color = p1.Color.Content.Emphasis.Color3,
			Transparency = p1.Color.Content.Emphasis.Transparency
		},
		NavigationItemTitleFont = p1.Typography.TitleLarge,
		DisconnectTextFont = p1.Typography.TitleLarge
	}
end