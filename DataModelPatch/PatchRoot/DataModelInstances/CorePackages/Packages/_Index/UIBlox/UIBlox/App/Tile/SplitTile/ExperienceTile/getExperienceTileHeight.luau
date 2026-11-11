local Parent = script.Parent
local _ = require(Parent.Parent.Parent.Parent.Style.StyleTypes)
local _ = require(Parent.Constants)
local _ = require(Parent.Enum.AspectRatioMode)
local GetExperienceTileRelativeHeightModule = require(Parent.getExperienceTileRelativeHeight)

return function(p1, p2, p3, p4, p5, p6): number
	-- upvalues: GetExperienceTileRelativeHeightModule (copy)
	local ExperienceTileRelativeHeightModule = GetExperienceTileRelativeHeightModule(p1, p3, p4, p5, p6)
	
	return (math.floor(p2 * ExperienceTileRelativeHeightModule.Scale + ExperienceTileRelativeHeightModule.Offset))
end