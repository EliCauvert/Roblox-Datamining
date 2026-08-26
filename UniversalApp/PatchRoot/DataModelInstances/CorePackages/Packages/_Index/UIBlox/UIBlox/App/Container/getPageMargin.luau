local tModule = require(script.Parent.Parent.Parent.Parent.t)

return function(p1)
	-- upvalues: tModule (ref)
	assert(tModule.number(p1))
	
	return if p1 < 360 then 12 elseif p1 < 600 then 24 else 48
end