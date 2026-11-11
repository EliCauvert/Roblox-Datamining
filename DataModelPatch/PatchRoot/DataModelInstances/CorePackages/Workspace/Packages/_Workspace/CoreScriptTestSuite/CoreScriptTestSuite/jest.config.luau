local Parent = script.Parent.Parent

return {
	projects = {
		require(Parent.InExperienceSessionization)["jest.config"],
		require(Parent.ExperienceLoadingScript)["jest.config"],
		require(Parent.CachedPolicyService)["jest.config"],
		require(Parent.CoreScriptsCommon)["jest.config"],
		require(Parent.CoreGuiCommon)["jest.config"],
		require(Parent.InExperienceLocales)["jest.config"],
		require(Parent.InExperienceOverlay)["jest.config"],
		require(Parent.LeaderboardStore)["jest.config"],
		require(Parent.PlayerList)["jest.config"],
		require(Parent.HelpPage)["jest.config"],
		require(Parent.InExperiencePerformance)["jest.config"],
		require(Parent.CoreScriptsRoactCommon)["jest.config"]
	}
}