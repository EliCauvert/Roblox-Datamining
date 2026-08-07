local profileShareLinks = script:FindFirstAncestor("ProfileShareLinks")

return require(profileShareLinks.Parent.Rodux).createReducer({}, {
	[require(profileShareLinks.Networking.Networking).ShareLinksNetworking.GetOrGenerateLink.Succeeded.name] = function(_, p0) --[[ line: 10 ]]
		return p0.responseBody
	end
})