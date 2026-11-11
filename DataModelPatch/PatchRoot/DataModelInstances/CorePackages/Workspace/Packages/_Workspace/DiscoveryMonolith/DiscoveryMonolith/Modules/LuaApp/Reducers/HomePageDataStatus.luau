local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local RetrievalStatus = require(DiscoveryMonolith.Parent.Http).Enum.RetrievalStatus
local SetHomePageDataStatusModule = require(DiscoveryMonolith.Modules.LuaApp.Actions.SetHomePageDataStatus)

return function(p1, p2)
	-- upvalues: RetrievalStatus (copy), SetHomePageDataStatusModule (copy)
	local P0 = p1 or RetrievalStatus.NotStarted
	
	return if p2.type == SetHomePageDataStatusModule.name then p2.status else P0
end