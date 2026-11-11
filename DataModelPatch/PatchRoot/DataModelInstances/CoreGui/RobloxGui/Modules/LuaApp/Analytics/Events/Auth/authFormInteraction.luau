local AuthFormInteractionFunction = require(game:GetService("CorePackages").Workspace.Packages.AuthAnalytics).Events.authFormInteraction

return function(_, p1, p2, p3, p4, p5)
	-- upvalues: AuthFormInteractionFunction (copy)
	AuthFormInteractionFunction(p1, p2, p3, p4, p5)
end