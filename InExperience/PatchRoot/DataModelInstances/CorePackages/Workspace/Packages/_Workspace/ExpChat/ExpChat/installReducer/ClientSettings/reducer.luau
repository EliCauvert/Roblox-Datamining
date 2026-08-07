local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local roduxModule = require(parent.Rodux)
local dictionary = require(parent.llama).Dictionary
local actions = expChat.Actions

return roduxModule.createReducer({ preferredTransparency = 1 }, {
	[require(actions.ClientSettingsLoaded).name] = function(p0, p1) --[[ line: 18 ]]
		-- upvalues: dictionary (ref)
		return dictionary.join(p0, p1.value)
	end,
	[require(actions.ClientSettingsChanged).name] = function(p2, p3) --[[ line: 22 ]]
		-- upvalues: dictionary (ref)
		return dictionary.join(p2, { [p3.property] = p3.value })
	end
})