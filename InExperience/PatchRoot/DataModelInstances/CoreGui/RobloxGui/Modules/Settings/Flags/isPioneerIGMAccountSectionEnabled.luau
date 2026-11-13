local FFlagEnablePioneerIGMAccountSectionModule = require(script.Parent.FFlagEnablePioneerIGMAccountSection)
local IsPioneerLaunch = require(game:GetService("CorePackages").Workspace.Packages.PioneerUtils).isPioneerLaunch

return function(p1)
	-- upvalues: FFlagEnablePioneerIGMAccountSectionModule (copy), IsPioneerLaunch (copy)
	return FFlagEnablePioneerIGMAccountSectionModule and (p1 or IsPioneerLaunch)()
end