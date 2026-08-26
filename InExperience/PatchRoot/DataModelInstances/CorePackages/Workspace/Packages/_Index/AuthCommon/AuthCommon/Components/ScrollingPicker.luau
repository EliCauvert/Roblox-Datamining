local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local roactModule = require(parent.Roact)
local cryoModule = require(parent.Cryo)
local withStyle = require(parent.UIBlox).Style.withStyle
local scrollingPickerDirectionModule = require(authCommon.Enums.ScrollingPickerDirection)
local otterModule = require(parent.Otter)
local fitChildrenModule = require(authCommon.Components.FitChildren)
local t = {
	[scrollingPickerDirectionModule.Horizontal] = "X",
	[scrollingPickerDirectionModule.Vertical] = "Y"
}
local t_1 = {
	[scrollingPickerDirectionModule.Horizontal] = "Y",
	[scrollingPickerDirectionModule.Vertical] = "X"
}
local scrollingPickerSlowScrollStepWaitMs = game:DefineFastInt("ScrollingPickerSlowScrollStepWaitMs", 100)
local scrollingPickerMaximumPickerChangePerInput = game:DefineFastInt("ScrollingPickerMaximumPickerChangePerInput", 1)
local scrollingPickerSmallInputDecayFactor = game:DefineFastInt("ScrollingPickerSmallInputDecayFactor", 3)
local _ = { spring = "spring", instant = "instant" }
local scrollingPicker = roactModule.PureComponent:extend("ScrollingPicker")
scrollingPicker.MOUSE_WHEEL_STEP_THRESHOLD = 0.1
scrollingPicker.defaultProps = {
	layoutOrder = 0,
	parentSpecifiedTarget = 1,
	entrySizeOnScrollingAxis = 10,
	clipsDescendants = true,
	shouldExpandTapTarget = false,
	tapTargetExpansionSize = 0,
	minTargetIndex = 1,
	entries = {},
	scrollDirection = scrollingPickerDirectionModule.Vertical
}
local tbl = setmetatable({
	[Enum.UserInputType.MouseButton1] = true,
	[Enum.UserInputType.Touch] = true
}, {
	__index = function(_, _)
		return false
	end
})

function scrollingPicker.init(p1)
	-- upvalues: t (ref), t_1 (ref), roactModule (ref), otterModule (ref), tbl (ref), scrollingPickerMaximumPickerChangePerInput (ref), scrollingPicker (ref), scrollingPickerSmallInputDecayFactor (ref), scrollingPickerSlowScrollStepWaitMs (ref)
	local parentSpecifiedTarget = p1.props.parentSpecifiedTarget
	local scrollDirection = p1.props.scrollDirection
	local shouldExpandTapTarget = p1.props.shouldExpandTapTarget
	p1.state = {
		scrollDirection = scrollDirection,
		scrollingAxis = t[scrollDirection],
		subAxis = t_1[scrollDirection]
	}
	p1.isMounted = false
	p1.currentIndex = 1
	p1.targetEntryRef = roactModule.createRef()
	p1.targetIndex = parentSpecifiedTarget
	p1.isEntrySelected = false
	p1.isTargetIndexSetByUserInput = false
	p1.timeInputBegan = tick()
	p1.recognizedInputBegan = false
	p1.inputChanged = false
	p1.inputPositionAtInputBegan = 0
	p1.inputPreviousPositionScrollingAxis = 0
	p1.scrollRef = roactModule.createRef()
	p1.shouldExpandTapTarget = shouldExpandTapTarget
	p1.tapTargetExpansionSize = p1.props.tapTargetExpansionSize
	p1.scrollDeltaAccumulator = 0
	
	function p0.getCenterIndexByPosition(p2)
		-- upvalues: p1 (ref)
		return math.floor(-p2 / p1.props.entrySizeOnScrollingAxis) + 1
	end
	
	function p0.getCenterIndexByScrollPosition(p2)
		-- upvalues: p1 (ref)
		return p1.getCenterIndexByPosition(p2 - p1.props.entrySizeOnScrollingAxis / 2)
	end
	
	function p0.updateParent()
		-- upvalues: p1 (ref)
		local onCurrentIndexChanged = p1.props.onCurrentIndexChanged
		local onSelectedIndexChanged = p1.props.onSelectedIndexChanged
		
		if onCurrentIndexChanged then
			onCurrentIndexChanged(p1.currentIndex)
		end
		if onSelectedIndexChanged and p1.currentIndex == p1.targetIndex then
			onSelectedIndexChanged(p1.currentIndex, p1.isTargetIndexSetByUserInput)
		end
	end
	
	function p0.onScrollPositionChanged()
		-- upvalues: p1 (ref)
		if p1.scrollRef.current then
			local centerIndexByScrollPosition = p1.getCenterIndexByScrollPosition(p1.scrollRef.current.Position[p1.state.scrollingAxis].Offset)
			
			if centerIndexByScrollPosition ~= p1.currentIndex then
				p1.currentIndex = centerIndexByScrollPosition
				p1.updateParent()
			end
		end
	end
	
	function p0.updateTargetIndex(p2)
		-- upvalues: p1 (ref), otterModule (copy)
		local newTargetIndex = p2.newTargetIndex
		local isSetByUserInput = p2.isSetByUserInput
		local otterAnimationType = p2.otterAnimationType
		
		if otterAnimationType == nil then
			otterAnimationType = "spring"
		end
		local entries = p1.props.entries
		local entrySizeOnScrollingAxis = p1.props.entrySizeOnScrollingAxis
		p1.targetIndex = if #entries < 1 then 0 else math.clamp(newTargetIndex, math.max(1, p1.props.minTargetIndex or 1), #entries)
		p1.isTargetIndexSetByUserInput = isSetByUserInput
		p1.motor:setGoal(otterModule[otterAnimationType](-(entrySizeOnScrollingAxis * (p1.targetIndex - 1)), { frequency = 2 }))
		
		if p1.currentIndex == p1.targetIndex then
			p1.updateParent()
		end
	end
	
	function p0.updateIndexByInputPosition(p2)
		-- upvalues: p1 (ref)
		if p1.scrollRef.current then
			local scrollingAxis = p1.state.scrollingAxis
			local absolutePosition = p1.scrollRef.current.AbsolutePosition
			local absoluteSize = p1.scrollRef.current.AbsoluteSize
			local _ = 0
			p1.updateTargetIndex({
				isSetByUserInput = true,
				newTargetIndex = p1.getCenterIndexByPosition(if absolutePosition.X < p2.X and p2.X < absolutePosition.X + absoluteSize.X and (absolutePosition.Y < p2.Y and p2.Y < absolutePosition.Y + absoluteSize.Y) then absolutePosition[scrollingAxis] - p2[scrollingAxis] else -(p1.targetIndex - 1) * p1.props.entrySizeOnScrollingAxis)
			})
		end
	end
	
	function p0.updateIndexByScrollPositionAndOffset(p2)
		-- upvalues: p1 (ref)
		p2 = p2 or 0
		
		if p1.scrollRef.current then
			p1.updateTargetIndex({
				isSetByUserInput = true,
				newTargetIndex = p1.getCenterIndexByScrollPosition(p1.scrollRef.current.Position[p1.state.scrollingAxis].Offset + p2)
			})
		end
	end
	
	function p0.onInputBegan(_, p2)
		-- upvalues: p1 (ref), tbl (copy)
		local scrollingAxis = p1.state.scrollingAxis
		
		if p1.isMounted and tbl[p2.UserInputType] and (#p1.props.entries > 0 and p2.UserInputState == Enum.UserInputState.Begin) then
			p1.recognizedInputBegan = true
			p1.timeInputBegan = tick()
			p1.inputPositionAtInputBegan = p2.Position[scrollingAxis]
			p1.inputPreviousPositionScrollingAxis = p2.Position[scrollingAxis]
			p1.motor:stop()
		end
	end
	
	function scrollingPicker.restrictInputChangeDelta(_, p2)
		-- upvalues: scrollingPickerMaximumPickerChangePerInput (copy), scrollingPicker (copy), scrollingPickerSmallInputDecayFactor (copy)
		local minValue = math.min(math.abs(p2), scrollingPickerMaximumPickerChangePerInput * scrollingPicker.MOUSE_WHEEL_STEP_THRESHOLD)
		
		return if minValue < scrollingPicker.MOUSE_WHEEL_STEP_THRESHOLD then math.pow(minValue / scrollingPicker.MOUSE_WHEEL_STEP_THRESHOLD, scrollingPickerSmallInputDecayFactor) * scrollingPicker.MOUSE_WHEEL_STEP_THRESHOLD else minValue * (if p2 > 0 then 1 else -1)
	end
	
	function p0.onInputChanged(_, p2)
		-- upvalues: p1 (ref), scrollingPicker (copy), scrollingPickerSlowScrollStepWaitMs (copy), otterModule (copy)
		local entries = p1.props.entries
		local entrySizeOnScrollingAxis = p1.props.entrySizeOnScrollingAxis
		local scrollingAxis = p1.state.scrollingAxis
		
		if p2.UserInputType == Enum.UserInputType.MouseWheel then
			local z = p2.Position.Z
			local var1 = scrollingPicker:restrictInputChangeDelta(z)
			
			if z < 0 ~= (p1.scrollDeltaAccumulator < 0) then
				p1.scrollDeltaAccumulator = 0
			end
			p1.scrollDeltaAccumulator += var1
			local var2 = math.abs(p1.scrollDeltaAccumulator) <= 4 * scrollingPicker.MOUSE_WHEEL_STEP_THRESHOLD
			while scrollingPicker.MOUSE_WHEEL_STEP_THRESHOLD <= math.abs(p1.scrollDeltaAccumulator) do
				local var3 = if p1.scrollDeltaAccumulator > 0 then 1 else -1
				p1.updateTargetIndex({
					isSetByUserInput = true,
					OtterAnimationType = "spring",
					newTargetIndex = p1.targetIndex - var3
				})
				p1.scrollDeltaAccumulator -= scrollingPicker.MOUSE_WHEEL_STEP_THRESHOLD * var3
				
				if var2 then
					task.wait(scrollingPickerSlowScrollStepWaitMs)
				end
			end
			return
		elseif p1.recognizedInputBegan then
			local var4 = p2.Position[scrollingAxis] - p1.inputPreviousPositionScrollingAxis
			
			if p1.scrollRef.current then
				p1.motor:setGoal(otterModule.instant(math.max(math.min(-(entrySizeOnScrollingAxis * (math.max(1, p1.props.minTargetIndex or 1) - 1)), p1.scrollRef.current.Position[scrollingAxis].Offset + var4), -(entrySizeOnScrollingAxis * (#entries - 1)))))
			end
			p1.inputChanged = true
			p1.inputPreviousPositionScrollingAxis = p2.Position[scrollingAxis]
		end
	end
	
	function p0.onInputEnded(_, p3)
		-- upvalues: p1 (ref)
		local scrollingAxis = p1.state.scrollingAxis
		
		if p1.recognizedInputBegan then
			if p1.inputChanged and math.abs(p3.Position[scrollingAxis] - p1.inputPositionAtInputBegan) > 1.5 then
				local var5 = tick() - p1.timeInputBegan
				
				if var5 < 0.3 then
					p1.updateIndexByScrollPositionAndOffset(p3.Delta[scrollingAxis] / var5)
				else
					p1.updateIndexByScrollPositionAndOffset(0)
				end
			else
				p1.updateIndexByInputPosition(p3.Position)
			end
		end
		p1.recognizedInputBegan = false
		p1.inputChanged = false
	end
	
	function p0.onSelectionGained(p3)
		-- upvalues: p1 (ref)
		p1.isEntrySelected = true
		p1.updateTargetIndex({
			isSetByUserInput = true,
			otterAnimationType = "instant",
			newTargetIndex = p3
		})
	end
	
	function p0.onSelectionLost()
		-- upvalues: p1 (ref)
		p1.isEntrySelected = false
	end
end

function scrollingPicker.didMount(p2)
	-- upvalues: otterModule (ref), scrollingPickerDirectionModule (ref)
	p2.updateParent()
	p2.motor = otterModule.createSingleMotor(0)
	p2.motor:onStep(function(p3)
		-- upvalues: p2 (ref), scrollingPickerDirectionModule (copy)
		if p2.scrollRef.current then
			local scrollingAxis = p2.state.scrollingAxis
			local subAxis = p2.state.subAxis
			local position = p2.scrollRef.current.Position
			p2.scrollRef.current.Position = if p2.state.scrollDirection == scrollingPickerDirectionModule.Horizontal then UDim2.new(UDim.new(position[scrollingAxis].Scale, p3), position[subAxis]) else UDim2.new(position[subAxis], UDim.new(position[scrollingAxis].Scale, p3))
		end
	end)
	p2.motor:onComplete(function()
		-- upvalues: p2 (ref)
		if p2.props.onAnimationComplete then
			p2.props.onAnimationComplete()
		end
	end)
	p2.updateTargetIndex({
		isSetByUserInput = false,
		otterAnimationType = "instant",
		newTargetIndex = p2.targetIndex
	})
	p2.isMounted = true
end

function scrollingPicker.willUnmount(p2)
	p2.isMounted = false
	p2.motor:destroy()
end

function scrollingPicker.didUpdate(p2, p3)
	local parentSpecifiedTarget = p2.props.parentSpecifiedTarget
	
	if if p2.props.entrySizeOnScrollingAxis == p3.entrySizeOnScrollingAxis then parentSpecifiedTarget ~= p2.targetIndex and parentSpecifiedTarget ~= p3.parentSpecifiedTarget else true then
		p2.updateTargetIndex({
			isSetByUserInput = false,
			newTargetIndex = parentSpecifiedTarget or p2.targetIndex
		})
	end
end

function scrollingPicker.render(p2)
	-- upvalues: withStyle (ref), scrollingPickerDirectionModule (ref), fitChildrenModule (ref), roactModule (ref), cryoModule (ref)
	return withStyle(function(_)
		-- upvalues: p2 (ref), scrollingPickerDirectionModule (copy), fitChildrenModule (copy), roactModule (copy), cryoModule (copy)
		local width, horizontal, uDim2, uDim2_1, uDim2_2
		local layoutOrder = p2.props.layoutOrder
		local size = p2.props.size
		local entries = p2.props.entries
		local entrySizeOnScrollingAxis = p2.props.entrySizeOnScrollingAxis
		local clipsDescendants = p2.props.clipsDescendants
		local scrollDirection = p2.state.scrollDirection
		local getEntryWrapperProps = p2.props.getEntryWrapperProps
		local _ = nil
		local _ = nil
		local _ = nil
		local _ = nil
		local _ = nil
		
		if scrollDirection == scrollingPickerDirectionModule.Horizontal then
			width = fitChildrenModule.FitAxis.Width
			horizontal = Enum.FillDirection.Horizontal
			uDim2 = UDim2.new(0, entrySizeOnScrollingAxis, 1, 0)
			uDim2_1 = UDim2.new(0, 0, 1, 0)
			uDim2_2 = UDim2.new(0.5, -entrySizeOnScrollingAxis / 2, 0, 0)
		else
			width = fitChildrenModule.FitAxis.Height
			horizontal = Enum.FillDirection.Vertical
			uDim2 = UDim2.new(1, 0, 0, entrySizeOnScrollingAxis)
			uDim2_1 = UDim2.new(1, 0, 0, 0)
			uDim2_2 = UDim2.new(0, 0, 0.5, -entrySizeOnScrollingAxis / 2)
		end
		local _ = nil
		local t = {}
		
		for i, v in ipairs(entries) do
			local t_1 = {
				Interactable = i == p2.targetIndex and p2.isEntrySelected,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Text = "",
				Selectable = math.abs(p2.targetIndex - i) < 2,
				[roactModule.Ref] = if i == p2.targetIndex then p2.targetEntryRef else nil,
				[roactModule.Event.SelectionGained] = function()
					-- upvalues: p2 (copy), i (ref)
					p2.onSelectionGained(i)
				end,
				[roactModule.Event.SelectionLost] = p2.onSelectionLost,
				[roactModule.Event.Activated] = p2.props.onEntryActivated
			}
			
			if getEntryWrapperProps then
				t_1 = cryoModule.Dictionary.join(t_1, getEntryWrapperProps(v))
			end
			table.insert(t, roactModule.createElement("TextButton", cryoModule.Dictionary.join(t_1, { Size = uDim2, LayoutOrder = i }), { p2.props.renderEntry(v) }))
		end
		table.insert(t, roactModule.createElement("UIListLayout", {
			FillDirection = horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}))
		
		return roactModule.createElement("Frame", {
			LayoutOrder = layoutOrder,
			Size = if p2.shouldExpandTapTarget then size + UDim2.new(0, 0, 0, p2.tapTargetExpansionSize) else size,
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			ClipsDescendants = clipsDescendants,
			SelectionGroup = true,
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
			[roactModule.Event.InputBegan] = p2.onInputBegan,
			[roactModule.Event.InputChanged] = p2.onInputChanged,
			[roactModule.Event.InputEnded] = p2.onInputEnded
		}, {
			CenterPosition = if p2.shouldExpandTapTarget then roactModule.createElement("Frame", {
				ClipsDescendants = true,
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = size,
				AutomaticSize = Enum.AutomaticSize.X
			}, {
				CenterPosition = roactModule.createElement("Frame", {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					Size = uDim2_1,
					Position = uDim2_2
				}, {
					AnimatedSlidingList = roactModule.createElement(fitChildrenModule.FitFrame, {
						Size = uDim2_1,
						fitAxis = width,
						BorderSizePixel = 0,
						BackgroundTransparency = 1,
						[roactModule.Ref] = p2.scrollRef,
						[roactModule.Change.AbsolutePosition] = p2.onScrollPositionChanged
					}, t)
				})
			}) else roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = uDim2_1,
				Position = uDim2_2
			}, {
				AnimatedSlidingList = roactModule.createElement(fitChildrenModule.FitFrame, {
					Size = uDim2_1,
					fitAxis = width,
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					[roactModule.Ref] = p2.scrollRef,
					[roactModule.Change.AbsolutePosition] = p2.onScrollPositionChanged
				}, t)
			})
		})
	end)
end

return scrollingPicker