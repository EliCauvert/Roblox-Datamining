return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(Scales)
	return { scales = Scales }
end)