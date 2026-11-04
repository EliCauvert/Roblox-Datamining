local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local GetDeepValueModule = require(AppChat.Utils.getDeepValue)
local GetFriendsChatSettingsStoreModule = require(AppChat.Stores.GetFriendsChatSettingsStore)
local FFlagAppChatUseSignalsForChatSettingsModule = require(AppChat.Flags.FFlagAppChatUseSignalsForChatSettings)

return function()
	-- upvalues: FFlagAppChatUseSignalsForChatSettingsModule (copy), UseSignalStateFunction (copy), GetFriendsChatSettingsStoreModule (copy), UseSelectorFunction (copy), GetDeepValueModule (copy)
	return if FFlagAppChatUseSignalsForChatSettingsModule then UseSignalStateFunction(GetFriendsChatSettingsStoreModule(false).getChatEnabled) else UseSelectorFunction(function(p1)
		-- upvalues: GetDeepValueModule (upval)
		return GetDeepValueModule(p1, "ChatAppReducer.ChatSettings.chatEnabled") or false
	end)
end