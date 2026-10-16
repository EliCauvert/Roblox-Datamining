local InterventionShared = script:FindFirstAncestor("InterventionShared")
local Parent = InterventionShared.Parent
local ConstantsModule = require(InterventionShared.Utils.Constants)
local ReactModule = require(Parent.React)
local UseLayerCollectorFunction = require(Parent.UIBlox).Core.Layout.LayerCollector.useLayerCollector

return function(p1) --[[ Line: 46 | Named "useScrollFrameHeightCalculation" ]]
	-- upvalues: UseLayerCollectorFunction (copy), ReactModule (copy), ConstantsModule (copy)
	local AbsoluteSize = UseLayerCollectorFunction().absoluteSize
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1.initialInnerContentHeight or 0)
	local Ceiled = math.ceil((math.min(AbsoluteSize.Y - ConstantsModule.UNIBAR_HEIGHT - (p1.scrollFrameHeaderFooterHeight or ConstantsModule.DIALOG_HEADER_HEIGHT), UseStateResult)))
	
	return {
		onInnerContentSizeChanged = ReactModule.useCallback(function(Frame) --[[ Line: 50 ]]
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(Frame.AbsoluteSize.Y)
		end, {}),
		scrollFrameContainerHeight = Ceiled,
		shouldShowScrollBar = Ceiled < UseStateResult
	}
end