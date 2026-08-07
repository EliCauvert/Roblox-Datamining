return {
	ExperienceDetailsLink = "ExperienceDetailsLink",
	ExperienceAffiliateLink = "ExperienceAffiliateLink",
	PlayWithReward = if require(script:FindFirstAncestor("GamePlayButton").Parent.SharedFlags).FFlagEnablePlayWithRewardComponent then "PlayWithReward" else nil
}