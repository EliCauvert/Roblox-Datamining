local serverTypeModule = require(script:FindFirstAncestor("GameInvite").Enums.ServerType)

return function(p1, p2, p3)
	-- upvalues: serverTypeModule (ref)
	return p1 > 0 and (p2.isCoreScript and (p2.serverType == serverTypeModule.StandardServer and p3 == true))
end