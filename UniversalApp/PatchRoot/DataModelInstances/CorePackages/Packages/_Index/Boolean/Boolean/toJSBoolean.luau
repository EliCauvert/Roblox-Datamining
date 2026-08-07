local numberModule = require(script.Parent.Parent.Number)

return function(p0) --[[ line: 20 ]]
	-- upvalues: numberModule (ref)
	return not not p0 and (p0 ~= 0 and (p0 ~= "" and not numberModule.isNaN(p0)))
end