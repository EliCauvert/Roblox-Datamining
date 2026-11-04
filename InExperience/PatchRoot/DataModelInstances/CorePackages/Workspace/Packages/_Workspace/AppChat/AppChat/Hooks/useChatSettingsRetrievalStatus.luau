local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local GetDeepValue2Module = require(AppChat.Utils.getDeepValue2)
local GetFriendsChatSettingsStoreModule = require(AppChat.Stores.GetFriendsChatSettingsStore)
local FFlagAppChatUseSignalsForChatSettingsModule = require(AppChat.Flags.FFlagAppChatUseSignalsForChatSettings)

return function()
	-- upvalues: FFlagAppChatUseSignalsForChatSettingsModule (copy), UseSignalStateFunction (copy), GetFriendsChatSettingsStoreModule (copy), UseSelectorFunction (copy), GetDeepValue2Module (copy)
	return if FFlagAppChatUseSignalsForChatSettingsModule then UseSignalStateFunction(GetFriendsChatSettingsStoreModule(false).getRetrievalStatus) else UseSelectorFunction(function(p1)
		-- upvalues: GetDeepValue2Module (upval)
		return GetDeepValue2Module(p1, "ChatAppReducer.ChatSettings.retrievalStatus")
	end)
end