local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local notificationService = game:GetService("NotificationService")
local realtimeDeliveryModule = require(parent.RealtimeDelivery)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local momentsGetMomentsUserStoreModule = require(parent.DataHydration.MomentsGetMomentsUserStore)
local getLocalUserIdModule = require(moments.Utils.getLocalUserId)
local var1, var2 = signalsModule.createSignal({})

local function getWakeVersion(p1, p2)
	-- upvalues: var1 (ref)
	return var1(p1)[p2] or 0
end

local function _(p1)
	-- upvalues: var1 (ref), var2 (ref)
	local cloned = table.clone(var1(false))
	cloned[p1] = (cloned[p1] or 0) + 1
	var2(cloned)
end

local var3 = nil
local var4 = nil

local function onPostLifecycleEvent(p1)
	-- upvalues: getLocalUserIdModule (ref), sharedFlagsModule (ref), var1 (ref), var2 (ref), momentsGetMomentsUserStoreModule (ref)
	if type(p1) ~= "table" or p1.type ~= "PostStatusChanged" or p1.status ~= "Published" and p1.status ~= "Rejected" or (type(p1.postAssetId) ~= "string" or p1.postAssetId == "") then return end
	local var5 = getLocalUserIdModule()
	
	if var5 == nil then return end
	if sharedFlagsModule.FFlagMomentsOptimisticProfilePending then
		local cloned = table.clone(var1(false))
		cloned[var5] = (cloned[var5] or 0) + 1
		var2(cloned)
	end
	if sharedFlagsModule.FFlagMomentsRefreshProfileOnPostStatus then
		momentsGetMomentsUserStoreModule(false).invalidateUser(var5)
	end
end

local function onAppResumed()
	-- upvalues: getLocalUserIdModule (ref), var1 (ref), var2 (ref)
	local var5 = getLocalUserIdModule()
	
	if var5 ~= nil then
		local cloned = table.clone(var1(false))
		cloned[var5] = (cloned[var5] or 0) + 1
		var2(cloned)
	end
end

return {
	subscribe = function(p1, p2)
		-- upvalues: var3 (write), realtimeDeliveryModule (ref), notificationService (ref), onPostLifecycleEvent (ref), sharedFlagsModule (ref), var4 (write), onAppResumed (ref)
		if var3 ~= nil then return end
		var3 = (p1 or realtimeDeliveryModule.RobloxEventReceiver.new(notificationService)):observeEvent("MomentsPostLifecycleV1", onPostLifecycleEvent)
		
		if sharedFlagsModule.FFlagMomentsOptimisticProfilePending then
			local var5 = p2
			
			if var5 == nil then
				local ok, status = pcall(function()
					return game:GetService("AppLifecycleObserverService")
				end)
				
				if ok then
					var5 = status
				end
			end
			if var5 ~= nil then
				var4 = var5.OnUnhide:Connect(onAppResumed)
			end
		end
	end,
	unsubscribe = function()
		-- upvalues: var3 (write), var4 (write)
		if var3 ~= nil then
			var3:disconnect()
			var3 = nil
		end
		if var4 ~= nil then
			var4:Disconnect()
			var4 = nil
		end
	end,
	getWakeVersion = getWakeVersion
}