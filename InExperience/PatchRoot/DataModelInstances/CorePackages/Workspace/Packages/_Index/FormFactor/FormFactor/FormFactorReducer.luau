local FormFactorModule = require(script.Parent.FormFactor)
local SetFormFactorModule = require(script.Parent.SetFormFactor)

return function(p1, p2) --[[ Line: 6 ]]
	-- upvalues: FormFactorModule (copy), SetFormFactorModule (copy)
	local P0 = p1 or FormFactorModule.UNKNOWN
	
	return if p2.type == SetFormFactorModule.name then p2.formFactor else P0
end