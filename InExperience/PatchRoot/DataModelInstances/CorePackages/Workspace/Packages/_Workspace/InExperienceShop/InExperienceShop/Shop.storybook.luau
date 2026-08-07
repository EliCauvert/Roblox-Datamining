local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local contextProvidersModule = require(inExperienceShop.Internal.ContextProviders)

return {
	name = inExperienceShop.Name,
	roact = reactModule,
	reactRoblox = require(parent.ReactRoblox),
	storyRoots = { inExperienceShop.Components },
	mapStory = function(p0) --[[ line: 16 ]]
		-- upvalues: reactModule (ref), contextProvidersModule (ref)
		return function(p1) --[[ line: 17 ]]
			-- upvalues: reactModule (copy), contextProvidersModule (copy), p0 (ref)
			return reactModule.createElement(contextProvidersModule, { theme = p1.theme, overlayGui = p1.focus }, reactModule.createElement(p0, p1))
		end
	end
}