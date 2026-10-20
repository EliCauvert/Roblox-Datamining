return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(ExperienceInfo)
	return { experienceInfo = ExperienceInfo }
end)