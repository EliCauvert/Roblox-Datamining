local progressLoading = script:FindFirstAncestor("ProgressLoading")
local parent = progressLoading.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
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
	name = "ProgressLoading",
	storyRoot = progressLoading,
	roact = reactModule,
	reactRoblox = reactRobloxModule,
	mapStory = function(p1)
		-- upvalues: reactModule (ref), foundationProvider (ref), t (ref), t_1 (ref)
		return function(p2)
			-- upvalues: reactModule (copy), foundationProvider (copy), t (copy), t_1 (copy), p1 (ref)
			return reactModule.createElement(foundationProvider, {
				colorMode = if p2 then t[p2.theme] else t.Default,
				device = if p2 then t_1[p2.platform] else "Desktop"
			}, { Story = reactModule.createElement(p1, p2) })
		end
	end
}