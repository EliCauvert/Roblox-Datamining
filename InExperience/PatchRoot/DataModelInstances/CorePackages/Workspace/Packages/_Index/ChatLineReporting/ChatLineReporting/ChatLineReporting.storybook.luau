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
	mapStory = function(p0) --[[ line: 14 ]]
		-- upvalues: dictionary (ref), reactModule (ref), mockProvidersModule (ref)
		return function(p1) --[[ line: 15 ]]
			-- upvalues: dictionary (copy), reactModule (copy), mockProvidersModule (copy), p0 (ref)
			return reactModule.createElement(mockProvidersModule, {}, {
				story = reactModule.createElement(p0, dictionary.union(p1, if p1.definition then p1.definition.props else {}))
			})
		end
	end,
	storyRoots = { chatLineReporting }
}