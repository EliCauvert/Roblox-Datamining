local fFlagEnableModerateChatRemoteEvent = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).FFlagEnableModerateChatRemoteEvent
local remoteAllowListAddExpChatFeatureValueChanged = game:DefineFastFlag("RemoteAllowListAddExpChatFeatureValueChanged", false)

return function() --[[ line: 6 ]]
	-- upvalues: fFlagEnableModerateChatRemoteEvent (ref), remoteAllowListAddExpChatFeatureValueChanged (ref)
	assert(game:FindService("NetworkServer") ~= nil)
	local networkServerService = game:GetService("NetworkServer")
	local t = {}
	table.insert(t, "GetServerVersion")
	table.insert(t, "GetServerChannel")
	table.insert(t, "WhisperChat")
	table.insert(t, "GetServerType")
	table.insert(t, "ServerSideBulkPurchaseEvent")
	table.insert(t, "CanChatWith")
	table.insert(t, "SetPlayerBlockList")
	table.insert(t, "UpdatePlayerBlockList")
	table.insert(t, "NewPlayerGroupDetails")
	table.insert(t, "NewPlayerCanManageDetails")
	table.insert(t, "SendPlayerBlockList")
	table.insert(t, "UpdateLocalPlayerBlockList")
	table.insert(t, "SendPlayerProfileSettings")
	table.insert(t, "UpdatePlayerProfileSettings")
	table.insert(t, "ShowPlayerJoinedFriendsToast")
	table.insert(t, "ShowFriendJoinedPlayerToast")
	table.insert(t, "CreateOrJoinParty")
	table.insert(t, "RequestPlayerProfileSettings")
	
	if fFlagEnableModerateChatRemoteEvent then
		table.insert(t, "ModerateChatSettingUpdated")
	end
	if remoteAllowListAddExpChatFeatureValueChanged then
		table.insert(t, "ExpChatFeatureValueChanged")
	end
	table.insert(t, "SetDialogInUse")
	table.insert(t, "ContactListInvokeIrisInvite")
	table.insert(t, "ContactListIrisInviteTeleport")
	table.insert(t, "UpdateCurrentCall")
	table.insert(t, "RequestDeviceCameraOrientationCapability")
	table.insert(t, "RequestDeviceCameraCFrame")
	table.insert(t, "ReplicateDeviceCameraCFrame")
	table.insert(t, "ReferredPlayerJoin")
	table.insert(t, "BuildExperiencePlaytestTeleport")
	table.insert(t, "SetUserActive")
	table.insert(t, "AvatarGesturesVRPlayer")
	networkServerService:InitializeRemoteAllowList(t)
end