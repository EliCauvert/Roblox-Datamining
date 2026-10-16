local Parent = script.Parent
local GetDeepValueModule = require(Parent.getDeepValue)
local EnumNetworkStatusModule = require(Parent.EnumNetworkStatus)

return function(p1) --[[ Line: 5 ]]
	-- upvalues: GetDeepValueModule (copy), EnumNetworkStatusModule (copy)
	local KeyPath = p1.keyPath
	
	return function(p2, p3) --[[ Line: 8 ]]
		-- upvalues: GetDeepValueModule (upval), KeyPath (copy), EnumNetworkStatusModule (upval)
		assert(typeof(p2) == "table")
		assert(typeof(p3) == "string")
		assert(#p3 > 0)
		local DeepValueModule = GetDeepValueModule(p2, KeyPath)
		assert(DeepValueModule, string.format("Reducer not found for keyPath: %s. Did you forget to call `installReducer`?", KeyPath))
		
		return DeepValueModule[p3] or EnumNetworkStatusModule.NotStarted
	end
end