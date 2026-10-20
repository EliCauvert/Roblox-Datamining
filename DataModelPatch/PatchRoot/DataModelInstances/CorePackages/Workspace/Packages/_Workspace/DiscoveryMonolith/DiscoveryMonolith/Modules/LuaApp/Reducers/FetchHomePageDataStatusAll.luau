local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local RetrievalStatus = require(DiscoveryMonolith.Parent.Http).Enum.RetrievalStatus
local SetFetchHomePageDataStatusAllModule = require(DiscoveryMonolith.Modules.LuaApp.Actions.SetFetchHomePageDataStatusAll)

return function(p1, p2)
	-- upvalues: RetrievalStatus (copy), SetFetchHomePageDataStatusAllModule (copy)
	local P0 = p1 or RetrievalStatus.NotStarted
	
	return if p2.type == SetFetchHomePageDataStatusAllModule.name then p2.status else P0
end