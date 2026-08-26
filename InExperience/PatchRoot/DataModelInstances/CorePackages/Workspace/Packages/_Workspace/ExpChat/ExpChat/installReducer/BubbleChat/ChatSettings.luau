local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local roduxModule = require(parent.Rodux)
local dictionary = require(parent.llama).Dictionary
local actions = expChat.Actions

return roduxModule.createReducer(require(script.Parent.DefaultSettings), {
	[require(actions.ConfigurationObjectsLoaded).name] = function(p1, p2)
		-- upvalues: dictionary (ref)
		return dictionary.join(p1, p2.bubbleChatSettings)
	end,
	[require(actions.BubbleChatSettingsChanged).name] = function(p1, p2)
		-- upvalues: dictionary (ref)
		return dictionary.join(p1, { [p2.property] = p2.value })
	end,
	[require(actions.BubbleChatChildSettingChanged).name] = function(p1, p2)
		-- upvalues: dictionary (ref)
		return dictionary.join(p1, {
			[p2.childName] = dictionary.join(p1[p2.childName], { [p2.property] = p2.value })
		})
	end,
	[require(actions.BubbleChatChildRemoved).name] = function(p1, p2)
		-- upvalues: dictionary (ref)
		return dictionary.removeKey(p1, p2.childName)
	end
})