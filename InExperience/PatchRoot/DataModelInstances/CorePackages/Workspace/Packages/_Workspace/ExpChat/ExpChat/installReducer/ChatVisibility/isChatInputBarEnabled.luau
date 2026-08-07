local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local expChatSharedModule = require(parent.ExpChatShared)
local roduxModule = require(parent.Rodux)
local dictionary = require(parent.llama).Dictionary
local actions = expChat.Actions

return roduxModule.createReducer({
	_propertyEnabled = true,
	_coreGuiEnabled = true,
	_topBarVisibility = true,
	_devTextBoxEnabled = false,
	value = true
}, {
	[require(actions.ChatInputBarConfigurationEnabled).name] = function(p0, p1) --[[ line: 31 ]]
		-- upvalues: dictionary (ref)
		return dictionary.join(p0, {
			_propertyEnabled = p1.enabled,
			value = p0._topBarVisibility and (p0._coreGuiEnabled and (not p0._devTextBoxEnabled and p1.enabled))
		})
	end,
	[require(actions.ChatTopBarButtonActivated).name] = function(p2, p3) --[[ line: 43 ]]
		-- upvalues: dictionary (ref)
		return dictionary.join(p2, {
			_topBarVisibility = p3.isVisible,
			value = p2._propertyEnabled and (p2._coreGuiEnabled and (not p2._devTextBoxEnabled and p3.isVisible))
		})
	end,
	[require(actions.SetCoreGuiEnabledChanged).name] = function(p4, p5) --[[ line: 55 ]]
		-- upvalues: dictionary (ref)
		return dictionary.join(p4, {
			_coreGuiEnabled = p5.enabled,
			value = p4._propertyEnabled and (p4._topBarVisibility and (not p4._devTextBoxEnabled and p5.enabled))
		})
	end,
	[require(actions.DevTextBoxEnabledChanged).name] = function(p6, p7) --[[ line: 67 ]]
		-- upvalues: dictionary (ref)
		return dictionary.join(p6, {
			_devTextBoxEnabled = p7.enabled,
			value = p6._propertyEnabled and (p6._topBarVisibility and (p6._coreGuiEnabled and not p7.enabled))
		})
	end,
	[expChatSharedModule.Actions.ClientAppLoaded.name] = function(p8, p9) --[[ line: 74 ]]
		-- upvalues: dictionary (ref)
		return dictionary.join(p8, {
			_coreGuiEnabled = p9.isChatCoreGuiEnabled,
			value = p8._propertyEnabled and (p8._topBarVisibility and (not p8._devTextBoxEnabled and p9.isChatCoreGuiEnabled))
		})
	end
})