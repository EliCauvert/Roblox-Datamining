local constantsModule = require(script.Parent.Parent.Common.Constants)

local function _(startValue, endValue, alpha, p0, p1) --[[ line: 14 | named "lerpRange" ]]
	return (startValue - endValue) * (p1 - p0) / (alpha - endValue) + p0
end

return function(p2, p3, p4) --[[ line: 20 | named "computeMobilePanelSize" ]]
	-- upvalues: constantsModule (ref)
	local minValue = math.min(p2.X, p2.Y)
	local maxValue = math.max(p2.X, p2.Y)
	local PANEL_BORDER = constantsModule.PANEL_BORDER
	local var3 = (minValue - 320) * 60 / 55 + 270
	local var4 = (maxValue - 480) * 46 / 190 + 434
	var3 = if constantsModule.PANEL_SIZE_MIN_CAP < var3 then p3 else math.clamp(var3, math.min(270, minValue - PANEL_BORDER), constantsModule.PANEL_SIZE_MIN_CAP)
	var4 = if constantsModule.PANEL_SIZE_MAX_CAP < var4 then p4 else math.clamp(var4, math.min(434, maxValue - PANEL_BORDER), constantsModule.PANEL_SIZE_MAX_CAP)
	
	return Vector2.new(if p2.Y < p2.X then var4 else var3, if p2.X < p2.Y then var4 else var3)
end