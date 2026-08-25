local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local scrollViewModule = require(foundation.Components.ScrollView)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)

local function computeAutomaticSize(p0)
	return if p0.autoSize then if p0.isOverMaxHeight then Enum.AutomaticSize.X else Enum.AutomaticSize.XY elseif p0.isOverMaxHeight then Enum.AutomaticSize.None else Enum.AutomaticSize.Y
end

local function computeSize(p1)
	local var7 = if p1.isOverMaxHeight and p1.maxHeight then UDim.new(0, p1.maxHeight) else UDim.new()
	
	return if p1.autoSize then UDim2.new(UDim.new(), var7) else UDim2.new(p1.width or UDim.new(), var7)
end

return function(p2)
	-- upvalues: reactModule (ref), computeAutomaticSize (ref), scrollViewModule (ref), withCommonPropsModule (ref), computeSize (ref), viewModule (ref)
	local autoSize = p2.autoSize or reactModule.useBinding(true)
	local width = p2.width or reactModule.useBinding(nil)
	local maxHeight = p2.maxHeight
	local var10, var11 = reactModule.useBinding(UDim2.fromScale(0, 1))
	local var12 = reactModule.useMemo(function()
		-- upvalues: reactModule (copy), var10 (ref), maxHeight (ref)
		return reactModule.joinBindings({ canvasSize = var10, maxHeight = maxHeight }):map(function(p3)
			return p3.maxHeight ~= nil and p3.maxHeight < p3.canvasSize.Y.Offset
		end)
	end, { maxHeight })
	local var13 = reactModule.joinBindings({ autoSize = autoSize, isOverMaxHeight = var12 }):map(computeAutomaticSize)
	
	return reactModule.createElement(scrollViewModule, withCommonPropsModule(p2.scrollViewProps, {
		ref = p2.scrollViewProps.ref,
		sizeConstraint = p2.scrollViewProps.sizeConstraint,
		tag = p2.scrollViewProps.tag,
		InputSink = p2.scrollViewProps.InputSink,
		scrollingFrameRef = p2.scrollViewProps.scrollingFrameRef,
		scroll = {
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			AutomaticSize = var13,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			CanvasSize = var10
		},
		AutomaticSize = var13,
		Size = reactModule.joinBindings({
			autoSize = autoSize,
			width = width,
			isOverMaxHeight = var12,
			maxHeight = maxHeight
		}):map(computeSize)
	}), reactModule.createElement(viewModule, {
		tag = "col size-full-0 auto-y",
		onAbsoluteSizeChanged = reactModule.useCallback(function(p4)
			-- upvalues: var11 (ref)
			return var11(UDim2.fromOffset(p4.AbsoluteSize.X, p4.AbsoluteSize.Y))
		end, { var11 })
	}, p2.children))
end