local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local UseStyleModule = require(Parent.Core.Style.useStyle)
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration

return function(Frame)
	-- upvalues: UseStyleModule (copy), ReactModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	local UseStyleModuleResult = UseStyleModule()
	local CaptionSmall = UseStyleModuleResult.Tokens.Typography.CaptionSmall
	local Foreground = if Frame.error then UseStyleModuleResult.Tokens.Color.ActionAlert.Foreground else UseStyleModuleResult.Tokens.Color.Content.Default
	
	return ReactModule.createElement("TextLabel", {
		TextWrapped = true,
		BackgroundTransparency = 1,
		Text = Frame.text,
		TextTransparency = Foreground.Transparency,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top,
		TextColor3 = Foreground.Color3,
		Font = if FoundationFontFaceMigration then nil else CaptionSmall.Font,
		FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(CaptionSmall.Font) else nil,
		TextSize = CaptionSmall.FontSize,
		LineHeight = CaptionSmall.LineHeight,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = Frame.LayoutOrder
	})
end