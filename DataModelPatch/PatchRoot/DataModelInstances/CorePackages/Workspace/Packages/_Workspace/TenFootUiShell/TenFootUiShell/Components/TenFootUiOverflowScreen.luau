local TenFootUiShell = script:FindFirstAncestor("TenFootUiShell")
local Parent = TenFootUiShell.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.TenFootUiCommon)
local ConstantsModule = require(TenFootUiShell.ReactNavigationExtend.Views.Constants)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local GetVirtualResolutionScaleFunction = require(Parent.Responsive).getVirtualResolutionScale

local function getVariantStyles(p1, p2)
	-- upvalues: ConstantsModule (copy)
	local PAGECONTENTHEIGHTRATIO = ConstantsModule.PAGE_CONTENT_HEIGHT_RATIO
	local YDelta = ConstantsModule.TOP_BAR_CANVAS_SIZE.Y - p2.Size.Size_600
	
	return {
		showOverflowFade = p1.screenKind == "Default",
		paddingTop = if p1.screenKind == "Default" then YDelta else 0,
		pageHeightRatio = PAGECONTENTHEIGHTRATIO,
		overflowStop = p2.Size.Size_400 / ConstantsModule.CANVAS_SIZE.Y + PAGECONTENTHEIGHTRATIO
	}
end

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), getVariantStyles (copy), ReactModule (copy), GetVirtualResolutionScaleFunction (copy)
	local VariantStyles = getVariantStyles(p1, (UseDesignTokensFunction()))
	
	return ReactModule.createElement("CanvasGroup", {
		Name = "TenFootUiOverflowScreen",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1),
		GroupTransparency = p1.groupTransparency,
		ResolutionScale = GetVirtualResolutionScaleFunction()
	}, ReactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, VariantStyles.paddingTop) }), p1.children, if VariantStyles.showOverflowFade then ReactModule.createElement("UIGradient", {
		Rotation = 270,
		Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0),
			NumberSequenceKeypoint.new(VariantStyles.pageHeightRatio, 0),
			NumberSequenceKeypoint.new(VariantStyles.overflowStop, 1),
			NumberSequenceKeypoint.new(1, 1)
		})
	}) else nil)
end