local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local Parent = ChatUIPrimitives.Parent
local ReactModule = require(Parent.React)
local FoundationProvider = require(Parent.Foundation).FoundationProvider

return {
	name = ChatUIPrimitives.Name,
	roact = ReactModule,
	reactRoblox = require(Parent.Dev.ReactRoblox),
	storyRoots = { ChatUIPrimitives },
	mapStory = function(p1)
		-- upvalues: ReactModule (copy), FoundationProvider (copy)
		return function(p2)
			-- upvalues: ReactModule (upval), FoundationProvider (upval), p1 (copy)
			return ReactModule.createElement(FoundationProvider, { theme = p2 and p2.theme, device = p2 and p2.platform }, ReactModule.createElement(p1, p2))
		end
	end
}