local globalConfigModule = require(script.Parent.Parent.GlobalConfig)

return function(...)
	-- upvalues: globalConfigModule (ref)
	if globalConfigModule.actionValidation then
		return assert(...)
	end
end