local textChannelWindow = script:FindFirstAncestor("TextChannelWindow")
local parent = textChannelWindow.Parent
local reactModule = require(parent.React)
local foundationProvider = require(parent.Foundation).FoundationProvider

return {
	name = textChannelWindow.Name,
	roact = reactModule,
	reactRoblox = require(parent.ReactRoblox),
	storyRoots = { textChannelWindow },
	mapStory = function(p1)
		-- upvalues: reactModule (ref), foundationProvider (ref)
		return function(p2)
			-- upvalues: reactModule (copy), foundationProvider (copy), p1 (ref)
			return reactModule.createElement(foundationProvider, { colorMode = p2 and p2.theme, device = p2 and p2.platform }, reactModule.createElement(p1, p2))
		end
	end
}