local parent = script:FindFirstAncestor("AuthCommon").Parent
local reactModule = require(parent.React)
local textService = game:GetService("TextService")
local getTextSize = require(parent.Style).GetTextSize
local foundationModule = require(parent.Foundation)
local normalizeFontFace = foundationModule.Utility.normalizeFontFace
local foundationFontFaceMigration = foundationModule.Utility.Flags.FoundationFontFaceMigration

return function(p1)
	-- upvalues: foundationFontFaceMigration (ref), getTextSize (ref), textService (ref), reactModule (ref), normalizeFontFace (ref)
	local var1 = if foundationFontFaceMigration then getTextSize(p1.text, p1.fontSize, p1.font, Vector2.new(1e999, p1.fontSize), { addTemporaryPadding = false }).X else textService:GetTextSize(p1.text, p1.fontSize, p1.font, Vector2.new(1e999, p1.fontSize)).X
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		Size = if p1.size then p1.size else UDim2.new(0, p1.width, 0, p1.height)
	}, reactModule.createElement("Frame", {
		Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.new(0.5, -var1 / 2 - p1.padding, 0, 1),
		BackgroundTransparency = p1.transparency,
		BackgroundColor3 = p1.color3
	}), reactModule.createElement("Frame", {
		Position = UDim2.new(0.5, var1 / 2 + p1.padding, 0.5, 0),
		Size = UDim2.new(0.5, -var1 / 2 - p1.padding, 0, 1),
		BackgroundTransparency = p1.transparency,
		BackgroundColor3 = p1.color3
	}), reactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Text = p1.text,
		TextSize = p1.fontSize,
		Font = if foundationFontFaceMigration then nil else p1.font,
		FontFace = if foundationFontFaceMigration then normalizeFontFace(p1.font) else nil,
		TextXAlignment = Enum.TextXAlignment.Center,
		TextYAlignment = Enum.TextYAlignment.Center,
		TextTransparency = p1.transparency,
		TextColor3 = p1.color3
	}))
end