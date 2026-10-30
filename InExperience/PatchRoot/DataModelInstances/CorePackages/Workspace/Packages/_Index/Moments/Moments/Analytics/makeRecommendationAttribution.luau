local Moments = script:FindFirstAncestor("Moments")
local _ = require(Moments.Parent.MomentsTypes)
local _ = require(Moments.Components.Feed.FeedTypes)

local function _(p1): string
	return if (p1.postAsset == nil or p1.postAsset.isAvatar ~= true) and not p1.metadata.isMomentScene then if p1.entityType == "edpVideo" then "GamePreviewVideo" elseif p1.metadata.partnerUploadType == "influencer" then "DynamicUpload" elseif p1.metadata.captureType == Enum.CaptureType.Screenshot then "Static" else "Dynamic" else "Avatar"
end

return function(p1, p2, p3)
	if p1 == nil then
		return nil
	else
		local FeedItemId = p1.feedItemId
		
		return if FeedItemId == nil or FeedItemId == "" then nil else {
			itemId = FeedItemId,
			tracingId = p1.tracingId,
			contentType = p3 or (if p2 == nil then nil elseif p2.postAsset == nil or p2.postAsset.isAvatar ~= true then if p2.metadata.isMomentScene then "Avatar" elseif p2.entityType == "edpVideo" then "GamePreviewVideo" elseif p2.metadata.partnerUploadType == "influencer" then "DynamicUpload" elseif p2.metadata.captureType == Enum.CaptureType.Screenshot then "Static" else "Dynamic" else "Avatar")
		}
	end
end