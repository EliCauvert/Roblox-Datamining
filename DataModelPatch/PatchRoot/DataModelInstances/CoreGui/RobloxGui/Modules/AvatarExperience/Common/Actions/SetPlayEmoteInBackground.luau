return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(ShouldPlayEmoteInBackground)
	return {
		shouldPlayEmoteInBackground = ShouldPlayEmoteInBackground
	}
end)