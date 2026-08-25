local argCheckModule = require(script:FindFirstAncestor("DiscoveryAnalytics").Parent.ArgCheck)
local luaAppJoinGameFailureInfluxHundredthsPercentage = game:DefineFastInt("LuaAppJoinGameFailureInfluxHundredthsPercentage", 0)

return function(p0, p1, p2)
	-- upvalues: argCheckModule (ref), luaAppJoinGameFailureInfluxHundredthsPercentage (ref)
	p2 = p2 or {}
	argCheckModule.isType(p1, "string", "documentName")
	p0:reportSeries(p1, p2, luaAppJoinGameFailureInfluxHundredthsPercentage)
end