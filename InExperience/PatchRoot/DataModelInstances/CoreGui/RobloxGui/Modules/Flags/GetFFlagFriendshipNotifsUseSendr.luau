local IXPServiceWrapper = require(game:GetService("CorePackages").Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local friendshipNotifsUseSendrEnabledForAll = game:DefineFastFlag("FriendshipNotifsUseSendrEnabledForAll", false)
local friendshipNotifsUseSendrExperimentV2 = game:DefineFastFlag("FriendshipNotifsUseSendrExperiment_v2", false)
local friendshipNotifsUseSendrLayerName = game:DefineFastString("FriendshipNotifsUseSendrLayerName", "Notification.Toast")
local friendshipNotifsUseSendrLayerValue = game:DefineFastString("FriendshipNotifsUseSendrLayerValue", "EnableNotificationViaSENDR")
local var1 = false
local var2 = nil
local var3 = nil

return function()
	-- upvalues: friendshipNotifsUseSendrExperimentV2 (ref), var1 (write), var2 (write), var3 (write), IXPServiceWrapper (ref), friendshipNotifsUseSendrLayerName (ref), friendshipNotifsUseSendrEnabledForAll (ref), friendshipNotifsUseSendrLayerValue (ref)
	if friendshipNotifsUseSendrExperimentV2 and not var1 then
		local ok, status = pcall(function()
			-- upvalues: var1 (copy), IXPServiceWrapper (copy), friendshipNotifsUseSendrLayerName (copy)
			var1 = true
			
			return IXPServiceWrapper:GetLayerData(friendshipNotifsUseSendrLayerName)
		end)
		var2 = ok
		var3 = status
	end
	return friendshipNotifsUseSendrEnabledForAll or var2 and (var3 and var3[friendshipNotifsUseSendrLayerValue])
end