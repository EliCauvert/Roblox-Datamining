local userInputService = game:GetService("UserInputService")
local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local contextActionService = game:GetService("ContextActionService")
local runService = game:GetService("RunService")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local UIBlox = inGameMenuDependenciesModule.UIBlox
local t = inGameMenuDependenciesModule.t
local otter = inGameMenuDependenciesModule.Otter
local focusHandlerModule = require(script.Parent.Connection.FocusHandler)
local withStyle = UIBlox.Core.Style.withStyle
local withSelectionCursorProvider = UIBlox.App.SelectionImage.withSelectionCursorProvider
local cursorKind = UIBlox.App.SelectionImage.CursorKind
local divideTransparencyModule = require(script.Parent.Parent.Utility.divideTransparency)
local assetImageModule = require(script.Parent.AssetImage)
local imageSetButton = UIBlox.Core.ImageSet.ImageSetButton
local t_1 = { frequency = 5 }

local function isGamepad(p0) --[[ line: 43 ]]
	return if p0 ~= Enum.UserInputType.Gamepad1 then if p0 ~= Enum.UserInputType.Gamepad2 then if p0 ~= Enum.UserInputType.Gamepad3 then if p0 ~= Enum.UserInputType.Gamepad4 then if p0 ~= Enum.UserInputType.Gamepad5 then if p0 ~= Enum.UserInputType.Gamepad6 then if p0 ~= Enum.UserInputType.Gamepad7 then p0 == Enum.UserInputType.Gamepad8 else true else true else true else true else true else true else true
end

local t_2 = {}

local function getInputObjects() --[[ line: 56 ]]
	-- upvalues: userInputService (ref), isGamepad (ref), t_2 (ref)
	local lastInputType = userInputService:GetLastInputType()
	
	if not isGamepad(lastInputType) then
		return nil
	elseif t_2[lastInputType] == nil then
		local t = {}
		
		for i, v in ipairs(userInputService:GetGamepadState(lastInputType)) do
			t[v.KeyCode] = v
		end
		t_2[lastInputType] = t
	end
	return t_2[lastInputType]
end

local slider = roact.PureComponent:extend("Slider")
slider.validateProps = t.intersection(t.strictInterface({
	min = t.number,
	max = t.number,
	stepInterval = t.numberPositive,
	value = t.number,
	valueChanged = t.callback,
	disabled = t.optional(t.boolean),
	width = t.optional(t.UDim),
	AnchorPoint = t.optional(t.Vector2),
	LayoutOrder = t.optional(t.integer),
	Position = t.optional(t.UDim2),
	canCaptureFocus = t.optional(t.boolean),
	isMenuOpen = t.optional(t.boolean),
	onSelectionLost = t.optional(t.callback),
	onSelectionGained = t.optional(t.callback),
	NextSelectionRight = t.optional(t.table),
	sliderDotRef = t.optional(t.union(t.callback, t.table))
}), function(p1) --[[ line: 115 ]]
	if p1.max < p1.min then
		return false, "min must be less than or equal to max"
	elseif p1.max < p1.value or p1.value < p1.min then
		return false, "value must be within min and max"
	end
	return true
end)
slider.defaultProps = { disabled = false, width = UDim.new(1, 0) }

function slider.init(p2) --[[ line: 133 ]]
	-- upvalues: roact (ref), otter (ref)
	p2.state = { dragging = false, hovering = false, entryMode = false }
	p2.totalMoveTime = 0
	p2.isFirstMove = true
	p2.unhandledTime = 0
	p2.rootButtonRef = roact.createRef()
	p2.hoverRef = roact.createRef()
	p2.hoverMotor = otter.createSingleMotor(0)
	p2.hoverMotor:onStep(function(p3) --[[ line: 148 ]]
		-- upvalues: p2 (ref)
		local current = p2.hoverRef.current
		
		if current ~= nil then
			current.Size = UDim2.new(0, p3, 0, p3)
		end
	end)
	
	function p2.onInputBegan(_, p4) --[[ line: 156 ]]
		-- upvalues: p2 (ref)
		if p2.props.disabled then return end
		local userInputType = p4.UserInputType
		
		if userInputType == Enum.UserInputType.MouseButton1 or userInputType == Enum.UserInputType.Touch then
			p2:processDrag(p4.Position.X)
			p2:startListeningForDrag()
			
			return
		end
	end
end

function slider.renderFocusHandler(p5) --[[ line: 173 ]]
	-- upvalues: roact (ref), focusHandlerModule (ref), guiService (ref), runService (ref), getInputObjects (ref), contextActionService (ref)
	return roact.createElement(focusHandlerModule, {
		isFocused = p5.state.entryMode and p5.props.canCaptureFocus,
		didFocus = function() --[[ line: 177 ]]
			-- upvalues: guiService (copy), p5 (ref), runService (copy), getInputObjects (copy), contextActionService (copy)
			guiService.CoreGuiNavigationEnabled = false
			p5.joystickListener = runService.Heartbeat:Connect(function(p6) --[[ line: 181 ]]
				-- upvalues: p5 (copy), getInputObjects (copy)
				p5:onMoveStep(p6, getInputObjects())
			end)
			local value = p5.props.value
			contextActionService:BindCoreAction("LeaveEntryMode", function(_, p7) --[[ line: 190 ]]
				-- upvalues: p5 (copy), value (ref)
				if p7 == Enum.UserInputState.End then
					p5:setState({ entryMode = false })
					p5.props.valueChanged(value)
					
					return Enum.ContextActionResult.Sink
				end
				return Enum.ContextActionResult.Pass
			end, false, Enum.KeyCode.ButtonB)
		end,
		didBlur = function() --[[ line: 200 ]]
			-- upvalues: p5 (ref), guiService (copy), contextActionService (copy)
			p5.joystickListener:Disconnect()
			guiService.CoreGuiNavigationEnabled = true
			contextActionService:UnbindCoreAction("LeaveEntryMode")
			p5:setState({ entryMode = false })
		end
	}) or nil
end

function slider.renderWithSelectionCursor(p8, p9) --[[ line: 209 ]]
	-- upvalues: withStyle (ref), roact (ref), imageSetButton (ref), assetImageModule (ref), divideTransparencyModule (ref), cursorKind (ref)
	local min = p8.props.min
	local var16 = (p8.props.value - min) / (p8.props.max - min)
	local absValue = math.abs(var16)
	local var18 = var16 / 2
	local canCaptureFocus = p8.state.entryMode and p8.props.canCaptureFocus
	
	return withStyle(function(p10) --[[ line: 220 ]]
		-- upvalues: roact (copy), imageSetButton (copy), p8 (ref), assetImageModule (copy), divideTransparencyModule (copy), var18 (ref), absValue (ref), var16 (ref), p9 (ref), canCaptureFocus (ref), cursorKind (copy)
		return roact.createElement(imageSetButton, {
			AnchorPoint = p8.props.AnchorPoint,
			BackgroundTransparency = 1,
			Image = "",
			LayoutOrder = p8.props.LayoutOrder,
			Position = p8.props.Position,
			Size = UDim2.new(p8.props.width.Scale, p8.props.width.Offset, 0, 36),
			[roact.Ref] = p8.rootButtonRef,
			[roact.Event.InputBegan] = p8.onInputBegan,
			Selectable = false
		}, {
			FocusHandler = p8:renderFocusHandler(),
			Gutter = roact.createElement(assetImageModule.Label, {
				BackgroundTransparency = 1,
				imageKey = "SliderCircle",
				AnchorPoint = Vector2.new(0.5, 0.5),
				ImageColor3 = p10.Theme.UIMuted.Color,
				ImageTransparency = p10.Theme.UIMuted.Transparency,
				Position = UDim2.new(0.5, 0, 0.5, 0),
				Size = UDim2.new(1, 0, 0, 4)
			}, {
				FilledGutter = roact.createElement(assetImageModule.Label, {
					BackgroundTransparency = 1,
					imageKey = "SliderCircle",
					AnchorPoint = Vector2.new(0.5, 0.5),
					ImageColor3 = p10.Theme.ContextualPrimaryDefault.Color,
					ImageTransparency = divideTransparencyModule(p10.Theme.ContextualPrimaryDefault.Transparency, if p8.props.disabled then 2 else 1),
					Position = UDim2.new(var18, 0, 0.5, 0),
					Size = UDim2.new(absValue, 0, 1, 0)
				})
			}),
			DotTrack = roact.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 4,
				Selectable = false,
				Size = UDim2.new(1, -12, 1, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0)
			}, {
				Dot = roact.createElement(assetImageModule.Button, {
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundTransparency = 1,
					imageKey = "SliderButton",
					Position = UDim2.new(var16, 0, 0.5, 0),
					Size = UDim2.new(0, 42, 0, 42),
					ImageTransparency = if p8.props.disabled then 0.5 else 0,
					ZIndex = 2,
					SelectionImageObject = p9(if canCaptureFocus then cursorKind.SelectedKnob else cursorKind.UnselectedKnob),
					[roact.Event.Activated] = function(_, p11) --[[ line: 274 ]]
						-- upvalues: p8 (copy)
						if p11.KeyCode == Enum.KeyCode.ButtonA then
							p8:setState({ entryMode = not p8.state.entryMode })
						end
					end,
					[roact.Event.InputBegan] = function(p12, p13) --[[ line: 281 ]]
						-- upvalues: p8 (copy)
						if p8.props.disabled then return end
						if p13.UserInputType == Enum.UserInputType.MouseMovement then
							p8:setState({ hovering = true })
							
							return
						end
						p8.onInputBegan(p12, p13)
					end,
					[roact.Event.InputEnded] = function(_, p14) --[[ line: 294 ]]
						-- upvalues: p8 (copy)
						if p8.props.disabled then return end
						if p14.UserInputType == Enum.UserInputType.MouseMovement then
							p8:setState({ hovering = false })
						end
					end,
					[roact.Ref] = p8.props.sliderDotRef,
					[roact.Event.SelectionLost] = p8.props.onSelectionLost,
					[roact.Event.SelectionGained] = p8.props.onSelectionGained,
					NextSelectionRight = p8.props.NextSelectionRight
				}),
				HoverOverlay = roact.createElement(assetImageModule.Label, {
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundTransparency = 1,
					imageKey = "SliderHover",
					Position = UDim2.new(var16, 0, 0.5, 0),
					Size = UDim2.new(0, 0, 0, 0),
					[roact.Ref] = p8.hoverRef
				})
			})
		})
	end)
end

function slider.render(p15) --[[ line: 323 ]]
	-- upvalues: withSelectionCursorProvider (ref)
	return withSelectionCursorProvider(function(p16) --[[ line: 324 ]]
		-- upvalues: p15 (ref)
		return p15:renderWithSelectionCursor(p16)
	end)
end

function slider.didMount(p17) --[[ line: 329 ]]
	local current = p17.rootButtonRef.current
	local ancestryChangedConnection = nil
	ancestryChangedConnection = current.AncestryChanged:Connect(function() --[[ line: 337 ]]
		-- upvalues: current (ref), ancestryChangedConnection (write), p17 (ref)
		if current:IsDescendantOf(game) then
			ancestryChangedConnection:Disconnect()
			p17.canUseUserInputService = current:FindFirstAncestorWhichIsA("PluginGui") == nil
			
			return
		end
	end)
	p17.hoverMotor:start()
end

function slider.didUpdate(p18) --[[ line: 352 ]]
	-- upvalues: otter (ref), t_1 (ref)
	if p18.props.disabled then
		p18:stopListeningForDrag()
	end
	p18.hoverMotor:setGoal(otter.spring(if not (p18.props.disabled or not p18.state.dragging and not p18.state.hovering) then 42 else 0, t_1))
end

function slider.willUnmount(p19) --[[ line: 365 ]]
	p19.hoverMotor:stop()
	p19:disconnectDragEvents()
end

function slider.startListeningForDrag(p20) --[[ line: 370 ]]
	-- upvalues: userInputService (ref)
	local current = p20.rootButtonRef.current
	
	if current == nil then return end
	if p20.state.dragging then return end
	if p20.canUseUserInputService then
		p20.moveConnection = userInputService.InputChanged:Connect(function(p21) --[[ line: 383 ]]
			-- upvalues: p20 (ref)
			if not p20.state.dragging then return end
			local userInputType = p21.UserInputType
			
			if userInputType ~= Enum.UserInputType.MouseMovement and userInputType ~= Enum.UserInputType.Touch then return end
			if p21.UserInputState == Enum.UserInputState.Change then
				p20:processDrag(p21.Position.X)
				
				return
			end
		end)
		p20.releaseConnection = userInputService.InputEnded:Connect(function(p22) --[[ line: 405 ]]
			-- upvalues: p20 (ref)
			local userInputType = p22.UserInputType
			
			if userInputType == Enum.UserInputType.MouseButton1 or userInputType == Enum.UserInputType.Touch then
				p20:stopListeningForDrag()
				p20:processDrag(p22.Position.X)
				
				return
			end
		end)
		p20.focusLostConnection = userInputService.WindowFocusReleased:Connect(function() --[[ line: 420 ]]
			-- upvalues: p20 (ref)
			p20:stopListeningForDrag()
		end)
	else
		local pluginGui = current:FindFirstAncestorWhichIsA("PluginGui")
		local sliderPluginGuiInputCapturer = Instance.new("ImageButton")
		sliderPluginGuiInputCapturer.BackgroundTransparency = 1
		sliderPluginGuiInputCapturer.Image = ""
		sliderPluginGuiInputCapturer.Name = "SliderPluginGuiInputCapturer"
		sliderPluginGuiInputCapturer.Size = UDim2.new(1, 0, 1, 0)
		sliderPluginGuiInputCapturer.ZIndex = 100000
		p20.moveConnection = sliderPluginGuiInputCapturer.MouseMoved:Connect(function(p23) --[[ line: 440 ]]
			-- upvalues: p20 (ref)
			p20:processDrag(p23)
		end)
		p20.releaseConnection = sliderPluginGuiInputCapturer.MouseButton1Up:Connect(function(p24) --[[ line: 444 ]]
			-- upvalues: p20 (ref)
			p20:stopListeningForDrag()
			p20:processDrag(p24)
		end)
		p20.focusLostConnection = sliderPluginGuiInputCapturer.MouseLeave:Connect(function(p25) --[[ line: 449 ]]
			-- upvalues: p20 (ref)
			p20:stopListeningForDrag()
			p20:processDrag(p25)
		end)
		sliderPluginGuiInputCapturer.Parent = pluginGui
		p20.inputCapturerButton = sliderPluginGuiInputCapturer
	end
	p20:setState({ dragging = true })
end

function slider.processDrag(p26, p27) --[[ line: 463 ]]
	local current = p26.rootButtonRef.current
	
	if current == nil then return end
	local min = p26.props.min
	local max = p26.props.max
	local stepInterval = p26.props.stepInterval
	local x = current.AbsoluteSize.X
	local var23 = math.floor((math.clamp(p27 - current.AbsolutePosition.X, 0, x) / x * (max - min) + min) / stepInterval + 0.5) * stepInterval
	
	if var23 ~= p26.props.value then
		p26.props.valueChanged(var23)
	end
end

function slider.disconnectDragEvents(p28) --[[ line: 486 ]]
	if p28.moveConnection ~= nil then
		p28.moveConnection:Disconnect()
		p28.moveConnection = nil
	end
	if p28.releaseConnection ~= nil then
		p28.releaseConnection:Disconnect()
		p28.releaseConnection = nil
	end
	if p28.focusLostConnection ~= nil then
		p28.focusLostConnection:Disconnect()
		p28.focusLostConnection = nil
	end
	if p28.inputCapturerButton ~= nil then
		p28.inputCapturerButton:Destroy()
		p28.inputCapturerButton = nil
	end
end

function slider.stopListeningForDrag(p29) --[[ line: 508 ]]
	if p29.state.dragging then
		p29:disconnectDragEvents()
		p29:setState({ dragging = false })
		
		return
	end
end

function slider.processGamepadInput(p30, p31, p32) --[[ line: 520 ]]
	local maxValue = math.max(math.min(p30.props.value + p30.props.stepInterval * p31 * p32, p30.props.max), p30.props.min)
	
	if maxValue ~= p30.props.value then
		p30.props.valueChanged(maxValue)
	end
end

function slider.onMoveStep(p33, p34, p35) --[[ line: 531 ]]
	local var27, var28, var29
	local position = p35[Enum.KeyCode.Thumbstick1].Position
	local var25 = position.Magnitude > 0.2
	local var26 = 0
	local _ = nil
	local _ = nil
	local _ = nil
	p33.totalMoveTime += p34
	
	if var25 then
		var27 = if position.x > 0 then 1 else -1
		var28 = 0.2
		var29 = 12
	else
		var27 = (if p35[Enum.KeyCode.DPadLeft].UserInputState == Enum.UserInputState.Begin then -1 else 0) + (if p35[Enum.KeyCode.DPadRight].UserInputState == Enum.UserInputState.Begin then 1 else 0)
		var28 = 0.5
		var29 = 8
	end
	if var27 == 0 then
		p33.totalMoveTime = 0
		p33.isFirstMove = true
	elseif p33.isFirstMove then
		p33.isFirstMove = false
		p33.totalMoveTime = 0
		p33.unhandledTime = 0
		var26 = 1
	elseif var28 < p33.totalMoveTime then
		local var30 = p34 - math.max(var28 - p33.totalMoveTime - p34, 0) + p33.unhandledTime
		var26 = math.floor(var29 * var30)
		p33.unhandledTime = var30 - var26 / var29
	else
		var26 = 0
		p33.unhandledTime = 0
	end
	if var26 > 0 then
		p33:processGamepadInput(var27, var26)
	end
end

function slider.getDerivedStateFromProps(p36) --[[ line: 581 ]]
	return if p36.isMenuOpen then nil else { entryMode = false }
end

return slider