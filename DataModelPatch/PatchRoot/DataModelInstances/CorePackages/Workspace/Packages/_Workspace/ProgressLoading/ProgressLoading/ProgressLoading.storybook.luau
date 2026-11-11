local ProgressLoading = script:FindFirstAncestor("ProgressLoading")
local Parent = ProgressLoading.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local FoundationProvider = FoundationModule.FoundationProvider
local config = {
	Default = FoundationModule.Enums.Theme.Dark,
	Light = FoundationModule.Enums.Theme.Light,
	Dark = FoundationModule.Enums.Theme.Dark
}
local config1 = {
	Default = "Desktop",
	Desktop = "Desktop",
	Console = "Console"
}

return {
	name = "ProgressLoading",
	storyRoot = ProgressLoading,
	roact = ReactModule,
	reactRoblox = require(Parent.ReactRoblox),
	mapStory = function(p1)
		-- upvalues: ReactModule (copy), FoundationProvider (copy), config (copy), config1 (copy)
		return function(p2)
			-- upvalues: ReactModule (upval), FoundationProvider (upval), config (upval), config1 (upval), p1 (copy)
			return ReactModule.createElement(FoundationProvider, {
				theme = p2 and config[p2.theme] or config.Default,
				device = p2 and config1[p2.platform] or "Desktop"
			}, { Story = ReactModule.createElement(p1, p2) })
		end
	end
}