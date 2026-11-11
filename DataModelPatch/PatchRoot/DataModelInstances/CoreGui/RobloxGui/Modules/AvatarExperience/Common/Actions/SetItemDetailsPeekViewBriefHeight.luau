return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(BriefViewHeight)
	return { briefViewHeight = BriefViewHeight }
end)