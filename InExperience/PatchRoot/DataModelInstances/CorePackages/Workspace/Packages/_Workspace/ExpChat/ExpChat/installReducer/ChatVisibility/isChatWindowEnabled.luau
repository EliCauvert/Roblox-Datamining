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
	value = true
}, {
	[require(actions.ChatWindowConfigurationEnabled).name] = function(p1, p2)
		-- upvalues: dictionary (ref)
		return dictionary.join(p1, {
			_propertyEnabled = p2.enabled,
			value = p1._topBarVisibility and (p1._coreGuiEnabled and p2.enabled)
		})
	end,
	[require(actions.ChatTopBarButtonActivated).name] = function(p1, p2)
		-- upvalues: dictionary (ref)
		return dictionary.join(p1, {
			_topBarVisibility = p2.isVisible,
			value = p1._propertyEnabled and (p1._coreGuiEnabled and p2.isVisible)
		})
	end,
	[require(actions.SetCoreGuiEnabledChanged).name] = function(p1, p2)
		-- upvalues: dictionary (ref)
		return dictionary.join(p1, {
			_coreGuiEnabled = p2.enabled,
			value = p1._propertyEnabled and (p1._topBarVisibility and p2.enabled)
		})
	end,
	[expChatSharedModule.Actions.ClientAppLoaded.name] = function(p1, p2)
		-- upvalues: dictionary (ref)
		return dictionary.join(p1, {
			_coreGuiEnabled = p2.isChatCoreGuiEnabled,
			value = p1._propertyEnabled and (p1._topBarVisibility and p2.isChatCoreGuiEnabled)
		})
	end
})