local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local scrollViewModule = require(foundation.Components.ScrollView)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)

local function computeAutomaticSize(p1)
	return if p1.autoSize then if p1.isOverMaxHeight then Enum.AutomaticSize.X else Enum.AutomaticSize.XY elseif p1.isOverMaxHeight then Enum.AutomaticSize.None else Enum.AutomaticSize.Y
end

local function computeSize(p1)
	local var1 = if p1.isOverMaxHeight and p1.maxHeight then UDim.new(0, p1.maxHeight) else UDim.new()
	
	return if p1.autoSize then UDim2.new(UDim.new(), var1) else UDim2.new(p1.width or UDim.new(), var1)
end

return function(p1)
	-- upvalues: reactModule (ref), computeAutomaticSize (ref), scrollViewModule (ref), withCommonPropsModule (ref), computeSize (ref), viewModule (ref)
	local autoSize = p1.autoSize or reactModule.useBinding(true)
	local width = p1.width or reactModule.useBinding(nil)
	local maxHeight = p1.maxHeight
	local var1, var2 = reactModule.useBinding(UDim2.fromScale(0, 1))
	local var3 = reactModule.useMemo(function()
		-- upvalues: reactModule (copy), var1 (ref), maxHeight (ref)
		return reactModule.joinBindings({ canvasSize = var1, maxHeight = maxHeight }):map(function(p2)
			return p2.maxHeight ~= nil and p2.maxHeight < p2.canvasSize.Y.Offset
		end)
	end, { maxHeight })
	local var4 = reactModule.joinBindings({ autoSize = autoSize, isOverMaxHeight = var3 }):map(computeAutomaticSize)
	
	return reactModule.createElement(scrollViewModule, withCommonPropsModule(p1.scrollViewProps, {
		ref = p1.scrollViewProps.ref,
		sizeConstraint = p1.scrollViewProps.sizeConstraint,
		tag = p1.scrollViewProps.tag,
		InputSink = p1.scrollViewProps.InputSink,
		scrollingFrameRef = p1.scrollViewProps.scrollingFrameRef,
		scroll = {
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			AutomaticSize = var4,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			CanvasSize = var1
		},
		AutomaticSize = var4,
		Size = reactModule.joinBindings({
			autoSize = autoSize,
			width = width,
			isOverMaxHeight = var3,
			maxHeight = maxHeight
		}):map(computeSize)
	}), reactModule.createElement(viewModule, {
		tag = "col size-full-0 auto-y",
		onAbsoluteSizeChanged = reactModule.useCallback(function(p2)
			-- upvalues: var2 (ref)
			return var2(UDim2.fromOffset(p2.AbsoluteSize.X, p2.AbsoluteSize.Y))
		end, { var2 })
	}, p1.children))
end