local Parent = script.Parent.Parent

return {
	projects = {
		require(Parent.AvatarExperienceCommon)["jest.config"],
		require(Parent.AvatarExperienceTimedOptions)["jest.config"],
		require(Parent.AvatarExperienceHeadRefinement)["jest.config"],
		require(Parent.AvatarExperienceInitialization)["jest.config"],
		require(Parent.AvatarExperienceNavigation)["jest.config"],
		require(Parent.AvatarExperienceSearch)["jest.config"],
		require(Parent.AvatarExperienceSlotBasedEditor)["jest.config"],
		require(Parent.AvatarExperienceCatalog)["jest.config"],
		require(Parent.AvatarExperienceControlBar)["jest.config"],
		require(Parent.AvatarExperienceSave)["jest.config"],
		require(Parent.AvatarExperienceAnalytics)["jest.config"],
		require(Parent.AvatarExperienceInspectAndBuy)["jest.config"],
		require(Parent.AvatarExperienceUIKit)["jest.config"],
		require(Parent.AvatarExperienceServerDrivenUi)["jest.config"],
		require(Parent.AvatarExperienceRodux)["jest.config"],
		require(Parent.AvatarExperiencePhotobooth)["jest.config"],
		require(Parent.AvatarExperienceTTIPerformance)["jest.config"],
		require(Parent.AvatarExperienceFavoritesManager)["jest.config"]
	}
}