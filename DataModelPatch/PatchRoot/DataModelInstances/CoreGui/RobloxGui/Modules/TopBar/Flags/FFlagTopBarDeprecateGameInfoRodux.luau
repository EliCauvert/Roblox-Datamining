local FFlagEnableConsoleExpControls = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls
local IsNewInGameMenuEnabledModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.isNewInGameMenuEnabled)

return game:DefineFastFlag("TopBarDeprecateGameInfoRodux", false) and (FFlagEnableConsoleExpControls and not IsNewInGameMenuEnabledModule)