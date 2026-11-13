local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ReactRobloxModule = require(CorePackages.Packages.ReactRoblox)
local FoundationModule = require(CorePackages.Packages.Foundation)
local AppStyleProvider = require(CorePackages.Packages.UIBlox).App.Style.AppStyleProvider
local FoundationProvider = FoundationModule.FoundationProvider
local ColorMode = FoundationModule.Enums.ColorMode

return {
	name = "PlayerList (legacy)",
	storyRoot = script.Parent,
	roact = ReactModule,
	reactRoblox = ReactRobloxModule,
	mapStory = function(p1)
		-- upvalues: ReactModule (copy), FoundationProvider (copy), ColorMode (copy), AppStyleProvider (copy)
		return function(p2)
			-- upvalues: ReactModule (upval), FoundationProvider (upval), ColorMode (upval), AppStyleProvider (upval), p1 (copy)
			local Settings = p2.settings
			
			return ReactModule.createElement(FoundationProvider, {
				colorMode = ColorMode.Dark,
				preferences = Settings,
				scale = if Settings then Settings.scale else nil
			}, {
				Style = ReactModule.createElement(AppStyleProvider, {
					style = {
						themeName = "Dark",
						fontName = "Gotham",
						settings = Settings
					}
				}, { Child = ReactModule.createElement(p1, p2) })
			})
		end
	end
}