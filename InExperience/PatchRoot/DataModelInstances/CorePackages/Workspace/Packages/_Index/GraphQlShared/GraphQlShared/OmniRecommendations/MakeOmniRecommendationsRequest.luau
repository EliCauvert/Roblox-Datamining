local Parent = script:FindFirstAncestor("GraphQlShared").Parent
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local Url = require(Parent.Http).Url
local HttpService = game:GetService("HttpService")
local DiscoveryUtilsModule = require(Parent.DiscoveryUtils)
local FFlagEnableContextFeaturesForOmniRecommendations = require(Parent.SharedFlags).FFlagEnableContextFeaturesForOmniRecommendations
local GetFFlagHomePYMKUseProfileFrameThumbnailFunction = require(Parent.SharedFlags).GetFFlagHomePYMKUseProfileFrameThumbnail
local AddSystemInfoToArgsFunction = DiscoveryUtilsModule.AddSystemInfoToArgs
local OmniRecommendationsPageType = DiscoveryUtilsModule.OmniRecommendationsPageType
local NewUrlBuilder = UrlBuilder.new({
	path = "/discovery-api/omni-recommendation",
	base = Url.APIS_URL
})

return function(Callback, p1, SessionId, PageToken, SupportedTreatmentTypes, RequestIntent, TopicIds, SduiTreatmentTypes, ContextFeatures, IncludePymkSortProfileFrame)
	-- upvalues: OmniRecommendationsPageType (copy), FFlagEnableContextFeaturesForOmniRecommendations (copy), GetFFlagHomePYMKUseProfileFrameThumbnailFunction (copy), AddSystemInfoToArgsFunction (copy), NewUrlBuilder (copy), HttpService (copy)
	local config = {
		pageType = OmniRecommendationsPageType.fromAppPage(p1),
		sessionId = SessionId,
		pageToken = PageToken,
		supportedTreatmentTypes = SupportedTreatmentTypes,
		requestIntent = RequestIntent,
		topicIds = TopicIds,
		sduiTreatmentTypes = SduiTreatmentTypes
	}
	
	if FFlagEnableContextFeaturesForOmniRecommendations and ContextFeatures then
		config.contextFeatures = ContextFeatures
	end
	if GetFFlagHomePYMKUseProfileFrameThumbnailFunction() and IncludePymkSortProfileFrame then
		config.includePymkSortProfileFrame = IncludePymkSortProfileFrame
	end
	AddSystemInfoToArgsFunction(config)
	
	return Callback(NewUrlBuilder(), "POST", { postBody = HttpService:JSONEncode(config) })
end