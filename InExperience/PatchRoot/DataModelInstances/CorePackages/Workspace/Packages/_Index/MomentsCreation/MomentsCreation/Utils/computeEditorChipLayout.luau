local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local textService = game:GetService("TextService")
local constantsModule = require(momentsCreation.Constants)
local fitTextOverlayFontSizeModule = require(momentsCreation.Utils.fitTextOverlayFontSize)

return function(p1)
	-- upvalues: constantsModule (ref), fitTextOverlayFontSizeModule (ref), textService (ref)
	local minValue = math.min(p1.itemWidth / 2, p1.maxChipWidth - p1.chipPadding * 2)
	local minFontSize = constantsModule.TextOverlay.MinFontSize
	local var1 = fitTextOverlayFontSizeModule(p1.text, p1.font, constantsModule.TextOverlay.DefaultFontSize, minValue, math.max(minFontSize, p1.viewportHeight - p1.keyboardHeight - p1.keyboardGap - p1.topMargin - p1.chipPadding * 2), minFontSize)
	local y = textService:GetTextSize(p1.text, var1, p1.font, Vector2.new(minValue, p1.viewportHeight)).Y
	
	return {
		fontSize = var1,
		size = UDim2.fromOffset(minValue, y),
		position = UDim2.new(0.5, 0, 0, p1.viewportHeight - p1.keyboardHeight - p1.layerTopY - p1.keyboardGap - (y + p1.chipPadding * 2) / 2)
	}
end