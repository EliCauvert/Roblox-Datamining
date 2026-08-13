local settingReactView = script:FindFirstAncestor("SettingReactView")
local parent = settingReactView.Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local foundationModule = require(parent.Foundation)
local foundationProvider = foundationModule.FoundationProvider
local t = {
	Default = foundationModule.Enums.ColorMode.Dark,
	Light = foundationModule.Enums.ColorMode.Light,
	Dark = foundationModule.Enums.ColorMode.Dark
}
local t_1 = {
	Default = "Desktop",
	Desktop = "Desktop",
	Console = "Console"
}

return {
	name = settingReactView.Name,
	storyRoot = settingReactView,
	roact = reactModule,
	reactRoblox = reactRobloxModule,
	mapStory = function(p0) --[[ line: 26 ]]
		-- upvalues: reactModule (ref), foundationProvider (ref), t (ref), t_1 (ref)
		return function(p1) --[[ line: 27 ]]
			-- upvalues: reactModule (copy), foundationProvider (copy), t (copy), t_1 (copy), p0 (ref)
			return reactModule.createElement(foundationProvider, {
				colorMode = if p1 then t[p1.theme] else t.Default,
				device = if p1 then t_1[p1.platform] else "Desktop"
			}, reactModule.createElement(p0, p1))
		end
	end
}