local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local TranslatorModule = require(Parent.Translations.Translator)
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local UseStyleModule = require(Parent.Core.Style.useStyle)
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration

local function _(InputLabel, None) --[[ Line: 25 | Named "labelText" ]]
	-- upvalues: ReactModule (copy), TranslatorModule (copy)
	return if None == nil or None == ReactModule.None then InputLabel elseif None then InputLabel .. "*" else TranslatorModule:FormatByKey("CommonUI.Controls.Input.Optional", { inputLabel = InputLabel })
end

return function(Frame) --[[ Line: 35 | Named "InputLabel" ]]
	-- upvalues: UseStyleModule (copy), ReactModule (copy), TranslatorModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	local UseStyleModuleResult = UseStyleModule()
	local BodySmall = UseStyleModuleResult.Tokens.Typography.BodySmall
	local Default = UseStyleModuleResult.Tokens.Color.Content.Default
	local Text = Frame.text
	local Required = Frame.required
	
	return ReactModule.createElement("TextLabel", {
		TextWrapped = true,
		BackgroundTransparency = 1,
		Text = if Required == nil or Required == ReactModule.None then Text elseif Required then Text .. "*" else TranslatorModule:FormatByKey("CommonUI.Controls.Input.Optional", { inputLabel = Text }),
		TextTransparency = Default.Transparency,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top,
		TextColor3 = Default.Color3,
		Font = if FoundationFontFaceMigration then nil else BodySmall.Font,
		FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(BodySmall.Font) else nil,
		TextSize = BodySmall.FontSize,
		LineHeight = BodySmall.LineHeight,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = Frame.LayoutOrder
	})
end