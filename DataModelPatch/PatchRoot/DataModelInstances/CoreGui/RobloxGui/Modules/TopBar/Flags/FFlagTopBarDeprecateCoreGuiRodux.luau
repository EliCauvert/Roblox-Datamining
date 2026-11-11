local CorePackages = game:GetService("CorePackages")
local FFlagEnableConsoleExpControls = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls
local EnabledFunction = require(CorePackages.Workspace.Packages.Chrome).Enabled
local FFlagTopBarSignalizeHealthBar = require(CorePackages.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeHealthBar

return game:DefineFastFlag("TopBarDeprecateCoreGuiRodux2", false) and (FFlagTopBarSignalizeHealthBar and (FFlagEnableConsoleExpControls and EnabledFunction()))