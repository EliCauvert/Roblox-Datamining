local IsPioneerLaunchFunction = require(script:FindFirstAncestor("InExperienceSideSheetUtils").Parent.PioneerUtils).isPioneerLaunch

return game:DefineFastFlag("EnableSideSheet8", false) or IsPioneerLaunchFunction()