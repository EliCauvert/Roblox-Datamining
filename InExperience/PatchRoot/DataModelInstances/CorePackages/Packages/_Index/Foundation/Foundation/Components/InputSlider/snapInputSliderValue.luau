local GetStepGridPositionModule = require(script.Parent.getStepGridPosition)

return function(Value: number, p1, p2)
	-- upvalues: GetStepGridPositionModule (copy)
	local ClampedValue = math.clamp(Value, p2.Min, p2.Max)
	
	if p1 == nil then
		return ClampedValue
	else
		local NewMin = p2.Min + math.round((GetStepGridPositionModule(ClampedValue, p1, p2))) * p1
		
		return if math.abs(p2.Max - ClampedValue) < math.abs(NewMin - ClampedValue) then p2.Max else math.clamp(NewMin, p2.Min, p2.Max)
	end
end