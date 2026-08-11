local chatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local parent = chatUIPrimitives.Parent
local reactModule = require(parent.React)
local foundationProvider = require(parent.Foundation).FoundationProvider

return {
	name = chatUIPrimitives.Name,
	roact = reactModule,
	reactRoblox = require(parent.Dev.ReactRoblox),
	storyRoots = { chatUIPrimitives },
	mapStory = function(p0) --[[ line: 17 ]]
		-- upvalues: reactModule (ref), foundationProvider (ref)
		return function(p1) --[[ line: 18 ]]
			-- upvalues: reactModule (copy), foundationProvider (copy), p0 (ref)
			return reactModule.createElement(foundationProvider, { colorMode = p1 and p1.theme, device = p1 and p1.platform }, reactModule.createElement(p0, p1))
		end
	end
}