local expChat = script:FindFirstAncestor("ExpChat")
local signalsReactModule = require(expChat.Parent.SignalsReact)
local getChatStatusStoreModule = require(expChat.Stores.GetChatStatusStore)
local getPresetChatStoreModule = require(expChat.Stores.GetPresetChatStore)
local getIsARButtonVisibleModule = require(expChat.getIsARButtonVisible)

return function() --[[ line: 21 | named "useIsARButtonVisible" ]]
	-- upvalues: getChatStatusStoreModule (ref), signalsReactModule (ref), getPresetChatStoreModule (ref), getIsARButtonVisibleModule (ref)
	local var5 = getPresetChatStoreModule(false)
	
	return getIsARButtonVisibleModule(signalsReactModule.useSignalState(getChatStatusStoreModule(false).getChatStatus), signalsReactModule.useSignalState(var5.getIsEnabled), signalsReactModule.useSignalState(var5.getAccessLevel))
end