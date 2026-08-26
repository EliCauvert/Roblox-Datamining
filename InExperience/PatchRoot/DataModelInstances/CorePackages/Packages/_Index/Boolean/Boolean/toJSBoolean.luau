local numberModule = require(script.Parent.Parent.Number)

return function(p1)
	-- upvalues: numberModule (ref)
	return not not p1 and (p1 ~= 0 and (p1 ~= "" and not numberModule.isNaN(p1)))
end