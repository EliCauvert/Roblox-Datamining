local parent = script.Parent.Parent.Parent
local translatorModule = require(parent.Translations.Translator)
local reactModule = require(parent.Parent.React)
local useStyleModule = require(parent.Core.Style.useStyle)
local UIBloxConfigModule = require(parent.UIBloxConfig)

local function _(p0, p1) --[[ line: 22 | named "labelText" ]]
	-- upvalues: reactModule (ref), translatorModule (ref)
	return if p1 == nil or p1 == reactModule.None then p0 elseif p1 then p0 .. "*" else translatorModule:FormatByKey("CommonUI.Controls.Input.Optional", { inputLabel = p0 })
end

return function(p2) --[[ line: 32 | named "InputLabel" ]]
	-- upvalues: useStyleModule (ref), UIBloxConfigModule (ref), reactModule (ref), translatorModule (ref)
	local var4 = useStyleModule()
	local var5 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var4.Tokens.Typography.BodySmall else var4.Tokens.Component.InputLabel.Base.Typography
	local var6 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var4.Tokens.Color.Content.Default else var4.Tokens.Component.InputLabel.Base.ContentColor
	local createElement = reactModule.createElement
	local var7 = "TextLabel"
	local t = { TextWrapped = true, BackgroundTransparency = 1 }
	local text = p2.text
	local required = p2.required
	t.Text = if required == nil or required == reactModule.None then text elseif required then text .. "*" else translatorModule:FormatByKey("CommonUI.Controls.Input.Optional", { inputLabel = text })
	t.TextTransparency = var6.Transparency
	t.TextXAlignment = Enum.TextXAlignment.Left
	t.TextYAlignment = Enum.TextYAlignment.Top
	t.TextColor3 = var6.Color3
	t.Font = var5.Font
	t.TextSize = var5.FontSize
	t.LineHeight = var5.LineHeight
	t.Size = UDim2.new(1, 0, 0, 0)
	t.AutomaticSize = Enum.AutomaticSize.Y
	t.LayoutOrder = p2.LayoutOrder
	
	return createElement(var7, t)
end