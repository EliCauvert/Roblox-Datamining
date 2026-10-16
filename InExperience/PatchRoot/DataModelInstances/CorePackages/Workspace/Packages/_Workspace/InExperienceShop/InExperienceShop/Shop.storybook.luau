local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local ReactModule = require(Parent.React)
local ContextProvidersModule = require(InExperienceShop.Internal.ContextProviders)

return {
	name = InExperienceShop.Name,
	roact = ReactModule,
	reactRoblox = require(Parent.ReactRoblox),
	storyRoots = { InExperienceShop.Components },
	mapStory = function(p1) --[[ Line: 16 ]]
		-- upvalues: ReactModule (copy), ContextProvidersModule (copy)
		return function(p2) --[[ Line: 17 ]]
			-- upvalues: ReactModule (upval), ContextProvidersModule (upval), p1 (copy)
			return ReactModule.createElement(ContextProvidersModule, { theme = p2.theme, overlayGui = p2.focus }, ReactModule.createElement(p1, p2))
		end
	end
}