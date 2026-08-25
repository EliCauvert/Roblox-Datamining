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
	[require(actions.ChatInputBarConfigurationEnabled).name] = function(p0, p1)
		-- upvalues: dictionary (ref)
		return dictionary.join(p0, {
			_propertyEnabled = p1.enabled,
			value = p0._coreGuiEnabled and (not p0._devTextBoxEnabled and p1.enabled)
		})
	end,
	[require(actions.SetCoreGuiEnabledChanged).name] = function(p2, p3)
		-- upvalues: dictionary (ref)
		return dictionary.join(p2, {
			_coreGuiEnabled = p3.enabled,
			value = p2._propertyEnabled and (not p2._devTextBoxEnabled and p3.enabled)
		})
	end,
	[require(actions.DevTextBoxEnabledChanged).name] = function(p4, p5)
		-- upvalues: dictionary (ref)
		return dictionary.join(p4, {
			_devTextBoxEnabled = p5.enabled,
			value = p4._coreGuiEnabled and p5.enabled
		})
	end,
	[expChatSharedModule.Actions.ClientAppLoaded.name] = function(p6, p7)
		-- upvalues: dictionary (ref)
		local isChatCoreGuiEnabled
		if not p6._propertyEnabled then
			isChatCoreGuiEnabled = p6._devTextBoxEnabled and p7.isChatCoreGuiEnabled
		end
		return dictionary.join(p6, {
			_coreGuiEnabled = p7.isChatCoreGuiEnabled,
			value = isChatCoreGuiEnabled
		})
	end
})