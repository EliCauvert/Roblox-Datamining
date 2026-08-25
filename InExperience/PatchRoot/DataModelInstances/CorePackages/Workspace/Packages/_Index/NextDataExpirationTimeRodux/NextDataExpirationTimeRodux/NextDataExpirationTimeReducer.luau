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
	reducer = function(p0, p1)
		-- upvalues: initializeExpirationTimes (ref), setNextDataExpirationTimeModule (ref)
		p0 = p0 or initializeExpirationTimes()
		
		if p1.type ~= setNextDataExpirationTimeModule.name then
			return p0
		end
		assert(p0, "state should always exist, assert for linter")
		local namespace = p1.namespace
		local key = p1.key
		assert(namespace, "SetNextDataExpirationTime does not have a valid namespace")
		assert(key, `SetNextDataExpirationTime does not have a valid key for namespace {namespace}`)
		local var6 = p0[namespace]
		
		if var6 then
			assert(var6, "namespaceState should always exist, assert for linter")
			local cloned = table.clone(var6)
			cloned[key] = p1.nextDataExpirationTime
			local cloned_1 = table.clone(p0)
			cloned_1[namespace] = cloned
			
			return cloned_1
		end
		warn(`No namespace {namespace} defined in NextDataExpirationTimeReducer for action`)
		
		return p0
	end
}