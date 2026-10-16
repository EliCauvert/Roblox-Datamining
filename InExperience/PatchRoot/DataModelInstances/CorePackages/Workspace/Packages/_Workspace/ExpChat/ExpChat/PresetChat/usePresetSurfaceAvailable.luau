local ExpChat = script:FindFirstAncestor("ExpChat")
local SignalsReactModule = require(ExpChat.Parent.SignalsReact)
local GetPresetChatStoreModule = require(ExpChat.Stores.GetPresetChatStore)
local FFlagExpChatUniverseChatPresetEnabledModule = require(ExpChat.Flags.FFlagExpChatUniverseChatPresetEnabled)
local ConstantsModule = require(ExpChat.PresetChat.Constants)

return function(p1) --[[ Line: 26 | Named "usePresetSurfaceAvailable" ]]
	-- upvalues: GetPresetChatStoreModule (copy), SignalsReactModule (copy), ConstantsModule (copy), FFlagExpChatUniverseChatPresetEnabledModule (copy)
	local PresetChatStoreModule = GetPresetChatStoreModule(false)
	local UseSignalStateResult = SignalsReactModule.useSignalState(PresetChatStoreModule.getAccessLevel)
	
	return if SignalsReactModule.useSignalState(PresetChatStoreModule.getIsEnabled) and UseSignalStateResult == ConstantsModule.AccessLevel.Enabled then p1 ~= nil or FFlagExpChatUniverseChatPresetEnabledModule else false
end