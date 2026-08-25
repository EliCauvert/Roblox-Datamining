local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local roduxModule = require(parent.Rodux)
local dictionary = require(parent.llama).Dictionary
local actions = expChat.Actions

return roduxModule.createReducer(require(script.Parent.DefaultSettings), {
	[require(actions.ConfigurationObjectsLoaded).name] = function(p0, p1)
		-- upvalues: dictionary (ref)
		return dictionary.join(p0, p1.bubbleChatSettings)
	end,
	[require(actions.BubbleChatSettingsChanged).name] = function(p2, p3)
		-- upvalues: dictionary (ref)
		return dictionary.join(p2, { [p3.property] = p3.value })
	end,
	[require(actions.BubbleChatChildSettingChanged).name] = function(p4, p5)
		-- upvalues: dictionary (ref)
		return dictionary.join(p4, {
			[p5.childName] = dictionary.join(p4[p5.childName], { [p5.property] = p5.value })
		})
	end,
	[require(actions.BubbleChatChildRemoved).name] = function(p6, p7)
		-- upvalues: dictionary (ref)
		return dictionary.removeKey(p6, p7.childName)
	end
})