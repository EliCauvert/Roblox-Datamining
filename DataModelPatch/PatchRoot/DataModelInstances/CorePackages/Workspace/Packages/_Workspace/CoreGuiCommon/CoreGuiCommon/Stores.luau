local CoreGuiCommon = script:FindFirstAncestor("CoreGuiCommon")
local FFlagTopBarSignalizeMenuOpen = require(CoreGuiCommon.Flags).FFlagTopBarSignalizeMenuOpen
local FFlagTopBarSignalizeKeepOutAreas = require(CoreGuiCommon.Flags).FFlagTopBarSignalizeKeepOutAreas
local FFlagTopBarSignalizeHealthBar = require(CoreGuiCommon.Flags).FFlagTopBarSignalizeHealthBar
local FFlagEnableUISelector = require(CoreGuiCommon.Flags).FFlagEnableUISelector

return {
	GetUILessStore = if require(CoreGuiCommon.Parent.SharedFlags).FFlagAddUILessMode then require(script.GetUILessStore) else nil,
	GetInspectAndBuyStore = if FFlagTopBarSignalizeMenuOpen then require(script.GetInspectAndBuyStore) else nil,
	GetKeepOutAreasStore = if FFlagTopBarSignalizeKeepOutAreas then require(script.GetKeepOutAreasStore) else nil,
	GetLocalHumanoidStore = if FFlagTopBarSignalizeHealthBar then require(script.GetLocalHumanoidStore) else nil,
	GetUiSelectorSignalStore = if FFlagEnableUISelector then require(script.GetUiSelectorSignalStore) else nil
}