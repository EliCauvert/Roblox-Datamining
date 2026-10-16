local ExpChat = script:FindFirstAncestor("ExpChat")
local SignalsReactModule = require(ExpChat.Parent.SignalsReact)
local GetChatStatusStoreModule = require(ExpChat.Stores.GetChatStatusStore)
local GetPresetChatStoreModule = require(ExpChat.Stores.GetPresetChatStore)
local GetIsARButtonVisibleModule = require(ExpChat.getIsARButtonVisible)

return function() --[[ Line: 21 | Named "useIsARButtonVisible" ]]
	-- upvalues: GetChatStatusStoreModule (copy), SignalsReactModule (copy), GetPresetChatStoreModule (copy), GetIsARButtonVisibleModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetChatStatusStoreModule(false).getChatStatus)
	local PresetChatStoreModule = GetPresetChatStoreModule(false)
	
	return GetIsARButtonVisibleModule(UseSignalStateResult, SignalsReactModule.useSignalState(PresetChatStoreModule.getIsEnabled), (SignalsReactModule.useSignalState(PresetChatStoreModule.getAccessLevel)))
end