local ChatLineReporting = script:FindFirstAncestor("ChatLineReporting")
local Parent = ChatLineReporting.Parent
local ReactModule = require(Parent.React)
local MockProvidersModule = require(script.Parent.MockProviders)
local Dictionary = require(Parent.Cryo).Dictionary

return {
	roact = ReactModule,
	reactRoblox = require(Parent.Dev.ReactRoblox),
	mapStory = function(p1) --[[ Line: 14 ]]
		-- upvalues: Dictionary (copy), ReactModule (copy), MockProvidersModule (copy)
		return function(p2) --[[ Line: 15 ]]
			-- upvalues: Dictionary (upval), ReactModule (upval), MockProvidersModule (upval), p1 (copy)
			return ReactModule.createElement(MockProvidersModule, {}, {
				story = ReactModule.createElement(p1, (Dictionary.union(p2, p2.definition and p2.definition.props or {})))
			})
		end
	end,
	storyRoots = { ChatLineReporting }
}