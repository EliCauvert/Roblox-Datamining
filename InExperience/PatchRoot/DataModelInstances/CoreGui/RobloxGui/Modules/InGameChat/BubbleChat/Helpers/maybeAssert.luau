local globalConfigModule = require(script.Parent.Parent.GlobalConfig)

return function(...) --[[ line: 4 | named "maybeAssert" ]]
	-- upvalues: globalConfigModule (ref)
	if globalConfigModule.actionValidation then
		return assert(...)
	end
end