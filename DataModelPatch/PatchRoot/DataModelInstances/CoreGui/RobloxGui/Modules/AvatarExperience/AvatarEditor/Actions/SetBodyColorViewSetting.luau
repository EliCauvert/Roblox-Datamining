return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(BodyColorViewSetting)
	return { bodyColorViewSetting = BodyColorViewSetting }
end)