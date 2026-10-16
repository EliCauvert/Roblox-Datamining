local NextDataExpirationTimeRodux = script:FindFirstAncestor("NextDataExpirationTimeRodux")
local SetNextDataExpirationTimeModule = require(NextDataExpirationTimeRodux.SetNextDataExpirationTime)
local ExpirationTimeNamespaceModule = require(NextDataExpirationTimeRodux.ExpirationTimeNamespace)
local _ = require(NextDataExpirationTimeRodux.Parent.DiscoveryTypes)

local function initializeExpirationTimes() --[[ Line: 8 ]]
	-- upvalues: ExpirationTimeNamespaceModule (copy)
	local t = {}
	
	for _, value in ExpirationTimeNamespaceModule do
		t[value] = {}
	end
	return t
end

return {
	key = "NextDataExpirationTimeKey",
	reducer = function(p1, p2) --[[ Line: 17 ]]
		-- upvalues: initializeExpirationTimes (copy), SetNextDataExpirationTimeModule (copy)
		local Tbl1 = p1 or initializeExpirationTimes()
		
		if p2.type ~= SetNextDataExpirationTimeModule.name then
			return Tbl1
		end
		assert(Tbl1, "state should always exist, assert for linter")
		local Namespace = p2.namespace
		local Key = p2.key
		assert(Namespace, "SetNextDataExpirationTime does not have a valid namespace")
		assert(Key, `SetNextDataExpirationTime does not have a valid key for namespace {Namespace}`)
		local Tbl = Tbl1[Namespace]
		
		if Tbl then
			assert(Tbl, "namespaceState should always exist, assert for linter")
			local Copy = table.clone(Tbl)
			Copy[Key] = p2.nextDataExpirationTime
			local Copy1 = table.clone(Tbl1)
			Copy1[Namespace] = Copy
			
			return Copy1
		else
			warn(`No namespace {Namespace} defined in NextDataExpirationTimeReducer for action`)
			
			return Tbl1
		end
	end
}