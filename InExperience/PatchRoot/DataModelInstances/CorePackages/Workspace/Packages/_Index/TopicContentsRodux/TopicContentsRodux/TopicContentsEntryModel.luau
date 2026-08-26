local parent = script:FindFirstAncestor("TopicContentsRodux").Parent
local omniRecommendationsContentType = require(parent.DiscoveryTypes).OmniRecommendationsContentType
local resultModule = require(parent.Result)
local fFlagSearchOmniAutocompletePage = require(parent.SharedFlags).FFlagSearchOmniAutocompletePage
local fFlagEnableTopSongsSort = require(parent.SharedFlags).FFlagEnableTopSongsSort
local fFlagLuaAppEnableHomepageOneByTwoTile = require(parent.SharedFlags).FFlagLuaAppEnableHomepageOneByTwoTile
local t = {
	new = function()
		return {}
	end,
	mock = function(p1)
		-- upvalues: omniRecommendationsContentType (ref)
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
		t.primaryImageAssetId = nil
		t.primaryVideoAssetId = nil
		t.attributionThumbnailAssetId = nil
		t.clickoutUrl = nil
		
		return t
	end
}

function t.fromGamesApiData(p1)
	-- upvalues: resultModule (ref), t (ref), omniRecommendationsContentType (ref)
	if type(p1.universeId) ~= "number" and type(p1.universeId) ~= "string" then
		return resultModule.error("TopicContentsEntryModel.fromGamesApiData expects universeId to be a number or a string")
	end
	local var1 = t.new()
	var1.contentType = omniRecommendationsContentType.Game
	var1.contentId = tostring(p1.universeId)
	var1.isSponsored = p1.isSponsored
	var1.isShowSponsoredLabel = nil
	
	if p1.isShowSponsoredLabel == nil then
		var1.isShowSponsoredLabel = true
	else
		var1.isShowSponsoredLabel = p1.isShowSponsoredLabel
	end
	var1.adId = p1.nativeAdData
	
	if p1.contentMetadata then
		local contentMetadata = p1.contentMetadata
		var1.badgePosition = contentMetadata.badgePosition
		var1.badgeAnalyticsId = contentMetadata.badgeAnalyticsId
		var1.badgeType = contentMetadata.badgeType
		var1.badgeText = contentMetadata.badgeText
		var1.badgeIcon = contentMetadata.badgeIcon
		var1.badgeComponentType = contentMetadata.badgeComponentType
	end
	return resultModule.success(var1)
end

if fFlagSearchOmniAutocompletePage then
	function t.fromOmniAutocompleteApi(p1)
		-- upvalues: resultModule (ref), t (ref), omniRecommendationsContentType (ref)
		if type(p1.universeId) ~= "number" and type(p1.universeId) ~= "string" then
			return resultModule.error("TopicContentsEntryModel.fromOmniAutocomplete expects universeId to be a number or a string")
		end
		local var1 = t.new()
		var1.contentType = omniRecommendationsContentType.Game
		var1.contentId = tostring(p1.universeId)
		
		if p1.contentMetadata then
			local contentMetadata = p1.contentMetadata
			var1.badgePosition = contentMetadata.badgePosition
			var1.badgeAnalyticsId = contentMetadata.badgeAnalyticsId
			var1.badgeType = contentMetadata.badgeType
			var1.badgeText = contentMetadata.badgeText
			var1.badgeIcon = contentMetadata.badgeIcon
			var1.badgeComponentType = contentMetadata.badgeComponentType
		end
		return resultModule.success(var1)
	end
end
function t.fromExploreApiData(p1)
	-- upvalues: resultModule (ref), t (ref), omniRecommendationsContentType (ref)
	if type(p1.universeId) ~= "number" and type(p1.universeId) ~= "string" then
		return resultModule.error("TopicContentsEntryModel.fromExploreApiData expects universeId to be a number or a string")
	end
	local var1 = t.new()
	var1.contentType = omniRecommendationsContentType.Game
	var1.contentId = tostring(p1.universeId)
	var1.isSponsored = p1.isSponsored
	var1.adId = p1.nativeAdData
	var1.isShowSponsoredLabel = nil
	
	if p1.contentMetadata then
		local contentMetadata = p1.contentMetadata
		var1.badgePosition = contentMetadata.badgePosition
		var1.badgeAnalyticsId = contentMetadata.badgeAnalyticsId
		var1.badgeType = contentMetadata.badgeType
		var1.badgeText = contentMetadata.badgeText
		var1.badgeIcon = contentMetadata.badgeIcon
		var1.badgeComponentType = contentMetadata.badgeComponentType
	end
	return resultModule.success(var1)
end

if fFlagEnableTopSongsSort then
	function t.songFromExploreApiData(p1)
		-- upvalues: resultModule (ref), t (ref), omniRecommendationsContentType (ref)
		if type(p1.assetId) == "number" or type(p1.assetId) == "string" then
			local var1 = t.new()
			var1.contentType = omniRecommendationsContentType.Song
			var1.contentId = tostring(p1.assetId)
			var1.isSponsored = false
			
			return resultModule.success(var1)
		end
		return resultModule.error("TopicContentsEntryModel.songFromExploreApiData expects assetId to be a number or a string")
	end
end
function t.fromOmniRecommendations(p1)
	-- upvalues: t (ref), fFlagLuaAppEnableHomepageOneByTwoTile (ref), resultModule (ref)
	local var1 = t.new()
	var1.contentType = p1.contentType
	var1.contentId = tostring(p1.contentId)
	
	if p1.contentMetadata then
		var1.adId = p1.contentMetadata.EncryptedAdTrackingData or nil
		var1.isSponsored = var1.adId ~= nil and var1.adId ~= ""
		var1.isShowSponsoredLabel = nil
		var1.payerName = p1.contentMetadata.PayerName or nil
		var1.logoAssetId = p1.contentMetadata.LogoAssetId
		var1.logoAspectRatio = p1.contentMetadata.LogoAspectRatio
		var1.headline = p1.contentMetadata.Headline
		var1.subtitle = p1.contentMetadata.Subtitle
		var1.ctaText = p1.contentMetadata.CtaText
		var1.tileVariant = p1.contentMetadata.TileVariant
		var1.badgePosition = p1.contentMetadata.badgePosition
		var1.badgeAnalyticsId = p1.contentMetadata.badgeAnalyticsId
		var1.badgeType = p1.contentMetadata.badgeType
		var1.badgeText = p1.contentMetadata.badgeText
		var1.badgeIcon = p1.contentMetadata.badgeIcon
		var1.badgeComponentType = p1.contentMetadata.badgeComponentType
		var1.componentType = p1.contentMetadata.ComponentType
		var1.alignmentType = p1.contentMetadata.AlignmentType
		var1.minRowPadding = p1.contentMetadata.MinRowPadding
		var1.placeIdOverride = if p1.contentMetadata.PlaceIdOverride then tostring(p1.contentMetadata.PlaceIdOverride) else nil
		var1.launchDataOverride = p1.contentMetadata.LaunchDataOverride
		var1.primaryWideImageAssetId = if p1.contentMetadata.PrimaryWideImageAssetId and p1.contentMetadata.PrimaryWideImageAssetId ~= "" then p1.contentMetadata.PrimaryWideImageAssetId else nil
		var1.primaryWideImageListId = p1.contentMetadata.PrimaryWideImageListId
		var1.primaryWideVideoAssetId = p1.contentMetadata.PrimaryWideVideoAssetId
		var1.primaryImageAssetId = if fFlagLuaAppEnableHomepageOneByTwoTile then p1.contentMetadata.PrimaryImageAssetId else nil
		var1.primaryVideoAssetId = if fFlagLuaAppEnableHomepageOneByTwoTile then p1.contentMetadata.PrimaryVideoAssetId else nil
		var1.attributionThumbnailAssetId = if fFlagLuaAppEnableHomepageOneByTwoTile then p1.contentMetadata.AttributionThumbnailAssetId else nil
		var1.clickoutUrl = if fFlagLuaAppEnableHomepageOneByTwoTile then p1.contentMetadata.ClickoutUrl else nil
	else
		var1.adId = nil
		var1.isSponsored = false
		var1.isShowSponsoredLabel = nil
		var1.payerName = nil
		var1.placeIdOverride = nil
		var1.launchDataOverride = nil
	end
	var1.analyticsData = p1.analyticsData
	
	return resultModule.success(var1)
end

return t