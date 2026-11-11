local NumberModule = require(script.Parent.Parent.Number)

return function(p1): boolean
	-- upvalues: NumberModule (copy)
	return not not p1 and (p1 ~= 0 and (p1 ~= "" and not NumberModule.isNaN(p1)))
end