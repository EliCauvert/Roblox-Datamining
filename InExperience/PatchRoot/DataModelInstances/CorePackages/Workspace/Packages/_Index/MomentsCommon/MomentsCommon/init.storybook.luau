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
	mapStory = function(p0)
		-- upvalues: t (ref), reactModule (ref), foundationModule (ref)
		return function(p1)
			-- upvalues: t (copy), reactModule (copy), foundationModule (copy), p0 (ref)
			return reactModule.createElement(foundationModule.FoundationProvider, { colorMode = if p1 then t[p1.theme] else t.Default }, { Child = reactModule.createElement(p0, p1) })
		end
	end
}