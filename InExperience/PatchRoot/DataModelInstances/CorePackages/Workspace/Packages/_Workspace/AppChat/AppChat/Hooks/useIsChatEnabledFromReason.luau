local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local GetDeepValueModule = require(AppChat.Utils.getDeepValue)
local GetFriendsChatSettingsStoreModule = require(AppChat.Stores.GetFriendsChatSettingsStore)
local FFlagAppChatUseSignalsForChatSettingsModule = require(AppChat.Flags.FFlagAppChatUseSignalsForChatSettings)

return function(p1)
	-- upvalues: FFlagAppChatUseSignalsForChatSettingsModule (copy), GetFriendsChatSettingsStoreModule (copy), UseSignalStateFunction (copy), UseSelectorFunction (copy), GetDeepValueModule (copy)
	if FFlagAppChatUseSignalsForChatSettingsModule then
		local FriendsChatSettingsStoreModule = GetFriendsChatSettingsStoreModule(false)
		
		return UseSignalStateFunction(if p1 == "globalRulesEnabled" then FriendsChatSettingsStoreModule.getGlobalRulesEnabled elseif p1 == "privacySettingsEnabled" then FriendsChatSettingsStoreModule.getPrivacySettingsEnabled else FriendsChatSettingsStoreModule.getThirdPartyPrivacySettingsEnabled)
	else
		return UseSelectorFunction(function(p2)
			-- upvalues: GetDeepValueModule (upval), p1 (copy)
			return GetDeepValueModule(p2, `ChatAppReducer.ChatSettings.{p1}`) or false
		end)
	end
end