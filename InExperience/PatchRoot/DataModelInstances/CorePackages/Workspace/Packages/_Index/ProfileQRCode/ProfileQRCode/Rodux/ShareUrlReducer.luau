local profileQRCode = script:FindFirstAncestor("ProfileQRCode")

return require(profileQRCode.Parent.Rodux).createReducer({}, {
	[require(profileQRCode.Networking.createOrGetProfileShareUrl).Succeeded.name] = function(_, p1)
		return p1.responseBody
	end
})