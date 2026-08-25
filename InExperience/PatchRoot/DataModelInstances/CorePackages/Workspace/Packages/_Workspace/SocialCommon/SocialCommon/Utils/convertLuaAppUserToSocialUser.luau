local dashModule = require(script:FindFirstAncestor("SocialCommon").Parent.Dash)

return function(p0)
	-- upvalues: dashModule (ref)
	return dashModule.join(p0, { name = p0.username, gameInstanceId = p0.gameId })
end