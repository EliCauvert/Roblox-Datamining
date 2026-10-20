local Parent = script.Parent
local IconSizeModule = require(Parent.Enum.IconSize)
local GetIconSizeModule = require(Parent.getIconSize)

return function(p1): UDim2
	-- upvalues: IconSizeModule (copy), GetIconSizeModule (copy)
	assert(IconSizeModule.isEnumValue(p1))
	local IconSizeModule1 = GetIconSizeModule(p1)
	
	return UDim2.fromOffset(IconSizeModule1, IconSizeModule1)
end