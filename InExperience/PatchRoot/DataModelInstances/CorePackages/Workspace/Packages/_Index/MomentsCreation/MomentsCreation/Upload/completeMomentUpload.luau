local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local MomentsCommonModule = require(MomentsCreation.Parent.MomentsCommon)
local LoggerModule = require(MomentsCreation.Logger)

return function(AssetId, p1)
	-- upvalues: MomentsCommonModule (copy), LoggerModule (copy)
	p1.uploadStore.setSuccess(AssetId)
	MomentsCommonModule.Analytics.reportMomentsCreationStep("upload", "success")
	local FeedStore = p1.feedStore
	
	if FeedStore then
		FeedStore.prependItem({ assetId = AssetId })
	end
	local MyCreationsStore = p1.myCreationsStore
	
	if MyCreationsStore then
		MyCreationsStore.prependItem({ assetId = AssetId })
		MyCreationsStore.invalidateCount()
	end
	p1.onPostedToFeed()
	LoggerModule:debug("event=completion assetId={} MomentsUseBackendPostStatusNotification={} localSuccessToast={}", tostring(AssetId), tostring(true), "suppressed")
end