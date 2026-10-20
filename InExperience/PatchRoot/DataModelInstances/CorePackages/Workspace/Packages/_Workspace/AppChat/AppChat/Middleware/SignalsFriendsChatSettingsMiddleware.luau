local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local FFlagAppChatFriendsTabIxpEnabledModule = require(AppChat.Flags.FFlagAppChatFriendsTabIxpEnabled)
local FFlagExpChatEnableFriendsTab = require(Parent.SharedFlags).FFlagExpChatEnableFriendsTab
local GetFriendsChatMetadataStoreModule = require(AppChat.Stores.GetFriendsChatMetadataStore)
local GetFriendsChatSettingsStoreModule = require(AppChat.Stores.GetFriendsChatSettingsStore)
local config = {
	[require(Parent.AppChatNetworking).rodux.GetMetadata.Succeeded.name] = function(p1)
		-- upvalues: GetFriendsChatMetadataStoreModule (copy)
		GetFriendsChatMetadataStoreModule(false).updateFriendsChatMetadata(p1.responseBody)
	end,
	[require(AppChat.Actions.ThirdPartyChatSettingsLoaded).name] = function(p1)
		-- upvalues: GetFriendsChatSettingsStoreModule (copy)
		GetFriendsChatSettingsStoreModule(false).setThirdPartyChatRestrictionStatus(p1.status)
	end
}

return function(Callback, _)
	-- upvalues: FFlagAppChatFriendsTabIxpEnabledModule (copy), FFlagExpChatEnableFriendsTab (copy), config (copy)
	return function(p1)
		-- upvalues: Callback (copy), FFlagAppChatFriendsTabIxpEnabledModule (upval), FFlagExpChatEnableFriendsTab (upval), config (upval)
		local CallbackResult = Callback(p1)
		
		if not FFlagAppChatFriendsTabIxpEnabledModule and not FFlagExpChatEnableFriendsTab then
			return CallbackResult
		end
		local Entry: (any) -> () = config[p1.type]
		
		if Entry then
			Entry(p1)
		end
		return CallbackResult
	end
end