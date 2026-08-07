local progressLoading = script:FindFirstAncestor("ProgressLoading")
local parent = progressLoading.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local foundationProvider = foundationModule.FoundationProvider
local t = {
	Default = foundationModule.Enums.Theme.Dark,
	Light = foundationModule.Enums.Theme.Light,
	Dark = foundationModule.Enums.Theme.Dark
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
	mapStory = function(p0) --[[ line: 22 ]]
		-- upvalues: reactModule (ref), foundationProvider (ref), t (ref), t_1 (ref)
		return function(p1) --[[ line: 23 ]]
			-- upvalues: reactModule (copy), foundationProvider (copy), t (copy), t_1 (copy), p0 (ref)
			return reactModule.createElement(foundationProvider, {
				theme = if p1 then t[p1.theme] else t.Default,
				device = if p1 then t_1[p1.platform] else t_1.Default
			}, { Story = reactModule.createElement(p0, p1) })
		end
	end
}