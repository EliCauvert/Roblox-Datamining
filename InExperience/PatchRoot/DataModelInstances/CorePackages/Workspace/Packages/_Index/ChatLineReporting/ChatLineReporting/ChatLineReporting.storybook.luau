local ChatLineReporting = script:FindFirstAncestor("ChatLineReporting")
local Parent = ChatLineReporting.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.Dev.ReactRoblox)
local MockProvidersModule = require(script.Parent.MockProviders)
local Dictionary = CryoModule.Dictionary

return {
	roact = ReactModule,
	reactRoblox = ReactRobloxModule,
	mapStory = function(p1)
		-- upvalues: Dictionary (copy), ReactModule (copy), MockProvidersModule (copy)
		return function(p2)
			-- upvalues: Dictionary (upval), ReactModule (upval), MockProvidersModule (upval), p1 (copy)
			return ReactModule.createElement(MockProvidersModule, {}, {
				story = ReactModule.createElement(p1, (Dictionary.union(p2, p2.definition and p2.definition.props or {})))
			})
		end
	end,
	storyRoots = { ChatLineReporting }
}