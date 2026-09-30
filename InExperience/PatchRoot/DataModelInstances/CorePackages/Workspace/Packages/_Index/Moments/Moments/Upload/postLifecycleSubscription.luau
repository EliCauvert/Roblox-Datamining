local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local notificationService = game:GetService("NotificationService")
local realtimeDeliveryModule = require(parent.RealtimeDelivery)
local momentsGetMomentsUserStoreModule = require(parent.DataHydration.MomentsGetMomentsUserStore)
local getLocalUserIdModule = require(moments.Utils.getLocalUserId)
local var1 = nil

local function onPostLifecycleEvent(p1)
	-- upvalues: getLocalUserIdModule (ref), momentsGetMomentsUserStoreModule (ref)
	if type(p1) ~= "table" or p1.type ~= "PostStatusChanged" or p1.status ~= "Published" and p1.status ~= "Rejected" or (type(p1.postAssetId) ~= "string" or p1.postAssetId == "") then return end
	local var2 = getLocalUserIdModule()
	
	if var2 == nil then
		return
	end
	momentsGetMomentsUserStoreModule(false).invalidateUser(var2)
end

return {
	subscribe = function(p1)
		-- upvalues: var1 (write), realtimeDeliveryModule (ref), notificationService (ref), onPostLifecycleEvent (ref)
		if var1 == nil then
			var1 = (p1 or realtimeDeliveryModule.RobloxEventReceiver.new(notificationService)):observeEvent("MomentsPostLifecycleV1", onPostLifecycleEvent)
			
			return
		end
	end,
	unsubscribe = function()
		-- upvalues: var1 (write)
		if var1 ~= nil then
			var1:disconnect()
			var1 = nil
		end
	end
}