local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local Parent = MomentsCommon.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local config = {
	Default = FoundationModule.Enums.Theme.Dark,
	Light = FoundationModule.Enums.Theme.Light,
	Dark = FoundationModule.Enums.Theme.Dark
}

return {
	name = MomentsCommon.Name,
	roact = ReactModule,
	reactRoblox = require(Parent.Dev.ReactRoblox),
	storyRoot = MomentsCommon,
	mapStory = function(p1)
		-- upvalues: config (copy), ReactModule (copy), FoundationModule (copy)
		return function(p2)
			-- upvalues: config (upval), ReactModule (upval), FoundationModule (upval), p1 (copy)
			return ReactModule.createElement(FoundationModule.FoundationProvider, { theme = p2 and config[p2.theme] or config.Default }, { Child = ReactModule.createElement(p1, p2) })
		end
	end
}