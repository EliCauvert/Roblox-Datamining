local parent = script.Parent.Parent.Parent
local reactModule = require(parent.Parent.React)
local useStyleModule = require(parent.Core.Style.useStyle)
local UIBloxConfigModule = require(parent.UIBloxConfig)

return function(p1)
	-- upvalues: useStyleModule (ref), UIBloxConfigModule (ref), reactModule (ref)
	local var1 = useStyleModule()
	local var2 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var1.Tokens.Typography.CaptionSmall else var1.Tokens.Component.HelperText.Base.Typography
	local var3 = if p1.error then if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var1.Tokens.Color.ActionAlert.Foreground else var1.Tokens.Component.HelperText.Error.ContentColor elseif UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var1.Tokens.Color.Content.Default else var1.Tokens.Component.HelperText.Base.ContentColor
	
	return reactModule.createElement("TextLabel", {
		TextWrapped = true,
		BackgroundTransparency = 1,
		Text = p1.text,
		TextTransparency = var3.Transparency,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top,
		TextColor3 = var3.Color3,
		Font = var2.Font,
		TextSize = var2.FontSize,
		LineHeight = var2.LineHeight,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.LayoutOrder
	})
end