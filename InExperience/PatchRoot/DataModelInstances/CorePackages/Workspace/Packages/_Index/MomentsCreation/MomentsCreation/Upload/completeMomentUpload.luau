local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local momentsCommonModule = require(momentsCreation.Parent.MomentsCommon)
local loggerModule = require(momentsCreation.Logger)
local fFlagMomentsRealtimeSessionTelemetry = momentsCommonModule.Flags.FFlagMomentsRealtimeSessionTelemetry

return function(p1, p2)
	-- upvalues: fFlagMomentsRealtimeSessionTelemetry (ref), momentsCommonModule (ref), loggerModule (ref)
	p2.uploadStore.setSuccess(p1)
	
	if fFlagMomentsRealtimeSessionTelemetry then
		momentsCommonModule.Analytics.reportMomentsCreationStep("upload", "success")
	end
	local feedStore = p2.feedStore
	
	if feedStore then
		feedStore.prependItem({ assetId = p1 })
	end
	local myCreationsStore = p2.myCreationsStore
	
	if myCreationsStore then
		myCreationsStore.prependItem({ assetId = p1 })
		myCreationsStore.invalidateCount()
	end
	p2.onPostedToFeed()
	loggerModule:debug("event=completion assetId={} MomentsUseBackendPostStatusNotification={} localSuccessToast={}", tostring(p1), tostring(true), "suppressed")
end