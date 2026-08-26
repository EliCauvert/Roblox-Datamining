local expChat = script:FindFirstAncestor("ExpChat")
local signalsReactModule = require(expChat.Parent.SignalsReact)
local getChatStatusStoreModule = require(expChat.Stores.GetChatStatusStore)
local getPresetChatStoreModule = require(expChat.Stores.GetPresetChatStore)
local getIsARButtonVisibleModule = require(expChat.getIsARButtonVisible)

return function()
	-- upvalues: getChatStatusStoreModule (ref), signalsReactModule (ref), getPresetChatStoreModule (ref), getIsARButtonVisibleModule (ref)
	local var1 = getPresetChatStoreModule(false)
	
	return getIsARButtonVisibleModule(signalsReactModule.useSignalState(getChatStatusStoreModule(false).getChatStatus), signalsReactModule.useSignalState(var1.getIsEnabled), signalsReactModule.useSignalState(var1.getAccessLevel))
end