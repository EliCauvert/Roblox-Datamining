return require(script:FindFirstAncestor("AuthCommon").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { countryCodeList = p1 }
end)