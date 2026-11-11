local GlobalConfigModule = require(script.Parent.Parent.GlobalConfig)

return function(...)
	-- upvalues: GlobalConfigModule (copy)
	if not GlobalConfigModule.actionValidation then return end
	return assert(...)
end