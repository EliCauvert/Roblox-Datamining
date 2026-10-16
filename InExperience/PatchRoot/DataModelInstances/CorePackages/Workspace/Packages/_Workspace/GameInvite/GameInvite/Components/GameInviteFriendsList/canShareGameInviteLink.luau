local ServerTypeModule = require(script:FindFirstAncestor("GameInvite").Enums.ServerType)

return function(p1: number, p2, Enabled): boolean --[[ Line: 10 | Named "canShareGameInviteLink" ]]
	-- upvalues: ServerTypeModule (copy)
	return p1 > 0 and (p2.isCoreScript and (p2.serverType == ServerTypeModule.StandardServer and Enabled == true))
end