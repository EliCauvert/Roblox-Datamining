local parent = script:FindFirstAncestor("InExperienceTopBar").Parent
local enabled = require(parent.Chrome).Enabled
local sharedFlagsModule = require(parent.SharedFlags)
local coreGuiCommonModule = require(parent.CoreGuiCommon)

return {
	FFlagTopBarSignalizeSetCores = game:DefineFastFlag("TopBarSignalizeSetCores", false),
	FFlagTopBarRefactor = game:DefineFastFlag("TopBarRefactor2", false) and (enabled() and (coreGuiCommonModule.Flags.FFlagTopBarSignalizeKeepOutAreas and (coreGuiCommonModule.Flags.FFlagTopBarSignalizeMenuOpen and (coreGuiCommonModule.Flags.FFlagTopBarSignalizeScreenSize and (sharedFlagsModule.FFlagEnableConsoleExpControls and not sharedFlagsModule.FFlagAddUILessMode)))))
}