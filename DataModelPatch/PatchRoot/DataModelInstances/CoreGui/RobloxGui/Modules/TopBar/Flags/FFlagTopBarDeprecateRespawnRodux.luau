local CorePackages = game:GetService("CorePackages")
local FFlagEnableConsoleExpControls = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls
local EnabledFunction = require(CorePackages.Workspace.Packages.Chrome).Enabled

return game:DefineFastFlag("TopBarDeprecateRespawnRodux2", false) and (FFlagEnableConsoleExpControls and EnabledFunction())