local IXPServiceWrapper = require(game:GetService("CorePackages").Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local FriendshipNotifsUseSendrEnabledForAll = game:DefineFastFlag("FriendshipNotifsUseSendrEnabledForAll", false)
local FriendshipNotifsUseSendrExperimentV2 = game:DefineFastFlag("FriendshipNotifsUseSendrExperiment_v2", false)
local FriendshipNotifsUseSendrLayerName = game:DefineFastString("FriendshipNotifsUseSendrLayerName", "Notification.Toast")
local FriendshipNotifsUseSendrLayerValue = game:DefineFastString("FriendshipNotifsUseSendrLayerValue", "EnableNotificationViaSENDR")
local Flag = false
local v1 = nil
local v2 = nil

return function() --[[ Line: 12 ]]
	-- upvalues: FriendshipNotifsUseSendrExperimentV2 (copy), Flag (ref), v1 (ref), v2 (ref), IXPServiceWrapper (copy), FriendshipNotifsUseSendrLayerName (copy), FriendshipNotifsUseSendrEnabledForAll (copy), FriendshipNotifsUseSendrLayerValue (copy)
	if FriendshipNotifsUseSendrExperimentV2 and not Flag then
		v1, v7 = pcall(function() --[[ Line: 14 ]]
			-- upvalues: Flag (upval), IXPServiceWrapper (upval), FriendshipNotifsUseSendrLayerName (upval)
			Flag = true
			
			return IXPServiceWrapper:GetLayerData(FriendshipNotifsUseSendrLayerName)
		end)
	end
	return FriendshipNotifsUseSendrEnabledForAll or v1 and (v2 and v2[FriendshipNotifsUseSendrLayerValue])
end