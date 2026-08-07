local expChat = script:FindFirstAncestor("ExpChat")
local signalsReactModule = require(expChat.Parent.SignalsReact)
local getPresetChatStoreModule = require(expChat.Stores.GetPresetChatStore)
local fFlagExpChatUniverseChatPresetEnabledModule = require(expChat.Flags.FFlagExpChatUniverseChatPresetEnabled)
local constantsModule = require(expChat.PresetChat.Constants)

return function(value) --[[ line: 26 | named "usePresetSurfaceAvailable" ]]
	-- upvalues: getPresetChatStoreModule (ref), signalsReactModule (ref), constantsModule (ref), fFlagExpChatUniverseChatPresetEnabledModule (ref)
	local var5 = getPresetChatStoreModule(false)
	
	return not (not signalsReactModule.useSignalState(var5.getIsEnabled) or signalsReactModule.useSignalState(var5.getAccessLevel) ~= constantsModule.AccessLevel.Enabled) and (value == nil and not fFlagExpChatUniverseChatPresetEnabledModule)
end