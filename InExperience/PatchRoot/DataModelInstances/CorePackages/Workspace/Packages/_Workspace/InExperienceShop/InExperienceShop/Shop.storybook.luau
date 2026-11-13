local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local ContextProvidersModule = require(InExperienceShop.Internal.ContextProviders)

return {
	name = InExperienceShop.Name,
	roact = ReactModule,
	reactRoblox = ReactRobloxModule,
	storyRoots = { InExperienceShop.Components },
	mapStory = function(p1)
		-- upvalues: ReactModule (copy), ContextProvidersModule (copy)
		return function(p2)
			-- upvalues: ReactModule (upval), ContextProvidersModule (upval), p1 (copy)
			return ReactModule.createElement(ContextProvidersModule, { theme = p2.theme, overlayGui = p2.focus }, ReactModule.createElement(p1, p2))
		end
	end
}