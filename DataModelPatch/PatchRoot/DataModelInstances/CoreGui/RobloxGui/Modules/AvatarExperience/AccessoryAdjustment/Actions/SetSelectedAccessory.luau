return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(SelectedAccessory)
	return { selectedAccessory = SelectedAccessory }
end)