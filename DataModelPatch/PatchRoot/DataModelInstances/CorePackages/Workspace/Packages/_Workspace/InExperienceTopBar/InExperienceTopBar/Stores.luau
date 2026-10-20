return {
	GetTopBarStore = if require(script:FindFirstAncestor("InExperienceTopBar").Flags).FFlagTopBarSignalizeSetCores then require(script.GetTopBarStore) else nil
}