local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local roduxModule = require(parent.Rodux)
local dictionary = require(parent.llama).Dictionary
local actions = expChat.Actions

return roduxModule.createReducer({ preferredTransparency = 1 }, {
	[require(actions.ClientSettingsLoaded).name] = function(p1, p2)
		-- upvalues: dictionary (ref)
		return dictionary.join(p1, p2.value)
	end,
	[require(actions.ClientSettingsChanged).name] = function(p1, p2)
		-- upvalues: dictionary (ref)
		return dictionary.join(p1, { [p2.property] = p2.value })
	end
})