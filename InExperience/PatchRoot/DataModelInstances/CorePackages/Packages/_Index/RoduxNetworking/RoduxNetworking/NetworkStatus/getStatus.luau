local parent = script.Parent
local getDeepValueModule = require(parent.getDeepValue)
local enumNetworkStatusModule = require(parent.EnumNetworkStatus)

return function(p1)
	-- upvalues: getDeepValueModule (ref), enumNetworkStatusModule (ref)
	local keyPath = p1.keyPath
	
	return function(p2, p3)
		-- upvalues: getDeepValueModule (copy), keyPath (ref), enumNetworkStatusModule (copy)
		assert(typeof(p2) == "table")
		assert(typeof(p3) == "string")
		assert(#p3 > 0)
		local var1 = getDeepValueModule(p2, keyPath)
		assert(var1, string.format("Reducer not found for keyPath: %s. Did you forget to call `installReducer`?", keyPath))
		
		return var1[p3] or enumNetworkStatusModule.NotStarted
	end
end