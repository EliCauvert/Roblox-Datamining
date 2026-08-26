local parent = script:FindFirstAncestor("DataHydration").Parent
local url = require(parent.Http).Url
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local getFStringEdpPlayerFeedbackServiceRoute = require(parent.SharedFlags).GetFStringEdpPlayerFeedbackServiceRoute
local _ = { ExperienceDiscoveryPage = "experience-discovery-page" }

return {
	USER_VOTE_FEEDBACK_METADATA_URL = urlBuilder.new({
		path = "{serviceRoute}/v1/channels/{channel}/assets",
		base = url.APIS_URL
	})({
		channel = "experience-discovery-page",
		serviceRoute = getFStringEdpPlayerFeedbackServiceRoute()
	}),
	buildUserVoteFeedbackMetadataUrl = function(p1)
		-- upvalues: urlBuilder (ref), url (ref), getFStringEdpPlayerFeedbackServiceRoute (ref)
		return urlBuilder.new({
			path = "{serviceRoute}/v1/channels/{channel}/assets/{rootPlaceId}",
			base = url.APIS_URL
		})({
			channel = "experience-discovery-page",
			serviceRoute = getFStringEdpPlayerFeedbackServiceRoute(),
			rootPlaceId = p1
		})
	end
}