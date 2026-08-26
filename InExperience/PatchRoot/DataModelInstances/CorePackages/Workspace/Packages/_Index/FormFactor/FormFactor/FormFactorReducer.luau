local formFactorModule = require(script.Parent.FormFactor)
local setFormFactorModule = require(script.Parent.SetFormFactor)

return function(p1, p2)
	-- upvalues: formFactorModule (ref), setFormFactorModule (ref)
	return if p2.type == setFormFactorModule.name then p2.formFactor else p1 or formFactorModule.UNKNOWN
end