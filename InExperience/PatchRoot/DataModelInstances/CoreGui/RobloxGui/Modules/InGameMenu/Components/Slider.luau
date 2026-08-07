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
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local foundationModule = require(corePackagesService.Packages.Foundation)
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local var8 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local var9 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
local divideTransparencyModule = require(script.Parent.Parent.Utility.divideTransparency)
local assetImageModule = require(script.Parent.AssetImage)
local imageSetButton = UIBlox.Core.ImageSet.ImageSetButton
local t_1 = { frequency = 5 }

local function isGamepad(p0) --[[ line: 50 ]]
	return if p0 ~= Enum.UserInputType.Gamepad1 then if p0 ~= Enum.UserInputType.Gamepad2 then if p0 ~= Enum.UserInputType.Gamepad3 then if p0 ~= Enum.UserInputType.Gamepad4 then if p0 ~= Enum.UserInputType.Gamepad5 then if p0 ~= Enum.UserInputType.Gamepad6 then if p0 ~= Enum.UserInputType.Gamepad7 then p0 == Enum.UserInputType.Gamepad8 else true else true else true else true else true else true else true
end

local t_2 = {}

local function getInputObjects() --[[ line: 63 ]]
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
}), function(p1) --[[ line: 122 ]]
	if p1.max < p1.min then
		return false, "min must be less than or equal to max"
	elseif p1.max < p1.value or p1.value < p1.min then
		return false, "value must be within min and max"
	end
	return true
end)
slider.defaultProps = { disabled = false, width = UDim.new(1, 0) }

function slider.init(p2) --[[ line: 140 ]]
	-- upvalues: roact (ref), otter (ref)
	p2.state = { dragging = false, hovering = false, entryMode = false }
	p2.totalMoveTime = 0
	p2.isFirstMove = true
	p2.unhandledTime = 0
	p2.rootButtonRef = roact.createRef()
	p2.hoverRef = roact.createRef()
	p2.hoverMotor = otter.createSingleMotor(0)
	p2.hoverMotor:onStep(function(p3) --[[ line: 155 ]]
		-- upvalues: p2 (ref)
		local current = p2.hoverRef.current
		
		if current ~= nil then
			current.Size = UDim2.new(0, p3, 0, p3)
		end
	end)
	
	function p2.onInputBegan(_, p4) --[[ line: 163 ]]
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

function slider.renderFocusHandler(p5) --[[ line: 180 ]]
	-- upvalues: roact (ref), focusHandlerModule (ref), guiService (ref), runService (ref), getInputObjects (ref), contextActionService (ref)
	return roact.createElement(focusHandlerModule, {
		isFocused = p5.state.entryMode and p5.props.canCaptureFocus,
		didFocus = function() --[[ line: 184 ]]
			-- upvalues: guiService (copy), p5 (ref), runService (copy), getInputObjects (copy), contextActionService (copy)
			guiService.CoreGuiNavigationEnabled = false
			p5.joystickListener = runService.Heartbeat:Connect(function(p6) --[[ line: 188 ]]
				-- upvalues: p5 (copy), getInputObjects (copy)
				p5:onMoveStep(p6, getInputObjects())
			end)
			local value = p5.props.value
			contextActionService:BindCoreAction("LeaveEntryMode", function(_, p7) --[[ line: 197 ]]
				-- upvalues: p5 (copy), value (ref)
				if p7 == Enum.UserInputState.End then
					p5:setState({ entryMode = false })
					p5.props.valueChanged(value)
					
					return Enum.ContextActionResult.Sink
				end
				return Enum.ContextActionResult.Pass
			end, false, Enum.KeyCode.ButtonB)
		end,
		didBlur = function() --[[ line: 207 ]]
			-- upvalues: p5 (ref), guiService (copy), contextActionService (copy)
			p5.joystickListener:Disconnect()
			guiService.CoreGuiNavigationEnabled = true
			contextActionService:UnbindCoreAction("LeaveEntryMode")
			p5:setState({ entryMode = false })
		end
	}) or nil
end

function slider.renderWithSelectionCursor(p8, p9) --[[ line: 216 ]]
	-- upvalues: withFoundationOrUIBloxStyle (ref), roact (ref), imageSetButton (ref), assetImageModule (ref), divideTransparencyModule (ref), var9 (ref)
	local min = p8.props.min
	local var19 = (p8.props.value - min) / (p8.props.max - min)
	local absValue = math.abs(var19)
	local var21 = var19 / 2
	local canCaptureFocus = p8.state.entryMode and p8.props.canCaptureFocus
	
	return withFoundationOrUIBloxStyle(function(p10) --[[ line: 227 ]]
		return {
			Theme = {
				UIMuted = {
					Color = p10.Color.Shift.Shift_100.Color3,
					Transparency = p10.Color.Shift.Shift_100.Transparency
				},
				ContextualPrimaryDefault = {
					Color = p10.Color.ActionEmphasis.Background.Color3,
					Transparency = p10.Color.ActionEmphasis.Background.Transparency
				}
			}
		}
	end, function(p11) --[[ line: 234 ]]
		-- upvalues: roact (copy), imageSetButton (copy), p8 (ref), assetImageModule (copy), divideTransparencyModule (copy), var21 (ref), absValue (ref), var19 (ref), p9 (ref), canCaptureFocus (ref), var9 (copy)
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
				ImageColor3 = p11.Theme.UIMuted.Color,
				ImageTransparency = p11.Theme.UIMuted.Transparency,
				Position = UDim2.new(0.5, 0, 0.5, 0),
				Size = UDim2.new(1, 0, 0, 4)
			}, {
				FilledGutter = roact.createElement(assetImageModule.Label, {
					BackgroundTransparency = 1,
					imageKey = "SliderCircle",
					AnchorPoint = Vector2.new(0.5, 0.5),
					ImageColor3 = p11.Theme.ContextualPrimaryDefault.Color,
					ImageTransparency = divideTransparencyModule(p11.Theme.ContextualPrimaryDefault.Transparency, if p8.props.disabled then 2 else 1),
					Position = UDim2.new(var21, 0, 0.5, 0),
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
					Position = UDim2.new(var19, 0, 0.5, 0),
					Size = UDim2.new(0, 42, 0, 42),
					ImageTransparency = if p8.props.disabled then 0.5 else 0,
					ZIndex = 2,
					SelectionImageObject = p9(if canCaptureFocus then var9.SelectedKnob else var9.UnselectedKnob),
					[roact.Event.Activated] = function(_, p12) --[[ line: 288 ]]
						-- upvalues: p8 (copy)
						if p12.KeyCode == Enum.KeyCode.ButtonA then
							p8:setState({ entryMode = not p8.state.entryMode })
						end
					end,
					[roact.Event.InputBegan] = function(p13, p14) --[[ line: 295 ]]
						-- upvalues: p8 (copy)
						if p8.props.disabled then return end
						if p14.UserInputType == Enum.UserInputType.MouseMovement then
							p8:setState({ hovering = true })
							
							return
						end
						p8.onInputBegan(p13, p14)
					end,
					[roact.Event.InputEnded] = function(_, p15) --[[ line: 308 ]]
						-- upvalues: p8 (copy)
						if p8.props.disabled then return end
						if p15.UserInputType == Enum.UserInputType.MouseMovement then
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
					Position = UDim2.new(var19, 0, 0.5, 0),
					Size = UDim2.new(0, 0, 0, 0),
					[roact.Ref] = p8.hoverRef
				})
			})
		})
	end)
end

function slider.render(p16) --[[ line: 337 ]]
	-- upvalues: var8 (ref)
	return var8(function(p17) --[[ line: 338 ]]
		-- upvalues: p16 (ref)
		return p16:renderWithSelectionCursor(p17)
	end)
end

function slider.didMount(p18) --[[ line: 343 ]]
	local current = p18.rootButtonRef.current
	local ancestryChangedConnection = nil
	ancestryChangedConnection = current.AncestryChanged:Connect(function() --[[ line: 351 ]]
		-- upvalues: current (ref), ancestryChangedConnection (write), p18 (ref)
		if current:IsDescendantOf(game) then
			ancestryChangedConnection:Disconnect()
			p18.canUseUserInputService = current:FindFirstAncestorWhichIsA("PluginGui") == nil
			
			return
		end
	end)
	p18.hoverMotor:start()
end

function slider.didUpdate(p19) --[[ line: 366 ]]
	-- upvalues: otter (ref), t_1 (ref)
	if p19.props.disabled then
		p19:stopListeningForDrag()
	end
	p19.hoverMotor:setGoal(otter.spring(if not (p19.props.disabled or not p19.state.dragging and not p19.state.hovering) then 42 else 0, t_1))
end

function slider.willUnmount(p20) --[[ line: 379 ]]
	p20.hoverMotor:stop()
	p20:disconnectDragEvents()
end

function slider.startListeningForDrag(p21) --[[ line: 384 ]]
	-- upvalues: userInputService (ref)
	local current = p21.rootButtonRef.current
	
	if current == nil then return end
	if p21.state.dragging then return end
	if p21.canUseUserInputService then
		p21.moveConnection = userInputService.InputChanged:Connect(function(p22) --[[ line: 397 ]]
			-- upvalues: p21 (ref)
			if not p21.state.dragging then return end
			local userInputType = p22.UserInputType
			
			if userInputType ~= Enum.UserInputType.MouseMovement and userInputType ~= Enum.UserInputType.Touch then return end
			if p22.UserInputState == Enum.UserInputState.Change then
				p21:processDrag(p22.Position.X)
				
				return
			end
		end)
		p21.releaseConnection = userInputService.InputEnded:Connect(function(p23) --[[ line: 419 ]]
			-- upvalues: p21 (ref)
			local userInputType = p23.UserInputType
			
			if userInputType == Enum.UserInputType.MouseButton1 or userInputType == Enum.UserInputType.Touch then
				p21:stopListeningForDrag()
				p21:processDrag(p23.Position.X)
				
				return
			end
		end)
		p21.focusLostConnection = userInputService.WindowFocusReleased:Connect(function() --[[ line: 434 ]]
			-- upvalues: p21 (ref)
			p21:stopListeningForDrag()
		end)
	else
		local pluginGui = current:FindFirstAncestorWhichIsA("PluginGui")
		local sliderPluginGuiInputCapturer = Instance.new("ImageButton")
		sliderPluginGuiInputCapturer.BackgroundTransparency = 1
		sliderPluginGuiInputCapturer.Image = ""
		sliderPluginGuiInputCapturer.Name = "SliderPluginGuiInputCapturer"
		sliderPluginGuiInputCapturer.Size = UDim2.new(1, 0, 1, 0)
		sliderPluginGuiInputCapturer.ZIndex = 100000
		p21.moveConnection = sliderPluginGuiInputCapturer.MouseMoved:Connect(function(p24) --[[ line: 454 ]]
			-- upvalues: p21 (ref)
			p21:processDrag(p24)
		end)
		p21.releaseConnection = sliderPluginGuiInputCapturer.MouseButton1Up:Connect(function(p25) --[[ line: 458 ]]
			-- upvalues: p21 (ref)
			p21:stopListeningForDrag()
			p21:processDrag(p25)
		end)
		p21.focusLostConnection = sliderPluginGuiInputCapturer.MouseLeave:Connect(function(p26) --[[ line: 463 ]]
			-- upvalues: p21 (ref)
			p21:stopListeningForDrag()
			p21:processDrag(p26)
		end)
		sliderPluginGuiInputCapturer.Parent = pluginGui
		p21.inputCapturerButton = sliderPluginGuiInputCapturer
	end
	p21:setState({ dragging = true })
end

function slider.processDrag(p27, p28) --[[ line: 477 ]]
	local current = p27.rootButtonRef.current
	
	if current == nil then return end
	local min = p27.props.min
	local max = p27.props.max
	local stepInterval = p27.props.stepInterval
	local x = current.AbsoluteSize.X
	local var26 = math.floor((math.clamp(p28 - current.AbsolutePosition.X, 0, x) / x * (max - min) + min) / stepInterval + 0.5) * stepInterval
	
	if var26 ~= p27.props.value then
		p27.props.valueChanged(var26)
	end
end

function slider.disconnectDragEvents(p29) --[[ line: 500 ]]
	if p29.moveConnection ~= nil then
		p29.moveConnection:Disconnect()
		p29.moveConnection = nil
	end
	if p29.releaseConnection ~= nil then
		p29.releaseConnection:Disconnect()
		p29.releaseConnection = nil
	end
	if p29.focusLostConnection ~= nil then
		p29.focusLostConnection:Disconnect()
		p29.focusLostConnection = nil
	end
	if p29.inputCapturerButton ~= nil then
		p29.inputCapturerButton:Destroy()
		p29.inputCapturerButton = nil
	end
end

function slider.stopListeningForDrag(p30) --[[ line: 522 ]]
	if p30.state.dragging then
		p30:disconnectDragEvents()
		p30:setState({ dragging = false })
		
		return
	end
end

function slider.processGamepadInput(p31, p32, p33) --[[ line: 534 ]]
	local maxValue = math.max(math.min(p31.props.value + p31.props.stepInterval * p32 * p33, p31.props.max), p31.props.min)
	
	if maxValue ~= p31.props.value then
		p31.props.valueChanged(maxValue)
	end
end

function slider.onMoveStep(p34, p35, p36) --[[ line: 545 ]]
	local var30, var31, var32
	local position = p36[Enum.KeyCode.Thumbstick1].Position
	local var28 = position.Magnitude > 0.2
	local var29 = 0
	local _ = nil
	local _ = nil
	local _ = nil
	p34.totalMoveTime += p35
	
	if var28 then
		var30 = if position.x > 0 then 1 else -1
		var31 = 0.2
		var32 = 12
	else
		var30 = (if p36[Enum.KeyCode.DPadLeft].UserInputState == Enum.UserInputState.Begin then -1 else 0) + (if p36[Enum.KeyCode.DPadRight].UserInputState == Enum.UserInputState.Begin then 1 else 0)
		var31 = 0.5
		var32 = 8
	end
	if var30 == 0 then
		p34.totalMoveTime = 0
		p34.isFirstMove = true
	elseif p34.isFirstMove then
		p34.isFirstMove = false
		p34.totalMoveTime = 0
		p34.unhandledTime = 0
		var29 = 1
	elseif var31 < p34.totalMoveTime then
		local var33 = p35 - math.max(var31 - p34.totalMoveTime - p35, 0) + p34.unhandledTime
		var29 = math.floor(var32 * var33)
		p34.unhandledTime = var33 - var29 / var32
	else
		var29 = 0
		p34.unhandledTime = 0
	end
	if var29 > 0 then
		p34:processGamepadInput(var30, var29)
	end
end

function slider.getDerivedStateFromProps(p37) --[[ line: 595 ]]
	return if p37.isMenuOpen then nil else { entryMode = false }
end

return slider