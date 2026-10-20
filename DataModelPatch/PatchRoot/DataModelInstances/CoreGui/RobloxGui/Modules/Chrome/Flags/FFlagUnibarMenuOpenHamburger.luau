local SharedFlagsModule = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags)
local FFlagUnibarMenuOpenHamburgerGamepadIXP = SharedFlagsModule.FFlagUnibarMenuOpenHamburgerGamepadIXP
local UnibarMenuOpenHamburger = game:DefineFastFlag("UnibarMenuOpenHamburger", false)

return SharedFlagsModule.FFlagEnableConsoleExpControls and (FFlagUnibarMenuOpenHamburgerGamepadIXP or UnibarMenuOpenHamburger)