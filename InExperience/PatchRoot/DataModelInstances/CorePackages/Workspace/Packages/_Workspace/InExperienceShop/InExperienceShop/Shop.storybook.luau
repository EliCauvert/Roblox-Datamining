local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local contextProvidersModule = require(inExperienceShop.Internal.ContextProviders)

return {
	name = inExperienceShop.Name,
	roact = reactModule,
	reactRoblox = require(parent.ReactRoblox),
	storyRoots = { inExperienceShop.Components },
	mapStory = function(p1)
		-- upvalues: reactModule (ref), contextProvidersModule (ref)
		return function(p2)
			-- upvalues: reactModule (copy), contextProvidersModule (copy), p1 (ref)
			return reactModule.createElement(contextProvidersModule, { theme = p2.theme, overlayGui = p2.focus }, reactModule.createElement(p1, p2))
		end
	end
}