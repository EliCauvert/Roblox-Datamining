local FFlagEnableModerateChatRemoteEvent = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).FFlagEnableModerateChatRemoteEvent
local RemoteAllowListAddExpChatFeatureValueChanged = game:DefineFastFlag("RemoteAllowListAddExpChatFeatureValueChanged", false)

return function()
	-- upvalues: FFlagEnableModerateChatRemoteEvent (copy), RemoteAllowListAddExpChatFeatureValueChanged (copy)
	assert(game:FindService("NetworkServer") ~= nil)
	local NetworkServer = game:GetService("NetworkServer")
	local List = {}
	table.insert(List, "GetServerVersion")
	table.insert(List, "GetServerChannel")
	table.insert(List, "WhisperChat")
	table.insert(List, "GetServerType")
	table.insert(List, "ServerSideBulkPurchaseEvent")
	table.insert(List, "CanChatWith")
	table.insert(List, "SetPlayerBlockList")
	table.insert(List, "UpdatePlayerBlockList")
	table.insert(List, "NewPlayerGroupDetails")
	table.insert(List, "NewPlayerCanManageDetails")
	table.insert(List, "SendPlayerBlockList")
	table.insert(List, "UpdateLocalPlayerBlockList")
	table.insert(List, "SendPlayerProfileSettings")
	table.insert(List, "UpdatePlayerProfileSettings")
	table.insert(List, "ShowPlayerJoinedFriendsToast")
	table.insert(List, "ShowFriendJoinedPlayerToast")
	table.insert(List, "CreateOrJoinParty")
	table.insert(List, "RequestPlayerProfileSettings")
	
	if FFlagEnableModerateChatRemoteEvent then
		table.insert(List, "ModerateChatSettingUpdated")
	end
	if RemoteAllowListAddExpChatFeatureValueChanged then
		table.insert(List, "ExpChatFeatureValueChanged")
	end
	table.insert(List, "SetDialogInUse")
	table.insert(List, "ContactListInvokeIrisInvite")
	table.insert(List, "ContactListIrisInviteTeleport")
	table.insert(List, "UpdateCurrentCall")
	table.insert(List, "RequestDeviceCameraOrientationCapability")
	table.insert(List, "RequestDeviceCameraCFrame")
	table.insert(List, "ReplicateDeviceCameraCFrame")
	table.insert(List, "ReferredPlayerJoin")
	table.insert(List, "BuildExperiencePlaytestTeleport")
	table.insert(List, "SetUserActive")
	table.insert(List, "AvatarGesturesVRPlayer")
	NetworkServer:InitializeRemoteAllowList(List)
end