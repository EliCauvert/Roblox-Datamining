local Parent = script.Parent
local _ = require(Parent.Parent.Parent.App.Style.StyleTypes)
local IconSizeModule = require(Parent.Enum.IconSize)
local config = {
	[IconSizeModule.Small] = 16,
	[IconSizeModule.Medium] = 36,
	[IconSizeModule.Large] = 48,
	[IconSizeModule.XLarge] = 96,
	[IconSizeModule.XXLarge] = 192
}

return function(Large, p1) --[[ Line: 17 ]]
	-- upvalues: IconSizeModule (copy), config (copy)
	assert(IconSizeModule.isEnumValue(Large))
	
	return if p1 == nil or p1.Tokens == nil then config[Large] elseif Large == IconSizeModule.Small then p1.Tokens.Size.Size_400 elseif Large == IconSizeModule.Medium then p1.Tokens.Size.Size_900 elseif Large == IconSizeModule.Large then p1.Tokens.Size.Size_1200 elseif Large == IconSizeModule.XLarge then p1.Tokens.Size.Size_2400 elseif Large == IconSizeModule.XXLarge then 192 else nil
end