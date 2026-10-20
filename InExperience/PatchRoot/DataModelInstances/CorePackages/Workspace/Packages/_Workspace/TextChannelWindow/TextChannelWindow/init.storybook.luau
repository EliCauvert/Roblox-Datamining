local TextChannelWindow = script:FindFirstAncestor("TextChannelWindow")
local Parent = TextChannelWindow.Parent
local ReactModule = require(Parent.React)
local FoundationProvider = require(Parent.Foundation).FoundationProvider

return {
	name = TextChannelWindow.Name,
	roact = ReactModule,
	reactRoblox = require(Parent.ReactRoblox),
	storyRoots = { TextChannelWindow },
	mapStory = function(p1)
		-- upvalues: ReactModule (copy), FoundationProvider (copy)
		return function(p2)
			-- upvalues: ReactModule (upval), FoundationProvider (upval), p1 (copy)
			return ReactModule.createElement(FoundationProvider, { colorMode = p2 and p2.theme, device = p2 and p2.platform }, ReactModule.createElement(p1, p2))
		end
	end
}