local Parent = script:FindFirstAncestor("TopicContentsRodux").Parent
local OmniRecommendationsContentType = require(Parent.DiscoveryTypes).OmniRecommendationsContentType
local ResultModule = require(Parent.Result)
local FFlagSearchOmniAutocompletePage = require(Parent.SharedFlags).FFlagSearchOmniAutocompletePage
local FFlagEnableTopSongsSort = require(Parent.SharedFlags).FFlagEnableTopSongsSort
local FFlagLuaAppEnableWhyThisAdModal = require(Parent.SharedFlags).FFlagLuaAppEnableWhyThisAdModal
local FFlagLuaAppEnableHomepageOneByTwoTile = require(Parent.SharedFlags).FFlagLuaAppEnableHomepageOneByTwoTile
local TopicContentsEntryModelModule = {
	new = function()
		return {}
	end,
	mock = function(p1)
		-- upvalues: OmniRecommendationsContentType (copy)
		local config = {
			contentType = OmniRecommendationsContentType.Game,
			contentId = p1 or "149757",
			isSponsored = false
		}
		config.isShowSponsoredLabel = config.isSponsored
		config.adId = nil
		config.payerName = nil
		config.logoAssetId = nil
		config.logoAspectRatio = nil
		config.headline = nil
		config.subtitle = nil
		config.ctaText = nil
		config.tileVariant = nil
		config.badgePosition = nil
		config.badgeAnalyticsId = nil
		config.badgeType = nil
		config.badgeText = nil
		config.badgeIcon = nil
		config.badgeComponentType = nil
		config.componentType = nil
		config.alignmentType = nil
		config.minRowPadding = nil
		config.placeIdOverride = nil
		config.launchDataOverride = nil
		config.analyticsData = nil
		config.primaryWideImageAssetId = nil
		config.primaryWideImageListId = nil
		config.primaryWideVideoAssetId = nil
		config.primaryImageAssetId = nil
		config.primaryVideoAssetId = nil
		config.clickoutUrl = nil
		
		return config
	end
}

function TopicContentsEntryModelModule.fromGamesApiData(p1)
	-- upvalues: ResultModule (copy), TopicContentsEntryModelModule (copy), OmniRecommendationsContentType (copy)
	if type(p1.universeId) ~= "number" and type(p1.universeId) ~= "string" then
		return ResultModule.error("TopicContentsEntryModel.fromGamesApiData expects universeId to be a number or a string")
	end
	local NewTopicContentsEntryModel = TopicContentsEntryModelModule.new()
	NewTopicContentsEntryModel.contentType = OmniRecommendationsContentType.Game
	NewTopicContentsEntryModel.contentId = tostring(p1.universeId)
	NewTopicContentsEntryModel.isSponsored = p1.isSponsored
	NewTopicContentsEntryModel.isShowSponsoredLabel = nil
	
	if p1.isShowSponsoredLabel == nil then
		NewTopicContentsEntryModel.isShowSponsoredLabel = true
	else
		NewTopicContentsEntryModel.isShowSponsoredLabel = p1.isShowSponsoredLabel
	end
	NewTopicContentsEntryModel.adId = p1.nativeAdData
	
	if p1.contentMetadata then
		local ContentMetadata = p1.contentMetadata
		NewTopicContentsEntryModel.badgePosition = ContentMetadata.badgePosition
		NewTopicContentsEntryModel.badgeAnalyticsId = ContentMetadata.badgeAnalyticsId
		NewTopicContentsEntryModel.badgeType = ContentMetadata.badgeType
		NewTopicContentsEntryModel.badgeText = ContentMetadata.badgeText
		NewTopicContentsEntryModel.badgeIcon = ContentMetadata.badgeIcon
		NewTopicContentsEntryModel.badgeComponentType = ContentMetadata.badgeComponentType
	end
	return ResultModule.success(NewTopicContentsEntryModel)
end

if FFlagSearchOmniAutocompletePage then
	function TopicContentsEntryModelModule.fromOmniAutocompleteApi(p1)
		-- upvalues: ResultModule (copy), TopicContentsEntryModelModule (copy), OmniRecommendationsContentType (copy)
		if type(p1.universeId) ~= "number" and type(p1.universeId) ~= "string" then
			return ResultModule.error("TopicContentsEntryModel.fromOmniAutocomplete expects universeId to be a number or a string")
		end
		local NewTopicContentsEntryModel = TopicContentsEntryModelModule.new()
		NewTopicContentsEntryModel.contentType = OmniRecommendationsContentType.Game
		NewTopicContentsEntryModel.contentId = tostring(p1.universeId)
		
		if p1.contentMetadata then
			local ContentMetadata = p1.contentMetadata
			NewTopicContentsEntryModel.badgePosition = ContentMetadata.badgePosition
			NewTopicContentsEntryModel.badgeAnalyticsId = ContentMetadata.badgeAnalyticsId
			NewTopicContentsEntryModel.badgeType = ContentMetadata.badgeType
			NewTopicContentsEntryModel.badgeText = ContentMetadata.badgeText
			NewTopicContentsEntryModel.badgeIcon = ContentMetadata.badgeIcon
			NewTopicContentsEntryModel.badgeComponentType = ContentMetadata.badgeComponentType
		end
		return ResultModule.success(NewTopicContentsEntryModel)
	end
end
function TopicContentsEntryModelModule.fromExploreApiData(p1)
	-- upvalues: ResultModule (copy), TopicContentsEntryModelModule (copy), OmniRecommendationsContentType (copy)
	if type(p1.universeId) ~= "number" and type(p1.universeId) ~= "string" then
		return ResultModule.error("TopicContentsEntryModel.fromExploreApiData expects universeId to be a number or a string")
	end
	local NewTopicContentsEntryModel = TopicContentsEntryModelModule.new()
	NewTopicContentsEntryModel.contentType = OmniRecommendationsContentType.Game
	NewTopicContentsEntryModel.contentId = tostring(p1.universeId)
	NewTopicContentsEntryModel.isSponsored = p1.isSponsored
	NewTopicContentsEntryModel.adId = p1.nativeAdData
	NewTopicContentsEntryModel.isShowSponsoredLabel = nil
	
	if p1.contentMetadata then
		local ContentMetadata = p1.contentMetadata
		NewTopicContentsEntryModel.badgePosition = ContentMetadata.badgePosition
		NewTopicContentsEntryModel.badgeAnalyticsId = ContentMetadata.badgeAnalyticsId
		NewTopicContentsEntryModel.badgeType = ContentMetadata.badgeType
		NewTopicContentsEntryModel.badgeText = ContentMetadata.badgeText
		NewTopicContentsEntryModel.badgeIcon = ContentMetadata.badgeIcon
		NewTopicContentsEntryModel.badgeComponentType = ContentMetadata.badgeComponentType
	end
	return ResultModule.success(NewTopicContentsEntryModel)
end

if FFlagEnableTopSongsSort then
	function TopicContentsEntryModelModule.songFromExploreApiData(p1)
		-- upvalues: ResultModule (copy), TopicContentsEntryModelModule (copy), OmniRecommendationsContentType (copy)
		if type(p1.assetId) == "number" or type(p1.assetId) == "string" then
			local NewTopicContentsEntryModel = TopicContentsEntryModelModule.new()
			NewTopicContentsEntryModel.contentType = OmniRecommendationsContentType.Song
			NewTopicContentsEntryModel.contentId = tostring(p1.assetId)
			NewTopicContentsEntryModel.isSponsored = false
			
			return ResultModule.success(NewTopicContentsEntryModel)
		else
			return ResultModule.error("TopicContentsEntryModel.songFromExploreApiData expects assetId to be a number or a string")
		end
	end
end
function TopicContentsEntryModelModule.fromOmniRecommendations(p1)
	-- upvalues: TopicContentsEntryModelModule (copy), FFlagLuaAppEnableWhyThisAdModal (copy), FFlagLuaAppEnableHomepageOneByTwoTile (copy), ResultModule (copy)
	local NewTopicContentsEntryModel = TopicContentsEntryModelModule.new()
	NewTopicContentsEntryModel.contentType = p1.contentType
	NewTopicContentsEntryModel.contentId = tostring(p1.contentId)
	
	if p1.contentMetadata then
		NewTopicContentsEntryModel.adId = p1.contentMetadata.EncryptedAdTrackingData or nil
		NewTopicContentsEntryModel.isSponsored = NewTopicContentsEntryModel.adId ~= nil and NewTopicContentsEntryModel.adId ~= ""
		NewTopicContentsEntryModel.isShowSponsoredLabel = nil
		NewTopicContentsEntryModel.payerName = FFlagLuaAppEnableWhyThisAdModal and p1.contentMetadata.PayerName or nil
		NewTopicContentsEntryModel.logoAssetId = p1.contentMetadata.LogoAssetId
		NewTopicContentsEntryModel.logoAspectRatio = p1.contentMetadata.LogoAspectRatio
		NewTopicContentsEntryModel.headline = p1.contentMetadata.Headline
		NewTopicContentsEntryModel.subtitle = p1.contentMetadata.Subtitle
		NewTopicContentsEntryModel.ctaText = p1.contentMetadata.CtaText
		NewTopicContentsEntryModel.tileVariant = p1.contentMetadata.TileVariant
		NewTopicContentsEntryModel.badgePosition = p1.contentMetadata.badgePosition
		NewTopicContentsEntryModel.badgeAnalyticsId = p1.contentMetadata.badgeAnalyticsId
		NewTopicContentsEntryModel.badgeType = p1.contentMetadata.badgeType
		NewTopicContentsEntryModel.badgeText = p1.contentMetadata.badgeText
		NewTopicContentsEntryModel.badgeIcon = p1.contentMetadata.badgeIcon
		NewTopicContentsEntryModel.badgeComponentType = p1.contentMetadata.badgeComponentType
		NewTopicContentsEntryModel.componentType = p1.contentMetadata.ComponentType
		NewTopicContentsEntryModel.alignmentType = p1.contentMetadata.AlignmentType
		NewTopicContentsEntryModel.minRowPadding = p1.contentMetadata.MinRowPadding
		NewTopicContentsEntryModel.placeIdOverride = if p1.contentMetadata.PlaceIdOverride then tostring(p1.contentMetadata.PlaceIdOverride) else nil
		NewTopicContentsEntryModel.launchDataOverride = p1.contentMetadata.LaunchDataOverride
		NewTopicContentsEntryModel.primaryWideImageAssetId = if p1.contentMetadata.PrimaryWideImageAssetId and p1.contentMetadata.PrimaryWideImageAssetId ~= "" then p1.contentMetadata.PrimaryWideImageAssetId else nil
		NewTopicContentsEntryModel.primaryWideImageListId = p1.contentMetadata.PrimaryWideImageListId
		NewTopicContentsEntryModel.primaryWideVideoAssetId = p1.contentMetadata.PrimaryWideVideoAssetId
		NewTopicContentsEntryModel.primaryImageAssetId = if FFlagLuaAppEnableHomepageOneByTwoTile then p1.contentMetadata.PrimaryImageAssetId else nil
		NewTopicContentsEntryModel.primaryVideoAssetId = if FFlagLuaAppEnableHomepageOneByTwoTile then p1.contentMetadata.PrimaryVideoAssetId else nil
		NewTopicContentsEntryModel.clickoutUrl = if FFlagLuaAppEnableHomepageOneByTwoTile then p1.contentMetadata.ClickoutUrl else nil
	else
		NewTopicContentsEntryModel.adId = nil
		NewTopicContentsEntryModel.isSponsored = false
		NewTopicContentsEntryModel.isShowSponsoredLabel = nil
		NewTopicContentsEntryModel.payerName = nil
		NewTopicContentsEntryModel.placeIdOverride = nil
		NewTopicContentsEntryModel.launchDataOverride = nil
	end
	NewTopicContentsEntryModel.analyticsData = p1.analyticsData
	
	return ResultModule.success(NewTopicContentsEntryModel)
end

return TopicContentsEntryModelModule