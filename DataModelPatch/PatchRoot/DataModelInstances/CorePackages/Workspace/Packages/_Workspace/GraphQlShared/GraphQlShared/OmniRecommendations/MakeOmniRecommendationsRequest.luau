local Parent = script:FindFirstAncestor("GraphQlShared").Parent
local HttpService = game:GetService("HttpService")
local DiscoveryUtilsModule = require(Parent.DiscoveryUtils)
local FFlagEnableContextFeaturesForOmniRecommendations = require(Parent.SharedFlags).FFlagEnableContextFeaturesForOmniRecommendations
local AddSystemInfoToArgsFunction = DiscoveryUtilsModule.AddSystemInfoToArgs
local OmniRecommendationsPageType = DiscoveryUtilsModule.OmniRecommendationsPageType
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "/discovery-api/omni-recommendation",
	base = require(Parent.Http).Url.APIS_URL
})

return function(Callback, p1, SessionId, PageToken, SupportedTreatmentTypes, RequestIntent, TopicIds, SduiTreatmentTypes, ContextFeatures)
	-- upvalues: OmniRecommendationsPageType (copy), FFlagEnableContextFeaturesForOmniRecommendations (copy), AddSystemInfoToArgsFunction (copy), NewResult (copy), HttpService (copy)
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
	AddSystemInfoToArgsFunction(config)
	
	return Callback(NewResult(), "POST", { postBody = HttpService:JSONEncode(config) })
end