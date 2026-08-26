local parent = script:FindFirstAncestor("GraphQlShared").Parent
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local url = require(parent.Http).Url
local httpService = game:GetService("HttpService")
local discoveryUtilsModule = require(parent.DiscoveryUtils)
local fFlagEnableContextFeaturesForOmniRecommendations = require(parent.SharedFlags).FFlagEnableContextFeaturesForOmniRecommendations
local getFFlagHomePYMKUseProfileFrameThumbnail = require(parent.SharedFlags).GetFFlagHomePYMKUseProfileFrameThumbnail
local addSystemInfoToArgs = discoveryUtilsModule.AddSystemInfoToArgs
local omniRecommendationsPageType = discoveryUtilsModule.OmniRecommendationsPageType
local var1 = urlBuilder.new({
	path = "/discovery-api/omni-recommendation",
	base = url.APIS_URL
})

return function(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10)
	-- upvalues: omniRecommendationsPageType (ref), fFlagEnableContextFeaturesForOmniRecommendations (ref), getFFlagHomePYMKUseProfileFrameThumbnail (ref), addSystemInfoToArgs (ref), var1 (ref), httpService (ref)
	local t = {
		pageType = omniRecommendationsPageType.fromAppPage(p2),
		sessionId = p3,
		pageToken = p4,
		supportedTreatmentTypes = p5,
		requestIntent = p6,
		topicIds = p7,
		sduiTreatmentTypes = p8
	}
	
	if fFlagEnableContextFeaturesForOmniRecommendations and p9 then
		t.contextFeatures = p9
	end
	if getFFlagHomePYMKUseProfileFrameThumbnail() and p10 then
		t.includePymkSortProfileFrame = p10
	end
	addSystemInfoToArgs(t)
	
	return p1(var1(), "POST", { postBody = httpService:JSONEncode(t) })
end