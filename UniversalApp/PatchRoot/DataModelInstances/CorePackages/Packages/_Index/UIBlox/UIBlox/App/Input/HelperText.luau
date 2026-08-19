local parent = script.Parent.Parent.Parent
local reactModule = require(parent.Parent.React)
local useStyleModule = require(parent.Core.Style.useStyle)
local UIBloxConfigModule = require(parent.UIBloxConfig)

return function(p0) --[[ line: 19 | named "HelperText" ]]
	-- upvalues: useStyleModule (ref), UIBloxConfigModule (ref), reactModule (ref)
	local var3 = useStyleModule()
	local var4 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var3.Tokens.Typography.CaptionSmall else var3.Tokens.Component.HelperText.Base.Typography
	local var5 = if p0.error then if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var3.Tokens.Color.ActionAlert.Foreground else var3.Tokens.Component.HelperText.Error.ContentColor elseif UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var3.Tokens.Color.Content.Default else var3.Tokens.Component.HelperText.Base.ContentColor
	
	return reactModule.createElement("TextLabel", {
		TextWrapped = true,
		BackgroundTransparency = 1,
		Text = p0.text,
		TextTransparency = var5.Transparency,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top,
		TextColor3 = var5.Color3,
		Font = var4.Font,
		TextSize = var4.FontSize,
		LineHeight = var4.LineHeight,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p0.LayoutOrder
	})
end