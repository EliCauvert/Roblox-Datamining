local formFactorModule = require(script.Parent.FormFactor)
local setFormFactorModule = require(script.Parent.SetFormFactor)

return function(p0, p1) --[[ line: 6 ]]
	-- upvalues: formFactorModule (ref), setFormFactorModule (ref)
	return if p1.type == setFormFactorModule.name then p1.formFactor else p0 or formFactorModule.UNKNOWN
end