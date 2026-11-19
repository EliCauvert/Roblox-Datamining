local IsPioneerLaunchFunction = require(script:FindFirstAncestor("InExperienceSideSheetUtils").Parent.PioneerUtils).isPioneerLaunch

return game:DefineFastFlag("EnableSideSheet9", false) or IsPioneerLaunchFunction()