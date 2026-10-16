local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local _ = require(SduiCoreSystem.Parent.Signals)
local BuildRepeatedPropModule = require(SduiCoreSystem.ClientBinding.PropBuilder.buildRepeatedProp)
local BuildTablePropModule = require(SduiCoreSystem.ClientBinding.PropBuilder.buildTableProp)
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local PropResultCategory = require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes).PropResultCategory

local function _(p1): boolean --[[ Line: 21 | Named "isArrayLike" ]]
	local CountP0 = #p1
	
	return CountP0 > 0 and next(p1, CountP0) == nil
end

return function(_, Array, p1, p2, p3, p4) --[[ Line: 26 | Named "buildContainerProp" ]]
	-- upvalues: PropResultCategory (copy), BuildRepeatedPropModule (copy), BuildTablePropModule (copy)
	if next(Array) == nil then
		return Array, PropResultCategory.Literal
	else
		local CountArray = #Array
		local NoNextEntry: boolean = CountArray > 0 and next(Array, CountArray) == nil
		
		return if NoNextEntry then BuildRepeatedPropModule("literal", { array = Array }, p1, p2, p3, p4) else BuildTablePropModule("literal", Array, p1, p2, p3, p4)
	end
end