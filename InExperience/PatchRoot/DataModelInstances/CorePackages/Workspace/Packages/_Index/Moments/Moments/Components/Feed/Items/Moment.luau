local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local _ = require(moments.Components.Feed.FeedTypes)
local momentItemModule = require(script.MomentItem)
local momentItemSkeletonModule = require(script.MomentItemSkeleton)
local _ = require(script.createMomentStore)
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(parent.MomentsTypes)
local getMomentsPreferencesStoreModule = require(moments.Stores.GetMomentsPreferencesStore)
local toMediaItemModule = require(moments.Components.Feed.Media.toMediaItem)
local momentMediaView = momentsCommonModule.Media.MomentMediaView

local function _(p0) --[[ line: 45 | named "momentAttribution" ]]
	if p0 == nil then
		return nil
	end
	local recommendationMetadata = p0.recommendationMetadata
	
	return if recommendationMetadata == nil or recommendationMetadata.itemId == nil or recommendationMetadata.itemId == "" then nil else {
		itemId = recommendationMetadata.itemId,
		tracingId = recommendationMetadata.tracingId
	}
end

return {
	{
		kind = "moment",
		getKey = function(p1) --[[ line: 64 ]]
			local moment = p1.moment
			local recommendationMetadata = moment.recommendationMetadata
			
			return if recommendationMetadata and recommendationMetadata.itemId and recommendationMetadata.itemId ~= "" then recommendationMetadata.itemId else moment.momentId
		end,
		getAttribution = function(p2) --[[ line: 78 ]]
			local moment = p2.moment
			
			if moment == nil then
				return nil
			end
			local recommendationMetadata = moment.recommendationMetadata
			
			return if recommendationMetadata == nil or recommendationMetadata.itemId == nil or recommendationMetadata.itemId == "" then nil else {
				itemId = recommendationMetadata.itemId,
				tracingId = recommendationMetadata.tracingId
			}
		end,
		render = function(p3, _) --[[ line: 82 ]]
			-- upvalues: toMediaItemModule (ref), reactModule (ref), momentMediaView (ref), getMomentsPreferencesStoreModule (ref), momentItemModule (ref)
			local moment = p3.moment
			
			if moment == nil then
				return nil
			end
			local var7 = nil
			local var8 = toMediaItemModule(p3)
			
			if var8 ~= nil then
				var7 = reactModule.createElement(momentMediaView, {
					suppressTapToToggle = true,
					momentId = var8.momentId,
					posterContent = var8.posterContent,
					showLoadingSkeleton = var8.captureType == Enum.CaptureType.Video,
					getScaleType = getMomentsPreferencesStoreModule(false).getMediaScaleType
				})
			end
			local recommendationMetadata = moment.recommendationMetadata
			
			return reactModule.createElement(momentItemModule, {
				data = {
					kind = "experience",
					creatorIsVerified = nil,
					isSponsored = false,
					commentCount = nil,
					momentId = moment.momentId,
					itemId = moment.recommendationMetadata and moment.recommendationMetadata.itemId,
					creatorId = moment.creatorId,
					placeId = moment.metadata.placeId or 0,
					universeId = moment.metadata.universeId or 0,
					description = moment.metadata.description,
					isModerated = moment.isModerated == true,
					feedItemId = if recommendationMetadata ~= nil then nil else recommendationMetadata.itemId,
					feedSessionId = if recommendationMetadata ~= nil then nil else recommendationMetadata.tracingId
				},
				mediaSurface = var7,
				moment = moment
			})
		end
	},
	{
		kind = "skeleton",
		getKey = function(_) --[[ line: 150 ]]
			return "__feed_skeleton__"
		end,
		getAttribution = function(_) --[[ line: 155 ]]
			return nil
		end,
		render = function(_, _) --[[ line: 159 ]]
			-- upvalues: reactModule (ref), momentItemSkeletonModule (ref)
			return reactModule.createElement(momentItemSkeletonModule)
		end
	}
}