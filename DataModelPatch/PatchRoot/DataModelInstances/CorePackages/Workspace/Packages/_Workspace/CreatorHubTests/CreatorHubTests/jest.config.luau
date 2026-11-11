local Parent = script.Parent.Parent

return {
	projects = {
		require(Parent.AffiliateLinks)["jest.config"],
		require(Parent.ExternalAttribution)["jest.config"],
		require(Parent.PlayerFeedback)["jest.config"]
	}
}