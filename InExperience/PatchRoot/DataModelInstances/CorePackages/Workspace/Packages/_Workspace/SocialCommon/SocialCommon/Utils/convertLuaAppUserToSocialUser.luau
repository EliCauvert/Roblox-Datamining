local DashModule = require(script:FindFirstAncestor("SocialCommon").Parent.Dash)

return function(p1)
	-- upvalues: DashModule (copy)
	return DashModule.join(p1, { name = p1.username, gameInstanceId = p1.gameId })
end