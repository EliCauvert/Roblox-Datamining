local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local NotificationService = game:GetService("NotificationService")
local MomentsCommonModule = require(Parent.MomentsCommon)
local RealtimeDeliveryModule = require(Parent.RealtimeDelivery)
local SharedFlagsModule = require(Parent.SharedFlags)
local MomentsGetMomentsUserStoreModule = require(Parent.DataHydration.MomentsGetMomentsUserStore)
local GetLocalUserIdModule = require(Moments.Utils.getLocalUserId)
local FFlagMomentsRealtimeSessionTelemetry = MomentsCommonModule.Flags.FFlagMomentsRealtimeSessionTelemetry
local MomentsPostReviewTelemetry = game:DefineFastFlag("MomentsPostReviewTelemetry", false)
local Signal, Signal2 = require(Parent.Signals).createSignal({})

local function _(Key) --[[ Line: 28 | Named "advanceWakeVersion" ]]
	-- upvalues: Signal (copy), Signal2 (copy)
	local Copy = table.clone(Signal(false))
	Copy[Key] = (Copy[Key] or 0) + 1
	Signal2(Copy)
end

local t = {}
local MomentsPostLifecycleV1 = nil
local OnUnhideConnection = nil

local function onPostLifecycleEvent(p1) --[[ Line: 40 ]]
	-- upvalues: GetLocalUserIdModule (copy), FFlagMomentsRealtimeSessionTelemetry (copy), MomentsPostReviewTelemetry (copy), t (copy), MomentsCommonModule (copy), SharedFlagsModule (copy), Signal (copy), Signal2 (copy), MomentsGetMomentsUserStoreModule (copy)
	if type(p1) ~= "table" or p1.type ~= "PostStatusChanged" or p1.status ~= "Published" and p1.status ~= "Rejected" or (type(p1.postAssetId) ~= "string" or p1.postAssetId == "") then return end
	local LocalUserIdModule = GetLocalUserIdModule()
	
	if LocalUserIdModule == nil then return end
	if FFlagMomentsRealtimeSessionTelemetry and MomentsPostReviewTelemetry and p1.isNewPost == true then
		local Text = p1.postAssetId .. ":" .. p1.status
		
		if not t[Text] then
			t[Text] = true
			MomentsCommonModule.Analytics.reportMomentsCreationStep("post_review", if p1.status == "Published" then "success" else "failed")
		end
	end
	if SharedFlagsModule.FFlagMomentsOptimisticProfilePending then
		local Copy = table.clone(Signal(false))
		Copy[LocalUserIdModule] = (Copy[LocalUserIdModule] or 0) + 1
		Signal2(Copy)
	end
	if SharedFlagsModule.FFlagMomentsRefreshProfileOnPostStatus then
		MomentsGetMomentsUserStoreModule(false).invalidateUser(LocalUserIdModule)
	end
end

local function onAppResumed() --[[ Line: 76 ]]
	-- upvalues: GetLocalUserIdModule (copy), Signal (copy), Signal2 (copy)
	local LocalUserIdModule = GetLocalUserIdModule()
	
	if LocalUserIdModule ~= nil then
		local Copy = table.clone(Signal(false))
		Copy[LocalUserIdModule] = (Copy[LocalUserIdModule] or 0) + 1
		Signal2(Copy)
	end
end

return {
	subscribe = function(p1, AppLifecycleObserverService) --[[ Line: 84 ]]
		-- upvalues: MomentsPostLifecycleV1 (ref), RealtimeDeliveryModule (copy), NotificationService (copy), onPostLifecycleEvent (copy), SharedFlagsModule (copy), OnUnhideConnection (ref), onAppResumed (copy)
		if MomentsPostLifecycleV1 ~= nil then return end
		MomentsPostLifecycleV1 = (p1 or RealtimeDeliveryModule.RobloxEventReceiver.new(NotificationService)):observeEvent("MomentsPostLifecycleV1", onPostLifecycleEvent)
		
		if SharedFlagsModule.FFlagMomentsOptimisticProfilePending then
			local AppLifecycleObserverService1 = AppLifecycleObserverService
			
			if AppLifecycleObserverService1 == nil then
				local Success, Result = pcall(function() --[[ Line: 93 ]]
					return game:GetService("AppLifecycleObserverService")
				end)
				
				if Success then
					AppLifecycleObserverService1 = Result
				end
			end
			if AppLifecycleObserverService1 ~= nil then
				OnUnhideConnection = AppLifecycleObserverService1.OnUnhide:Connect(onAppResumed)
			end
		end
	end,
	unsubscribe = function() --[[ Line: 106 ]]
		-- upvalues: MomentsPostLifecycleV1 (ref), OnUnhideConnection (ref)
		if MomentsPostLifecycleV1 ~= nil then
			MomentsPostLifecycleV1:disconnect()
			MomentsPostLifecycleV1 = nil
		end
		if OnUnhideConnection ~= nil then
			OnUnhideConnection:Disconnect()
			OnUnhideConnection = nil
		end
	end,
	getWakeVersion = function(p1, p2) --[[ Line: 24 ]]
		-- upvalues: Signal (copy)
		return Signal(p1)[p2] or 0
	end
}