local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local momentsCommonModule = require(momentsCreation.Parent.MomentsCommon)
local loggerModule = require(momentsCreation.Logger)
local getFFlagMomentsUseBackendPostStatusNotificationModule = require(momentsCreation.Flags.GetFFlagMomentsUseBackendPostStatusNotification)
local fFlagMomentsRealtimeSessionTelemetry = momentsCommonModule.Flags.FFlagMomentsRealtimeSessionTelemetry

return function(p1, p2)
	-- upvalues: fFlagMomentsRealtimeSessionTelemetry (ref), momentsCommonModule (ref), getFFlagMomentsUseBackendPostStatusNotificationModule (ref), loggerModule (ref)
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
	local var1 = getFFlagMomentsUseBackendPostStatusNotificationModule()
	loggerModule:debug("event=completion assetId={} MomentsUseBackendPostStatusNotification={} localSuccessToast={}", tostring(p1), tostring(var1), if var1 then "suppressed" else "trigger")
	
	if not var1 then
		p2.toastStore.triggerToast({
			title = p2.localizations.publishedTitle,
			text = p2.localizations.publishedBody
		})
	end
end