local CorePackages = game:GetService("CorePackages")
local EnabledResult = require(CorePackages.Workspace.Packages.Chrome).Enabled()

return require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls and EnabledResult