local appComposition = script:FindFirstAncestor("AppComposition")
local parent = appComposition.Parent
local reactModule = require(parent.React)
local foundationProvider = require(parent.Foundation).FoundationProvider

return {
	name = appComposition.Name,
	roact = reactModule,
	reactRoblox = require(parent.Dev.ReactRoblox),
	mapStory = function(p1)
		-- upvalues: reactModule (ref), foundationProvider (ref)
		return function(p2)
			-- upvalues: reactModule (copy), foundationProvider (copy), p1 (ref)
			return reactModule.createElement(foundationProvider, { colorMode = p2.theme, device = p2.platform }, reactModule.createElement(p1, p2))
		end
	end,
	storyRoots = { appComposition }
}