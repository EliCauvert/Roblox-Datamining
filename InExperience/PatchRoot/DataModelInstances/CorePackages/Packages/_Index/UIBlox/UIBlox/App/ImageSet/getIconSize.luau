local parent = script.Parent
local _ = require(parent.Parent.Parent.App.Style.StyleTypes)
local iconSizeModule = require(parent.Enum.IconSize)
local t = {
	[iconSizeModule.Small] = 16,
	[iconSizeModule.Medium] = 36,
	[iconSizeModule.Large] = 48,
	[iconSizeModule.XLarge] = 96,
	[iconSizeModule.XXLarge] = 192
}

return function(p1, p2)
	-- upvalues: iconSizeModule (ref), t (ref)
	assert(iconSizeModule.isEnumValue(p1))
	
	return if p2 == nil or p2.Tokens == nil then t[p1] elseif p1 == iconSizeModule.Small then p2.Tokens.Size.Size_400 elseif p1 == iconSizeModule.Medium then p2.Tokens.Size.Size_900 elseif p1 == iconSizeModule.Large then p2.Tokens.Size.Size_1200 elseif p1 == iconSizeModule.XLarge then p2.Tokens.Size.Size_2400 elseif p1 == iconSizeModule.XXLarge then 192 else nil
end