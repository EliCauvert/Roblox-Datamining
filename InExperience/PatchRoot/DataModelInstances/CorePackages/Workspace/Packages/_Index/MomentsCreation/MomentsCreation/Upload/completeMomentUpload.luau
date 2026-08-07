local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local loggerModule = require(momentsCreation.Logger)
local getFFlagMomentsUseBackendPostStatusNotificationModule = require(momentsCreation.Flags.GetFFlagMomentsUseBackendPostStatusNotification)

return function(p0, p1) --[[ line: 37 | named "completeMomentUpload" ]]
	-- upvalues: getFFlagMomentsUseBackendPostStatusNotificationModule (ref), loggerModule (ref)
	p1.uploadStore.setSuccess(p0)
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
	local var3 = getFFlagMomentsUseBackendPostStatusNotificationModule()
	loggerModule:debug("event=completion assetId={} MomentsUseBackendPostStatusNotification={} localSuccessToast={}", tostring(p0), tostring(var3), if var3 then "suppressed" else "trigger")
	
	if not var3 then
		p1.toastStore.triggerToast({
			title = p1.localizations.publishedTitle,
			text = p1.localizations.publishedBody
		})
	end
end