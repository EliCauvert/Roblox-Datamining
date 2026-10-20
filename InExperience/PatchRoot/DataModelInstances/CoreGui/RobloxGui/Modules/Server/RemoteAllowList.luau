local SharedFlagsModule = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags)
local FFlagEnableModerateChatRemoteEvent = SharedFlagsModule.FFlagEnableModerateChatRemoteEvent
local FFlagPlatformLeaderboardRccEnabled = SharedFlagsModule.FFlagPlatformLeaderboardRccEnabled
local RemoteAllowListAddExpChatFeatureValueChanged = game:DefineFastFlag("RemoteAllowListAddExpChatFeatureValueChanged", false)

return function()
	-- upvalues: FFlagEnableModerateChatRemoteEvent (copy), RemoteAllowListAddExpChatFeatureValueChanged (copy), FFlagPlatformLeaderboardRccEnabled (copy)
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
	table.insert(List, "RequestDeviceCameraOrientationCapability")
	table.insert(List, "RequestDeviceCameraCFrame")
	table.insert(List, "ReplicateDeviceCameraCFrame")
	table.insert(List, "ReferredPlayerJoin")
	table.insert(List, "BuildExperiencePlaytestTeleport")
	table.insert(List, "SetUserActive")
	table.insert(List, "AvatarGesturesVRPlayer")
	
	if FFlagPlatformLeaderboardRccEnabled then
		table.insert(List, "PlatformLeaderboardPush")
		table.insert(List, "PlatformLeaderboardTabOpened")
		table.insert(List, "PlatformLeaderboardTabClosed")
	end
	NetworkServer:InitializeRemoteAllowList(List)
end