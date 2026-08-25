local IXPServiceWrapper = require(game:GetService("CorePackages").Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local friendshipNotifsUseSendrEnabledForAll = game:DefineFastFlag("FriendshipNotifsUseSendrEnabledForAll", false)
local friendshipNotifsUseSendrExperimentV2 = game:DefineFastFlag("FriendshipNotifsUseSendrExperiment_v2", false)
local friendshipNotifsUseSendrLayerName = game:DefineFastString("FriendshipNotifsUseSendrLayerName", "Notification.Toast")
local friendshipNotifsUseSendrLayerValue = game:DefineFastString("FriendshipNotifsUseSendrLayerValue", "EnableNotificationViaSENDR")
local var4 = false
local var5 = nil
local var6 = nil

return function()
	-- upvalues: friendshipNotifsUseSendrExperimentV2 (ref), var4 (write), var5 (write), var6 (write), IXPServiceWrapper (ref), friendshipNotifsUseSendrLayerName (ref), friendshipNotifsUseSendrEnabledForAll (ref), friendshipNotifsUseSendrLayerValue (ref)
	if friendshipNotifsUseSendrExperimentV2 and not var4 then
		local ok, status = pcall(function()
			-- upvalues: var4 (copy), IXPServiceWrapper (copy), friendshipNotifsUseSendrLayerName (copy)
			var4 = true
			
			return IXPServiceWrapper:GetLayerData(friendshipNotifsUseSendrLayerName)
		end)
		var5 = ok
		var6 = status
	end
	return friendshipNotifsUseSendrEnabledForAll or var5 and (var6 and var6[friendshipNotifsUseSendrLayerValue])
end