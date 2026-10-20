return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(SelectedSlot)
	return { selectedSlot = SelectedSlot }
end)