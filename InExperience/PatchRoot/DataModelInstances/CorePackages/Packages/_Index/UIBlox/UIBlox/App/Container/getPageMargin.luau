local tModule = require(script.Parent.Parent.Parent.Parent.t)

return function(p0)
	-- upvalues: tModule (ref)
	assert(tModule.number(p0))
	
	return if p0 < 360 then 12 elseif p0 < 600 then 24 else 48
end