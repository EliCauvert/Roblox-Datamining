local coreGuiCommon = script:FindFirstAncestor("CoreGuiCommon")

return {
	GetUILessStore = if require(coreGuiCommon.Parent.SharedFlags).FFlagAddUILessMode then require(script.GetUILessStore) else nil,
	GetInspectAndBuyStore = if require(coreGuiCommon.Flags).FFlagTopBarSignalizeMenuOpen then require(script.GetInspectAndBuyStore) else nil,
	GetKeepOutAreasStore = if require(coreGuiCommon.Flags).FFlagTopBarSignalizeKeepOutAreas then require(script.GetKeepOutAreasStore) else nil,
	GetLocalHumanoidStore = if require(coreGuiCommon.Flags).FFlagTopBarSignalizeHealthBar then require(script.GetLocalHumanoidStore) else nil,
	GetUiSelectorSignalStore = if require(coreGuiCommon.Flags).FFlagEnableUISelector then require(script.GetUiSelectorSignalStore) else nil
}