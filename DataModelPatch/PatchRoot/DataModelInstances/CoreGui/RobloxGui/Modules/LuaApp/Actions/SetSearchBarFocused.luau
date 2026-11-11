return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("SetSearchBarFocused", function(Focused)
	return { focused = Focused }
end)