local parent = script.Parent
local iconSizeModule = require(parent.Enum.IconSize)
local getIconSizeModule = require(parent.getIconSize)

return function(p0)
	-- upvalues: iconSizeModule (ref), getIconSizeModule (ref)
	assert(iconSizeModule.isEnumValue(p0))
	local var2 = getIconSizeModule(p0)
	
	return UDim2.fromOffset(var2, var2)
end