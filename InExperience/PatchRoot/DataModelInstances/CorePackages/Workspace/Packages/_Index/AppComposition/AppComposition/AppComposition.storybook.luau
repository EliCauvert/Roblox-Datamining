local appComposition = script:FindFirstAncestor("AppComposition")
local parent = appComposition.Parent
local reactModule = require(parent.React)
local foundationProvider = require(parent.Foundation).FoundationProvider

return {
	name = appComposition.Name,
	roact = reactModule,
	reactRoblox = require(parent.Dev.ReactRoblox),
	mapStory = function(p0)
		-- upvalues: reactModule (ref), foundationProvider (ref)
		return function(p1)
			-- upvalues: reactModule (copy), foundationProvider (copy), p0 (ref)
			return reactModule.createElement(foundationProvider, { colorMode = p1.theme, device = p1.platform }, reactModule.createElement(p0, p1))
		end
	end,
	storyRoots = { appComposition }
}