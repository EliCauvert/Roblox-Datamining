local argCheckModule = require(script:FindFirstAncestor("DiscoveryAnalytics").Parent.ArgCheck)
local luaAppJoinGameFailureInfluxHundredthsPercentage = game:DefineFastInt("LuaAppJoinGameFailureInfluxHundredthsPercentage", 0)

return function(p1, p2, p3)
	-- upvalues: argCheckModule (ref), luaAppJoinGameFailureInfluxHundredthsPercentage (ref)
	p3 = p3 or {}
	argCheckModule.isType(p2, "string", "documentName")
	p1:reportSeries(p2, p3, luaAppJoinGameFailureInfluxHundredthsPercentage)
end