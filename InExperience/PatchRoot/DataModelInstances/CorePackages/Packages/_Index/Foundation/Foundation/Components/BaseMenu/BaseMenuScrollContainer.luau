local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local flagsModule = require(foundation.Utility.Flags)
local scrollViewModule = require(foundation.Components.ScrollView)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)

local function computeAutomaticSize(p0) --[[ line: 39 ]]
	return if p0.autoSize then if p0.isOverMaxHeight then Enum.AutomaticSize.X else Enum.AutomaticSize.XY elseif p0.isOverMaxHeight then Enum.AutomaticSize.None else Enum.AutomaticSize.Y
end

local function computeSize(p1) --[[ line: 45 ]]
	local var8 = if p1.isOverMaxHeight and p1.maxHeight then UDim.new(0, p1.maxHeight) else UDim.new()
	
	return if p1.autoSize then UDim2.new(UDim.new(), var8) else UDim2.new(p1.width or UDim.new(), var8)
end

return function(p2) --[[ line: 63 | named "BaseMenuScrollContainer" ]]
	-- upvalues: reactModule (ref), computeAutomaticSize (ref), scrollViewModule (ref), withCommonPropsModule (ref), flagsModule (ref), computeSize (ref), viewModule (ref)
	local autoSize = p2.autoSize or reactModule.useBinding(true)
	local width = p2.width or reactModule.useBinding(nil)
	local maxHeight = p2.maxHeight
	local var11, var12 = reactModule.useBinding(UDim2.fromScale(0, 1))
	local var13 = reactModule.useMemo(function() --[[ line: 72 ]]
		-- upvalues: reactModule (copy), var11 (ref), maxHeight (ref)
		return reactModule.joinBindings({ canvasSize = var11, maxHeight = maxHeight }):map(function(p3) --[[ line: 74 ]]
			return p3.maxHeight ~= nil and p3.maxHeight < p3.canvasSize.Y.Offset
		end)
	end, { maxHeight })
	local var14 = reactModule.joinBindings({ autoSize = autoSize, isOverMaxHeight = var13 }):map(computeAutomaticSize)
	
	return reactModule.createElement(scrollViewModule, withCommonPropsModule(p2.scrollViewProps, {
		ref = p2.scrollViewProps.ref,
		sizeConstraint = p2.scrollViewProps.sizeConstraint,
		tag = p2.scrollViewProps.tag,
		InputSink = p2.scrollViewProps.InputSink,
		scrollingFrameRef = p2.scrollViewProps.scrollingFrameRef,
		scroll = {
			AutomaticCanvasSize = if flagsModule.FoundationBaseMenuAutoYCanvasSizing then Enum.AutomaticSize.Y else nil,
			AutomaticSize = var14,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			CanvasSize = var11
		},
		AutomaticSize = var14,
		Size = reactModule.joinBindings({
			autoSize = autoSize,
			width = width,
			isOverMaxHeight = var13,
			maxHeight = maxHeight
		}):map(computeSize)
	}), reactModule.createElement(viewModule, {
		tag = if flagsModule.FoundationBaseMenuAutoYCanvasSizing then "col size-full-0 auto-y" else "col size-full",
		onAbsoluteSizeChanged = reactModule.useCallback(function(p4) --[[ line: 79 ]]
			-- upvalues: var12 (ref)
			return var12(UDim2.fromOffset(p4.AbsoluteSize.X, p4.AbsoluteSize.Y))
		end, { var12 })
	}, p2.children))
end