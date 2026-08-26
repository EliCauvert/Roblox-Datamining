local interventionShared = script:FindFirstAncestor("InterventionShared")
local parent = interventionShared.Parent
local constantsModule = require(interventionShared.Utils.Constants)
local reactModule = require(parent.React)
local useLayerCollector = require(parent.UIBlox).Core.Layout.LayerCollector.useLayerCollector

return function(p1)
	-- upvalues: useLayerCollector (ref), reactModule (ref), constantsModule (ref)
	local absoluteSize = useLayerCollector().absoluteSize
	local var1, var2 = reactModule.useState(p1.initialInnerContentHeight or 0)
	local ceiled = math.ceil(math.min(absoluteSize.Y - constantsModule.UNIBAR_HEIGHT - (p1.scrollFrameHeaderFooterHeight or constantsModule.DIALOG_HEADER_HEIGHT), var1))
	
	return {
		onInnerContentSizeChanged = reactModule.useCallback(function(p2)
			-- upvalues: var2 (ref)
			var2(p2.AbsoluteSize.Y)
		end, {}),
		scrollFrameContainerHeight = ceiled,
		shouldShowScrollBar = ceiled < var1
	}
end