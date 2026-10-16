local AppBlox = script:FindFirstAncestor("AppBlox")
local Parent = AppBlox.Parent
local ReactModule = require(Parent.React)
local FoundationProvider = require(Parent.Foundation).FoundationProvider

return {
	name = AppBlox.Name,
	roact = ReactModule,
	reactRoblox = require(Parent.Dev.ReactRoblox),
	mapStory = function(p1) --[[ Line: 14 ]]
		-- upvalues: ReactModule (copy), FoundationProvider (copy)
		return function(p2) --[[ Line: 15 ]]
			-- upvalues: ReactModule (upval), FoundationProvider (upval), p1 (copy)
			return ReactModule.createElement(FoundationProvider, { colorMode = p2.theme, device = p2.platform }, ReactModule.createElement(p1, p2))
		end
	end,
	storyRoots = { AppBlox }
}