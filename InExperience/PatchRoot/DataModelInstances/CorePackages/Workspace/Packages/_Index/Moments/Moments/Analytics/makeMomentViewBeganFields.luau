local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local MomentsCommonModule = require(Parent.MomentsCommon)
local _ = require(Parent.MomentsTypes)
local MomentsGetPostAssetStoreModule = require(Parent.DataHydration.MomentsGetPostAssetStore)
local GetFFlagMomentsRenderPostAssetsModule = require(Parent.MomentsCommon.GetFFlagMomentsRenderPostAssets)
local FFlagMomentsAvatarLookTryOn = require(Parent.SharedFlags).FFlagMomentsAvatarLookTryOn
local FFlagMomentsImpressionPrimaryEntityModule = require(Moments.Flags.FFlagMomentsImpressionPrimaryEntity)
local DeriveMomentFromPostModule = require(Moments.Utils.deriveMomentFromPost)
local config = {
	[Enum.CaptureType.Video] = 1,
	[Enum.CaptureType.Screenshot] = 2
}

local function resolveTryOnOutfitId(p1, p2)
	-- upvalues: FFlagMomentsAvatarLookTryOn (copy), GetFFlagMomentsRenderPostAssetsModule (copy), MomentsGetPostAssetStoreModule (copy), DeriveMomentFromPostModule (copy)
	if not FFlagMomentsAvatarLookTryOn or not p2 then
		return 0
	elseif p1.metadata.outfitId ~= nil then
		return p1.metadata.outfitId
	else
		local PostAssetId = if p1.postAsset == nil then nil else p1.postAsset.postAssetId
		
		if not GetFFlagMomentsRenderPostAssetsModule() or PostAssetId == nil or PostAssetId <= 0 then
			return 0
		end
		local DataResult = MomentsGetPostAssetStoreModule(false).getCachedPostAsset(PostAssetId).data(false)
		
		if DataResult == nil then
			return nil
		else
			local DeriveMomentFromPostModuleResult = DeriveMomentFromPostModule(p1, DataResult)
			
			return if DeriveMomentFromPostModuleResult == nil then 0 else DeriveMomentFromPostModuleResult.metadata.outfitId or 0
		end
	end
end

return function(p1, Entry, ViewId, Enabled)
	-- upvalues: MomentsCommonModule (copy), FFlagMomentsImpressionPrimaryEntityModule (copy), resolveTryOnOutfitId (copy), config (copy)
	local RecommendationMetadata = p1.recommendationMetadata
	local FeedItemId = RecommendationMetadata.feedItemId
	
	if FeedItemId == nil or FeedItemId == "" then
		MomentsCommonModule.Analytics.reportMomentSkip("impression", if FeedItemId == nil then "nil" else "empty", { entry = Entry })
		
		return nil
	end
	local config1 = {
		viewMode = "vertical",
		momentId = p1.momentId,
		feedItemId = FeedItemId,
		feedSessionId = RecommendationMetadata.tracingId or "",
		source = Entry
	}
	local UniverseId: number = p1.metadata.universeId
	
	if UniverseId ~= nil and UniverseId > 0 then
		config1.destinationUniverseId = tostring(UniverseId)
	end
	if FFlagMomentsImpressionPrimaryEntityModule then
		local ResolveTryOnOutfitIdResult: number = resolveTryOnOutfitId(p1, Enabled == true)
		
		if ResolveTryOnOutfitIdResult == nil or ResolveTryOnOutfitIdResult <= 0 then
			if ResolveTryOnOutfitIdResult ~= nil then
				local Entry1 = config[p1.metadata.captureType]
				
				if Entry1 ~= nil then
					config1.primaryEntityType = tostring(Entry1)
				end
				if UniverseId ~= nil and UniverseId > 0 then
					config1.primaryCtaEntityId = tostring(UniverseId)
				end
			end
		else
			config1.primaryEntityType = tostring(3)
			config1.primaryCtaEntityId = tostring(ResolveTryOnOutfitIdResult)
		end
	end
	if ViewId ~= nil then
		config1.viewId = ViewId
	end
	return config1
end