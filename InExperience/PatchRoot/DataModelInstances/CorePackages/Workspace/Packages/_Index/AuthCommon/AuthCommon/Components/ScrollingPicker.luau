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

function scrollingPicker.init(p0)
	-- upvalues: t (ref), t_1 (ref), roactModule (ref), otterModule (ref), tbl (ref), scrollingPickerMaximumPickerChangePerInput (ref), scrollingPicker (ref), scrollingPickerSmallInputDecayFactor (ref), scrollingPickerSlowScrollStepWaitMs (ref)
	local parentSpecifiedTarget = p0.props.parentSpecifiedTarget
	local scrollDirection = p0.props.scrollDirection
	local shouldExpandTapTarget = p0.props.shouldExpandTapTarget
	p0.state = {
		scrollDirection = scrollDirection,
		scrollingAxis = t[scrollDirection],
		subAxis = t_1[scrollDirection]
	}
	p0.isMounted = false
	p0.currentIndex = 1
	p0.targetEntryRef = roactModule.createRef()
	p0.targetIndex = parentSpecifiedTarget
	p0.isEntrySelected = false
	p0.isTargetIndexSetByUserInput = false
	p0.timeInputBegan = tick()
	p0.recognizedInputBegan = false
	p0.inputChanged = false
	p0.inputPositionAtInputBegan = 0
	p0.inputPreviousPositionScrollingAxis = 0
	p0.scrollRef = roactModule.createRef()
	p0.shouldExpandTapTarget = shouldExpandTapTarget
	p0.tapTargetExpansionSize = p0.props.tapTargetExpansionSize
	p0.scrollDeltaAccumulator = 0
	
	function p0.getCenterIndexByPosition(p1)
		-- upvalues: p0 (ref)
		return math.floor(-p1 / p0.props.entrySizeOnScrollingAxis) + 1
	end
	
	function p0.getCenterIndexByScrollPosition(p2)
		-- upvalues: p0 (ref)
		return p0.getCenterIndexByPosition(p2 - p0.props.entrySizeOnScrollingAxis / 2)
	end
	
	function p0.updateParent()
		-- upvalues: p0 (ref)
		local onCurrentIndexChanged = p0.props.onCurrentIndexChanged
		local onSelectedIndexChanged = p0.props.onSelectedIndexChanged
		
		if onCurrentIndexChanged then
			onCurrentIndexChanged(p0.currentIndex)
		end
		if onSelectedIndexChanged and p0.currentIndex == p0.targetIndex then
			onSelectedIndexChanged(p0.currentIndex, p0.isTargetIndexSetByUserInput)
		end
	end
	
	function p0.onScrollPositionChanged()
		-- upvalues: p0 (ref)
		if p0.scrollRef.current then
			local centerIndexByScrollPosition = p0.getCenterIndexByScrollPosition(p0.scrollRef.current.Position[p0.state.scrollingAxis].Offset)
			
			if centerIndexByScrollPosition ~= p0.currentIndex then
				p0.currentIndex = centerIndexByScrollPosition
				p0.updateParent()
			end
		end
	end
	
	function p0.updateTargetIndex(p3)
		-- upvalues: p0 (ref), otterModule (copy)
		local newTargetIndex = p3.newTargetIndex
		local isSetByUserInput = p3.isSetByUserInput
		local otterAnimationType = p3.otterAnimationType
		
		if otterAnimationType == nil then
			otterAnimationType = "spring"
		end
		local entries = p0.props.entries
		local entrySizeOnScrollingAxis = p0.props.entrySizeOnScrollingAxis
		p0.targetIndex = if #entries < 1 then 0 else math.clamp(newTargetIndex, math.max(1, p0.props.minTargetIndex or 1), #entries)
		p0.isTargetIndexSetByUserInput = isSetByUserInput
		p0.motor:setGoal(otterModule[otterAnimationType](-(entrySizeOnScrollingAxis * (p0.targetIndex - 1)), { frequency = 2 }))
		
		if p0.currentIndex == p0.targetIndex then
			p0.updateParent()
		end
	end
	
	function p0.updateIndexByInputPosition(p4)
		-- upvalues: p0 (ref)
		if p0.scrollRef.current then
			local scrollingAxis = p0.state.scrollingAxis
			local absolutePosition = p0.scrollRef.current.AbsolutePosition
			local absoluteSize = p0.scrollRef.current.AbsoluteSize
			local _ = 0
			p0.updateTargetIndex({
				isSetByUserInput = true,
				newTargetIndex = p0.getCenterIndexByPosition(if absolutePosition.X < p4.X and p4.X < absolutePosition.X + absoluteSize.X and (absolutePosition.Y < p4.Y and p4.Y < absolutePosition.Y + absoluteSize.Y) then absolutePosition[scrollingAxis] - p4[scrollingAxis] else -(p0.targetIndex - 1) * p0.props.entrySizeOnScrollingAxis)
			})
		end
	end
	
	function p0.updateIndexByScrollPositionAndOffset(p5)
		-- upvalues: p0 (ref)
		p5 = p5 or 0
		
		if p0.scrollRef.current then
			p0.updateTargetIndex({
				isSetByUserInput = true,
				newTargetIndex = p0.getCenterIndexByScrollPosition(p0.scrollRef.current.Position[p0.state.scrollingAxis].Offset + p5)
			})
		end
	end
	
	function p0.onInputBegan(_, p6)
		-- upvalues: p0 (ref), tbl (copy)
		local scrollingAxis = p0.state.scrollingAxis
		
		if p0.isMounted and tbl[p6.UserInputType] and (#p0.props.entries > 0 and p6.UserInputState == Enum.UserInputState.Begin) then
			p0.recognizedInputBegan = true
			p0.timeInputBegan = tick()
			p0.inputPositionAtInputBegan = p6.Position[scrollingAxis]
			p0.inputPreviousPositionScrollingAxis = p6.Position[scrollingAxis]
			p0.motor:stop()
		end
	end
	
	function scrollingPicker.restrictInputChangeDelta(_, p7)
		-- upvalues: scrollingPickerMaximumPickerChangePerInput (copy), scrollingPicker (copy), scrollingPickerSmallInputDecayFactor (copy)
		local minValue = math.min(math.abs(p7), scrollingPickerMaximumPickerChangePerInput * scrollingPicker.MOUSE_WHEEL_STEP_THRESHOLD)
		
		return if minValue < scrollingPicker.MOUSE_WHEEL_STEP_THRESHOLD then math.pow(minValue / scrollingPicker.MOUSE_WHEEL_STEP_THRESHOLD, scrollingPickerSmallInputDecayFactor) * scrollingPicker.MOUSE_WHEEL_STEP_THRESHOLD else minValue * (if p7 > 0 then 1 else -1)
	end
	
	function p0.onInputChanged(_, p8)
		-- upvalues: p0 (ref), scrollingPicker (copy), scrollingPickerSlowScrollStepWaitMs (copy), otterModule (copy)
		local entries = p0.props.entries
		local entrySizeOnScrollingAxis = p0.props.entrySizeOnScrollingAxis
		local scrollingAxis = p0.state.scrollingAxis
		
		if p8.UserInputType == Enum.UserInputType.MouseWheel then
			local z = p8.Position.Z
			local var15 = scrollingPicker:restrictInputChangeDelta(z)
			
			if z < 0 ~= (p0.scrollDeltaAccumulator < 0) then
				p0.scrollDeltaAccumulator = 0
			end
			p0.scrollDeltaAccumulator += var15
			local var16 = math.abs(p0.scrollDeltaAccumulator) <= 4 * scrollingPicker.MOUSE_WHEEL_STEP_THRESHOLD
			while scrollingPicker.MOUSE_WHEEL_STEP_THRESHOLD <= math.abs(p0.scrollDeltaAccumulator) do
				local var17 = if p0.scrollDeltaAccumulator > 0 then 1 else -1
				p0.updateTargetIndex({
					isSetByUserInput = true,
					OtterAnimationType = "spring",
					newTargetIndex = p0.targetIndex - var17
				})
				p0.scrollDeltaAccumulator -= scrollingPicker.MOUSE_WHEEL_STEP_THRESHOLD * var17
				
				if var16 then
					task.wait(scrollingPickerSlowScrollStepWaitMs)
				end
			end
			return
		elseif p0.recognizedInputBegan then
			local var18 = p8.Position[scrollingAxis] - p0.inputPreviousPositionScrollingAxis
			
			if p0.scrollRef.current then
				p0.motor:setGoal(otterModule.instant(math.max(math.min(-(entrySizeOnScrollingAxis * (math.max(1, p0.props.minTargetIndex or 1) - 1)), p0.scrollRef.current.Position[scrollingAxis].Offset + var18), -(entrySizeOnScrollingAxis * (#entries - 1)))))
			end
			p0.inputChanged = true
			p0.inputPreviousPositionScrollingAxis = p8.Position[scrollingAxis]
		end
	end
	
	function p0.onInputEnded(_, p9)
		-- upvalues: p0 (ref)
		local scrollingAxis = p0.state.scrollingAxis
		
		if p0.recognizedInputBegan then
			if p0.inputChanged and math.abs(p9.Position[scrollingAxis] - p0.inputPositionAtInputBegan) > 1.5 then
				local var19 = tick() - p0.timeInputBegan
				
				if var19 < 0.3 then
					p0.updateIndexByScrollPositionAndOffset(p9.Delta[scrollingAxis] / var19)
				else
					p0.updateIndexByScrollPositionAndOffset(0)
				end
			else
				p0.updateIndexByInputPosition(p9.Position)
			end
		end
		p0.recognizedInputBegan = false
		p0.inputChanged = false
	end
	
	function p0.onSelectionGained(p10)
		-- upvalues: p0 (ref)
		p0.isEntrySelected = true
		p0.updateTargetIndex({
			isSetByUserInput = true,
			otterAnimationType = "instant",
			newTargetIndex = p10
		})
	end
	
	function p0.onSelectionLost()
		-- upvalues: p0 (ref)
		p0.isEntrySelected = false
	end
end

function scrollingPicker.didMount(p11)
	-- upvalues: otterModule (ref), scrollingPickerDirectionModule (ref)
	p11.updateParent()
	p11.motor = otterModule.createSingleMotor(0)
	p11.motor:onStep(function(p12)
		-- upvalues: p11 (ref), scrollingPickerDirectionModule (copy)
		if p11.scrollRef.current then
			local scrollingAxis = p11.state.scrollingAxis
			local subAxis = p11.state.subAxis
			local position = p11.scrollRef.current.Position
			p11.scrollRef.current.Position = if p11.state.scrollDirection == scrollingPickerDirectionModule.Horizontal then UDim2.new(UDim.new(position[scrollingAxis].Scale, p12), position[subAxis]) else UDim2.new(position[subAxis], UDim.new(position[scrollingAxis].Scale, p12))
		end
	end)
	p11.motor:onComplete(function()
		-- upvalues: p11 (ref)
		if p11.props.onAnimationComplete then
			p11.props.onAnimationComplete()
		end
	end)
	p11.updateTargetIndex({
		isSetByUserInput = false,
		otterAnimationType = "instant",
		newTargetIndex = p11.targetIndex
	})
	p11.isMounted = true
end

function scrollingPicker.willUnmount(p13)
	p13.isMounted = false
	p13.motor:destroy()
end

function scrollingPicker.didUpdate(p14, p15)
	local parentSpecifiedTarget = p14.props.parentSpecifiedTarget
	
	if if p14.props.entrySizeOnScrollingAxis == p15.entrySizeOnScrollingAxis then parentSpecifiedTarget ~= p14.targetIndex and parentSpecifiedTarget ~= p15.parentSpecifiedTarget else true then
		p14.updateTargetIndex({
			isSetByUserInput = false,
			newTargetIndex = parentSpecifiedTarget or p14.targetIndex
		})
	end
end

function scrollingPicker.render(p16)
	-- upvalues: withStyle (ref), scrollingPickerDirectionModule (ref), fitChildrenModule (ref), roactModule (ref), cryoModule (ref)
	return withStyle(function(_)
		-- upvalues: p16 (ref), scrollingPickerDirectionModule (copy), fitChildrenModule (copy), roactModule (copy), cryoModule (copy)
		local width, horizontal, uDim2, uDim2_1, uDim2_2
		local layoutOrder = p16.props.layoutOrder
		local size = p16.props.size
		local entries = p16.props.entries
		local entrySizeOnScrollingAxis = p16.props.entrySizeOnScrollingAxis
		local clipsDescendants = p16.props.clipsDescendants
		local scrollDirection = p16.state.scrollDirection
		local getEntryWrapperProps = p16.props.getEntryWrapperProps
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
				Interactable = i == p16.targetIndex and p16.isEntrySelected,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Text = "",
				Selectable = math.abs(p16.targetIndex - i) < 2,
				[roactModule.Ref] = if i == p16.targetIndex then p16.targetEntryRef else nil,
				[roactModule.Event.SelectionGained] = function()
					-- upvalues: p16 (copy), i (ref)
					p16.onSelectionGained(i)
				end,
				[roactModule.Event.SelectionLost] = p16.onSelectionLost,
				[roactModule.Event.Activated] = p16.props.onEntryActivated
			}
			
			if getEntryWrapperProps then
				t_1 = cryoModule.Dictionary.join(t_1, getEntryWrapperProps(v))
			end
			table.insert(t, roactModule.createElement("TextButton", cryoModule.Dictionary.join(t_1, { Size = uDim2, LayoutOrder = i }), { p16.props.renderEntry(v) }))
		end
		table.insert(t, roactModule.createElement("UIListLayout", {
			FillDirection = horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}))
		
		return roactModule.createElement("Frame", {
			LayoutOrder = layoutOrder,
			Size = if p16.shouldExpandTapTarget then size + UDim2.new(0, 0, 0, p16.tapTargetExpansionSize) else size,
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			ClipsDescendants = clipsDescendants,
			SelectionGroup = true,
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
			[roactModule.Event.InputBegan] = p16.onInputBegan,
			[roactModule.Event.InputChanged] = p16.onInputChanged,
			[roactModule.Event.InputEnded] = p16.onInputEnded
		}, {
			CenterPosition = if p16.shouldExpandTapTarget then roactModule.createElement("Frame", {
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
						[roactModule.Ref] = p16.scrollRef,
						[roactModule.Change.AbsolutePosition] = p16.onScrollPositionChanged
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
					[roactModule.Ref] = p16.scrollRef,
					[roactModule.Change.AbsolutePosition] = p16.onScrollPositionChanged
				}, t)
			})
		})
	end)
end

return scrollingPicker