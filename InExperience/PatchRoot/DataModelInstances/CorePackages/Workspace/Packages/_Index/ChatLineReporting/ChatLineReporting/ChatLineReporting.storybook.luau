local chatLineReporting = script:FindFirstAncestor("ChatLineReporting")
local parent = chatLineReporting.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.Dev.ReactRoblox)
local mockProvidersModule = require(script.Parent.MockProviders)
local dictionary = cryoModule.Dictionary

return {
	roact = reactModule,
	reactRoblox = reactRobloxModule,
	mapStory = function(p1)
		-- upvalues: dictionary (ref), reactModule (ref), mockProvidersModule (ref)
		return function(p2)
			-- upvalues: dictionary (copy), reactModule (copy), mockProvidersModule (copy), p1 (ref)
			return reactModule.createElement(mockProvidersModule, {}, {
				story = reactModule.createElement(p1, dictionary.union(p2, if p2.definition then p2.definition.props else {}))
			})
		end
	end,
	storyRoots = { chatLineReporting }
}