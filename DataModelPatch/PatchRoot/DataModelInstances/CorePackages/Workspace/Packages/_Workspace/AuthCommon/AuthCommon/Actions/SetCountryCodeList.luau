return require(script:FindFirstAncestor("AuthCommon").Parent.Rodux).makeActionCreator(script.Name, function(CountryCodeList)
	return { countryCodeList = CountryCodeList }
end)