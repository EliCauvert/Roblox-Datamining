local UserInputService = game:GetService("UserInputService")
local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local RoactModule = require(Parent2.Roact)
local CryoModule = require(Parent2.Cryo)
local TModule = require(Parent2.t)
local RoactGamepadModule = require(Parent2.RoactGamepad)
local ImageSetComponentModule = require(Parent.ImageSet.ImageSetComponent)
local UseCursorByTypeModule = require(Parent1.App.SelectionCursor.useCursorByType)
local CursorTypeModule = require(Parent1.App.SelectionCursor.CursorType)
local LerpModule = require(Parent1.Utility.lerp)
local WithSelectionCursorProviderModule = require(Parent1.App.SelectionImage.withSelectionCursorProvider)
local GenericSlider = RoactModule.PureComponent:extend("GenericSlider")
GenericSlider.validateProps = TModule.strictInterface({
	lowerValue = TModule.number,
	upperValue = TModule.optional(TModule.number),
	min = TModule.number,
	max = TModule.number,
	stepInterval = TModule.numberPositive,
	isDisabled = TModule.optional(TModule.boolean),
	onValueChanged = TModule.callback,
	onDragStartLower = TModule.optional(TModule.callback),
	onDragStartUpper = TModule.optional(TModule.callback),
	onDragEnd = TModule.optional(TModule.callback),
	trackImage = TModule.union(TModule.string, TModule.table),
	trackColor = TModule.union(TModule.Color3, TModule.table),
	trackTransparency = TModule.union(TModule.number, TModule.table),
	trackSliceCenter = TModule.optional(TModule.Rect),
	trackFillImage = TModule.union(TModule.string, TModule.table),
	trackFillColor = TModule.union(TModule.Color3, TModule.table),
	trackFillTransparency = TModule.union(TModule.number, TModule.table),
	trackFillSliceCenter = TModule.optional(TModule.Rect),
	knobImage = TModule.union(TModule.string, TModule.table),
	knobColorLower = TModule.union(TModule.Color3, TModule.table),
	knobColorUpper = TModule.optional(TModule.union(TModule.Color3, TModule.table)),
	knobTransparency = TModule.union(TModule.number, TModule.table),
	knobImagePadding = TModule.optional(TModule.numberMin(0)),
	knobShadowImage = TModule.union(TModule.string, TModule.table),
	knobShadowTransparencyLower = TModule.union(TModule.number, TModule.table),
	knobShadowTransparencyUpper = TModule.optional(TModule.union(TModule.number, TModule.table)),
	width = TModule.optional(TModule.UDim),
	position = TModule.optional(TModule.UDim2),
	anchorPoint = TModule.optional(TModule.Vector2),
	layoutOrder = TModule.optional(TModule.integer),
	imageButtonRef = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	focusController = TModule.optional(TModule.table),
	containerRef = TModule.optional(TModule.table),
	customTrack = TModule.optional(TModule.table),
	customKnobHeight = TModule.optional(TModule.number),
	customKnobBorderColor = TModule.optional(TModule.Color3),
	customKnobBorderSize = TModule.optional(TModule.number),
	selectedCursor = TModule.table,
	unselectedCursor = TModule.table
})
GenericSlider.defaultProps = {
	knobImagePadding = 0,
	width = UDim.new(1, 0),
	customKnobBorderColor = Color3.new(0, 0, 0)
}

function GenericSlider.init(p1)
	-- upvalues: RoactModule (copy)
	p1.rootRef = p1.props.imageButtonRef or RoactModule.createRef()
	p1.lowerKnobRef = RoactModule.createRef()
	p1.upperKnobRef = RoactModule.createRef()
	p1.moveDirection = 0
	p1.lowerKnobDrag = false
	p1.upperKnobDrag = false
	p1.totalMoveTime = 0
	p1.isFirstMove = true
	p1.unhandledTime = 0
	p1.state = { lowerKnobIsSelected = false, upperKnobIsSelected = false }
end

function GenericSlider.getKnobVisibleHeight(p1)
	return if p1.props.customKnobHeight then (44 - p1.props.knobImagePadding * 2) / 44 * p1.props.customKnobHeight else 44 - p1.props.knobImagePadding * 2
end

function GenericSlider.getKnobHeight(p1)
	return if p1.props.customKnobHeight then 44 / (44 - p1.props.knobImagePadding * 2) * p1.props.customKnobHeight else 44
end

function GenericSlider.onMoveStep(p1, p2, p3)
	if not p1.state.lowerKnobIsSelected and not p1.state.upperKnobIsSelected then return end
	local Position = p2[Enum.KeyCode.Thumbstick1].Position
	local IsMagnitudeAbove = Position.Magnitude > 0.2
	local Floored = 0
	p1.totalMoveTime += p3
	local v1 = nil
	local v2 = nil
	local v3 = nil
	
	if IsMagnitudeAbove then
		v2 = if Position.x > 0 then 1 else -1
		v3 = 0.2
		v1 = 12
	else
		v2 = (if p2[Enum.KeyCode.DPadLeft].UserInputState == Enum.UserInputState.Begin then -1 else 0) + (if p2[Enum.KeyCode.DPadRight].UserInputState == Enum.UserInputState.Begin then 1 else 0)
		v3 = 0.5
		v1 = 8
	end
	if v2 == 0 then
		p1.totalMoveTime = 0
		p1.isFirstMove = true
	elseif p1.isFirstMove then
		p1.isFirstMove = false
		p1.totalMoveTime = 0
		p1.unhandledTime = 0
		Floored = 1
	elseif v3 < p1.totalMoveTime then
		local NewLargest = p3 - math.max(v3 - p1.totalMoveTime - p3, 0) + p1.unhandledTime
		Floored = math.floor(v1 * NewLargest)
		p1.unhandledTime = NewLargest - Floored / v1
	else
		Floored = 0
		p1.unhandledTime = 0
	end
	if Floored > 0 then
		p1:processGamepadInput(v2, Floored)
	end
end

function GenericSlider.processGamepadInput(p1, p2, Floored)
	if p1:hasTwoKnobs() then
		p1:processTwoKnobGamepadInput(p2, Floored)
		
		return
	else
		p1:processOneKnobGamepadInput(p2, Floored)
	end
end

function GenericSlider.processTwoKnobGamepadInput(p1, p2, p3)
	local ScaledStepInterval = p1.props.stepInterval * p2
	local LowerValue = p1.props.lowerValue
	local UpperValue = p1.props.upperValue
	
	if LowerValue == UpperValue and not p1.state.processingGamepad then
		if p1.state.lowerKnobIsSelected and p2 == 1 and LowerValue ~= p1.props.max then
			p1:setState({
				lowerKnobIsSelected = false,
				upperKnobIsSelected = true,
				processingGamepad = true
			})
			p1.props.focusController.moveFocusTo(p1.upperKnobRef)
		elseif p1.state.upperKnobIsSelected and p2 == -1 and UpperValue ~= p1.props.min then
			p1:setState({
				lowerKnobIsSelected = true,
				upperKnobIsSelected = false,
				processingGamepad = true
			})
			p1.props.focusController.moveFocusTo(p1.lowerKnobRef)
		end
	elseif not p1.state.processingGamepad then
		p1:setState({ processingGamepad = true })
	end
	if p1.state.lowerKnobIsSelected then
		local Largest = math.max(math.min(LowerValue + ScaledStepInterval * p3, p1.props.max), p1.props.min)
		LowerValue = if UpperValue >= Largest then Largest else UpperValue
	elseif p1.state.upperKnobIsSelected then
		local Largest = math.max(math.min(UpperValue + ScaledStepInterval * p3, p1.props.max), p1.props.min)
		UpperValue = if LowerValue <= Largest then Largest else LowerValue
	end
	if UpperValue ~= p1.props.upperValue or LowerValue ~= p1.props.lowerValue then
		p1.props.onValueChanged(LowerValue, UpperValue)
	end
end

function GenericSlider.processOneKnobGamepadInput(p1, p2, p3)
	local ScaledStepInterval = p1.props.stepInterval * p2
	local LowerValue = p1.props.lowerValue
	
	if p1.state.lowerKnobIsSelected then
		LowerValue = math.max(math.min(LowerValue + ScaledStepInterval * p3, p1.props.max), p1.props.min)
	end
	if LowerValue ~= p1.props.lowerValue then
		p1.props.onValueChanged(LowerValue)
	end
end

function GenericSlider.renderTrack(p1, Size, HasTwoKnobs, XScale)
	-- upvalues: RoactModule (copy), ImageSetComponentModule (copy)
	return if p1.props.customTrack then p1.props.customTrack else RoactModule.createElement(ImageSetComponentModule.Label, {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		ImageColor3 = p1.props.trackColor,
		ImageTransparency = p1.props.trackTransparency,
		Image = p1.props.trackImage,
		Size = UDim2.new(1, 0, 0, 4),
		Position = UDim2.fromScale(0.5, 0.5),
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = p1.props.trackSliceCenter
	}, {
		TrackFill = RoactModule.createElement(ImageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			ImageColor3 = p1.props.trackFillColor,
			ImageTransparency = p1.props.trackFillTransparency,
			Image = p1.props.trackFillImage,
			Size = Size,
			Position = HasTwoKnobs and UDim2.new(XScale, 0, 0, 0) or UDim2.new(0, 0, 0, 0),
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = p1.props.trackFillSliceCenter
		})
	})
end

function GenericSlider.wrapKnobWithBorder(p1, Element, Position)
	-- upvalues: RoactModule (copy)
	local CustomKnobHeight = if p1.props.customKnobHeight then p1.props.customKnobHeight else p1:getKnobVisibleHeight()
	
	return RoactModule.createElement("Frame", {
		ZIndex = 3,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.fromOffset(CustomKnobHeight, CustomKnobHeight),
		Position = Position,
		BackgroundColor3 = p1.props.customKnobBorderColor
	}, {
		UICorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
		KnobContent = Element
	})
end

function GenericSlider.renderUpperKnob(p1, Position, LowerKnobIsSelected, HasTwoKnobs, _)
	-- upvalues: RoactModule (copy), RoactGamepadModule (copy), ImageSetComponentModule (copy)
	if not HasTwoKnobs then
		return nil
	end
	local KnobHeight = p1:getKnobHeight()
	local Position1: UDim2 = Position
	
	if p1.props.customKnobBorderSize and p1.props.customKnobBorderSize > 0 then
		KnobHeight -= 2 * (p1.props.customKnobBorderSize + 2)
		Position1 = UDim2.fromScale(0.5, 0.5)
	end
	local Element = RoactModule.createElement(RoactGamepadModule.Focusable[ImageSetComponentModule.Button], {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		ImageColor3 = p1.props.knobColorUpper,
		ImageTransparency = p1.props.knobTransparency,
		Image = p1.props.knobImage,
		Size = UDim2.fromOffset(KnobHeight, KnobHeight),
		Position = Position1,
		ZIndex = 3,
		NextSelectionLeft = if LowerKnobIsSelected or p1.props.upperValue == p1.props.lowerValue then nil else p1.lowerKnobRef or nil,
		NextSelectionRight = LowerKnobIsSelected and p1.upperKnobRef or nil,
		NextSelectionUp = LowerKnobIsSelected and p1.upperKnobRef or nil,
		NextSelectionDown = LowerKnobIsSelected and p1.upperKnobRef or nil,
		SelectionImageObject = LowerKnobIsSelected and p1.props.selectedCursor or p1.props.unselectedCursor,
		[RoactModule.Ref] = p1.upperKnobRef,
		[RoactModule.Event.InputBegan] = function(_, Input)
			-- upvalues: p1 (copy)
			if not p1.props.isDisabled then
				p1:onInputBegan(Input, true)
				
				return
			end
		end,
		inputBindings = {
			OnMoveStep = RoactGamepadModule.Input.onMoveStep(function(p2, p3)
				-- upvalues: p1 (copy)
				p1:onMoveStep(p2, p3)
			end),
			SelectUpperKnob = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, function()
				-- upvalues: p1 (copy)
				p1:setState(function(p2)
					return {
						processingGamepad = false,
						upperKnobIsSelected = not p2.upperKnobIsSelected
					}
				end)
			end),
			UnselectUpperKnob = LowerKnobIsSelected and RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonB, function()
				-- upvalues: p1 (copy)
				p1:setState({ upperKnobIsSelected = false, processingGamepad = false })
			end) or nil
		}
	})
	
	return if p1.props.customKnobBorderSize and p1.props.customKnobBorderSize > 0 then p1:wrapKnobWithBorder(Element, Position) else Element
end

function GenericSlider.renderLowerKnob(p1, Position, LowerKnobIsSelected, HasTwoKnobs, _)
	-- upvalues: RoactModule (copy), RoactGamepadModule (copy), ImageSetComponentModule (copy)
	local KnobHeight = p1:getKnobHeight()
	local Position1: UDim2 = Position
	
	if p1.props.customKnobBorderSize and p1.props.customKnobBorderSize > 0 then
		KnobHeight -= 2 * (p1.props.customKnobBorderSize + 2)
		Position1 = UDim2.fromScale(0.5, 0.5)
	end
	local Element = RoactModule.createElement(RoactGamepadModule.Focusable[ImageSetComponentModule.Button], {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		ImageColor3 = p1.props.knobColorLower,
		ImageTransparency = p1.props.knobTransparency,
		Image = p1.props.knobImage,
		Size = UDim2.fromOffset(KnobHeight, KnobHeight),
		Position = Position1,
		ZIndex = 3,
		inputBindings = {
			OnMoveStep = RoactGamepadModule.Input.onMoveStep(function(p2, p3)
				-- upvalues: p1 (copy)
				p1:onMoveStep(p2, p3)
			end),
			SelectLowerKnob = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, function()
				-- upvalues: p1 (copy)
				p1:setState(function(p2)
					return {
						processingGamepad = false,
						lowerKnobIsSelected = not p2.lowerKnobIsSelected
					}
				end)
			end),
			UnselectLowerKnob = LowerKnobIsSelected and RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonB, function()
				-- upvalues: p1 (copy)
				p1:setState({ lowerKnobIsSelected = false, processingGamepad = false })
			end) or nil
		},
		NextSelectionLeft = LowerKnobIsSelected and p1.lowerKnobRef or nil,
		NextSelectionRight = HasTwoKnobs and not LowerKnobIsSelected and p1.props.upperValue ~= p1.props.lowerValue and p1.upperKnobRef or nil,
		NextSelectionUp = LowerKnobIsSelected and p1.lowerKnobRef or nil,
		NextSelectionDown = LowerKnobIsSelected and p1.lowerKnobRef or nil,
		SelectionImageObject = LowerKnobIsSelected and p1.props.selectedCursor or p1.props.unselectedCursor,
		[RoactModule.Ref] = p1.lowerKnobRef,
		[RoactModule.Event.InputBegan] = function(_, Input)
			-- upvalues: p1 (copy)
			if not p1.props.isDisabled then
				p1:onInputBegan(Input, true)
				
				return
			end
		end
	})
	
	return if p1.props.customKnobBorderSize and p1.props.customKnobBorderSize > 0 then p1:wrapKnobWithBorder(Element, Position) else Element
end

function GenericSlider.renderKnobShadow(p1, ImageTransparency, Position)
	-- upvalues: RoactModule (copy), ImageSetComponentModule (copy)
	return RoactModule.createElement(ImageSetComponentModule.Label, {
		BackgroundTransparency = 1,
		ZIndex = 2,
		AnchorPoint = Vector2.new(0.5, 0.5),
		ImageTransparency = ImageTransparency,
		Image = p1.props.knobShadowImage,
		Size = UDim2.fromOffset(p1:getKnobHeight(), p1:getKnobHeight()),
		Position = Position
	})
end

function GenericSlider.render(p1)
	-- upvalues: LerpModule (copy), WithSelectionCursorProviderModule (copy), RoactModule (copy), RoactGamepadModule (copy), ImageSetComponentModule (copy)
	local LowerKnobIsSelected = p1.state.lowerKnobIsSelected or p1.state.upperKnobIsSelected
	local HasTwoKnobs = p1:hasTwoKnobs()
	local LowerValueRatio = (p1.props.lowerValue - p1.props.min) / (p1.props.max - p1.props.min)
	local UpperValueRatio = HasTwoKnobs and (p1.props.upperValue - p1.props.min) / (p1.props.max - p1.props.min) or nil
	local KnobVisibleHeight: number = p1:getKnobVisibleHeight()
	local LerpModuleResult = LerpModule(KnobVisibleHeight / 2, -KnobVisibleHeight / 2, LowerValueRatio)
	local LerpModuleResult1 = HasTwoKnobs and LerpModule(KnobVisibleHeight / 2, -KnobVisibleHeight / 2, UpperValueRatio) or nil
	local _UDim2 = UDim2.new(LowerValueRatio, LerpModuleResult, 0.5, 0)
	local _UDim2_1 = HasTwoKnobs and UDim2.new(UpperValueRatio, LerpModuleResult1, 0.5, 0) or nil
	local _UDim2_2: UDim2 = HasTwoKnobs and UDim2.fromScale(UpperValueRatio - LowerValueRatio, 1) or UDim2.fromScale(LowerValueRatio, 1)
	local LowerKnobIsSelected1 = p1.state.lowerKnobIsSelected or p1.state.upperKnobIsSelected
	
	return WithSelectionCursorProviderModule(function(p2)
		-- upvalues: RoactModule (upval), RoactGamepadModule (upval), ImageSetComponentModule (upval), p1 (copy), LowerKnobIsSelected1 (copy), _UDim2_2 (copy), HasTwoKnobs (copy), LowerValueRatio (copy), _UDim2 (copy), LowerKnobIsSelected (copy), _UDim2_1 (copy)
		return RoactModule.createElement(RoactGamepadModule.Focusable[ImageSetComponentModule.Button], {
			BackgroundTransparency = 1,
			AnchorPoint = p1.props.anchorPoint,
			Size = UDim2.new(p1.props.width.Scale, p1.props.width.Offset, 0, 36),
			LayoutOrder = p1.props.layoutOrder,
			Position = p1.props.position,
			[RoactModule.Event.InputBegan] = function(_, Input)
				-- upvalues: p1 (upval)
				if not p1.props.isDisabled then
					p1:onInputBegan(Input, false)
					
					return
				end
			end,
			[RoactModule.Ref] = p1.rootRef,
			NextSelectionLeft = LowerKnobIsSelected1 and p1.rootRef or nil,
			NextSelectionRight = LowerKnobIsSelected1 and p1.rootRef or nil,
			NextSelectionUp = if LowerKnobIsSelected1 then p1.rootRef else p1.props.NextSelectionUp or p1.rootRef,
			NextSelectionDown = if LowerKnobIsSelected1 then p1.rootRef else p1.props.NextSelectionDown or p1.rootRef,
			defaultChild = (if p1.props.upperValue == p1.props.min then p1.upperKnobRef else p1.lowerKnobRef or p1.upperKnobRef) or nil,
			onFocusLost = function()
				-- upvalues: p1 (upval)
				if p1.state.lowerKnobIsSelected or p1.state.upperKnobIsSelected then
					p1:setState({ lowerKnobIsSelected = false, upperKnobIsSelected = false })
				end
			end
		}, {
			Track = p1:renderTrack(_UDim2_2, HasTwoKnobs, LowerValueRatio),
			LowerKnob = p1:renderLowerKnob(_UDim2, LowerKnobIsSelected, HasTwoKnobs, p2),
			LowerKnobShadow = p1:renderKnobShadow(p1.props.knobShadowTransparencyLower, _UDim2),
			UpperKnob = p1:renderUpperKnob(_UDim2_1, LowerKnobIsSelected, HasTwoKnobs, p2),
			UpperKnobShadow = HasTwoKnobs and p1:renderKnobShadow(p1.props.knobShadowTransparencyUpper, _UDim2_1) or nil
		})
	end)
end

function GenericSlider.didMount(p1)
	local Current = p1.rootRef.current
	local Connection = nil
	Connection = Current.AncestryChanged:Connect(function()
		-- upvalues: Current (copy), Connection (ref), p1 (copy)
		if Current:IsDescendantOf(game) then
			Connection:Disconnect()
			p1.canUseUserInputService = Current:FindFirstAncestorWhichIsA("PluginGui") == nil
			
			return
		end
	end)
	
	if Current:IsDescendantOf(game) then
		Connection:Disconnect()
		p1.canUseUserInputService = Current:FindFirstAncestorWhichIsA("PluginGui") == nil
	end
end

function GenericSlider.didUpdate(p1, _, State)
	if p1.props.disabled then
		p1:stopListeningForDrag()
	end
	local NoLowerKnobIsSelected: boolean = State.lowerKnobIsSelected and not p1.state.lowerKnobIsSelected
	local NoUpperKnobIsSelected: boolean = State.upperKnobIsSelected and not p1.state.upperKnobIsSelected
	
	if p1.props.onDragEnd ~= nil and (NoLowerKnobIsSelected or NoUpperKnobIsSelected) then
		p1.props.onDragEnd()
		
		return
	end
	if p1.props.onDragStartLower ~= nil and not State.lowerKnobIsSelected and p1.state.lowerKnobIsSelected then
		p1.props.onDragStartLower()
		
		return
	end
	if p1.props.onDragStartUpper ~= nil and not State.upperKnobIsSelected and p1.state.upperKnobIsSelected then
		p1.props.onDragStartUpper()
	end
end

function GenericSlider.willUnmount(p1)
	p1:stopListeningForDrag()
end

function GenericSlider.onInputBegan(p1, Input, p2)
	if p1.props.disabled then return end
	if Input.UserInputState ~= Enum.UserInputState.Begin then return end
	local UserInputType = Input.UserInputType
	
	if UserInputType ~= Enum.UserInputType.MouseButton1 and UserInputType ~= Enum.UserInputType.Touch then return end
	if UserInputType ~= Enum.UserInputType.Touch or p2 then
		p1:processDrag(Input.Position.X)
		p1:startListeningForDrag()
		
		return
	end
end

function GenericSlider.startListeningForDrag(p1)
	-- upvalues: UserInputService (copy)
	local Current = p1.rootRef.current
	
	if Current == nil then return end
	if p1.dragging then return end
	if p1.canUseUserInputService then
		local function Callback(Input)
			-- upvalues: p1 (copy)
			if not p1.dragging then return end
			local UserInputType = Input.UserInputType
			
			if UserInputType ~= Enum.UserInputType.MouseMovement and UserInputType ~= Enum.UserInputType.Touch then return end
			if Input.UserInputState == Enum.UserInputState.Change then
				p1:processDrag(Input.Position.X)
				
				return
			end
		end
		
		if p1.props.containerRef then
			p1.moveConnection = p1.props.containerRef.current.InputChanged:Connect(Callback)
		else
			p1.moveConnection = UserInputService.InputChanged:Connect(Callback)
		end
		p1.releaseConnection = UserInputService.InputEnded:Connect(function(Input)
			-- upvalues: p1 (copy)
			local UserInputType = Input.UserInputType
			
			if UserInputType ~= Enum.UserInputType.MouseButton1 and UserInputType ~= Enum.UserInputType.Touch then return end
			p1:stopListeningForDrag()
			
			if not p1.props.containerRef then
				p1:processOneKnobDrag(Input.Position.X)
			end
		end)
		p1.focusLostConnection = UserInputService.WindowFocusReleased:Connect(function()
			-- upvalues: p1 (copy)
			p1:stopListeningForDrag()
		end)
	else
		local PluginGui = Current:FindFirstAncestorWhichIsA("PluginGui")
		local SliderPluginGuiInputCapturer = Instance.new("ImageButton")
		SliderPluginGuiInputCapturer.BackgroundTransparency = 1
		SliderPluginGuiInputCapturer.Image = ""
		SliderPluginGuiInputCapturer.Name = "SliderPluginGuiInputCapturer"
		SliderPluginGuiInputCapturer.Size = UDim2.new(1, 0, 1, 0)
		SliderPluginGuiInputCapturer.ZIndex = 100000
		p1.moveConnection = SliderPluginGuiInputCapturer.MouseMoved:Connect(function(X)
			-- upvalues: p1 (copy)
			p1:processDrag(X)
		end)
		p1.releaseConnection = SliderPluginGuiInputCapturer.MouseButton1Up:Connect(function(p2)
			-- upvalues: p1 (copy)
			p1:stopListeningForDrag()
			p1:processOneKnobDrag(p2)
		end)
		p1.focusLostConnection = SliderPluginGuiInputCapturer.MouseLeave:Connect(function(X)
			-- upvalues: p1 (copy)
			p1:stopListeningForDrag()
			p1:processOneKnobDrag(X)
		end)
		SliderPluginGuiInputCapturer.Parent = PluginGui
		p1.inputCapturerButton = SliderPluginGuiInputCapturer
	end
	p1.dragging = true
	
	if p1.lowerKnobDrag and p1.props.onDragStartLower ~= nil then
		p1.props.onDragStartLower()
	end
	if p1.upperKnobDrag and p1.props.onDragStartUpper ~= nil then
		p1.props.onDragStartUpper()
	end
end

function GenericSlider.getSteppedValue(p1, p2)
	local Current = p1.rootRef.current
	
	if Current == nil then
		return 0
	else
		local Min = p1.props.min
		local StepInterval = p1.props.stepInterval
		local X: number = Current.AbsoluteSize.X
		
		return math.floor((math.clamp(p2 - Current.AbsolutePosition.X, 0, X) / X * (p1.props.max - Min) + Min) / StepInterval + 0.5) * StepInterval
	end
end

function GenericSlider.processDrag(p1, X)
	if p1:hasTwoKnobs() then
		p1:processTwoKnobDrag(X)
		
		return
	else
		p1:processOneKnobDrag(X)
	end
end

function GenericSlider.processOneKnobDrag(p1, X)
	if p1:hasTwoKnobs() then return end
	local SteppedValue = p1:getSteppedValue(X)
	p1.lowerKnobDrag = true
	
	if SteppedValue ~= p1.props.lowerValue then
		p1.props.onValueChanged(SteppedValue)
	end
end

function GenericSlider.processTwoKnobDrag(p1, p2)
	local SteppedValue = p1:getSteppedValue(p2)
	local LowerValue = p1.props.lowerValue
	local UpperValue = p1.props.upperValue
	
	if p1.lowerKnobDrag or p1.upperKnobDrag then
		if p1.lowerKnobDrag and p1.upperKnobDrag then
			if UpperValue <= SteppedValue - p1.props.stepInterval then
				p1.upperKnobDrag = true
				p1.lowerKnobDrag = false
				UpperValue = SteppedValue
			elseif SteppedValue + p1.props.stepInterval <= LowerValue then
				p1.upperKnobDrag = false
				p1.lowerKnobDrag = true
				LowerValue = SteppedValue
			end
		elseif p1.lowerKnobDrag then
			if SteppedValue <= UpperValue then
				LowerValue = SteppedValue
			end
		elseif p1.upperKnobDrag and LowerValue <= SteppedValue then
			UpperValue = SteppedValue
		end
	else
		if SteppedValue == LowerValue then
			p1.lowerKnobDrag = true
		end
		if SteppedValue == UpperValue then
			p1.upperKnobDrag = true
		end
	end
	if UpperValue ~= p1.props.upperValue or LowerValue ~= p1.props.lowerValue then
		p1.props.onValueChanged(LowerValue, UpperValue)
	end
end

function GenericSlider.stopListeningForDrag(p1)
	if p1.moveConnection ~= nil then
		p1.moveConnection:Disconnect()
		p1.moveConnection = nil
	end
	if p1.releaseConnection ~= nil then
		p1.releaseConnection:Disconnect()
		p1.releaseConnection = nil
	end
	if p1.focusLostConnection ~= nil then
		p1.focusLostConnection:Disconnect()
		p1.focusLostConnection = nil
	end
	if p1.inputCapturerButton ~= nil then
		p1.inputCapturerButton:Destroy()
		p1.inputCapturerButton = nil
	end
	p1.dragging = false
	p1.lowerKnobDrag = false
	p1.upperKnobDrag = false
	
	if p1.props.onDragEnd ~= nil then
		p1.props.onDragEnd()
	end
end

function GenericSlider.hasTwoKnobs(p1): boolean
	return p1.props.upperValue ~= nil
end

return RoactModule.forwardRef(function(p1, ImageButtonRef)
	-- upvalues: UseCursorByTypeModule (copy), CursorTypeModule (copy), CryoModule (copy), RoactModule (copy), GenericSlider (copy)
	return RoactModule.createElement(GenericSlider, CryoModule.Dictionary.join(CryoModule.Dictionary.join(p1, {
		selectedCursor = UseCursorByTypeModule(CursorTypeModule.SelectedKnob),
		unselectedCursor = UseCursorByTypeModule(CursorTypeModule.UnselectedKnob)
	}), { imageButtonRef = ImageButtonRef }))
end)