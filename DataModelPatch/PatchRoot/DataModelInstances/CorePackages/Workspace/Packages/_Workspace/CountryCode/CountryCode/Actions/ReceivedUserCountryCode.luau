return require(script:FindFirstAncestor("CountryCode").Parent.Rodux).makeActionCreator(script.Name, function(CountryCode)
	return { countryCode = CountryCode }
end)