local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local _ = require(sduiCoreSystem.Parent.Signals)
local buildRepeatedPropModule = require(sduiCoreSystem.ClientBinding.PropBuilder.buildRepeatedProp)
local buildTablePropModule = require(sduiCoreSystem.ClientBinding.PropBuilder.buildTableProp)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local propResultCategory = require(sduiCoreSystem.ClientBinding.SduiClientBindingTypes).PropResultCategory

local function _(p1)
	local p0Count = #p1
	
	return p0Count > 0 and next(p1, p0Count) == nil
end

return function(_, p1, p2, p3, p4, p5)
	-- upvalues: propResultCategory (ref), buildRepeatedPropModule (ref), buildTablePropModule (ref)
	if next(p1) == nil then
		return p1, propResultCategory.Literal
	end
	local p1Count = #p1
	
	return if p1Count > 0 and next(p1, p1Count) == nil then buildRepeatedPropModule("literal", { array = p1 }, p2, p3, p4, p5) else buildTablePropModule("literal", p1, p2, p3, p4, p5)
end