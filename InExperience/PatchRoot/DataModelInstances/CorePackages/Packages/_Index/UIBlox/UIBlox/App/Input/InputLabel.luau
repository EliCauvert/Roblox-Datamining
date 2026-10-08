local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local translatorModule = require(parent.Translations.Translator)
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local normalizeFontFace = foundationModule.Utility.normalizeFontFace
local useStyleModule = require(parent.Core.Style.useStyle)
local foundationFontFaceMigration = foundationModule.Utility.Flags.FoundationFontFaceMigration

local function _(p1, p2)
	-- upvalues: reactModule (ref), translatorModule (ref)
	return if p2 == nil or p2 == reactModule.None then p1 elseif p2 then p1 .. "*" else translatorModule:FormatByKey("CommonUI.Controls.Input.Optional", { inputLabel = p1 })
end

return function(p1)
	-- upvalues: useStyleModule (ref), reactModule (ref), translatorModule (ref), foundationFontFaceMigration (ref), normalizeFontFace (ref)
	local var1 = useStyleModule()
	local bodySmall = var1.Tokens.Typography.BodySmall
	local default = var1.Tokens.Color.Content.Default
	local createElement = reactModule.createElement
	local var2 = "TextLabel"
	local t = { TextWrapped = true, BackgroundTransparency = 1 }
	local text = p1.text
	local required = p1.required
	t.Text = if required == nil or required == reactModule.None then text elseif required then text .. "*" else translatorModule:FormatByKey("CommonUI.Controls.Input.Optional", { inputLabel = text })
	t.TextTransparency = default.Transparency
	t.TextXAlignment = Enum.TextXAlignment.Left
	t.TextYAlignment = Enum.TextYAlignment.Top
	t.TextColor3 = default.Color3
	t.Font = if foundationFontFaceMigration then nil else bodySmall.Font
	t.FontFace = if foundationFontFaceMigration then normalizeFontFace(bodySmall.Font) else nil
	t.TextSize = bodySmall.FontSize
	t.LineHeight = bodySmall.LineHeight
	t.Size = UDim2.new(1, 0, 0, 0)
	t.AutomaticSize = Enum.AutomaticSize.Y
	t.LayoutOrder = p1.LayoutOrder
	
	return createElement(var2, t)
end