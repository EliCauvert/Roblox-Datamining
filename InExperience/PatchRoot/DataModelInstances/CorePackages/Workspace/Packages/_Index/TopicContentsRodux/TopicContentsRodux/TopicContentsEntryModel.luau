local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("TopicContentsRodux").Parent
local omniRecommendationsContentType = require(parent.DiscoveryTypes).OmniRecommendationsContentType
local resultModule = require(parent.Result)
local fFlagSearchOmniAutocompletePage = require(parent.SharedFlags).FFlagSearchOmniAutocompletePage
local fFlagEnableTopSongsSort = require(parent.SharedFlags).FFlagEnableTopSongsSort
local fFlagLuaAppEnableHomepageOneByTwoTile = require(parent.SharedFlags).FFlagLuaAppEnableHomepageOneByTwoTile
local fFlagLuaAppEnableOneByTwoTileFunnelTelemetry = require(parent.SharedFlags).FFlagLuaAppEnableOneByTwoTileFunnelTelemetry
local fFlagLuaAppSponsoredGamePreviewVideo = require(parent.SharedFlags).FFlagLuaAppSponsoredGamePreviewVideo
local var1 = if fFlagLuaAppEnableOneByTwoTileFunnelTelemetry then {} else nil
local t = {
	new = function()
		return {}
	end,
	mock = function(p1)
		-- upvalues: omniRecommendationsContentType (ref), fFlagLuaAppEnableOneByTwoTileFunnelTelemetry (ref)
		local t = {
			contentType = omniRecommendationsContentType.Game,
			contentId = p1 or "149757",
			isSponsored = false
		}
		t.isShowSponsoredLabel = t.isSponsored
		t.adId = nil
		t.payerName = nil
		t.logoAssetId = nil
		t.logoAspectRatio = nil
		t.headline = nil
		t.subtitle = nil
		t.ctaText = nil
		t.tileVariant = nil
		t.badgePosition = nil
		t.badgeAnalyticsId = nil
		t.badgeType = nil
		t.badgeText = nil
		t.badgeIcon = nil
		t.badgeComponentType = nil
		t.componentType = nil
		t.alignmentType = nil
		t.minRowPadding = nil
		t.placeIdOverride = nil
		t.launchDataOverride = nil
		t.analyticsData = nil
		t.primaryWideImageAssetId = nil
		t.primaryWideImageListId = nil
		t.primaryWideVideoAssetId = nil
		t.sponsoredGamePreviewVideoEligible = nil
		t.primaryImageAssetId = nil
		t.primaryVideoAssetId = nil
		t.attributionThumbnailAssetId = nil
		t.clickoutUrl = nil
		
		if fFlagLuaAppEnableOneByTwoTileFunnelTelemetry then
			t.oneByTwoTileFlowId = nil
			t.recommendationsRequestId = nil
		end
		return t
	end
}

function t.fromGamesApiData(p1)
	-- upvalues: resultModule (ref), t (ref), omniRecommendationsContentType (ref)
	if type(p1.universeId) ~= "number" and type(p1.universeId) ~= "string" then
		return resultModule.error("TopicContentsEntryModel.fromGamesApiData expects universeId to be a number or a string")
	end
	local var2 = t.new()
	var2.contentType = omniRecommendationsContentType.Game
	var2.contentId = tostring(p1.universeId)
	var2.isSponsored = p1.isSponsored
	var2.isShowSponsoredLabel = nil
	
	if p1.isShowSponsoredLabel == nil then
		var2.isShowSponsoredLabel = true
	else
		var2.isShowSponsoredLabel = p1.isShowSponsoredLabel
	end
	var2.adId = p1.nativeAdData
	
	if p1.contentMetadata then
		local contentMetadata = p1.contentMetadata
		var2.badgePosition = contentMetadata.badgePosition
		var2.badgeAnalyticsId = contentMetadata.badgeAnalyticsId
		var2.badgeType = contentMetadata.badgeType
		var2.badgeText = contentMetadata.badgeText
		var2.badgeIcon = contentMetadata.badgeIcon
		var2.badgeComponentType = contentMetadata.badgeComponentType
	end
	return resultModule.success(var2)
end

if fFlagSearchOmniAutocompletePage then
	function t.fromOmniAutocompleteApi(p1)
		-- upvalues: resultModule (ref), t (ref), omniRecommendationsContentType (ref)
		if type(p1.universeId) ~= "number" and type(p1.universeId) ~= "string" then
			return resultModule.error("TopicContentsEntryModel.fromOmniAutocomplete expects universeId to be a number or a string")
		end
		local var2 = t.new()
		var2.contentType = omniRecommendationsContentType.Game
		var2.contentId = tostring(p1.universeId)
		
		if p1.contentMetadata then
			local contentMetadata = p1.contentMetadata
			var2.badgePosition = contentMetadata.badgePosition
			var2.badgeAnalyticsId = contentMetadata.badgeAnalyticsId
			var2.badgeType = contentMetadata.badgeType
			var2.badgeText = contentMetadata.badgeText
			var2.badgeIcon = contentMetadata.badgeIcon
			var2.badgeComponentType = contentMetadata.badgeComponentType
		end
		return resultModule.success(var2)
	end
end
function t.fromExploreApiData(p1)
	-- upvalues: resultModule (ref), t (ref), omniRecommendationsContentType (ref)
	if type(p1.universeId) ~= "number" and type(p1.universeId) ~= "string" then
		return resultModule.error("TopicContentsEntryModel.fromExploreApiData expects universeId to be a number or a string")
	end
	local var2 = t.new()
	var2.contentType = omniRecommendationsContentType.Game
	var2.contentId = tostring(p1.universeId)
	var2.isSponsored = p1.isSponsored
	var2.adId = p1.nativeAdData
	var2.isShowSponsoredLabel = nil
	
	if p1.contentMetadata then
		local contentMetadata = p1.contentMetadata
		var2.badgePosition = contentMetadata.badgePosition
		var2.badgeAnalyticsId = contentMetadata.badgeAnalyticsId
		var2.badgeType = contentMetadata.badgeType
		var2.badgeText = contentMetadata.badgeText
		var2.badgeIcon = contentMetadata.badgeIcon
		var2.badgeComponentType = contentMetadata.badgeComponentType
	end
	return resultModule.success(var2)
end

if fFlagEnableTopSongsSort then
	function t.songFromExploreApiData(p1)
		-- upvalues: resultModule (ref), t (ref), omniRecommendationsContentType (ref)
		if type(p1.assetId) == "number" or type(p1.assetId) == "string" then
			local var2 = t.new()
			var2.contentType = omniRecommendationsContentType.Song
			var2.contentId = tostring(p1.assetId)
			var2.isSponsored = false
			
			return resultModule.success(var2)
		end
		return resultModule.error("TopicContentsEntryModel.songFromExploreApiData expects assetId to be a number or a string")
	end
end
function t.fromOmniRecommendations(p1, p2)
	-- upvalues: t (ref), fFlagLuaAppSponsoredGamePreviewVideo (ref), fFlagLuaAppEnableHomepageOneByTwoTile (ref), fFlagLuaAppEnableOneByTwoTileFunnelTelemetry (ref), var1 (ref), httpService (ref), resultModule (ref)
	local var2 = t.new()
	var2.contentType = p1.contentType
	var2.contentId = tostring(p1.contentId)
	
	if p1.contentMetadata then
		local var3
		var2.adId = p1.contentMetadata.EncryptedAdTrackingData or nil
		var2.isSponsored = var2.adId ~= nil and var2.adId ~= ""
		var2.isShowSponsoredLabel = nil
		var2.payerName = p1.contentMetadata.PayerName or nil
		var2.logoAssetId = p1.contentMetadata.LogoAssetId
		var2.logoAspectRatio = p1.contentMetadata.LogoAspectRatio
		var2.headline = p1.contentMetadata.Headline
		var2.subtitle = p1.contentMetadata.Subtitle
		var2.ctaText = p1.contentMetadata.CtaText
		var2.tileVariant = p1.contentMetadata.TileVariant
		var2.badgePosition = p1.contentMetadata.badgePosition
		var2.badgeAnalyticsId = p1.contentMetadata.badgeAnalyticsId
		var2.badgeType = p1.contentMetadata.badgeType
		var2.badgeText = p1.contentMetadata.badgeText
		var2.badgeIcon = p1.contentMetadata.badgeIcon
		var2.badgeComponentType = p1.contentMetadata.badgeComponentType
		var2.componentType = p1.contentMetadata.ComponentType
		var2.alignmentType = p1.contentMetadata.AlignmentType
		var2.minRowPadding = p1.contentMetadata.MinRowPadding
		var2.placeIdOverride = if p1.contentMetadata.PlaceIdOverride then tostring(p1.contentMetadata.PlaceIdOverride) else nil
		var2.launchDataOverride = p1.contentMetadata.LaunchDataOverride
		var2.primaryWideImageAssetId = if p1.contentMetadata.PrimaryWideImageAssetId and p1.contentMetadata.PrimaryWideImageAssetId ~= "" then p1.contentMetadata.PrimaryWideImageAssetId else nil
		var2.primaryWideImageListId = p1.contentMetadata.PrimaryWideImageListId
		var2.primaryWideVideoAssetId = p1.contentMetadata.PrimaryWideVideoAssetId
		
		if fFlagLuaAppSponsoredGamePreviewVideo then
			var3 = p1.contentMetadata.SponsoredGamePreviewVideoEligible == true
			var3 = nil
		else
			var3 = nil
		end
		var2.sponsoredGamePreviewVideoEligible = var3
		var2.primaryImageAssetId = if fFlagLuaAppEnableHomepageOneByTwoTile then p1.contentMetadata.PrimaryImageAssetId else nil
		var2.primaryVideoAssetId = if fFlagLuaAppEnableHomepageOneByTwoTile then p1.contentMetadata.PrimaryVideoAssetId else nil
		var2.attributionThumbnailAssetId = if fFlagLuaAppEnableHomepageOneByTwoTile then p1.contentMetadata.AttributionThumbnailAssetId else nil
		var2.clickoutUrl = if fFlagLuaAppEnableHomepageOneByTwoTile then p1.contentMetadata.ClickoutUrl else nil
	else
		var2.adId = nil
		var2.isSponsored = false
		var2.isShowSponsoredLabel = nil
		var2.payerName = nil
		var2.placeIdOverride = nil
		var2.launchDataOverride = nil
	end
	var2.analyticsData = p1.analyticsData
	
	if fFlagLuaAppEnableOneByTwoTileFunnelTelemetry then
		local contentMetadata = p1.contentMetadata
		
		if contentMetadata and contentMetadata.ComponentType == "OneByTwoTile" then
			local formattedText = string.format("%s:%s:%s", p2 or "", tostring(p1.contentId), contentMetadata.EncryptedAdTrackingData or "")
			local var4 = var1[formattedText]
			
			if var4 == nil then
				var4 = httpService:GenerateGUID(false):lower()
				var1[formattedText] = var4
			end
			var2.oneByTwoTileFlowId = var4
			var2.recommendationsRequestId = p2
		end
	end
	return resultModule.success(var2)
end

return t