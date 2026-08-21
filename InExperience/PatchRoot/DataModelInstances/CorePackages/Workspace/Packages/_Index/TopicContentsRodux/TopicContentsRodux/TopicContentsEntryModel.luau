local parent = script:FindFirstAncestor("TopicContentsRodux").Parent
local omniRecommendationsContentType = require(parent.DiscoveryTypes).OmniRecommendationsContentType
local resultModule = require(parent.Result)
local fFlagSearchOmniAutocompletePage = require(parent.SharedFlags).FFlagSearchOmniAutocompletePage
local fFlagEnableTopSongsSort = require(parent.SharedFlags).FFlagEnableTopSongsSort
local fFlagLuaAppEnableHomepageOneByTwoTile = require(parent.SharedFlags).FFlagLuaAppEnableHomepageOneByTwoTile
local t = {
	new = function() --[[ line: 15 ]]
		return {}
	end,
	mock = function(p0) --[[ line: 21 ]]
		-- upvalues: omniRecommendationsContentType (ref)
		local t = {
			contentType = omniRecommendationsContentType.Game,
			contentId = p0 or "149757",
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
		t.clickoutUrl = nil
		
		return t
	end
}

function t.fromGamesApiData(p1) --[[ line: 56 ]]
	-- upvalues: resultModule (ref), t (ref), omniRecommendationsContentType (ref)
	if type(p1.universeId) ~= "number" and type(p1.universeId) ~= "string" then
		return resultModule.error("TopicContentsEntryModel.fromGamesApiData expects universeId to be a number or a string")
	end
	local var3 = t.new()
	var3.contentType = omniRecommendationsContentType.Game
	var3.contentId = tostring(p1.universeId)
	var3.isSponsored = p1.isSponsored
	var3.isShowSponsoredLabel = nil
	
	if p1.isShowSponsoredLabel == nil then
		var3.isShowSponsoredLabel = true
	else
		var3.isShowSponsoredLabel = p1.isShowSponsoredLabel
	end
	var3.adId = p1.nativeAdData
	
	if p1.contentMetadata then
		local contentMetadata = p1.contentMetadata
		var3.badgePosition = contentMetadata.badgePosition
		var3.badgeAnalyticsId = contentMetadata.badgeAnalyticsId
		var3.badgeType = contentMetadata.badgeType
		var3.badgeText = contentMetadata.badgeText
		var3.badgeIcon = contentMetadata.badgeIcon
		var3.badgeComponentType = contentMetadata.badgeComponentType
	end
	return resultModule.success(var3)
end

if fFlagSearchOmniAutocompletePage then
	function t.fromOmniAutocompleteApi(p2) --[[ line: 89 ]]
		-- upvalues: resultModule (ref), t (ref), omniRecommendationsContentType (ref)
		if type(p2.universeId) ~= "number" and type(p2.universeId) ~= "string" then
			return resultModule.error("TopicContentsEntryModel.fromOmniAutocomplete expects universeId to be a number or a string")
		end
		local var4 = t.new()
		var4.contentType = omniRecommendationsContentType.Game
		var4.contentId = tostring(p2.universeId)
		
		if p2.contentMetadata then
			local contentMetadata = p2.contentMetadata
			var4.badgePosition = contentMetadata.badgePosition
			var4.badgeAnalyticsId = contentMetadata.badgeAnalyticsId
			var4.badgeType = contentMetadata.badgeType
			var4.badgeText = contentMetadata.badgeText
			var4.badgeIcon = contentMetadata.badgeIcon
			var4.badgeComponentType = contentMetadata.badgeComponentType
		end
		return resultModule.success(var4)
	end
end
function t.fromExploreApiData(p3) --[[ line: 116 ]]
	-- upvalues: resultModule (ref), t (ref), omniRecommendationsContentType (ref)
	if type(p3.universeId) ~= "number" and type(p3.universeId) ~= "string" then
		return resultModule.error("TopicContentsEntryModel.fromExploreApiData expects universeId to be a number or a string")
	end
	local var5 = t.new()
	var5.contentType = omniRecommendationsContentType.Game
	var5.contentId = tostring(p3.universeId)
	var5.isSponsored = p3.isSponsored
	var5.adId = p3.nativeAdData
	var5.isShowSponsoredLabel = nil
	
	if p3.contentMetadata then
		local contentMetadata = p3.contentMetadata
		var5.badgePosition = contentMetadata.badgePosition
		var5.badgeAnalyticsId = contentMetadata.badgeAnalyticsId
		var5.badgeType = contentMetadata.badgeType
		var5.badgeText = contentMetadata.badgeText
		var5.badgeIcon = contentMetadata.badgeIcon
		var5.badgeComponentType = contentMetadata.badgeComponentType
	end
	return resultModule.success(var5)
end

if fFlagEnableTopSongsSort then
	function t.songFromExploreApiData(p4) --[[ line: 142 ]]
		-- upvalues: resultModule (ref), t (ref), omniRecommendationsContentType (ref)
		if type(p4.assetId) == "number" or type(p4.assetId) == "string" then
			local var6 = t.new()
			var6.contentType = omniRecommendationsContentType.Song
			var6.contentId = tostring(p4.assetId)
			var6.isSponsored = false
			
			return resultModule.success(var6)
		end
		return resultModule.error("TopicContentsEntryModel.songFromExploreApiData expects assetId to be a number or a string")
	end
end
function t.fromOmniRecommendations(p5) --[[ line: 157 ]]
	-- upvalues: t (ref), fFlagLuaAppEnableHomepageOneByTwoTile (ref), resultModule (ref)
	local var7 = t.new()
	var7.contentType = p5.contentType
	var7.contentId = tostring(p5.contentId)
	
	if p5.contentMetadata then
		var7.adId = p5.contentMetadata.EncryptedAdTrackingData or nil
		var7.isSponsored = var7.adId ~= nil and var7.adId ~= ""
		var7.isShowSponsoredLabel = nil
		var7.payerName = p5.contentMetadata.PayerName or nil
		var7.logoAssetId = p5.contentMetadata.LogoAssetId
		var7.logoAspectRatio = p5.contentMetadata.LogoAspectRatio
		var7.headline = p5.contentMetadata.Headline
		var7.subtitle = p5.contentMetadata.Subtitle
		var7.ctaText = p5.contentMetadata.CtaText
		var7.tileVariant = p5.contentMetadata.TileVariant
		var7.badgePosition = p5.contentMetadata.badgePosition
		var7.badgeAnalyticsId = p5.contentMetadata.badgeAnalyticsId
		var7.badgeType = p5.contentMetadata.badgeType
		var7.badgeText = p5.contentMetadata.badgeText
		var7.badgeIcon = p5.contentMetadata.badgeIcon
		var7.badgeComponentType = p5.contentMetadata.badgeComponentType
		var7.componentType = p5.contentMetadata.ComponentType
		var7.alignmentType = p5.contentMetadata.AlignmentType
		var7.minRowPadding = p5.contentMetadata.MinRowPadding
		var7.placeIdOverride = if p5.contentMetadata.PlaceIdOverride then tostring(p5.contentMetadata.PlaceIdOverride) else nil
		var7.launchDataOverride = p5.contentMetadata.LaunchDataOverride
		var7.primaryWideImageAssetId = if p5.contentMetadata.PrimaryWideImageAssetId and p5.contentMetadata.PrimaryWideImageAssetId ~= "" then p5.contentMetadata.PrimaryWideImageAssetId else nil
		var7.primaryWideImageListId = p5.contentMetadata.PrimaryWideImageListId
		var7.primaryWideVideoAssetId = p5.contentMetadata.PrimaryWideVideoAssetId
		var7.primaryImageAssetId = if fFlagLuaAppEnableHomepageOneByTwoTile then p5.contentMetadata.PrimaryImageAssetId else nil
		var7.primaryVideoAssetId = if fFlagLuaAppEnableHomepageOneByTwoTile then p5.contentMetadata.PrimaryVideoAssetId else nil
		var7.clickoutUrl = if fFlagLuaAppEnableHomepageOneByTwoTile then p5.contentMetadata.ClickoutUrl else nil
	else
		var7.adId = nil
		var7.isSponsored = false
		var7.isShowSponsoredLabel = nil
		var7.payerName = nil
		var7.placeIdOverride = nil
		var7.launchDataOverride = nil
	end
	var7.analyticsData = p5.analyticsData
	
	return resultModule.success(var7)
end

return t