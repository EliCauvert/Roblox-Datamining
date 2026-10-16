local Parent = script:FindFirstAncestor("InExperienceTopBar").Parent
local EnabledFunction = require(Parent.Chrome).Enabled
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEnableConsoleExpControls = SharedFlagsModule.FFlagEnableConsoleExpControls
local FFlagAddUILessMode = SharedFlagsModule.FFlagAddUILessMode
local FFlagFixBulkPurchaseTopBarObfuscation = SharedFlagsModule.FFlagFixBulkPurchaseTopBarObfuscation
local CoreGuiCommonModule = require(Parent.CoreGuiCommon)
local FFlagTopBarSignalizeKeepOutAreas = CoreGuiCommonModule.Flags.FFlagTopBarSignalizeKeepOutAreas
local FFlagTopBarSignalizeMenuOpen = CoreGuiCommonModule.Flags.FFlagTopBarSignalizeMenuOpen
local FFlagTopBarSignalizeScreenSize = CoreGuiCommonModule.Flags.FFlagTopBarSignalizeScreenSize

return {
	FFlagExperienceAgeRatingBadge = game:DefineFastFlag("ExperienceAgeRatingBadge2", false),
	FFlagTopBarSignalizeSetCores = game:DefineFastFlag("TopBarSignalizeSetCores", false),
	FFlagTopBarRefactor = game:DefineFastFlag("TopBarRefactor2", false) and (FFlagFixBulkPurchaseTopBarObfuscation and (EnabledFunction() and (FFlagTopBarSignalizeKeepOutAreas and (FFlagTopBarSignalizeMenuOpen and (FFlagTopBarSignalizeScreenSize and (FFlagEnableConsoleExpControls and not FFlagAddUILessMode))))))
}