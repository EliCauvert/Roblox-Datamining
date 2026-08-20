local parent = script:FindFirstAncestor("GraphQlShared").Parent
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local url = require(parent.Http).Url
local httpService = game:GetService("HttpService")
local discoveryUtilsModule = require(parent.DiscoveryUtils)
local fFlagEnableContextFeaturesForOmniRecommendations = require(parent.SharedFlags).FFlagEnableContextFeaturesForOmniRecommendations
local getFFlagHomePYMKUseProfileFrameThumbnail = require(parent.SharedFlags).GetFFlagHomePYMKUseProfileFrameThumbnail
local addSystemInfoToArgs = discoveryUtilsModule.AddSystemInfoToArgs
local omniRecommendationsPageType = discoveryUtilsModule.OmniRecommendationsPageType
local var2 = urlBuilder.new({
	path = "/discovery-api/omni-recommendation",
	base = url.APIS_URL
})

return function(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9) --[[ line: 55 ]]
	-- upvalues: omniRecommendationsPageType (ref), fFlagEnableContextFeaturesForOmniRecommendations (ref), getFFlagHomePYMKUseProfileFrameThumbnail (ref), addSystemInfoToArgs (ref), var2 (ref), httpService (ref)
	local t = {
		pageType = omniRecommendationsPageType.fromAppPage(p1),
		sessionId = p2,
		pageToken = p3,
		supportedTreatmentTypes = p4,
		requestIntent = p5,
		topicIds = p6,
		sduiTreatmentTypes = p7
	}
	
	if fFlagEnableContextFeaturesForOmniRecommendations and p8 then
		t.contextFeatures = p8
	end
	if getFFlagHomePYMKUseProfileFrameThumbnail() and p9 then
		t.includePymkSortProfileFrame = p9
	end
	addSystemInfoToArgs(t)
	
	return p0(var2(), "POST", { postBody = httpService:JSONEncode(t) })
end