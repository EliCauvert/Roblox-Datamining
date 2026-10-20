local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local TextService = game:GetService("TextService")
local ConstantsModule = require(MomentsCreation.Constants)
local FitTextOverlayFontSizeModule = require(MomentsCreation.Utils.fitTextOverlayFontSize)

return function(p1)
	-- upvalues: ConstantsModule (copy), FitTextOverlayFontSizeModule (copy), TextService (copy)
	local Smallest = math.min(p1.itemWidth / 2, p1.maxChipWidth - p1.chipPadding * 2)
	local MinFontSize: number = ConstantsModule.TextOverlay.MinFontSize
	local FitTextOverlayFontSizeModuleResult: number = FitTextOverlayFontSizeModule(p1.text, p1.font, ConstantsModule.TextOverlay.DefaultFontSize, Smallest, math.max(MinFontSize, p1.viewportHeight - p1.keyboardHeight - p1.keyboardGap - p1.topMargin - p1.chipPadding * 2), MinFontSize)
	local TextSize = TextService:GetTextSize(p1.text, FitTextOverlayFontSizeModuleResult, p1.font, Vector2.new(Smallest, p1.viewportHeight))
	local Y = TextSize.Y
	
	return {
		fontSize = FitTextOverlayFontSizeModuleResult,
		size = UDim2.fromOffset(if p1.growWidthWithText and TextService:GetTextSize(p1.text, FitTextOverlayFontSizeModuleResult, p1.font, Vector2.new(Smallest, 1000000)).Y <= TextService:GetTextSize(p1.text, FitTextOverlayFontSizeModuleResult, p1.font, Vector2.new(1000000, 1000000)).Y then math.clamp(math.ceil(TextSize.X) + (math.ceil(TextService:GetTextSize(" ", FitTextOverlayFontSizeModuleResult, p1.font, Vector2.new(1000000, 1000000)).X) + math.ceil(FitTextOverlayFontSizeModuleResult * (p1.overhangFraction or 0))), math.min(FitTextOverlayFontSizeModuleResult, Smallest), Smallest) else Smallest, Y),
		position = UDim2.new(0.5, 0, 0, p1.viewportHeight - p1.keyboardHeight - p1.layerTopY - p1.keyboardGap - (Y + p1.chipPadding * 2) / 2)
	}
end