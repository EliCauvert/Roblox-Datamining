local parent = script.Parent.Parent.Parent
local translatorModule = require(parent.Translations.Translator)
local reactModule = require(parent.Parent.React)
local useStyleModule = require(parent.Core.Style.useStyle)
local UIBloxConfigModule = require(parent.UIBloxConfig)

local function _(p1, p2)
	-- upvalues: reactModule (ref), translatorModule (ref)
	return if p2 == nil or p2 == reactModule.None then p1 elseif p2 then p1 .. "*" else translatorModule:FormatByKey("CommonUI.Controls.Input.Optional", { inputLabel = p1 })
end

return function(p1)
	-- upvalues: useStyleModule (ref), UIBloxConfigModule (ref), reactModule (ref), translatorModule (ref)
	local var1 = useStyleModule()
	local var2 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var1.Tokens.Typography.BodySmall else var1.Tokens.Component.InputLabel.Base.Typography
	local var3 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var1.Tokens.Color.Content.Default else var1.Tokens.Component.InputLabel.Base.ContentColor
	local createElement = reactModule.createElement
	local var4 = "TextLabel"
	local t = { TextWrapped = true, BackgroundTransparency = 1 }
	local text = p1.text
	local required = p1.required
	t.Text = if required == nil or required == reactModule.None then text elseif required then text .. "*" else translatorModule:FormatByKey("CommonUI.Controls.Input.Optional", { inputLabel = text })
	t.TextTransparency = var3.Transparency
	t.TextXAlignment = Enum.TextXAlignment.Left
	t.TextYAlignment = Enum.TextYAlignment.Top
	t.TextColor3 = var3.Color3
	t.Font = var2.Font
	t.TextSize = var2.FontSize
	t.LineHeight = var2.LineHeight
	t.Size = UDim2.new(1, 0, 0, 0)
	t.AutomaticSize = Enum.AutomaticSize.Y
	t.LayoutOrder = p1.LayoutOrder
	
	return createElement(var4, t)
end