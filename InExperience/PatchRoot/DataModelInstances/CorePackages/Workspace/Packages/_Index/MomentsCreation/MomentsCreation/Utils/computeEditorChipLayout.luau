local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local TextService = game:GetService("TextService")
local ConstantsModule = require(MomentsCreation.Constants)
local FitTextOverlayFontSizeModule = require(MomentsCreation.Utils.fitTextOverlayFontSize)

return function(p1) --[[ Line: 41 | Named "computeEditorChipLayout" ]]
	-- upvalues: ConstantsModule (copy), FitTextOverlayFontSizeModule (copy), TextService (copy)
	local Smallest = math.min(p1.itemWidth / 2, p1.maxChipWidth - p1.chipPadding * 2)
	local MinFontSize: number = ConstantsModule.TextOverlay.MinFontSize
	local FitTextOverlayFontSizeModuleResult = FitTextOverlayFontSizeModule(p1.text, p1.font, ConstantsModule.TextOverlay.DefaultFontSize, Smallest, math.max(MinFontSize, p1.viewportHeight - p1.keyboardHeight - p1.keyboardGap - p1.topMargin - p1.chipPadding * 2), MinFontSize)
	local Y = TextService:GetTextSize(p1.text, FitTextOverlayFontSizeModuleResult, p1.font, Vector2.new(Smallest, p1.viewportHeight)).Y
	
	return {
		fontSize = FitTextOverlayFontSizeModuleResult,
		size = UDim2.fromOffset(Smallest, Y),
		position = UDim2.new(0.5, 0, 0, p1.viewportHeight - p1.keyboardHeight - p1.layerTopY - p1.keyboardGap - (Y + p1.chipPadding * 2) / 2)
	}
end