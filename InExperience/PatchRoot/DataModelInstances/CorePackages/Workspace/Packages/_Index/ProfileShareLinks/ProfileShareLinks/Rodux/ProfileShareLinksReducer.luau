local profileShareLinks = script:FindFirstAncestor("ProfileShareLinks")

return require(profileShareLinks.Parent.Rodux).createReducer({}, {
	[require(profileShareLinks.Networking.Networking).ShareLinksNetworking.GetOrGenerateLink.Succeeded.name] = function(_, p1)
		return p1.responseBody
	end
})