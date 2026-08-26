local constantsModule = require(script.Parent.Parent.Common.Constants)

local function _(startValue, endValue, alpha, p1, p2)
	return (startValue - endValue) * (p2 - p1) / (alpha - endValue) + p1
end

return function(p1, p2, p3, p4)
	-- upvalues: constantsModule (ref)
	local minValue = math.min(p1.X, p1.Y)
	local maxValue = math.max(p1.X, p1.Y)
	local PANEL_BORDER = constantsModule.PANEL_BORDER
	local var1 = (minValue - 320) * 60 / 55 + 270
	local var2 = (maxValue - 480) * 46 / 190 + 434
	var1 = if constantsModule.PANEL_SIZE_MIN_CAP < var1 then p2 else math.clamp(var1, math.min(270, minValue - PANEL_BORDER), constantsModule.PANEL_SIZE_MIN_CAP)
	var2 = if constantsModule.PANEL_SIZE_MAX_CAP < var2 then p3 else math.clamp(var2, math.min(434, maxValue - PANEL_BORDER), constantsModule.PANEL_SIZE_MAX_CAP)
	local var3 = if p1.Y < p1.X then var2 else var1
	local var4 = if p1.X < p1.Y then var2 else var1
	
	if p4 ~= nil then
		var4 = math.min(var4, math.max(0, p1.Y - p4))
	end
	return Vector2.new(var3, var4)
end