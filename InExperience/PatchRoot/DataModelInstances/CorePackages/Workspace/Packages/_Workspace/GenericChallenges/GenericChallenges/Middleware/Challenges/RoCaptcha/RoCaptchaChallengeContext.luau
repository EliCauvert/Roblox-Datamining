local ChallengeLifecycleEventConstants = require(script:FindFirstAncestor("GenericChallenges").Utils.ChallengeEventConstants).ChallengeLifecycleEventConstants

return {
	ChallengeLaunched = "challengeLaunched",
	ChallengeInitialized = ChallengeLifecycleEventConstants.ChallengeInitialized,
	ChallengeDisplayed = ChallengeLifecycleEventConstants.ChallengeDisplayed,
	ChallengeInvalidated = ChallengeLifecycleEventConstants.ChallengeInvalidated,
	ChallengeAbandoned = ChallengeLifecycleEventConstants.ChallengeAbandoned
}