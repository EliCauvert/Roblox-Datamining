local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local t = {
	Default = foundationModule.Enums.ColorMode.Dark,
	Light = foundationModule.Enums.ColorMode.Light,
	Dark = foundationModule.Enums.ColorMode.Dark
}

return {
	name = momentsCommon.Name,
	roact = reactModule,
	reactRoblox = require(parent.Dev.ReactRoblox),
	storyRoot = momentsCommon,
	mapStory = function(p1)
		-- upvalues: t (ref), reactModule (ref), foundationModule (ref)
		return function(p2)
			-- upvalues: t (copy), reactModule (copy), foundationModule (copy), p1 (ref)
			return reactModule.createElement(foundationModule.FoundationProvider, { colorMode = if p2 then t[p2.theme] else t.Default }, { Child = reactModule.createElement(p1, p2) })
		end
	end
}