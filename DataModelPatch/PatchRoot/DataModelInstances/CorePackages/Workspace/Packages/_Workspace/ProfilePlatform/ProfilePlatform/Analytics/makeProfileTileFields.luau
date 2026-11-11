local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local MomentsCommonModule = require(Parent.MomentsCommon)
local _ = require(Parent.DataHydration.MomentsStoreTypes)
local GetFFlagMomentsAnalyticsSchemaIdentityFunction = MomentsCommonModule.Flags.GetFFlagMomentsAnalyticsSchemaIdentity

local function buildTileFields(p1, SurfaceId, ParentEntity, p2, InteractionType)
	-- upvalues: GetFFlagMomentsAnalyticsSchemaIdentityFunction (copy), MomentsCommonModule (copy)
	if not GetFFlagMomentsAnalyticsSchemaIdentityFunction() then
		local RecommendationMetadata = p1.recommendationMetadata
		
		return {
			userId = SurfaceId,
			itemId = if RecommendationMetadata == nil then "" else (if GetFFlagMomentsAnalyticsSchemaIdentityFunction() then RecommendationMetadata.feedItemId else RecommendationMetadata.itemId) or "",
			gridIndex = tostring(p2)
		}
	end
	local RecommendationMetadata = p1.recommendationMetadata
	local FeedItemId = if RecommendationMetadata == nil then nil else RecommendationMetadata.feedItemId
	
	if FeedItemId == nil or FeedItemId == "" then
		MomentsCommonModule.Analytics.reportMomentSkip("tile", if FeedItemId == nil then "nil" else "empty", { entry = "profile", parentEntity = ParentEntity })
		
		return nil
	end
	local config = {
		surface = "profile",
		parentEntity = ParentEntity,
		surfaceId = SurfaceId,
		feedItemId = FeedItemId,
		tileIndex = tostring(p2)
	}
	
	if InteractionType ~= nil then
		config.interactionType = InteractionType
	end
	return config
end

return {
	INTERACTION_OPEN = "open",
	getTileMomentId = function(p1)
		-- upvalues: GetFFlagMomentsAnalyticsSchemaIdentityFunction (copy)
		local RecommendationMetadata = p1.recommendationMetadata
		
		return if RecommendationMetadata == nil then "" else (if GetFFlagMomentsAnalyticsSchemaIdentityFunction() then RecommendationMetadata.feedItemId else RecommendationMetadata.itemId) or ""
	end,
	makeProfileTileImpressionFields = function(p1, SurfaceId, ParentEntity, p2)
		-- upvalues: buildTileFields (copy)
		return (buildTileFields(p1, SurfaceId, ParentEntity, p2, nil))
	end,
	makeProfileTileInteractionFields = function(p1, SurfaceId, ParentEntity, p2)
		-- upvalues: buildTileFields (copy)
		return (buildTileFields(p1, SurfaceId, ParentEntity, p2, "open"))
	end
}