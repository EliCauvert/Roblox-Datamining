return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(AvatarType)
	return { avatarType = AvatarType }
end)