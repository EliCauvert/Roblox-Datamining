local ArgCheckModule = require(script:FindFirstAncestor("DiscoveryAnalytics").Parent.ArgCheck)
local LuaAppJoinGameFailureInfluxHundredthsPercentage = game:DefineFastInt("LuaAppJoinGameFailureInfluxHundredthsPercentage", 0)

return function(p1, p2, p3)
	-- upvalues: ArgCheckModule (copy), LuaAppJoinGameFailureInfluxHundredthsPercentage (copy)
	local P2 = p3 or {}
	ArgCheckModule.isType(p2, "string", "documentName")
	p1:reportSeries(p2, P2, LuaAppJoinGameFailureInfluxHundredthsPercentage)
end