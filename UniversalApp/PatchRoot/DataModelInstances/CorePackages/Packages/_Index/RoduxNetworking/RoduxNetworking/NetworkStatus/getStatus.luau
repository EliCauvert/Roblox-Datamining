local parent = script.Parent
local getDeepValueModule = require(parent.getDeepValue)
local enumNetworkStatusModule = require(parent.EnumNetworkStatus)

return function(p0) --[[ line: 5 ]]
	-- upvalues: getDeepValueModule (ref), enumNetworkStatusModule (ref)
	local keyPath = p0.keyPath
	
	return function(p1, p2) --[[ line: 8 ]]
		-- upvalues: getDeepValueModule (copy), keyPath (ref), enumNetworkStatusModule (copy)
		assert(typeof(p1) == "table")
		assert(typeof(p2) == "string")
		assert(#p2 > 0)
		local var2 = getDeepValueModule(p1, keyPath)
		assert(var2, string.format("Reducer not found for keyPath: %s. Did you forget to call `installReducer`?", keyPath))
		
		return var2[p2] or enumNetworkStatusModule.NotStarted
	end
end