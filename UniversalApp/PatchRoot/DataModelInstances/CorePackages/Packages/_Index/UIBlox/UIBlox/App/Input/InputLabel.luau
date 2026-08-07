local parent = script.Parent.Parent.Parent
local translatorModule = require(parent.Translations.Translator)
local reactModule = require(parent.Parent.React)
local useStyleModule = require(parent.Core.Style.useStyle)

local function _(p0, p1) --[[ line: 21 | named "labelText" ]]
	-- upvalues: reactModule (ref), translatorModule (ref)
	return if p1 == nil or p1 == reactModule.None then p0 elseif p1 then p0 .. "*" else translatorModule:FormatByKey("CommonUI.Controls.Input.Optional", { inputLabel = p0 })
end

return function(p2) --[[ line: 31 | named "InputLabel" ]]
	-- upvalues: useStyleModule (ref), reactModule (ref), translatorModule (ref)
	local inputLabel = useStyleModule().Tokens.Component.InputLabel
	local typography = inputLabel.Base.Typography
	local contentColor = inputLabel.Base.ContentColor
	local createElement = reactModule.createElement
	local var3 = "TextLabel"
	local t = { TextWrapped = true, BackgroundTransparency = 1 }
	local text = p2.text
	local required = p2.required
	t.Text = if required == nil or required == reactModule.None then text elseif required then text .. "*" else translatorModule:FormatByKey("CommonUI.Controls.Input.Optional", { inputLabel = text })
	t.TextTransparency = contentColor.Transparency
	t.TextXAlignment = Enum.TextXAlignment.Left
	t.TextYAlignment = Enum.TextYAlignment.Top
	t.TextColor3 = contentColor.Color3
	t.Font = typography.Font
	t.TextSize = typography.FontSize
	t.LineHeight = typography.LineHeight
	t.Size = UDim2.new(1, 0, 0, 0)
	t.AutomaticSize = Enum.AutomaticSize.Y
	t.LayoutOrder = p2.LayoutOrder
	
	return createElement(var3, t)
end