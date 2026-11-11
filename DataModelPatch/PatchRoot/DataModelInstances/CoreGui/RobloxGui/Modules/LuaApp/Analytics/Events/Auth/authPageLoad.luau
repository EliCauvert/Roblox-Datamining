local AuthPageloadFunction = require(game:GetService("CorePackages").Workspace.Packages.AuthAnalytics).Events.authPageload

return function(_, p1, p2, p3)
	-- upvalues: AuthPageloadFunction (copy)
	AuthPageloadFunction(p1, p2, p3)
end