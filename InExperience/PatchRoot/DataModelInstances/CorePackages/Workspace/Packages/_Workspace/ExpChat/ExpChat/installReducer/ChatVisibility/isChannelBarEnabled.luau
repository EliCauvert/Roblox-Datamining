local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local expChatSharedModule = require(parent.ExpChatShared)
local roduxModule = require(parent.Rodux)
local dictionary = require(parent.llama).Dictionary
local actions = expChat.Actions

return roduxModule.createReducer({
	_propertyEnabled = false,
	_coreGuiEnabled = true,
	_topBarVisibility = true,
	value = false
}, {
	[require(actions.ChannelTabsConfigurationEnabled).name] = function(p0, p1)
		-- upvalues: dictionary (ref)
		return dictionary.join(p0, {
			_propertyEnabled = p1.enabled,
			value = p0._topBarVisibility and (p0._coreGuiEnabled and p1.enabled)
		})
	end,
	[require(actions.ChatTopBarButtonActivated).name] = function(p2, p3)
		-- upvalues: dictionary (ref)
		return dictionary.join(p2, {
			_topBarVisibility = p3.isVisible,
			value = p2._propertyEnabled and (p2._coreGuiEnabled and p3.isVisible)
		})
	end,
	[require(actions.SetCoreGuiEnabledChanged).name] = function(p4, p5)
		-- upvalues: dictionary (ref)
		return dictionary.join(p4, {
			_coreGuiEnabled = p5.enabled,
			value = p4._propertyEnabled and (p4._topBarVisibility and p5.enabled)
		})
	end,
	[expChatSharedModule.Actions.ClientAppLoaded.name] = function(p6, p7)
		-- upvalues: dictionary (ref)
		return dictionary.join(p6, {
			_coreGuiEnabled = p7.isChatCoreGuiEnabled,
			value = p6._propertyEnabled and (p6._topBarVisibility and p7.isChatCoreGuiEnabled)
		})
	end
})