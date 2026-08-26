local parent = script.Parent
local iconSizeModule = require(parent.Enum.IconSize)
local getIconSizeModule = require(parent.getIconSize)

return function(p1)
	-- upvalues: iconSizeModule (ref), getIconSizeModule (ref)
	assert(iconSizeModule.isEnumValue(p1))
	local var1 = getIconSizeModule(p1)
	
	return UDim2.fromOffset(var1, var1)
end