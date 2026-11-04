local AppChat = script:FindFirstAncestor("AppChat")
local ActionHandlers = require(AppChat.Parent.SignalsMiddleware).ActionHandlers
local FFlagAppChatUseSignalsForLastEntryPointModule = require(AppChat.Flags.FFlagAppChatUseSignalsForLastEntryPoint)
local FFlagAppChatUseSignalsForExternalNavigationRequestModule = require(AppChat.Flags.FFlagAppChatUseSignalsForExternalNavigationRequest)
local FFlagAppChatUseSignalsForChatSettingsModule = require(AppChat.Flags.FFlagAppChatUseSignalsForChatSettings)

return function(p1)
	-- upvalues: FFlagAppChatUseSignalsForLastEntryPointModule (copy), ActionHandlers (copy), AppChat (copy), FFlagAppChatUseSignalsForExternalNavigationRequestModule (copy), FFlagAppChatUseSignalsForChatSettingsModule (copy)
	if FFlagAppChatUseSignalsForLastEntryPointModule then
		ActionHandlers.register(p1, "EnteredChatFromEntryPoint", function(p2): boolean
			-- upvalues: AppChat (upval)
			require(AppChat.Stores.GetLastEntryPointStore)(false).enteredChatFromEntryPoint(p2.entryPoint)
			
			return false
		end)
	end
	if FFlagAppChatUseSignalsForExternalNavigationRequestModule then
		ActionHandlers.register(p1, "NavigateIntoChat", function(p2): boolean
			-- upvalues: AppChat (upval)
			require(AppChat.Stores.GetExternalNavigationRequestStore)(false).navigateIntoChat(p2.screen, p2.params)
			
			return false
		end)
	end
	if FFlagAppChatUseSignalsForChatSettingsModule then
		ActionHandlers.register(p1, "GetMetadata_Succeeded", function(p2): boolean
			-- upvalues: AppChat (upval)
			local GetFriendsChatSettingsStoreModule = require(AppChat.Stores.GetFriendsChatSettingsStore)
			require(AppChat.Stores.GetFriendsChatMetadataStore)(false).updateFriendsChatMetadata(p2.responseBody)
			GetFriendsChatSettingsStoreModule(false).clearDebugGroupChatToggle()
			
			return false
		end)
		ActionHandlers.register(p1, "ThirdPartyChatSettingsLoaded", function(p2): boolean
			-- upvalues: AppChat (upval)
			require(AppChat.Stores.GetFriendsChatSettingsStore)(false).setThirdPartyChatRestrictionStatus(p2.status)
			
			return false
		end)
		ActionHandlers.register(p1, "Debug_GroupChatEnabledToggled", function(_): boolean
			-- upvalues: AppChat (upval)
			require(AppChat.Stores.GetFriendsChatSettingsStore)(false).toggleDebugGroupChatEnabled()
			
			return false
		end)
	end
end