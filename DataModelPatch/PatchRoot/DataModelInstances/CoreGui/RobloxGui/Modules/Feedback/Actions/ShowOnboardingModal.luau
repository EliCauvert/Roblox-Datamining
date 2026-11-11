return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(OnboardingModalVisible)
	return { onboardingModalVisible = OnboardingModalVisible }
end)