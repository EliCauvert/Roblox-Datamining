local interventionShared = script:FindFirstAncestor("InterventionShared")
local parent = interventionShared.Parent
local constantsModule = require(interventionShared.Utils.Constants)
local reactModule = require(parent.React)
local useLayerCollector = require(parent.UIBlox).Core.Layout.LayerCollector.useLayerCollector

return function(p0)
	-- upvalues: useLayerCollector (ref), reactModule (ref), constantsModule (ref)
	local absoluteSize = useLayerCollector().absoluteSize
	local var3, var4 = reactModule.useState(p0.initialInnerContentHeight or 0)
	local ceiled = math.ceil(math.min(absoluteSize.Y - constantsModule.UNIBAR_HEIGHT - (p0.scrollFrameHeaderFooterHeight or constantsModule.DIALOG_HEADER_HEIGHT), var3))
	
	return {
		onInnerContentSizeChanged = reactModule.useCallback(function(p1)
			-- upvalues: var4 (ref)
			var4(p1.AbsoluteSize.Y)
		end, {}),
		scrollFrameContainerHeight = ceiled,
		shouldShowScrollBar = ceiled < var3
	}
end