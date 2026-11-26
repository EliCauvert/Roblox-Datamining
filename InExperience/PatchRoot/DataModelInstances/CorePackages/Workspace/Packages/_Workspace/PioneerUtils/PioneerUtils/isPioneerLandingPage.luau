local FFlagEnablePioneerLandingPageLayout = require(script:FindFirstAncestor("PioneerUtils").Parent.SharedFlags).FFlagEnablePioneerLandingPageLayout
local IsPioneerLaunchModule = require(script.Parent.isPioneerLaunch)

return function()
	-- upvalues: FFlagEnablePioneerLandingPageLayout (copy), IsPioneerLaunchModule (copy)
	return FFlagEnablePioneerLandingPageLayout and IsPioneerLaunchModule()
end