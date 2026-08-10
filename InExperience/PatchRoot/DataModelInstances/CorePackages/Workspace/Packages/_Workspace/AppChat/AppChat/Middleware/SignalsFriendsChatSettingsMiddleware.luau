local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appChatNetworkingModule = require(parent.AppChatNetworking)
local fFlagAppChatFriendsTabIxpEnabledModule = require(appChat.Flags.FFlagAppChatFriendsTabIxpEnabled)
local fFlagExpChatEnableFriendsTab = require(parent.SharedFlags).FFlagExpChatEnableFriendsTab
local thirdPartyChatSettingsLoadedModule = require(appChat.Actions.ThirdPartyChatSettingsLoaded)
local getFriendsChatMetadataStoreModule = require(appChat.Stores.GetFriendsChatMetadataStore)
local getFriendsChatSettingsStoreModule = require(appChat.Stores.GetFriendsChatSettingsStore)
local t = {
	[appChatNetworkingModule.rodux.GetMetadata.Succeeded.name] = function(p0) --[[ line: 12 ]]
		-- upvalues: getFriendsChatMetadataStoreModule (ref)
		getFriendsChatMetadataStoreModule(false).updateFriendsChatMetadata(p0.responseBody)
	end,
	[thirdPartyChatSettingsLoadedModule.name] = function(value) --[[ line: 16 ]]
		-- upvalues: getFriendsChatSettingsStoreModule (ref)
		getFriendsChatSettingsStoreModule(false).setThirdPartyChatRestrictionStatus(value.status)
	end
}

return function(value, _) --[[ line: 25 | named "SignalsFriendsChatSettingsMiddleware" ]]
	-- upvalues: fFlagAppChatFriendsTabIxpEnabledModule (ref), fFlagExpChatEnableFriendsTab (ref), t (ref)
	return function(p1) --[[ line: 26 ]]
		-- upvalues: value (ref), fFlagAppChatFriendsTabIxpEnabledModule (copy), fFlagExpChatEnableFriendsTab (copy), t (copy)
		local var7 = value(p1)
		
		if not fFlagAppChatFriendsTabIxpEnabledModule and not fFlagExpChatEnableFriendsTab then
			return var7
		end
		local type = t[p1.type]
		
		if type then
			type(p1)
		end
		return var7
	end
end