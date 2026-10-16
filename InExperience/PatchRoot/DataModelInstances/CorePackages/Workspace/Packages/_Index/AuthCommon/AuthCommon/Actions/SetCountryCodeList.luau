return require(script:FindFirstAncestor("AuthCommon").Parent.Rodux).makeActionCreator(script.Name, function(CountryCodeList) --[[ Line: 11 ]]
	return { countryCodeList = CountryCodeList }
end)