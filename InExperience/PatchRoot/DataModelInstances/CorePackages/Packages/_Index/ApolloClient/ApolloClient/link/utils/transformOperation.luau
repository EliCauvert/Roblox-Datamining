local Boolean = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).Boolean
local _ = require(script.Parent.Parent.core.types)
local GetOperationNameFunction = require(script.Parent.Parent.Parent.utilities).getOperationName

return {
	transformOperation = function(p1) --[[ Line: 20 ]]
		-- upvalues: Boolean (copy), GetOperationNameFunction (copy)
		local config = {
			variables = Boolean.toJSBoolean(p1.variables) and p1.variables or {},
			extensions = Boolean.toJSBoolean(p1.extensions) and p1.extensions or {},
			operationName = p1.operationName,
			query = p1.query
		}
		
		if not Boolean.toJSBoolean(config.operationName) then
			if typeof(config.query) ~= "string" then
				config.operationName = Boolean.toJSBoolean(GetOperationNameFunction(config.query)) and GetOperationNameFunction(config.query) or nil
				
				return config
			end
			config.operationName = ""
		end
		return config
	end
}