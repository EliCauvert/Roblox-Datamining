local parent = script.Parent
local parent_1 = parent.Parent.Parent
local _ = require(parent_1.App.Style.StyleTypes)
local UIBloxConfigModule = require(parent_1.UIBloxConfig)
local iconSizeModule = require(parent.Enum.IconSize)
local t = {
	[iconSizeModule.Small] = 16,
	[iconSizeModule.Medium] = 36,
	[iconSizeModule.Large] = 48,
	[iconSizeModule.XLarge] = 96,
	[iconSizeModule.XXLarge] = 192
}

return function(p0, p1)
	-- upvalues: iconSizeModule (ref), UIBloxConfigModule (ref), t (ref)
	assert(iconSizeModule.isEnumValue(p0))
	
	return if p1 == nil or p1.Tokens == nil then t[p0] elseif p0 == iconSizeModule.Small then if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Size.Size_400 else p1.Tokens.Semantic.Icon.Size.Small elseif p0 == iconSizeModule.Medium then if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Size.Size_900 else p1.Tokens.Semantic.Icon.Size.Medium elseif p0 == iconSizeModule.Large then if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Size.Size_1200 else p1.Tokens.Semantic.Icon.Size.Large elseif p0 == iconSizeModule.XLarge then if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Size.Size_2400 else p1.Tokens.Semantic.Icon.Size.XLarge elseif p0 == iconSizeModule.XXLarge then if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then 192 else p1.Tokens.Semantic.Icon.Size.XxLarge else nil
end