local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local momentsCommonModule = require(momentsCreation.Parent.MomentsCommon)
local loggerModule = require(momentsCreation.Logger)
local getFFlagMomentsUseBackendPostStatusNotificationModule = require(momentsCreation.Flags.GetFFlagMomentsUseBackendPostStatusNotification)
local fFlagMomentsRealtimeSessionTelemetry = momentsCommonModule.Flags.FFlagMomentsRealtimeSessionTelemetry

return function(p0, p1)
	-- upvalues: fFlagMomentsRealtimeSessionTelemetry (ref), momentsCommonModule (ref), getFFlagMomentsUseBackendPostStatusNotificationModule (ref), loggerModule (ref)
	p1.uploadStore.setSuccess(p0)
	
	if fFlagMomentsRealtimeSessionTelemetry then
		momentsCommonModule.Analytics.reportMomentsCreationStep("upload", "success")
	end
	local feedStore = p1.feedStore
	
	if feedStore then
		feedStore.prependItem({ assetId = p0 })
	end
	local myCreationsStore = p1.myCreationsStore
	
	if myCreationsStore then
		myCreationsStore.prependItem({ assetId = p0 })
		myCreationsStore.invalidateCount()
	end
	p1.onPostedToFeed()
	local var4 = getFFlagMomentsUseBackendPostStatusNotificationModule()
	loggerModule:debug("event=completion assetId={} MomentsUseBackendPostStatusNotification={} localSuccessToast={}", tostring(p0), tostring(var4), if var4 then "suppressed" else "trigger")
	
	if not var4 then
		p1.toastStore.triggerToast({
			title = p1.localizations.publishedTitle,
			text = p1.localizations.publishedBody
		})
	end
end