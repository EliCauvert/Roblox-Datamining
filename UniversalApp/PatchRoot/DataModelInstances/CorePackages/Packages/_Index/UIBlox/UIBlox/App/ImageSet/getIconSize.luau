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

return function(p0, p1) --[[ line: 17 ]]
	-- upvalues: iconSizeModule (ref), t (ref)
	assert(iconSizeModule.isEnumValue(p0))
	
	return if p1 == nil or p1.Tokens == nil then t[p0] elseif p0 == iconSizeModule.Small then p1.Tokens.Semantic.Icon.Size.Small elseif p0 == iconSizeModule.Medium then p1.Tokens.Semantic.Icon.Size.Medium elseif p0 == iconSizeModule.Large then p1.Tokens.Semantic.Icon.Size.Large elseif p0 == iconSizeModule.XLarge then p1.Tokens.Semantic.Icon.Size.XLarge elseif p0 == iconSizeModule.XXLarge then p1.Tokens.Semantic.Icon.Size.XxLarge else nil
end