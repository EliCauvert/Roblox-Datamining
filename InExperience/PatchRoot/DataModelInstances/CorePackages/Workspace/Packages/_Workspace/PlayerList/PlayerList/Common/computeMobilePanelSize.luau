local ConstantsModule = require(script.Parent.Parent.Common.Constants)

local function _(p1, p2, p3, p4, p5) --[[ Line: 14 | Named "lerpRange" ]]
	return (p1 - p2) * (p5 - p4) / (p3 - p2) + p4
end

return function(Vector, p1, p2, p3): Vector2 --[[ Line: 22 | Named "computeMobilePanelSize" ]]
	-- upvalues: ConstantsModule (copy)
	local Smallest = math.min(Vector.X, Vector.Y)
	local Largest = math.max(Vector.X, Vector.Y)
	local PANELBORDER: number = ConstantsModule.PANEL_BORDER
	local Value = (Smallest - 320) * 60 / 55 + 270
	local Value1 = (Largest - 480) * 46 / 190 + 434
	local ClampedValue = if ConstantsModule.PANEL_SIZE_MIN_CAP < Value then p1 else math.clamp(Value, math.min(270, Smallest - PANELBORDER), ConstantsModule.PANEL_SIZE_MIN_CAP)
	local ClampedValue1 = if ConstantsModule.PANEL_SIZE_MAX_CAP < Value1 then p2 else math.clamp(Value1, math.min(434, Largest - PANELBORDER), ConstantsModule.PANEL_SIZE_MAX_CAP)
	local X = if Vector.Y < Vector.X then ClampedValue1 else ClampedValue
	local Y = if Vector.Y > Vector.X then ClampedValue1 else ClampedValue
	
	if p3 ~= nil then
		Y = math.min(Y, (math.max(0, Vector.Y - p3)))
	end
	return Vector2.new(X, Y)
end