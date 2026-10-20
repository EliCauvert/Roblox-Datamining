local AppComposition = script:FindFirstAncestor("AppComposition")
local Parent = AppComposition.Parent
local ReactModule = require(Parent.React)
local FoundationProvider = require(Parent.Foundation).FoundationProvider

return {
	name = AppComposition.Name,
	roact = ReactModule,
	reactRoblox = require(Parent.Dev.ReactRoblox),
	mapStory = function(p1)
		-- upvalues: ReactModule (copy), FoundationProvider (copy)
		return function(p2)
			-- upvalues: ReactModule (upval), FoundationProvider (upval), p1 (copy)
			return ReactModule.createElement(FoundationProvider, { colorMode = p2.theme, device = p2.platform }, ReactModule.createElement(p1, p2))
		end
	end,
	storyRoots = { AppComposition }
}