local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local expChatSharedModule = require(parent.ExpChatShared)
local roduxModule = require(parent.Rodux)
local dictionary = require(parent.llama).Dictionary
local actions = expChat.Actions

return roduxModule.createReducer({
	_propertyEnabled = true,
	_coreGuiEnabled = true,
	_devTextBoxEnabled = false,
	value = true
}, {
	[require(actions.ChatInputBarConfigurationEnabled).name] = function(p1, p2)
		-- upvalues: dictionary (ref)
		return dictionary.join(p1, {
			_propertyEnabled = p2.enabled,
			value = p1._coreGuiEnabled and (not p1._devTextBoxEnabled and p2.enabled)
		})
	end,
	[require(actions.SetCoreGuiEnabledChanged).name] = function(p1, p2)
		-- upvalues: dictionary (ref)
		return dictionary.join(p1, {
			_coreGuiEnabled = p2.enabled,
			value = p1._propertyEnabled and (not p1._devTextBoxEnabled and p2.enabled)
		})
	end,
	[require(actions.DevTextBoxEnabledChanged).name] = function(p1, p2)
		-- upvalues: dictionary (ref)
		return dictionary.join(p1, {
			_devTextBoxEnabled = p2.enabled,
			value = p1._coreGuiEnabled and p2.enabled
		})
	end,
	[expChatSharedModule.Actions.ClientAppLoaded.name] = function(p1, p2)
		-- upvalues: dictionary (ref)
		local isChatCoreGuiEnabled
		if not p1._propertyEnabled then
			isChatCoreGuiEnabled = p1._devTextBoxEnabled and p2.isChatCoreGuiEnabled
		end
		return dictionary.join(p1, {
			_coreGuiEnabled = p2.isChatCoreGuiEnabled,
			value = isChatCoreGuiEnabled
		})
	end
})