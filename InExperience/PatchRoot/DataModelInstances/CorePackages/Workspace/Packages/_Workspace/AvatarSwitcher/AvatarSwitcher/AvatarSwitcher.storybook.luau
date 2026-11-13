local AvatarSwitcher = script:FindFirstAncestor("AvatarSwitcher")
local Parent = AvatarSwitcher.Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local ContextProvidersModule = require(AvatarSwitcher.Internal.ContextProviders)

return {
	name = AvatarSwitcher.Name,
	roact = ReactModule,
	reactRoblox = ReactRobloxModule,
	storyRoots = { AvatarSwitcher.Components },
	mapStory = function(p1)
		-- upvalues: ReactModule (copy), ContextProvidersModule (copy)
		return function(p2)
			-- upvalues: ReactModule (upval), ContextProvidersModule (upval), p1 (copy)
			return ReactModule.createElement(ContextProvidersModule, { theme = p2.theme, overlayGui = p2.focus }, ReactModule.createElement(p1, p2))
		end
	end
}