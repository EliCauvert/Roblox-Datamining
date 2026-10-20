return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(PriceInRobux)
	return { priceInRobux = PriceInRobux }
end)