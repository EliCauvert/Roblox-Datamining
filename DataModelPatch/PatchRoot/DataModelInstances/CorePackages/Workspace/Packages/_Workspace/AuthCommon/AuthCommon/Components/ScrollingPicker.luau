local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local RoactModule = require(Parent.Roact)
local CryoModule = require(Parent.Cryo)
local WithStyleFunction = require(Parent.UIBlox).Style.withStyle
local ScrollingPickerDirectionModule = require(AuthCommon.Enums.ScrollingPickerDirection)
local OtterModule = require(Parent.Otter)
local FitChildrenModule = require(AuthCommon.Components.FitChildren)
local config = {
	[ScrollingPickerDirectionModule.Horizontal] = "X",
	[ScrollingPickerDirectionModule.Vertical] = "Y"
}
local config1 = {
	[ScrollingPickerDirectionModule.Horizontal] = "Y",
	[ScrollingPickerDirectionModule.Vertical] = "X"
}
local ScrollingPickerSlowScrollStepWaitMs = game:DefineFastInt("ScrollingPickerSlowScrollStepWaitMs", 100)
local ScrollingPickerMaximumPickerChangePerInput = game:DefineFastInt("ScrollingPickerMaximumPickerChangePerInput", 1)
local ScrollingPickerSmallInputDecayFactor = game:DefineFastInt("ScrollingPickerSmallInputDecayFactor", 3)
local ScrollingPicker = RoactModule.PureComponent:extend("ScrollingPicker")
ScrollingPicker.MOUSE_WHEEL_STEP_THRESHOLD = 0.1
ScrollingPicker.defaultProps = {
	layoutOrder = 0,
	parentSpecifiedTarget = 1,
	entrySizeOnScrollingAxis = 10,
	clipsDescendants = true,
	shouldExpandTapTarget = false,
	tapTargetExpansionSize = 0,
	minTargetIndex = 1,
	entries = {},
	scrollDirection = ScrollingPickerDirectionModule.Vertical
}
local self = setmetatable({
	[Enum.UserInputType.MouseButton1] = true,
	[Enum.UserInputType.Touch] = true
}, {
	__index = function(_, _): boolean
		return false
	end
})

function ScrollingPicker.init(p1)
	-- upvalues: config (copy), config1 (copy), RoactModule (copy), OtterModule (copy), self (copy), ScrollingPickerMaximumPickerChangePerInput (copy), ScrollingPicker (copy), ScrollingPickerSmallInputDecayFactor (copy), ScrollingPickerSlowScrollStepWaitMs (copy)
	local ParentSpecifiedTarget = p1.props.parentSpecifiedTarget
	local ScrollDirection = p1.props.scrollDirection
	local ShouldExpandTapTarget = p1.props.shouldExpandTapTarget
	p1.state = {
		scrollDirection = ScrollDirection,
		scrollingAxis = config[ScrollDirection],
		subAxis = config1[ScrollDirection]
	}
	p1.isMounted = false
	p1.currentIndex = 1
	p1.targetEntryRef = RoactModule.createRef()
	p1.targetIndex = ParentSpecifiedTarget
	p1.isEntrySelected = false
	p1.isTargetIndexSetByUserInput = false
	p1.timeInputBegan = tick()
	p1.recognizedInputBegan = false
	p1.inputChanged = false
	p1.inputPositionAtInputBegan = 0
	p1.inputPreviousPositionScrollingAxis = 0
	p1.scrollRef = RoactModule.createRef()
	p1.shouldExpandTapTarget = ShouldExpandTapTarget
	p1.tapTargetExpansionSize = p1.props.tapTargetExpansionSize
	p1.scrollDeltaAccumulator = 0
	
	function p1.getCenterIndexByPosition(p2): number
		-- upvalues: p1 (copy)
		return math.floor(-p2 / p1.props.entrySizeOnScrollingAxis) + 1
	end
	
	function p1.getCenterIndexByScrollPosition(Offset)
		-- upvalues: p1 (copy)
		return p1.getCenterIndexByPosition(Offset - p1.props.entrySizeOnScrollingAxis / 2)
	end
	
	function p1.updateParent()
		-- upvalues: p1 (copy)
		local OnCurrentIndexChangedFunction: (any) -> () = p1.props.onCurrentIndexChanged
		local OnSelectedIndexChangedFunction: (any, any) -> () = p1.props.onSelectedIndexChanged
		
		if OnCurrentIndexChangedFunction then
			OnCurrentIndexChangedFunction(p1.currentIndex)
		end
		if OnSelectedIndexChangedFunction and p1.currentIndex == p1.targetIndex then
			OnSelectedIndexChangedFunction(p1.currentIndex, p1.isTargetIndexSetByUserInput)
		end
	end
	
	function p1.onScrollPositionChanged()
		-- upvalues: p1 (copy)
		if p1.scrollRef.current then
			local CenterIndexByScrollPosition = p1.getCenterIndexByScrollPosition(p1.scrollRef.current.Position[p1.state.scrollingAxis].Offset)
			
			if CenterIndexByScrollPosition ~= p1.currentIndex then
				p1.currentIndex = CenterIndexByScrollPosition
				p1.updateParent()
			end
		end
	end
	
	function p1.updateTargetIndex(p2)
		-- upvalues: p1 (copy), OtterModule (upval)
		local NewTargetIndex: number = p2.newTargetIndex
		local IsSetByUserInput = p2.isSetByUserInput
		local OtterAnimationType = p2.otterAnimationType
		
		if OtterAnimationType == nil then
			OtterAnimationType = "spring"
		end
		local Entries = p1.props.entries
		local EntrySizeOnScrollingAxis = p1.props.entrySizeOnScrollingAxis
		p1.targetIndex = if #Entries < 1 then 0 else math.clamp(NewTargetIndex, math.max(1, p1.props.minTargetIndex or 1), #Entries)
		p1.isTargetIndexSetByUserInput = IsSetByUserInput
		p1.motor:setGoal(OtterModule[OtterAnimationType](-(EntrySizeOnScrollingAxis * (p1.targetIndex - 1)), { frequency = 2 }))
		
		if p1.currentIndex == p1.targetIndex then
			p1.updateParent()
		end
	end
	
	function p1.updateIndexByInputPosition(Vector)
		-- upvalues: p1 (copy)
		if p1.scrollRef.current then
			local ScrollingAxis = p1.state.scrollingAxis
			local AbsolutePosition = p1.scrollRef.current.AbsolutePosition
			local AbsoluteSize = p1.scrollRef.current.AbsoluteSize
			local EntrySizeOnScrollingAxis = p1.props.entrySizeOnScrollingAxis
			p1.updateTargetIndex({
				isSetByUserInput = true,
				newTargetIndex = p1.getCenterIndexByPosition(if AbsolutePosition.X < Vector.X and Vector.X < AbsolutePosition.X + AbsoluteSize.X and AbsolutePosition.Y < Vector.Y and Vector.Y < AbsolutePosition.Y + AbsoluteSize.Y then AbsolutePosition[ScrollingAxis] - Vector[ScrollingAxis] else -(p1.targetIndex - 1) * EntrySizeOnScrollingAxis)
			})
		end
	end
	
	function p1.updateIndexByScrollPositionAndOffset(DeltaEntryRatio)
		-- upvalues: p1 (copy)
		local DeltaEntryRatio1 = DeltaEntryRatio or 0
		
		if p1.scrollRef.current then
			p1.updateTargetIndex({
				isSetByUserInput = true,
				newTargetIndex = p1.getCenterIndexByScrollPosition(p1.scrollRef.current.Position[p1.state.scrollingAxis].Offset + DeltaEntryRatio1)
			})
		end
	end
	
	function p1:onInputBegan(Input)
		-- upvalues: p1 (copy), self (upval)
		local Entries = p1.props.entries
		local ScrollingAxis = p1.state.scrollingAxis
		
		if p1.isMounted and self[Input.UserInputType] and #Entries > 0 and Input.UserInputState == Enum.UserInputState.Begin then
			p1.recognizedInputBegan = true
			p1.timeInputBegan = tick()
			p1.inputPositionAtInputBegan = Input.Position[ScrollingAxis]
			p1.inputPreviousPositionScrollingAxis = Input.Position[ScrollingAxis]
			p1.motor:stop()
		end
	end
	
	function ScrollingPicker:restrictInputChangeDelta(Value: number)
		-- upvalues: ScrollingPickerMaximumPickerChangePerInput (upval), ScrollingPicker (upval), ScrollingPickerSmallInputDecayFactor (upval)
		local v1: number = if Value > 0 then 1 else -1
		local Smallest = math.min(math.abs(Value), ScrollingPickerMaximumPickerChangePerInput * ScrollingPicker.MOUSE_WHEEL_STEP_THRESHOLD)
		
		return if Smallest < ScrollingPicker.MOUSE_WHEEL_STEP_THRESHOLD then math.pow(Smallest / ScrollingPicker.MOUSE_WHEEL_STEP_THRESHOLD, ScrollingPickerSmallInputDecayFactor) * ScrollingPicker.MOUSE_WHEEL_STEP_THRESHOLD else Smallest * v1
	end
	
	function p1:onInputChanged(Input)
		-- upvalues: p1 (copy), ScrollingPicker (upval), ScrollingPickerSlowScrollStepWaitMs (upval), OtterModule (upval)
		local Entries = p1.props.entries
		local EntrySizeOnScrollingAxis = p1.props.entrySizeOnScrollingAxis
		local ScrollingAxis = p1.state.scrollingAxis
		
		if Input.UserInputType == Enum.UserInputType.MouseWheel then
			local Z: number = Input.Position.Z
			local RestrictInputChangeDeltaResult = ScrollingPicker:restrictInputChangeDelta(Z)
			
			if Z < 0 ~= (p1.scrollDeltaAccumulator < 0) then
				p1.scrollDeltaAccumulator = 0
			end
			p1.scrollDeltaAccumulator += RestrictInputChangeDeltaResult
			local IsMagnitudeBelow = math.abs(p1.scrollDeltaAccumulator) <= 4 * ScrollingPicker.MOUSE_WHEEL_STEP_THRESHOLD
			while ScrollingPicker.MOUSE_WHEEL_STEP_THRESHOLD <= math.abs(p1.scrollDeltaAccumulator) do
				local v1: number = if p1.scrollDeltaAccumulator > 0 then 1 else -1
				p1.updateTargetIndex({
					isSetByUserInput = true,
					OtterAnimationType = "spring",
					newTargetIndex = p1.targetIndex - v1
				})
				p1.scrollDeltaAccumulator -= ScrollingPicker.MOUSE_WHEEL_STEP_THRESHOLD * v1
				
				if IsMagnitudeBelow then
					task.wait(ScrollingPickerSlowScrollStepWaitMs)
				end
			end
			return
		else
			if p1.recognizedInputBegan then
				local PositionEntryDelta = Input.Position[ScrollingAxis] - p1.inputPreviousPositionScrollingAxis
				
				if p1.scrollRef.current then
					p1.motor:setGoal(OtterModule.instant((math.max(math.min(-(EntrySizeOnScrollingAxis * (math.max(1, p1.props.minTargetIndex or 1) - 1)), p1.scrollRef.current.Position[ScrollingAxis].Offset + PositionEntryDelta), -(EntrySizeOnScrollingAxis * (#Entries - 1))))))
				end
				p1.inputChanged = true
				p1.inputPreviousPositionScrollingAxis = Input.Position[ScrollingAxis]
			end
		end
	end
	
	function p1:onInputEnded(p2)
		-- upvalues: p1 (copy)
		local ScrollingAxis = p1.state.scrollingAxis
		
		if p1.recognizedInputBegan then
			local PositionEntryDelta = p2.Position[ScrollingAxis] - p1.inputPositionAtInputBegan
			
			if p1.inputChanged and math.abs(PositionEntryDelta) > 1.5 then
				local Elapsed = tick() - p1.timeInputBegan
				
				if Elapsed < 0.3 then
					p1.updateIndexByScrollPositionAndOffset(p2.Delta[ScrollingAxis] / Elapsed)
				else
					p1.updateIndexByScrollPositionAndOffset(0)
				end
			else
				p1.updateIndexByInputPosition(p2.Position)
			end
		end
		p1.recognizedInputBegan = false
		p1.inputChanged = false
	end
	
	function p1.onSelectionGained(NewTargetIndex)
		-- upvalues: p1 (copy)
		p1.isEntrySelected = true
		p1.updateTargetIndex({
			isSetByUserInput = true,
			otterAnimationType = "instant",
			newTargetIndex = NewTargetIndex
		})
	end
	
	function p1.onSelectionLost()
		-- upvalues: p1 (copy)
		p1.isEntrySelected = false
	end
end

function ScrollingPicker.didMount(p2)
	-- upvalues: OtterModule (copy), ScrollingPickerDirectionModule (copy)
	p2.updateParent()
	p2.motor = OtterModule.createSingleMotor(0)
	p2.motor:onStep(function(Offset)
		-- upvalues: p2 (copy), ScrollingPickerDirectionModule (upval)
		if p2.scrollRef.current then
			local ScrollingAxis = p2.state.scrollingAxis
			local SubAxis = p2.state.subAxis
			local Position = p2.scrollRef.current.Position
			p2.scrollRef.current.Position = if p2.state.scrollDirection == ScrollingPickerDirectionModule.Horizontal then UDim2.new(UDim.new(Position[ScrollingAxis].Scale, Offset), Position[SubAxis]) else UDim2.new(Position[SubAxis], UDim.new(Position[ScrollingAxis].Scale, Offset))
		end
	end)
	p2.motor:onComplete(function()
		-- upvalues: p2 (copy)
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

function ScrollingPicker.willUnmount(p2)
	p2.isMounted = false
	p2.motor:destroy()
end

function ScrollingPicker.didUpdate(p2, DefaultProps)
	local ParentSpecifiedTarget = p2.props.parentSpecifiedTarget
	
	if p2.props.entrySizeOnScrollingAxis ~= DefaultProps.entrySizeOnScrollingAxis or ParentSpecifiedTarget ~= p2.targetIndex and ParentSpecifiedTarget ~= DefaultProps.parentSpecifiedTarget then
		p2.updateTargetIndex({
			isSetByUserInput = false,
			newTargetIndex = if ParentSpecifiedTarget then ParentSpecifiedTarget else p2.targetIndex
		})
	end
end

function ScrollingPicker.render(p2)
	-- upvalues: WithStyleFunction (copy), ScrollingPickerDirectionModule (copy), FitChildrenModule (copy), RoactModule (copy), CryoModule (copy)
	return WithStyleFunction(function(_)
		-- upvalues: p2 (copy), ScrollingPickerDirectionModule (upval), FitChildrenModule (upval), RoactModule (upval), CryoModule (upval)
		local LayoutOrder = p2.props.layoutOrder
		local Size = p2.props.size
		local Entries = p2.props.entries
		local EntrySizeOnScrollingAxis = p2.props.entrySizeOnScrollingAxis
		local ClipsDescendants = p2.props.clipsDescendants
		local GetEntryWrapperPropsFunction = p2.props.getEntryWrapperProps
		local Width = nil
		local _UDim2_1 = nil
		local Horizontal = nil
		local _UDim2 = nil
		local _UDim2_2 = nil
		
		if p2.state.scrollDirection == ScrollingPickerDirectionModule.Horizontal then
			Width = FitChildrenModule.FitAxis.Width
			Horizontal = Enum.FillDirection.Horizontal
			_UDim2 = UDim2.new(0, EntrySizeOnScrollingAxis, 1, 0)
			_UDim2_1 = UDim2.new(0, 0, 1, 0)
			_UDim2_2 = UDim2.new(0.5, -EntrySizeOnScrollingAxis / 2, 0, 0)
		else
			Width = FitChildrenModule.FitAxis.Height
			Horizontal = Enum.FillDirection.Vertical
			_UDim2 = UDim2.new(1, 0, 0, EntrySizeOnScrollingAxis)
			_UDim2_1 = UDim2.new(1, 0, 0, 0)
			_UDim2_2 = UDim2.new(0, 0, 0.5, -EntrySizeOnScrollingAxis / 2)
		end
		local List = {}
		
		for LayoutOrder1, entry in ipairs(Entries) do
			local JoinResult = {
				Interactable = LayoutOrder1 == p2.targetIndex and p2.isEntrySelected,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Text = "",
				Selectable = math.abs(p2.targetIndex - LayoutOrder1) < 2,
				[RoactModule.Ref] = if LayoutOrder1 == p2.targetIndex then p2.targetEntryRef else nil,
				[RoactModule.Event.SelectionGained] = function()
					-- upvalues: p2 (upval), LayoutOrder1 (copy)
					p2.onSelectionGained(LayoutOrder1)
				end,
				[RoactModule.Event.SelectionLost] = p2.onSelectionLost,
				[RoactModule.Event.Activated] = p2.props.onEntryActivated
			}
			
			if GetEntryWrapperPropsFunction then
				JoinResult = CryoModule.Dictionary.join(JoinResult, GetEntryWrapperPropsFunction(entry))
			end
			table.insert(List, RoactModule.createElement("TextButton", CryoModule.Dictionary.join(JoinResult, { Size = _UDim2, LayoutOrder = LayoutOrder1 }), { p2.props.renderEntry(entry) }))
		end
		table.insert(List, RoactModule.createElement("UIListLayout", {
			FillDirection = Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}))
		
		return RoactModule.createElement("Frame", {
			LayoutOrder = LayoutOrder,
			Size = if p2.shouldExpandTapTarget then Size + UDim2.new(0, 0, 0, p2.tapTargetExpansionSize) else Size,
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			ClipsDescendants = ClipsDescendants,
			SelectionGroup = true,
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
			[RoactModule.Event.InputBegan] = p2.onInputBegan,
			[RoactModule.Event.InputChanged] = p2.onInputChanged,
			[RoactModule.Event.InputEnded] = p2.onInputEnded
		}, {
			CenterPosition = if p2.shouldExpandTapTarget then RoactModule.createElement("Frame", {
				ClipsDescendants = true,
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = Size,
				AutomaticSize = Enum.AutomaticSize.X
			}, {
				CenterPosition = RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					Size = _UDim2_1,
					Position = _UDim2_2
				}, {
					AnimatedSlidingList = RoactModule.createElement(FitChildrenModule.FitFrame, {
						Size = _UDim2_1,
						fitAxis = Width,
						BorderSizePixel = 0,
						BackgroundTransparency = 1,
						[RoactModule.Ref] = p2.scrollRef,
						[RoactModule.Change.AbsolutePosition] = p2.onScrollPositionChanged
					}, List)
				})
			}) else RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = _UDim2_1,
				Position = _UDim2_2
			}, {
				AnimatedSlidingList = RoactModule.createElement(FitChildrenModule.FitFrame, {
					Size = _UDim2_1,
					fitAxis = Width,
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					[RoactModule.Ref] = p2.scrollRef,
					[RoactModule.Change.AbsolutePosition] = p2.onScrollPositionChanged
				}, List)
			})
		})
	end)
end

return ScrollingPicker