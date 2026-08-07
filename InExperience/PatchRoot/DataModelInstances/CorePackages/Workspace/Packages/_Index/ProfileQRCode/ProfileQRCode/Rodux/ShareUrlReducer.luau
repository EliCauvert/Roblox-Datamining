local profileQRCode = script:FindFirstAncestor("ProfileQRCode")

return require(profileQRCode.Parent.Rodux).createReducer({}, {
	[require(profileQRCode.Networking.createOrGetProfileShareUrl).Succeeded.name] = function(_, p0) --[[ line: 14 ]]
		return p0.responseBody
	end
})