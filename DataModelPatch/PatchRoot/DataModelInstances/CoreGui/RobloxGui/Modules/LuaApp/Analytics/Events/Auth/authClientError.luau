local AuthClientErrorFunction = require(game:GetService("CorePackages").Workspace.Packages.AuthAnalytics).Events.authClientError

return function(_, p1, p2, p3)
	-- upvalues: AuthClientErrorFunction (copy)
	AuthClientErrorFunction(p1, p2, p3)
end