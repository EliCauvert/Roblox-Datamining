local userInputService = game:GetService("UserInputService")
local parent = script.Parent.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local cryoModule = require(parent_2.Cryo)
local tModule = require(parent_2.t)
local roactGamepadModule = require(parent_2.RoactGamepad)
local imageSetComponentModule = require(parent.ImageSet.ImageSetComponent)
local useCursorByTypeModule = require(parent_1.App.SelectionCursor.useCursorByType)
local cursorTypeModule = require(parent_1.App.SelectionCursor.CursorType)
local lerpModule = require(parent_1.Utility.lerp)
local withSelectionCursorProviderModule = require(parent_1.App.SelectionImage.withSelectionCursorProvider)
local genericSlider = roactModule.PureComponent:extend("GenericSlider")
genericSlider.validateProps = tModule.strictInterface({
	lowerValue = tModule.number,
	upperValue = tModule.optional(tModule.number),
	min = tModule.number,
	max = tModule.number,
	stepInterval = tModule.numberPositive,
	isDisabled = tModule.optional(tModule.boolean),
	onValueChanged = tModule.callback,
	onDragStartLower = tModule.optional(tModule.callback),
	onDragStartUpper = tModule.optional(tModule.callback),
	onDragEnd = tModule.optional(tModule.callback),
	trackImage = tModule.union(tModule.string, tModule.table),
	trackColor = tModule.union(tModule.Color3, tModule.table),
	trackTransparency = tModule.union(tModule.number, tModule.table),
	trackSliceCenter = tModule.optional(tModule.Rect),
	trackFillImage = tModule.union(tModule.string, tModule.table),
	trackFillColor = tModule.union(tModule.Color3, tModule.table),
	trackFillTransparency = tModule.union(tModule.number, tModule.table),
	trackFillSliceCenter = tModule.optional(tModule.Rect),
	knobImage = tModule.union(tModule.string, tModule.table),
	knobColorLower = tModule.union(tModule.Color3, tModule.table),
	knobColorUpper = tModule.optional(tModule.union(tModule.Color3, tModule.table)),
	knobTransparency = tModule.union(tModule.number, tModule.table),
	knobImagePadding = tModule.optional(tModule.numberMin(0)),
	knobShadowImage = tModule.union(tModule.string, tModule.table),
	knobShadowTransparencyLower = tModule.union(tModule.number, tModule.table),
	knobShadowTransparencyUpper = tModule.optional(tModule.union(tModule.number, tModule.table)),
	width = tModule.optional(tModule.UDim),
	position = tModule.optional(tModule.UDim2),
	anchorPoint = tModule.optional(tModule.Vector2),
	layoutOrder = tModule.optional(tModule.integer),
	imageButtonRef = tModule.optional(tModule.table),
	NextSelectionUp = tModule.optional(tModule.table),
	NextSelectionDown = tModule.optional(tModule.table),
	focusController = tModule.optional(tModule.table),
	containerRef = tModule.optional(tModule.table),
	customTrack = tModule.optional(tModule.table),
	customKnobHeight = tModule.optional(tModule.number),
	customKnobBorderColor = tModule.optional(tModule.Color3),
	customKnobBorderSize = tModule.optional(tModule.number),
	selectedCursor = tModule.table,
	unselectedCursor = tModule.table
})
genericSlider.defaultProps = {
	knobImagePadding = 0,
	width = UDim.new(1, 0),
	customKnobBorderColor = Color3.new(0, 0, 0)
}

function genericSlider.init(p0)
	-- upvalues: roactModule (ref)
	p0.rootRef = p0.props.imageButtonRef or roactModule.createRef()
	p0.lowerKnobRef = roactModule.createRef()
	p0.upperKnobRef = roactModule.createRef()
	p0.moveDirection = 0
	p0.lowerKnobDrag = false
	p0.upperKnobDrag = false
	p0.totalMoveTime = 0
	p0.isFirstMove = true
	p0.unhandledTime = 0
	p0.state = { lowerKnobIsSelected = false, upperKnobIsSelected = false }
end

function genericSlider.getKnobVisibleHeight(p1)
	return if p1.props.customKnobHeight then (44 - p1.props.knobImagePadding * 2) / 44 * p1.props.customKnobHeight else 44 - p1.props.knobImagePadding * 2
end

function genericSlider.getKnobHeight(p2)
	return if p2.props.customKnobHeight then 44 / (44 - p2.props.knobImagePadding * 2) * p2.props.customKnobHeight else 44
end

function genericSlider.onMoveStep(p3, p4, p5)
	if not p3.state.lowerKnobIsSelected and not p3.state.upperKnobIsSelected then return end
	local var13, var14, var15
	local position = p4[Enum.KeyCode.Thumbstick1].Position
	local var11 = position.Magnitude > 0.2
	local var12 = 0
	local _ = nil
	local _ = nil
	local _ = nil
	p3.totalMoveTime += p5
	
	if var11 then
		var13 = if position.x > 0 then 1 else -1
		var14 = 0.2
		var15 = 12
	else
		var13 = (if p4[Enum.KeyCode.DPadLeft].UserInputState == Enum.UserInputState.Begin then -1 else 0) + (if p4[Enum.KeyCode.DPadRight].UserInputState == Enum.UserInputState.Begin then 1 else 0)
		var14 = 0.5
		var15 = 8
	end
	if var13 == 0 then
		p3.totalMoveTime = 0
		p3.isFirstMove = true
	elseif p3.isFirstMove then
		p3.isFirstMove = false
		p3.totalMoveTime = 0
		p3.unhandledTime = 0
		var12 = 1
	elseif var14 < p3.totalMoveTime then
		local var16 = p5 - math.max(var14 - p3.totalMoveTime - p5, 0) + p3.unhandledTime
		var12 = math.floor(var15 * var16)
		p3.unhandledTime = var16 - var12 / var15
	else
		var12 = 0
		p3.unhandledTime = 0
	end
	if var12 > 0 then
		p3:processGamepadInput(var13, var12)
	end
end

function genericSlider.processGamepadInput(p6, p7, p8)
	if p6:hasTwoKnobs() then
		p6:processTwoKnobGamepadInput(p7, p8)
		
		return
	end
	p6:processOneKnobGamepadInput(p7, p8)
end

function genericSlider.processTwoKnobGamepadInput(p9, p10, p11)
	local var17 = p9.props.stepInterval * p10
	local lowerValue = p9.props.lowerValue
	local upperValue = p9.props.upperValue
	
	if lowerValue == upperValue and not p9.state.processingGamepad then
		if p9.state.lowerKnobIsSelected and p10 == 1 and lowerValue ~= p9.props.max then
			p9:setState({
				lowerKnobIsSelected = false,
				upperKnobIsSelected = true,
				processingGamepad = true
			})
			p9.props.focusController.moveFocusTo(p9.upperKnobRef)
		elseif p9.state.upperKnobIsSelected and p10 == -1 and upperValue ~= p9.props.min then
			p9:setState({
				lowerKnobIsSelected = true,
				upperKnobIsSelected = false,
				processingGamepad = true
			})
			p9.props.focusController.moveFocusTo(p9.lowerKnobRef)
		end
	elseif not p9.state.processingGamepad then
		p9:setState({ processingGamepad = true })
	end
	if p9.state.lowerKnobIsSelected then
		local maxValue = math.max(math.min(lowerValue + var17 * p11, p9.props.max), p9.props.min)
		lowerValue = if maxValue <= upperValue then maxValue else upperValue
	elseif p9.state.upperKnobIsSelected then
		local maxValue = math.max(math.min(upperValue + var17 * p11, p9.props.max), p9.props.min)
		upperValue = if lowerValue <= maxValue then maxValue else lowerValue
	end
	if upperValue ~= p9.props.upperValue or lowerValue ~= p9.props.lowerValue then
		p9.props.onValueChanged(lowerValue, upperValue)
	end
end

function genericSlider.processOneKnobGamepadInput(p12, p13, p14)
	local var20 = p12.props.stepInterval * p13
	local lowerValue = p12.props.lowerValue
	
	if p12.state.lowerKnobIsSelected then
		lowerValue = math.max(math.min(lowerValue + var20 * p14, p12.props.max), p12.props.min)
	end
	if lowerValue ~= p12.props.lowerValue then
		p12.props.onValueChanged(lowerValue)
	end
end

function genericSlider.renderTrack(p15, p16, p17, p18)
	-- upvalues: roactModule (ref), imageSetComponentModule (ref)
	return if p15.props.customTrack then p15.props.customTrack else roactModule.createElement(imageSetComponentModule.Label, {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		ImageColor3 = p15.props.trackColor,
		ImageTransparency = p15.props.trackTransparency,
		Image = p15.props.trackImage,
		Size = UDim2.new(1, 0, 0, 4),
		Position = UDim2.fromScale(0.5, 0.5),
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = p15.props.trackSliceCenter
	}, {
		TrackFill = roactModule.createElement(imageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			ImageColor3 = p15.props.trackFillColor,
			ImageTransparency = p15.props.trackFillTransparency,
			Image = p15.props.trackFillImage,
			Size = p16,
			Position = p17 and UDim2.new(p18, 0, 0, 0) or UDim2.new(0, 0, 0, 0),
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = p15.props.trackFillSliceCenter
		})
	})
end

function genericSlider.wrapKnobWithBorder(p19, p20, p21)
	-- upvalues: roactModule (ref)
	local var21 = if p19.props.customKnobHeight then p19.props.customKnobHeight else p19:getKnobVisibleHeight()
	
	return roactModule.createElement("Frame", {
		ZIndex = 3,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.fromOffset(var21, var21),
		Position = p21,
		BackgroundColor3 = p19.props.customKnobBorderColor
	}, {
		UICorner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
		KnobContent = p20
	})
end

function genericSlider.renderUpperKnob(p22, p23, p24, p25, _)
	-- upvalues: roactModule (ref), roactGamepadModule (ref), imageSetComponentModule (ref)
	if not p25 then
		return nil
	end
	local knobHeight = p22:getKnobHeight()
	local var23 = p23
	
	if p22.props.customKnobBorderSize and p22.props.customKnobBorderSize > 0 then
		knobHeight -= 2 * (p22.props.customKnobBorderSize + 2)
		var23 = UDim2.fromScale(0.5, 0.5)
	end
	local lowerKnobRef
	local createElement = roactModule.createElement
	local button = roactGamepadModule.Focusable[imageSetComponentModule.Button]
	local t = {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		ImageColor3 = p22.props.knobColorUpper,
		ImageTransparency = p22.props.knobTransparency,
		Image = p22.props.knobImage,
		Size = UDim2.fromOffset(knobHeight, knobHeight),
		Position = var23,
		ZIndex = 3
	}
	
	if not p24 and p22.props.upperValue ~= p22.props.lowerValue then
		lowerKnobRef = p22.lowerKnobRef or nil
	end
	t.NextSelectionLeft = lowerKnobRef
	t.NextSelectionRight = if p24 then p22.upperKnobRef else nil
	t.NextSelectionUp = if p24 then p22.upperKnobRef else nil
	t.NextSelectionDown = if p24 then p22.upperKnobRef else nil
	t.SelectionImageObject = if p24 then p22.props.selectedCursor else p22.props.unselectedCursor
	t[roactModule.Ref] = p22.upperKnobRef
	
	t[roactModule.Event.InputBegan] = function(_, p26)
		-- upvalues: p22 (ref)
		if p22.props.isDisabled then
			return
		end
		p22:onInputBegan(p26, true)
	end
	
	t.inputBindings = {
		OnMoveStep = roactGamepadModule.Input.onMoveStep(function(p27, p28)
			-- upvalues: p22 (ref)
			p22:onMoveStep(p27, p28)
		end),
		SelectUpperKnob = roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, function()
			-- upvalues: p22 (ref)
			p22:setState(function(p29)
				return {
					processingGamepad = false,
					upperKnobIsSelected = not p29.upperKnobIsSelected
				}
			end)
		end),
		UnselectUpperKnob = p24 and roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonB, function()
			-- upvalues: p22 (ref)
			p22:setState({ upperKnobIsSelected = false, processingGamepad = false })
		end) or nil
	}
	createElement = createElement(button, t)
	
	return if p22.props.customKnobBorderSize and p22.props.customKnobBorderSize > 0 then p22:wrapKnobWithBorder(createElement, p23) else createElement
end

function genericSlider.renderLowerKnob(p30, p31, p32, p33, _)
	-- upvalues: roactModule (ref), roactGamepadModule (ref), imageSetComponentModule (ref)
	local knobHeight = p30:getKnobHeight()
	local var27 = p31
	
	if p30.props.customKnobBorderSize and p30.props.customKnobBorderSize > 0 then
		knobHeight -= 2 * (p30.props.customKnobBorderSize + 2)
		var27 = UDim2.fromScale(0.5, 0.5)
	end
	local upperKnobRef
	local createElement = roactModule.createElement
	local button = roactGamepadModule.Focusable[imageSetComponentModule.Button]
	local t = {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		ImageColor3 = p30.props.knobColorLower,
		ImageTransparency = p30.props.knobTransparency,
		Image = p30.props.knobImage,
		Size = UDim2.fromOffset(knobHeight, knobHeight),
		Position = var27,
		ZIndex = 3,
		inputBindings = {
			OnMoveStep = roactGamepadModule.Input.onMoveStep(function(p34, p35)
				-- upvalues: p30 (ref)
				p30:onMoveStep(p34, p35)
			end),
			SelectLowerKnob = roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, function()
				-- upvalues: p30 (ref)
				p30:setState(function(p36)
					return {
						processingGamepad = false,
						lowerKnobIsSelected = not p36.lowerKnobIsSelected
					}
				end)
			end),
			UnselectLowerKnob = p32 and roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonB, function()
				-- upvalues: p30 (ref)
				p30:setState({ lowerKnobIsSelected = false, processingGamepad = false })
			end) or nil
		},
		NextSelectionLeft = if p32 then p30.lowerKnobRef else nil
	}
	
	if p33 and not p32 and p30.props.upperValue ~= p30.props.lowerValue then
		upperKnobRef = p30.upperKnobRef or nil
	end
	t.NextSelectionRight = upperKnobRef
	t.NextSelectionUp = if p32 then p30.lowerKnobRef else nil
	t.NextSelectionDown = if p32 then p30.lowerKnobRef else nil
	t.SelectionImageObject = if p32 then p30.props.selectedCursor else p30.props.unselectedCursor
	t[roactModule.Ref] = p30.lowerKnobRef
	
	t[roactModule.Event.InputBegan] = function(_, p37)
		-- upvalues: p30 (ref)
		if p30.props.isDisabled then
			return
		end
		p30:onInputBegan(p37, true)
	end
	
	createElement = createElement(button, t)
	
	return if p30.props.customKnobBorderSize and p30.props.customKnobBorderSize > 0 then p30:wrapKnobWithBorder(createElement, p31) else createElement
end

function genericSlider.renderKnobShadow(p38, p39, p40)
	-- upvalues: roactModule (ref), imageSetComponentModule (ref)
	return roactModule.createElement(imageSetComponentModule.Label, {
		BackgroundTransparency = 1,
		ZIndex = 2,
		AnchorPoint = Vector2.new(0.5, 0.5),
		ImageTransparency = p39,
		Image = p38.props.knobShadowImage,
		Size = UDim2.fromOffset(p38:getKnobHeight(), p38:getKnobHeight()),
		Position = p40
	})
end

function genericSlider.render(p41)
	-- upvalues: lerpModule (ref), withSelectionCursorProviderModule (ref), roactModule (ref), roactGamepadModule (ref), imageSetComponentModule (ref)
	local lowerKnobIsSelected = p41.state.lowerKnobIsSelected or p41.state.upperKnobIsSelected
	local var31 = p41:hasTwoKnobs()
	local var32 = (p41.props.lowerValue - p41.props.min) / (p41.props.max - p41.props.min)
	local var33 = if var31 then (p41.props.upperValue - p41.props.min) / (p41.props.max - p41.props.min) else nil
	local knobVisibleHeight = p41:getKnobVisibleHeight()
	local uDim2 = UDim2.new(var32, lerpModule(knobVisibleHeight / 2, -knobVisibleHeight / 2, var32), 0.5, 0)
	local var36 = var31 and UDim2.new(var33, var31 and lerpModule(knobVisibleHeight / 2, -knobVisibleHeight / 2, var33) or nil, 0.5, 0) or nil
	local var37 = var31 and UDim2.fromScale(var33 - var32, 1) or UDim2.fromScale(var32, 1)
	local lowerKnobIsSelected_1 = p41.state.lowerKnobIsSelected or p41.state.upperKnobIsSelected
	
	return withSelectionCursorProviderModule(function(p42)
		-- upvalues: roactModule (copy), roactGamepadModule (copy), imageSetComponentModule (copy), p41 (ref), lowerKnobIsSelected_1 (ref), var37 (ref), var31 (ref), var32 (ref), uDim2 (ref), lowerKnobIsSelected (ref), var36 (ref)
		return roactModule.createElement(roactGamepadModule.Focusable[imageSetComponentModule.Button], {
			BackgroundTransparency = 1,
			AnchorPoint = p41.props.anchorPoint,
			Size = UDim2.new(p41.props.width.Scale, p41.props.width.Offset, 0, 36),
			LayoutOrder = p41.props.layoutOrder,
			Position = p41.props.position,
			[roactModule.Event.InputBegan] = function(_, p43)
				-- upvalues: p41 (copy)
				if p41.props.isDisabled then
					return
				end
				p41:onInputBegan(p43, false)
			end,
			[roactModule.Ref] = p41.rootRef,
			NextSelectionLeft = if lowerKnobIsSelected_1 then p41.rootRef else nil,
			NextSelectionRight = if lowerKnobIsSelected_1 then p41.rootRef else nil,
			NextSelectionUp = if not lowerKnobIsSelected_1 then p41.props.NextSelectionUp else p41.rootRef,
			NextSelectionDown = if not lowerKnobIsSelected_1 then p41.props.NextSelectionDown else p41.rootRef,
			defaultChild = if p41.props.upperValue ~= p41.props.min then p41.lowerKnobRef else p41.upperKnobRef or nil,
			onFocusLost = function()
				-- upvalues: p41 (copy)
				if p41.state.lowerKnobIsSelected or p41.state.upperKnobIsSelected then
					p41:setState({ lowerKnobIsSelected = false, upperKnobIsSelected = false })
				end
			end
		}, {
			Track = p41:renderTrack(var37, var31, var32),
			LowerKnob = p41:renderLowerKnob(uDim2, lowerKnobIsSelected, var31, p42),
			LowerKnobShadow = p41:renderKnobShadow(p41.props.knobShadowTransparencyLower, uDim2),
			UpperKnob = p41:renderUpperKnob(var36, lowerKnobIsSelected, var31, p42),
			UpperKnobShadow = var31 and p41:renderKnobShadow(p41.props.knobShadowTransparencyUpper, var36) or nil
		})
	end)
end

function genericSlider.didMount(p44)
	local current = p44.rootRef.current
	local ancestryChangedConnection = nil
	ancestryChangedConnection = current.AncestryChanged:Connect(function()
		-- upvalues: current (ref), ancestryChangedConnection (write), p44 (ref)
		if current:IsDescendantOf(game) then
			ancestryChangedConnection:Disconnect()
			p44.canUseUserInputService = current:FindFirstAncestorWhichIsA("PluginGui") == nil
			
			return
		end
	end)
	
	if current:IsDescendantOf(game) then
		ancestryChangedConnection:Disconnect()
		p44.canUseUserInputService = current:FindFirstAncestorWhichIsA("PluginGui") == nil
	end
end

function genericSlider.didUpdate(p45, _, p46)
	if p45.props.disabled then
		p45:stopListeningForDrag()
	end
	if p45.props.onDragEnd ~= nil and (p46.lowerKnobIsSelected and not p45.state.lowerKnobIsSelected or p46.upperKnobIsSelected and not p45.state.upperKnobIsSelected) then
		p45.props.onDragEnd()
		
		return
	elseif p45.props.onDragStartLower ~= nil and not p46.lowerKnobIsSelected and p45.state.lowerKnobIsSelected then
		p45.props.onDragStartLower()
		
		return
	elseif p45.props.onDragStartUpper ~= nil and not p46.upperKnobIsSelected and p45.state.upperKnobIsSelected then
		p45.props.onDragStartUpper()
	end
end

function genericSlider.willUnmount(p47)
	p47:stopListeningForDrag()
end

function genericSlider.onInputBegan(p48, p49, p50)
	if p48.props.disabled then return end
	if p49.UserInputState ~= Enum.UserInputState.Begin then return end
	local userInputType = p49.UserInputType
	
	if userInputType ~= Enum.UserInputType.MouseButton1 and userInputType ~= Enum.UserInputType.Touch then return end
	if userInputType == Enum.UserInputType.Touch and not p50 then
		return
	end
	p48:processDrag(p49.Position.X)
	p48:startListeningForDrag()
end

function genericSlider.startListeningForDrag(p51)
	-- upvalues: userInputService (ref)
	local current = p51.rootRef.current
	
	if current == nil then return end
	if p51.dragging then return end
	if p51.canUseUserInputService then
		local var40 = function(p52)
			-- upvalues: p51 (ref)
			if not p51.dragging then return end
			local userInputType = p52.UserInputType
			
			if userInputType ~= Enum.UserInputType.MouseMovement and userInputType ~= Enum.UserInputType.Touch then return end
			if p52.UserInputState == Enum.UserInputState.Change then
				p51:processDrag(p52.Position.X)
				
				return
			end
		end
		
		if p51.props.containerRef then
			p51.moveConnection = p51.props.containerRef.current.InputChanged:Connect(var40)
		else
			p51.moveConnection = userInputService.InputChanged:Connect(var40)
		end
		p51.releaseConnection = userInputService.InputEnded:Connect(function(p53)
			-- upvalues: p51 (ref)
			local userInputType = p53.UserInputType
			
			if userInputType ~= Enum.UserInputType.MouseButton1 and userInputType ~= Enum.UserInputType.Touch then return end
			p51:stopListeningForDrag()
			
			if not p51.props.containerRef then
				p51:processOneKnobDrag(p53.Position.X)
			end
		end)
		p51.focusLostConnection = userInputService.WindowFocusReleased:Connect(function()
			-- upvalues: p51 (ref)
			p51:stopListeningForDrag()
		end)
	else
		local pluginGui = current:FindFirstAncestorWhichIsA("PluginGui")
		local sliderPluginGuiInputCapturer = Instance.new("ImageButton")
		sliderPluginGuiInputCapturer.BackgroundTransparency = 1
		sliderPluginGuiInputCapturer.Image = ""
		sliderPluginGuiInputCapturer.Name = "SliderPluginGuiInputCapturer"
		sliderPluginGuiInputCapturer.Size = UDim2.new(1, 0, 1, 0)
		sliderPluginGuiInputCapturer.ZIndex = 100000
		p51.moveConnection = sliderPluginGuiInputCapturer.MouseMoved:Connect(function(p54)
			-- upvalues: p51 (ref)
			p51:processDrag(p54)
		end)
		p51.releaseConnection = sliderPluginGuiInputCapturer.MouseButton1Up:Connect(function(p55)
			-- upvalues: p51 (ref)
			p51:stopListeningForDrag()
			p51:processOneKnobDrag(p55)
		end)
		p51.focusLostConnection = sliderPluginGuiInputCapturer.MouseLeave:Connect(function(p56)
			-- upvalues: p51 (ref)
			p51:stopListeningForDrag()
			p51:processOneKnobDrag(p56)
		end)
		sliderPluginGuiInputCapturer.Parent = pluginGui
		p51.inputCapturerButton = sliderPluginGuiInputCapturer
	end
	p51.dragging = true
	
	if p51.lowerKnobDrag and p51.props.onDragStartLower ~= nil then
		p51.props.onDragStartLower()
	end
	if p51.upperKnobDrag and p51.props.onDragStartUpper ~= nil then
		p51.props.onDragStartUpper()
	end
end

function genericSlider.getSteppedValue(p57, p58)
	local current = p57.rootRef.current
	
	if current == nil then
		return 0
	end
	local min = p57.props.min
	local max = p57.props.max
	local stepInterval = p57.props.stepInterval
	local x = current.AbsoluteSize.X
	
	return math.floor((math.clamp(p58 - current.AbsolutePosition.X, 0, x) / x * (max - min) + min) / stepInterval + 0.5) * stepInterval
end

function genericSlider.processDrag(p59, p60)
	if p59:hasTwoKnobs() then
		p59:processTwoKnobDrag(p60)
		
		return
	end
	p59:processOneKnobDrag(p60)
end

function genericSlider.processOneKnobDrag(p61, p62)
	if p61:hasTwoKnobs() then return end
	local var43 = p61:getSteppedValue(p62)
	p61.lowerKnobDrag = true
	
	if var43 ~= p61.props.lowerValue then
		p61.props.onValueChanged(var43)
	end
end

function genericSlider.processTwoKnobDrag(p63, p64)
	local var44 = p63:getSteppedValue(p64)
	local lowerValue = p63.props.lowerValue
	local upperValue = p63.props.upperValue
	
	if not p63.lowerKnobDrag and not p63.upperKnobDrag then
		if var44 == lowerValue then
			p63.lowerKnobDrag = true
		end
		if var44 == upperValue then
			p63.upperKnobDrag = true
		end
	elseif p63.lowerKnobDrag and p63.upperKnobDrag then
		if upperValue <= var44 - p63.props.stepInterval then
			p63.upperKnobDrag = true
			p63.lowerKnobDrag = false
			upperValue = var44
		elseif var44 + p63.props.stepInterval <= lowerValue then
			p63.upperKnobDrag = false
			p63.lowerKnobDrag = true
			lowerValue = var44
		end
	elseif p63.lowerKnobDrag then
		if var44 <= upperValue then
			lowerValue = var44
		end
	elseif p63.upperKnobDrag and lowerValue <= var44 then
		upperValue = var44
	end
	if upperValue ~= p63.props.upperValue or lowerValue ~= p63.props.lowerValue then
		p63.props.onValueChanged(lowerValue, upperValue)
	end
end

function genericSlider.stopListeningForDrag(p65)
	if p65.moveConnection ~= nil then
		p65.moveConnection:Disconnect()
		p65.moveConnection = nil
	end
	if p65.releaseConnection ~= nil then
		p65.releaseConnection:Disconnect()
		p65.releaseConnection = nil
	end
	if p65.focusLostConnection ~= nil then
		p65.focusLostConnection:Disconnect()
		p65.focusLostConnection = nil
	end
	if p65.inputCapturerButton ~= nil then
		p65.inputCapturerButton:Destroy()
		p65.inputCapturerButton = nil
	end
	p65.dragging = false
	p65.lowerKnobDrag = false
	p65.upperKnobDrag = false
	
	if p65.props.onDragEnd ~= nil then
		p65.props.onDragEnd()
	end
end

function genericSlider.hasTwoKnobs(p66)
	return p66.props.upperValue ~= nil
end

return roactModule.forwardRef(function(p67, p68)
	-- upvalues: useCursorByTypeModule (ref), cursorTypeModule (ref), cryoModule (ref), roactModule (ref), genericSlider (ref)
	return roactModule.createElement(genericSlider, cryoModule.Dictionary.join(cryoModule.Dictionary.join(p67, {
		selectedCursor = useCursorByTypeModule(cursorTypeModule.SelectedKnob),
		unselectedCursor = useCursorByTypeModule(cursorTypeModule.UnselectedKnob)
	}), { imageButtonRef = p68 }))
end)