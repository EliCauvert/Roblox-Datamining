local AuthButtonClickFunction = require(game:GetService("CorePackages").Workspace.Packages.AuthAnalytics).Events.authButtonClick

return function(_, p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: AuthButtonClickFunction (copy)
	AuthButtonClickFunction(p1, p2, p3, p4, p5, p6, p7)
end