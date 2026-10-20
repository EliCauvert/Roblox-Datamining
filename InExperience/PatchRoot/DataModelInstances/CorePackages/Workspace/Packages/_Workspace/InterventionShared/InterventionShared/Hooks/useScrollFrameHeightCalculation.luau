local InterventionShared = script:FindFirstAncestor("InterventionShared")
local Parent = InterventionShared.Parent
local ConstantsModule = require(InterventionShared.Utils.Constants)
local ReactModule = require(Parent.React)
local UseLayerCollectorFunction = require(Parent.UIBlox).Core.Layout.LayerCollector.useLayerCollector

return function(p1)
	-- upvalues: UseLayerCollectorFunction (copy), ReactModule (copy), ConstantsModule (copy)
	local UseLayerCollectorResult = UseLayerCollectorFunction()
	local ScreenSize = p1.screenSize or UseLayerCollectorResult.absoluteSize
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1.initialInnerContentHeight or 0)
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(Frame.AbsoluteSize.Y)
	end, {})
	local YDelta = ScreenSize.Y - ConstantsModule.UNIBAR_HEIGHT - (p1.scrollFrameHeaderFooterHeight or ConstantsModule.DIALOG_HEADER_HEIGHT)
	
	if p1.screenSize then
		YDelta = math.max(0, YDelta)
	end
	local Ceiled = math.ceil((math.min(YDelta, UseStateResult)))
	
	return {
		onInnerContentSizeChanged = UseResult,
		scrollFrameContainerHeight = Ceiled,
		shouldShowScrollBar = Ceiled < UseStateResult
	}
end