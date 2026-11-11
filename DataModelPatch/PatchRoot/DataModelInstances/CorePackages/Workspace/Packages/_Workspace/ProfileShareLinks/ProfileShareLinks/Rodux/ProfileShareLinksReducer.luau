local ProfileShareLinks = script:FindFirstAncestor("ProfileShareLinks")

return require(ProfileShareLinks.Parent.Rodux).createReducer({}, {
	[require(ProfileShareLinks.Networking.Networking).ShareLinksNetworking.GetOrGenerateLink.Succeeded.name] = function(_, p1)
		return p1.responseBody
	end
})