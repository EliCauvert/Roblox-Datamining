local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ExpChatSharedModule = require(Parent.ExpChatShared)
local RoduxModule = require(Parent.Rodux)
local Dictionary = require(Parent.llama).Dictionary
local Actions = ExpChat.Actions

return RoduxModule.createReducer({
	_propertyEnabled = false,
	_coreGuiEnabled = true,
	_topBarVisibility = true,
	value = false
}, {
	[require(Actions.ChannelTabsConfigurationEnabled).name] = function(p1, p2)
		-- upvalues: Dictionary (copy)
		return Dictionary.join(p1, {
			_propertyEnabled = p2.enabled,
			value = p1._topBarVisibility and (p1._coreGuiEnabled and p2.enabled)
		})
	end,
	[require(Actions.ChatTopBarButtonActivated).name] = function(p1, p2)
		-- upvalues: Dictionary (copy)
		return Dictionary.join(p1, {
			_topBarVisibility = p2.isVisible,
			value = p1._propertyEnabled and (p1._coreGuiEnabled and p2.isVisible)
		})
	end,
	[require(Actions.SetCoreGuiEnabledChanged).name] = function(p1, p2)
		-- upvalues: Dictionary (copy)
		return Dictionary.join(p1, {
			_coreGuiEnabled = p2.enabled,
			value = p1._propertyEnabled and (p1._topBarVisibility and p2.enabled)
		})
	end,
	[ExpChatSharedModule.Actions.ClientAppLoaded.name] = function(p1, p2)
		-- upvalues: Dictionary (copy)
		return Dictionary.join(p1, {
			_coreGuiEnabled = p2.isChatCoreGuiEnabled,
			value = p1._propertyEnabled and (p1._topBarVisibility and p2.isChatCoreGuiEnabled)
		})
	end
})