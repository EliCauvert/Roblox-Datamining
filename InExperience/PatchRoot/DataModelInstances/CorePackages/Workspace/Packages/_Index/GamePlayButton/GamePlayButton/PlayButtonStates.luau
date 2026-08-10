return {
	Loading = "Loading",
	Playable = "Playable",
	PaidAccess = "PaidAccess",
	UnplayableOther = "UnplayableOther",
	PlayableWithParty = "PlayableWithParty",
	WaitingForParty = "WaitingForParty",
	ActionNeeded = "ActionNeeded",
	FiatPaidAccess = "FiatPaidAccess",
	DemoMode = if require(script:FindFirstAncestor("GamePlayButton").Parent.SharedFlags).FFlagLuaAppDemoModePlayButton then "DemoMode" else nil
}