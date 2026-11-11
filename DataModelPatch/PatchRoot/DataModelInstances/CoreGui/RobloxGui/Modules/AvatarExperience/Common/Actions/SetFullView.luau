return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(AvatarScreen, FullViewStatus)
	return {
		avatarScreen = AvatarScreen,
		fullViewStatus = FullViewStatus
	}
end)