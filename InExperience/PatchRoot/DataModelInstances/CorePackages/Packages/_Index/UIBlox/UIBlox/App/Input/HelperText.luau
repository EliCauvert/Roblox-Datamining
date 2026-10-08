local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local normalizeFontFace = foundationModule.Utility.normalizeFontFace
local useStyleModule = require(parent.Core.Style.useStyle)
local foundationFontFaceMigration = foundationModule.Utility.Flags.FoundationFontFaceMigration

return function(p1)
	-- upvalues: useStyleModule (ref), reactModule (ref), foundationFontFaceMigration (ref), normalizeFontFace (ref)
	local var1 = useStyleModule()
	local captionSmall = var1.Tokens.Typography.CaptionSmall
	local var2 = if p1.error then var1.Tokens.Color.ActionAlert.Foreground else var1.Tokens.Color.Content.Default
	
	return reactModule.createElement("TextLabel", {
		TextWrapped = true,
		BackgroundTransparency = 1,
		Text = p1.text,
		TextTransparency = var2.Transparency,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top,
		TextColor3 = var2.Color3,
		Font = if foundationFontFaceMigration then nil else captionSmall.Font,
		FontFace = if foundationFontFaceMigration then normalizeFontFace(captionSmall.Font) else nil,
		TextSize = captionSmall.FontSize,
		LineHeight = captionSmall.LineHeight,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.LayoutOrder
	})
end