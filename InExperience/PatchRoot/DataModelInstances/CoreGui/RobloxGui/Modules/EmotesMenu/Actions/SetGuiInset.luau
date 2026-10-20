return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(GuiInset)
	return { guiInset = GuiInset }
end)