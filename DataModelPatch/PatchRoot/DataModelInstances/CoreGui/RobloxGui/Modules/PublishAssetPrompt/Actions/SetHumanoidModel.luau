return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(HumanoidModel)
	return { humanoidModel = HumanoidModel }
end)