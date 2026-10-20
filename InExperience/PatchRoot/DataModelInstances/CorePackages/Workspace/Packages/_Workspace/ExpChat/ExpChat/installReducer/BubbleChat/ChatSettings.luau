local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local Dictionary = require(Parent.llama).Dictionary
local Actions = ExpChat.Actions

return require(Parent.Rodux).createReducer(require(script.Parent.DefaultSettings), {
	[require(Actions.ConfigurationObjectsLoaded).name] = function(p1, p2)
		-- upvalues: Dictionary (copy)
		return Dictionary.join(p1, p2.bubbleChatSettings)
	end,
	[require(Actions.BubbleChatSettingsChanged).name] = function(p1, p2)
		-- upvalues: Dictionary (copy)
		return Dictionary.join(p1, { [p2.property] = p2.value })
	end,
	[require(Actions.BubbleChatChildSettingChanged).name] = function(p1, p2)
		-- upvalues: Dictionary (copy)
		return Dictionary.join(p1, {
			[p2.childName] = Dictionary.join(p1[p2.childName], { [p2.property] = p2.value })
		})
	end,
	[require(Actions.BubbleChatChildRemoved).name] = function(p1, p2)
		-- upvalues: Dictionary (copy)
		return Dictionary.removeKey(p1, p2.childName)
	end
})