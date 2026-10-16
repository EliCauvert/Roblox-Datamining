local SettingReactView = script:FindFirstAncestor("SettingReactView")
local Parent = SettingReactView.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local FoundationProvider = FoundationModule.FoundationProvider
local config = {
	Default = FoundationModule.Enums.ColorMode.Dark,
	Light = FoundationModule.Enums.ColorMode.Light,
	Dark = FoundationModule.Enums.ColorMode.Dark
}
local config1 = {
	Default = "Desktop",
	Desktop = "Desktop",
	Console = "Console"
}

return {
	name = SettingReactView.Name,
	storyRoot = SettingReactView,
	roact = ReactModule,
	reactRoblox = require(Parent.ReactRoblox),
	mapStory = function(p1) --[[ Line: 26 ]]
		-- upvalues: ReactModule (copy), FoundationProvider (copy), config (copy), config1 (copy)
		return function(p2) --[[ Line: 27 ]]
			-- upvalues: ReactModule (upval), FoundationProvider (upval), config (upval), config1 (upval), p1 (copy)
			return ReactModule.createElement(FoundationProvider, {
				colorMode = p2 and config[p2.theme] or config.Default,
				device = p2 and config1[p2.platform] or "Desktop"
			}, ReactModule.createElement(p1, p2))
		end
	end
}