local dashModule = require(script:FindFirstAncestor("SocialCommon").Parent.Dash)

return function(p1)
	-- upvalues: dashModule (ref)
	return dashModule.join(p1, { name = p1.username, gameInstanceId = p1.gameId })
end