local NullModule = require(script.Parent.null)

return {
	isNillish = function(NullModule1): boolean
		-- upvalues: NullModule (copy)
		return NullModule1 == nil or NullModule1 == NullModule
	end,
	isNotNillish = function(NullModule1): boolean
		-- upvalues: NullModule (copy)
		return NullModule1 ~= nil and NullModule1 ~= NullModule
	end
}