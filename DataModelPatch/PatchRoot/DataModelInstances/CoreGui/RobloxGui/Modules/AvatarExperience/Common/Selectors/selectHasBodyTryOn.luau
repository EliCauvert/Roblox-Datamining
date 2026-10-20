local SelectTryOnBodyIdsModule = require(script.Parent.selectTryOnBodyIds)

return function(p1): boolean
	-- upvalues: SelectTryOnBodyIdsModule (copy)
	return #SelectTryOnBodyIdsModule(p1) > 0
end