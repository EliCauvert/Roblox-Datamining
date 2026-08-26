local nextDataExpirationTimeRodux = script:FindFirstAncestor("NextDataExpirationTimeRodux")
local setNextDataExpirationTimeModule = require(nextDataExpirationTimeRodux.SetNextDataExpirationTime)
local expirationTimeNamespaceModule = require(nextDataExpirationTimeRodux.ExpirationTimeNamespace)
local _ = require(nextDataExpirationTimeRodux.Parent.DiscoveryTypes)

local function initializeExpirationTimes()
	-- upvalues: expirationTimeNamespaceModule (ref)
	local t = {}
	
	for i, v in expirationTimeNamespaceModule do
		t[v] = {}
	end
	return t
end

return {
	key = "NextDataExpirationTimeKey",
	reducer = function(p1, p2)
		-- upvalues: initializeExpirationTimes (ref), setNextDataExpirationTimeModule (ref)
		p1 = p1 or initializeExpirationTimes()
		
		if p2.type ~= setNextDataExpirationTimeModule.name then
			return p1
		end
		assert(p1, "state should always exist, assert for linter")
		local namespace = p2.namespace
		local key = p2.key
		assert(namespace, "SetNextDataExpirationTime does not have a valid namespace")
		assert(key, `SetNextDataExpirationTime does not have a valid key for namespace {namespace}`)
		local var1 = p1[namespace]
		
		if var1 then
			assert(var1, "namespaceState should always exist, assert for linter")
			local cloned = table.clone(var1)
			cloned[key] = p2.nextDataExpirationTime
			local cloned_1 = table.clone(p1)
			cloned_1[namespace] = cloned
			
			return cloned_1
		end
		warn(`No namespace {namespace} defined in NextDataExpirationTimeReducer for action`)
		
		return p1
	end
}