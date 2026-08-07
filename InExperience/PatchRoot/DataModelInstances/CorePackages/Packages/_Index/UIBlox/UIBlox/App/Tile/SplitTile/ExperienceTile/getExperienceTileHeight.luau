local parent = script.Parent
local _ = require(parent.Parent.Parent.Parent.Style.StyleTypes)
local _ = require(parent.Constants)
local _ = require(parent.Enum.AspectRatioMode)
local getExperienceTileRelativeHeightModule = require(parent.getExperienceTileRelativeHeight)

return function(p0, p1, p2, p3, p4, p5) --[[ line: 18 ]]
	-- upvalues: getExperienceTileRelativeHeightModule (ref)
	local var1 = getExperienceTileRelativeHeightModule(p0, p2, p3, p4, p5)
	
	return math.floor(p1 * var1.Scale + var1.Offset)
end