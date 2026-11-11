local CountryCode = script:FindFirstAncestor("CountryCode")

return require(CountryCode.Parent.Rodux).createReducer("", {
	[require(CountryCode.Actions.ReceivedUserCountryCode).name] = function(_, p1)
		return p1.countryCode
	end
})