local AuthModalShownFunction = require(game:GetService("CorePackages").Workspace.Packages.AuthAnalytics).Events.authModalShown

return function(_, p1, p2)
	-- upvalues: AuthModalShownFunction (copy)
	AuthModalShownFunction(p1, p2)
end