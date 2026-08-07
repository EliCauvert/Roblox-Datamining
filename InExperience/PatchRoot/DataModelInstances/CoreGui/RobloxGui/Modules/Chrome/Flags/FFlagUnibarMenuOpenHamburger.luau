local sharedFlagsModule = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags)
local fFlagEnableConsoleExpControls = sharedFlagsModule.FFlagEnableConsoleExpControls

return fFlagEnableConsoleExpControls and (sharedFlagsModule.FFlagUnibarMenuOpenHamburgerGamepadIXP or game:DefineFastFlag("UnibarMenuOpenHamburger", false))