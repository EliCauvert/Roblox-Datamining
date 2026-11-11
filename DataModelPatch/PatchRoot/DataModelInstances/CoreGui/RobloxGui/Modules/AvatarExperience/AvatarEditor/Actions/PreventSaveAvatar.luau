return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(PreventSaveAvatar)
	return { preventSaveAvatar = PreventSaveAvatar }
end)