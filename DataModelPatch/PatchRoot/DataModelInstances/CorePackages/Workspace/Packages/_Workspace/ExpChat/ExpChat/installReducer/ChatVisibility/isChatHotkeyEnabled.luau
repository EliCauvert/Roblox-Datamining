local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local Dictionary = require(Parent.llama).Dictionary
local Actions = ExpChat.Actions

return require(Parent.Rodux).createReducer({
	_propertyEnabled = true,
	_coreGuiEnabled = true,
	_devTextBoxEnabled = false,
	value = true
}, {
	[require(Actions.ChatInputBarConfigurationEnabled).name] = function(p1, p2)
		-- upvalues: Dictionary (copy)
		return Dictionary.join(p1, {
			_propertyEnabled = p2.enabled,
			value = p1._coreGuiEnabled and (not p1._devTextBoxEnabled and p2.enabled)
		})
	end,
	[require(Actions.SetCoreGuiEnabledChanged).name] = function(p1, p2)
		-- upvalues: Dictionary (copy)
		return Dictionary.join(p1, {
			_coreGuiEnabled = p2.enabled,
			value = p1._propertyEnabled and (not p1._devTextBoxEnabled and p2.enabled)
		})
	end,
	[require(Actions.DevTextBoxEnabledChanged).name] = function(p1, p2)
		-- upvalues: Dictionary (copy)
		return Dictionary.join(p1, {
			_devTextBoxEnabled = p2.enabled,
			value = p1._coreGuiEnabled and p2.enabled
		})
	end,
	[require(Parent.ExpChatShared).Actions.ClientAppLoaded.name] = function(p1, p2)
		-- upvalues: Dictionary (copy)
		return Dictionary.join(p1, {
			_coreGuiEnabled = p2.isChatCoreGuiEnabled,
			value = if p1._propertyEnabled then p2.isChatCoreGuiEnabled else p1._devTextBoxEnabled and p2.isChatCoreGuiEnabled
		})
	end
})