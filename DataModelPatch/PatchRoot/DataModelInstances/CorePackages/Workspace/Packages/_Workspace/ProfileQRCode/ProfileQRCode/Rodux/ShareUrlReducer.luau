local ProfileQRCode = script:FindFirstAncestor("ProfileQRCode")

return require(ProfileQRCode.Parent.Rodux).createReducer({}, {
	[require(ProfileQRCode.Networking.createOrGetProfileShareUrl).Succeeded.name] = function(_, p1)
		return p1.responseBody
	end
})