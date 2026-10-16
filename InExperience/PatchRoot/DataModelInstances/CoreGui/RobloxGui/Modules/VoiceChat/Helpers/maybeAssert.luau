local GlobalConfigModule = require(script.Parent.Parent.GlobalConfig)

return function(...) --[[ Line: 4 | Named "maybeAssert" ]]
	-- upvalues: GlobalConfigModule (copy)
	if not GlobalConfigModule.actionValidation then return end
	return assert(...)
end