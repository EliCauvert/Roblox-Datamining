local IsPioneerLaunchFunction = require(game:GetService("CorePackages").Workspace.Packages.PioneerUtils).isPioneerLaunch

return game:DefineFastFlag("RemoveExitModal", false) or IsPioneerLaunchFunction()