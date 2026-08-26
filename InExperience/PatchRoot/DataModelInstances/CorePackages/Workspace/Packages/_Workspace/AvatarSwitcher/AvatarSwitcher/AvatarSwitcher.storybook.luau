local avatarSwitcher = script:FindFirstAncestor("AvatarSwitcher")
local parent = avatarSwitcher.Parent
local reactModule = require(parent.React)
local contextProvidersModule = require(avatarSwitcher.Internal.ContextProviders)

return {
	name = avatarSwitcher.Name,
	roact = reactModule,
	reactRoblox = require(parent.ReactRoblox),
	storyRoots = { avatarSwitcher.Components },
	mapStory = function(p1)
		-- upvalues: reactModule (ref), contextProvidersModule (ref)
		return function(p2)
			-- upvalues: reactModule (copy), contextProvidersModule (copy), p1 (ref)
			return reactModule.createElement(contextProvidersModule, { theme = p2.theme, overlayGui = p2.focus }, reactModule.createElement(p1, p2))
		end
	end
}