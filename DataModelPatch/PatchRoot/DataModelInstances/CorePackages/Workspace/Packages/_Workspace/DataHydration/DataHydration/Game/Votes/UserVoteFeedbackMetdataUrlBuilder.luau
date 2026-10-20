local Parent = script:FindFirstAncestor("DataHydration").Parent
local Url = require(Parent.Http).Url
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local GetFStringEdpPlayerFeedbackServiceRouteFunction = require(Parent.SharedFlags).GetFStringEdpPlayerFeedbackServiceRoute

return {
	USER_VOTE_FEEDBACK_METADATA_URL = UrlBuilder.new({
		path = "{serviceRoute}/v1/channels/{channel}/assets",
		base = Url.APIS_URL
	})({
		channel = "experience-discovery-page",
		serviceRoute = GetFStringEdpPlayerFeedbackServiceRouteFunction()
	}),
	buildUserVoteFeedbackMetadataUrl = function(RootPlaceId)
		-- upvalues: UrlBuilder (copy), Url (copy), GetFStringEdpPlayerFeedbackServiceRouteFunction (copy)
		return UrlBuilder.new({
			path = "{serviceRoute}/v1/channels/{channel}/assets/{rootPlaceId}",
			base = Url.APIS_URL
		})({
			channel = "experience-discovery-page",
			serviceRoute = GetFStringEdpPlayerFeedbackServiceRouteFunction(),
			rootPlaceId = RootPlaceId
		})
	end
}