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

function genericSlider.init(p1)
	-- upvalues: roactModule (ref)
	p1.rootRef = p1.props.imageButtonRef or roactModule.createRef()
	p1.lowerKnobRef = roactModule.createRef()
	p1.upperKnobRef = roactModule.createRef()
	p1.moveDirection = 0
	p1.lowerKnobDrag = false
	p1.upperKnobDrag = false
	p1.totalMoveTime = 0
	p1.isFirstMove = true
	p1.unhandledTime = 0
	p1.state = { lowerKnobIsSelected = false, upperKnobIsSelected = false }
end

function genericSlider.getKnobVisibleHeight(p1)
	return if p1.props.customKnobHeight then (44 - p1.props.knobImagePadding * 2) / 44 * p1.props.customKnobHeight else 44 - p1.props.knobImagePadding * 2
end

function genericSlider.getKnobHeight(p1)
	return if p1.props.customKnobHeight then 44 / (44 - p1.props.knobImagePadding * 2) * p1.props.customKnobHeight else 44
end

function genericSlider.onMoveStep(p1, p2, p3)
	if not p1.state.lowerKnobIsSelected and not p1.state.upperKnobIsSelected then return end
	local var1, var2, var3
	local position = p2[Enum.KeyCode.Thumbstick1].Position
	local var4 = position.Magnitude > 0.2
	local var5 = 0
	local _ = nil
	local _ = nil
	local _ = nil
	p1.totalMoveTime += p3
	
	if var4 then
		var1 = if position.x > 0 then 1 else -1
		var2 = 0.2
		var3 = 12
	else
		var1 = (if p2[Enum.KeyCode.DPadLeft].UserInputState == Enum.UserInputState.Begin then -1 else 0) + (if p2[Enum.KeyCode.DPadRight].UserInputState == Enum.UserInputState.Begin then 1 else 0)
		var2 = 0.5
		var3 = 8
	end
	if var1 == 0 then
		p1.totalMoveTime = 0
		p1.isFirstMove = true
	elseif p1.isFirstMove then
		p1.isFirstMove = false
		p1.totalMoveTime = 0
		p1.unhandledTime = 0
		var5 = 1
	elseif var2 < p1.totalMoveTime then
		local var6 = p3 - math.max(var2 - p1.totalMoveTime - p3, 0) + p1.unhandledTime
		var5 = math.floor(var3 * var6)
		p1.unhandledTime = var6 - var5 / var3
	else
		var5 = 0
		p1.unhandledTime = 0
	end
	if var5 > 0 then
		p1:processGamepadInput(var1, var5)
	end
end

function genericSlider.processGamepadInput(p1, p2, p3)
	if p1:hasTwoKnobs() then
		p1:processTwoKnobGamepadInput(p2, p3)
		
		return
	end
	p1:processOneKnobGamepadInput(p2, p3)
end

function genericSlider.processTwoKnobGamepadInput(p1, p2, p3)
	local var1 = p1.props.stepInterval * p2
	local lowerValue = p1.props.lowerValue
	local upperValue = p1.props.upperValue
	
	if lowerValue == upperValue and not p1.state.processingGamepad then
		if p1.state.lowerKnobIsSelected and p2 == 1 and lowerValue ~= p1.props.max then
			p1:setState({
				lowerKnobIsSelected = false,
				upperKnobIsSelected = true,
				processingGamepad = true
			})
			p1.props.focusController.moveFocusTo(p1.upperKnobRef)
		elseif p1.state.upperKnobIsSelected and p2 == -1 and upperValue ~= p1.props.min then
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
		local maxValue = math.max(math.min(lowerValue + var1 * p3, p1.props.max), p1.props.min)
		lowerValue = if maxValue <= upperValue then maxValue else upperValue
	elseif p1.state.upperKnobIsSelected then
		local maxValue = math.max(math.min(upperValue + var1 * p3, p1.props.max), p1.props.min)
		upperValue = if lowerValue <= maxValue then maxValue else lowerValue
	end
	if upperValue ~= p1.props.upperValue or lowerValue ~= p1.props.lowerValue then
		p1.props.onValueChanged(lowerValue, upperValue)
	end
end

function genericSlider.processOneKnobGamepadInput(p1, p2, p3)
	local var1 = p1.props.stepInterval * p2
	local lowerValue = p1.props.lowerValue
	
	if p1.state.lowerKnobIsSelected then
		lowerValue = math.max(math.min(lowerValue + var1 * p3, p1.props.max), p1.props.min)
	end
	if lowerValue ~= p1.props.lowerValue then
		p1.props.onValueChanged(lowerValue)
	end
end

function genericSlider.renderTrack(p1, p2, p3, p4)
	-- upvalues: roactModule (ref), imageSetComponentModule (ref)
	return if p1.props.customTrack then p1.props.customTrack else roactModule.createElement(imageSetComponentModule.Label, {
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
		TrackFill = roactModule.createElement(imageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			ImageColor3 = p1.props.trackFillColor,
			ImageTransparency = p1.props.trackFillTransparency,
			Image = p1.props.trackFillImage,
			Size = p2,
			Position = p3 and UDim2.new(p4, 0, 0, 0) or UDim2.new(0, 0, 0, 0),
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = p1.props.trackFillSliceCenter
		})
	})
end

function genericSlider.wrapKnobWithBorder(p1, p2, p3)
	-- upvalues: roactModule (ref)
	local var1 = if p1.props.customKnobHeight then p1.props.customKnobHeight else p1:getKnobVisibleHeight()
	
	return roactModule.createElement("Frame", {
		ZIndex = 3,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.fromOffset(var1, var1),
		Position = p3,
		BackgroundColor3 = p1.props.customKnobBorderColor
	}, {
		UICorner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
		KnobContent = p2
	})
end

function genericSlider.renderUpperKnob(p1, p2, p3, p4, _)
	-- upvalues: roactModule (ref), roactGamepadModule (ref), imageSetComponentModule (ref)
	if not p4 then
		return nil
	end
	local knobHeight = p1:getKnobHeight()
	local var1 = p2
	
	if p1.props.customKnobBorderSize and p1.props.customKnobBorderSize > 0 then
		knobHeight -= 2 * (p1.props.customKnobBorderSize + 2)
		var1 = UDim2.fromScale(0.5, 0.5)
	end
	local lowerKnobRef
	local createElement = roactModule.createElement
	local button = roactGamepadModule.Focusable[imageSetComponentModule.Button]
	local t = {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		ImageColor3 = p1.props.knobColorUpper,
		ImageTransparency = p1.props.knobTransparency,
		Image = p1.props.knobImage,
		Size = UDim2.fromOffset(knobHeight, knobHeight),
		Position = var1,
		ZIndex = 3
	}
	
	if not p3 and p1.props.upperValue ~= p1.props.lowerValue then
		lowerKnobRef = p1.lowerKnobRef or nil
	end
	t.NextSelectionLeft = lowerKnobRef
	t.NextSelectionRight = if p3 then p1.upperKnobRef else nil
	t.NextSelectionUp = if p3 then p1.upperKnobRef else nil
	t.NextSelectionDown = if p3 then p1.upperKnobRef else nil
	t.SelectionImageObject = if p3 then p1.props.selectedCursor else p1.props.unselectedCursor
	t[roactModule.Ref] = p1.upperKnobRef
	
	t[roactModule.Event.InputBegan] = function(_, p5)
		-- upvalues: p1 (ref)
		if p1.props.isDisabled then
			return
		end
		p1:onInputBegan(p5, true)
	end
	
	t.inputBindings = {
		OnMoveStep = roactGamepadModule.Input.onMoveStep(function(p5, p6)
			-- upvalues: p1 (ref)
			p1:onMoveStep(p5, p6)
		end),
		SelectUpperKnob = roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, function()
			-- upvalues: p1 (ref)
			p1:setState(function(p5)
				return {
					processingGamepad = false,
					upperKnobIsSelected = not p5.upperKnobIsSelected
				}
			end)
		end),
		UnselectUpperKnob = p3 and roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonB, function()
			-- upvalues: p1 (ref)
			p1:setState({ upperKnobIsSelected = false, processingGamepad = false })
		end) or nil
	}
	createElement = createElement(button, t)
	
	return if p1.props.customKnobBorderSize and p1.props.customKnobBorderSize > 0 then p1:wrapKnobWithBorder(createElement, p2) else createElement
end

function genericSlider.renderLowerKnob(p1, p2, p3, p4, _)
	-- upvalues: roactModule (ref), roactGamepadModule (ref), imageSetComponentModule (ref)
	local knobHeight = p1:getKnobHeight()
	local var1 = p2
	
	if p1.props.customKnobBorderSize and p1.props.customKnobBorderSize > 0 then
		knobHeight -= 2 * (p1.props.customKnobBorderSize + 2)
		var1 = UDim2.fromScale(0.5, 0.5)
	end
	local upperKnobRef
	local createElement = roactModule.createElement
	local button = roactGamepadModule.Focusable[imageSetComponentModule.Button]
	local t = {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		ImageColor3 = p1.props.knobColorLower,
		ImageTransparency = p1.props.knobTransparency,
		Image = p1.props.knobImage,
		Size = UDim2.fromOffset(knobHeight, knobHeight),
		Position = var1,
		ZIndex = 3,
		inputBindings = {
			OnMoveStep = roactGamepadModule.Input.onMoveStep(function(p5, p6)
				-- upvalues: p1 (ref)
				p1:onMoveStep(p5, p6)
			end),
			SelectLowerKnob = roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, function()
				-- upvalues: p1 (ref)
				p1:setState(function(p5)
					return {
						processingGamepad = false,
						lowerKnobIsSelected = not p5.lowerKnobIsSelected
					}
				end)
			end),
			UnselectLowerKnob = p3 and roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonB, function()
				-- upvalues: p1 (ref)
				p1:setState({ lowerKnobIsSelected = false, processingGamepad = false })
			end) or nil
		},
		NextSelectionLeft = if p3 then p1.lowerKnobRef else nil
	}
	
	if p4 and not p3 and p1.props.upperValue ~= p1.props.lowerValue then
		upperKnobRef = p1.upperKnobRef or nil
	end
	t.NextSelectionRight = upperKnobRef
	t.NextSelectionUp = if p3 then p1.lowerKnobRef else nil
	t.NextSelectionDown = if p3 then p1.lowerKnobRef else nil
	t.SelectionImageObject = if p3 then p1.props.selectedCursor else p1.props.unselectedCursor
	t[roactModule.Ref] = p1.lowerKnobRef
	
	t[roactModule.Event.InputBegan] = function(_, p5)
		-- upvalues: p1 (ref)
		if p1.props.isDisabled then
			return
		end
		p1:onInputBegan(p5, true)
	end
	
	createElement = createElement(button, t)
	
	return if p1.props.customKnobBorderSize and p1.props.customKnobBorderSize > 0 then p1:wrapKnobWithBorder(createElement, p2) else createElement
end

function genericSlider.renderKnobShadow(p1, p2, p3)
	-- upvalues: roactModule (ref), imageSetComponentModule (ref)
	return roactModule.createElement(imageSetComponentModule.Label, {
		BackgroundTransparency = 1,
		ZIndex = 2,
		AnchorPoint = Vector2.new(0.5, 0.5),
		ImageTransparency = p2,
		Image = p1.props.knobShadowImage,
		Size = UDim2.fromOffset(p1:getKnobHeight(), p1:getKnobHeight()),
		Position = p3
	})
end

function genericSlider.render(p1)
	-- upvalues: lerpModule (ref), withSelectionCursorProviderModule (ref), roactModule (ref), roactGamepadModule (ref), imageSetComponentModule (ref)
	local lowerKnobIsSelected = p1.state.lowerKnobIsSelected or p1.state.upperKnobIsSelected
	local var1 = p1:hasTwoKnobs()
	local var2 = (p1.props.lowerValue - p1.props.min) / (p1.props.max - p1.props.min)
	local var3 = if var1 then (p1.props.upperValue - p1.props.min) / (p1.props.max - p1.props.min) else nil
	local knobVisibleHeight = p1:getKnobVisibleHeight()
	local uDim2 = UDim2.new(var2, lerpModule(knobVisibleHeight / 2, -knobVisibleHeight / 2, var2), 0.5, 0)
	local var4 = var1 and UDim2.new(var3, var1 and lerpModule(knobVisibleHeight / 2, -knobVisibleHeight / 2, var3) or nil, 0.5, 0) or nil
	local var5 = var1 and UDim2.fromScale(var3 - var2, 1) or UDim2.fromScale(var2, 1)
	local lowerKnobIsSelected_1 = p1.state.lowerKnobIsSelected or p1.state.upperKnobIsSelected
	
	return withSelectionCursorProviderModule(function(p2)
		-- upvalues: roactModule (copy), roactGamepadModule (copy), imageSetComponentModule (copy), p1 (ref), lowerKnobIsSelected_1 (ref), var5 (ref), var1 (ref), var2 (ref), uDim2 (ref), lowerKnobIsSelected (ref), var4 (ref)
		return roactModule.createElement(roactGamepadModule.Focusable[imageSetComponentModule.Button], {
			BackgroundTransparency = 1,
			AnchorPoint = p1.props.anchorPoint,
			Size = UDim2.new(p1.props.width.Scale, p1.props.width.Offset, 0, 36),
			LayoutOrder = p1.props.layoutOrder,
			Position = p1.props.position,
			[roactModule.Event.InputBegan] = function(_, p3)
				-- upvalues: p1 (copy)
				if p1.props.isDisabled then
					return
				end
				p1:onInputBegan(p3, false)
			end,
			[roactModule.Ref] = p1.rootRef,
			NextSelectionLeft = if lowerKnobIsSelected_1 then p1.rootRef else nil,
			NextSelectionRight = if lowerKnobIsSelected_1 then p1.rootRef else nil,
			NextSelectionUp = if not lowerKnobIsSelected_1 then p1.props.NextSelectionUp else p1.rootRef,
			NextSelectionDown = if not lowerKnobIsSelected_1 then p1.props.NextSelectionDown else p1.rootRef,
			defaultChild = if p1.props.upperValue ~= p1.props.min then p1.lowerKnobRef else p1.upperKnobRef or nil,
			onFocusLost = function()
				-- upvalues: p1 (copy)
				if p1.state.lowerKnobIsSelected or p1.state.upperKnobIsSelected then
					p1:setState({ lowerKnobIsSelected = false, upperKnobIsSelected = false })
				end
			end
		}, {
			Track = p1:renderTrack(var5, var1, var2),
			LowerKnob = p1:renderLowerKnob(uDim2, lowerKnobIsSelected, var1, p2),
			LowerKnobShadow = p1:renderKnobShadow(p1.props.knobShadowTransparencyLower, uDim2),
			UpperKnob = p1:renderUpperKnob(var4, lowerKnobIsSelected, var1, p2),
			UpperKnobShadow = var1 and p1:renderKnobShadow(p1.props.knobShadowTransparencyUpper, var4) or nil
		})
	end)
end

function genericSlider.didMount(p1)
	local current = p1.rootRef.current
	local ancestryChangedConnection = nil
	ancestryChangedConnection = current.AncestryChanged:Connect(function()
		-- upvalues: current (ref), ancestryChangedConnection (write), p1 (ref)
		if current:IsDescendantOf(game) then
			ancestryChangedConnection:Disconnect()
			p1.canUseUserInputService = current:FindFirstAncestorWhichIsA("PluginGui") == nil
			
			return
		end
	end)
	
	if current:IsDescendantOf(game) then
		ancestryChangedConnection:Disconnect()
		p1.canUseUserInputService = current:FindFirstAncestorWhichIsA("PluginGui") == nil
	end
end

function genericSlider.didUpdate(p1, _, p2)
	if p1.props.disabled then
		p1:stopListeningForDrag()
	end
	if p1.props.onDragEnd ~= nil and (p2.lowerKnobIsSelected and not p1.state.lowerKnobIsSelected or p2.upperKnobIsSelected and not p1.state.upperKnobIsSelected) then
		p1.props.onDragEnd()
		
		return
	elseif p1.props.onDragStartLower ~= nil and not p2.lowerKnobIsSelected and p1.state.lowerKnobIsSelected then
		p1.props.onDragStartLower()
		
		return
	elseif p1.props.onDragStartUpper ~= nil and not p2.upperKnobIsSelected and p1.state.upperKnobIsSelected then
		p1.props.onDragStartUpper()
	end
end

function genericSlider.willUnmount(p1)
	p1:stopListeningForDrag()
end

function genericSlider.onInputBegan(p1, p2, p3)
	if p1.props.disabled then return end
	if p2.UserInputState ~= Enum.UserInputState.Begin then return end
	local userInputType = p2.UserInputType
	
	if userInputType ~= Enum.UserInputType.MouseButton1 and userInputType ~= Enum.UserInputType.Touch then return end
	if userInputType == Enum.UserInputType.Touch and not p3 then
		return
	end
	p1:processDrag(p2.Position.X)
	p1:startListeningForDrag()
end

function genericSlider.startListeningForDrag(p1)
	-- upvalues: userInputService (ref)
	local current = p1.rootRef.current
	
	if current == nil then return end
	if p1.dragging then return end
	if p1.canUseUserInputService then
		local var1 = function(p2)
			-- upvalues: p1 (ref)
			if not p1.dragging then return end
			local userInputType = p2.UserInputType
			
			if userInputType ~= Enum.UserInputType.MouseMovement and userInputType ~= Enum.UserInputType.Touch then return end
			if p2.UserInputState == Enum.UserInputState.Change then
				p1:processDrag(p2.Position.X)
				
				return
			end
		end
		
		if p1.props.containerRef then
			p1.moveConnection = p1.props.containerRef.current.InputChanged:Connect(var1)
		else
			p1.moveConnection = userInputService.InputChanged:Connect(var1)
		end
		p1.releaseConnection = userInputService.InputEnded:Connect(function(p2)
			-- upvalues: p1 (ref)
			local userInputType = p2.UserInputType
			
			if userInputType ~= Enum.UserInputType.MouseButton1 and userInputType ~= Enum.UserInputType.Touch then return end
			p1:stopListeningForDrag()
			
			if not p1.props.containerRef then
				p1:processOneKnobDrag(p2.Position.X)
			end
		end)
		p1.focusLostConnection = userInputService.WindowFocusReleased:Connect(function()
			-- upvalues: p1 (ref)
			p1:stopListeningForDrag()
		end)
	else
		local pluginGui = current:FindFirstAncestorWhichIsA("PluginGui")
		local sliderPluginGuiInputCapturer = Instance.new("ImageButton")
		sliderPluginGuiInputCapturer.BackgroundTransparency = 1
		sliderPluginGuiInputCapturer.Image = ""
		sliderPluginGuiInputCapturer.Name = "SliderPluginGuiInputCapturer"
		sliderPluginGuiInputCapturer.Size = UDim2.new(1, 0, 1, 0)
		sliderPluginGuiInputCapturer.ZIndex = 100000
		p1.moveConnection = sliderPluginGuiInputCapturer.MouseMoved:Connect(function(p2)
			-- upvalues: p1 (ref)
			p1:processDrag(p2)
		end)
		p1.releaseConnection = sliderPluginGuiInputCapturer.MouseButton1Up:Connect(function(p2)
			-- upvalues: p1 (ref)
			p1:stopListeningForDrag()
			p1:processOneKnobDrag(p2)
		end)
		p1.focusLostConnection = sliderPluginGuiInputCapturer.MouseLeave:Connect(function(p2)
			-- upvalues: p1 (ref)
			p1:stopListeningForDrag()
			p1:processOneKnobDrag(p2)
		end)
		sliderPluginGuiInputCapturer.Parent = pluginGui
		p1.inputCapturerButton = sliderPluginGuiInputCapturer
	end
	p1.dragging = true
	
	if p1.lowerKnobDrag and p1.props.onDragStartLower ~= nil then
		p1.props.onDragStartLower()
	end
	if p1.upperKnobDrag and p1.props.onDragStartUpper ~= nil then
		p1.props.onDragStartUpper()
	end
end

function genericSlider.getSteppedValue(p1, p2)
	local current = p1.rootRef.current
	
	if current == nil then
		return 0
	end
	local min = p1.props.min
	local max = p1.props.max
	local stepInterval = p1.props.stepInterval
	local x = current.AbsoluteSize.X
	
	return math.floor((math.clamp(p2 - current.AbsolutePosition.X, 0, x) / x * (max - min) + min) / stepInterval + 0.5) * stepInterval
end

function genericSlider.processDrag(p1, p2)
	if p1:hasTwoKnobs() then
		p1:processTwoKnobDrag(p2)
		
		return
	end
	p1:processOneKnobDrag(p2)
end

function genericSlider.processOneKnobDrag(p1, p2)
	if p1:hasTwoKnobs() then return end
	local var1 = p1:getSteppedValue(p2)
	p1.lowerKnobDrag = true
	
	if var1 ~= p1.props.lowerValue then
		p1.props.onValueChanged(var1)
	end
end

function genericSlider.processTwoKnobDrag(p1, p2)
	local var1 = p1:getSteppedValue(p2)
	local lowerValue = p1.props.lowerValue
	local upperValue = p1.props.upperValue
	
	if not p1.lowerKnobDrag and not p1.upperKnobDrag then
		if var1 == lowerValue then
			p1.lowerKnobDrag = true
		end
		if var1 == upperValue then
			p1.upperKnobDrag = true
		end
	elseif p1.lowerKnobDrag and p1.upperKnobDrag then
		if upperValue <= var1 - p1.props.stepInterval then
			p1.upperKnobDrag = true
			p1.lowerKnobDrag = false
			upperValue = var1
		elseif var1 + p1.props.stepInterval <= lowerValue then
			p1.upperKnobDrag = false
			p1.lowerKnobDrag = true
			lowerValue = var1
		end
	elseif p1.lowerKnobDrag then
		if var1 <= upperValue then
			lowerValue = var1
		end
	elseif p1.upperKnobDrag and lowerValue <= var1 then
		upperValue = var1
	end
	if upperValue ~= p1.props.upperValue or lowerValue ~= p1.props.lowerValue then
		p1.props.onValueChanged(lowerValue, upperValue)
	end
end

function genericSlider.stopListeningForDrag(p1)
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

function genericSlider.hasTwoKnobs(p1)
	return p1.props.upperValue ~= nil
end

return roactModule.forwardRef(function(p1, p2)
	-- upvalues: useCursorByTypeModule (ref), cursorTypeModule (ref), cryoModule (ref), roactModule (ref), genericSlider (ref)
	return roactModule.createElement(genericSlider, cryoModule.Dictionary.join(cryoModule.Dictionary.join(p1, {
		selectedCursor = useCursorByTypeModule(cursorTypeModule.SelectedKnob),
		unselectedCursor = useCursorByTypeModule(cursorTypeModule.UnselectedKnob)
	}), { imageButtonRef = p2 }))
end)