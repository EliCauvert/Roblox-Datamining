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
local var1 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local var2 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
local divideTransparencyModule = require(script.Parent.Parent.Utility.divideTransparency)
local assetImageModule = require(script.Parent.AssetImage)
local imageSetButton = UIBlox.Core.ImageSet.ImageSetButton
local t_1 = { frequency = 5 }

local function isGamepad(p1)
	return if p1 ~= Enum.UserInputType.Gamepad1 then if p1 ~= Enum.UserInputType.Gamepad2 then if p1 ~= Enum.UserInputType.Gamepad3 then if p1 ~= Enum.UserInputType.Gamepad4 then if p1 ~= Enum.UserInputType.Gamepad5 then if p1 ~= Enum.UserInputType.Gamepad6 then if p1 ~= Enum.UserInputType.Gamepad7 then p1 == Enum.UserInputType.Gamepad8 else true else true else true else true else true else true else true
end

local t_2 = {}

local function getInputObjects()
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
}), function(p1)
	if p1.max < p1.min then
		return false, "min must be less than or equal to max"
	elseif p1.max < p1.value or p1.value < p1.min then
		return false, "value must be within min and max"
	end
	return true
end)
slider.defaultProps = { disabled = false, width = UDim.new(1, 0) }

function slider.init(p1)
	-- upvalues: roact (ref), otter (ref)
	p1.state = { dragging = false, hovering = false, entryMode = false }
	p1.totalMoveTime = 0
	p1.isFirstMove = true
	p1.unhandledTime = 0
	p1.rootButtonRef = roact.createRef()
	p1.hoverRef = roact.createRef()
	p1.hoverMotor = otter.createSingleMotor(0)
	p1.hoverMotor:onStep(function(p2)
		-- upvalues: p1 (ref)
		local current = p1.hoverRef.current
		
		if current ~= nil then
			current.Size = UDim2.new(0, p2, 0, p2)
		end
	end)
	
	function p2.onInputBegan(_, p2)
		-- upvalues: p1 (ref)
		if p1.props.disabled then return end
		local userInputType = p2.UserInputType
		
		if userInputType == Enum.UserInputType.MouseButton1 or userInputType == Enum.UserInputType.Touch then
			p1:processDrag(p2.Position.X)
			p1:startListeningForDrag()
			
			return
		end
	end
end

function slider.renderFocusHandler(p1)
	-- upvalues: roact (ref), focusHandlerModule (ref), guiService (ref), runService (ref), getInputObjects (ref), contextActionService (ref)
	return roact.createElement(focusHandlerModule, {
		isFocused = p1.state.entryMode and p1.props.canCaptureFocus,
		didFocus = function()
			-- upvalues: guiService (copy), p1 (ref), runService (copy), getInputObjects (copy), contextActionService (copy)
			guiService.CoreGuiNavigationEnabled = false
			p1.joystickListener = runService.Heartbeat:Connect(function(p2)
				-- upvalues: p1 (copy), getInputObjects (copy)
				p1:onMoveStep(p2, getInputObjects())
			end)
			local value = p1.props.value
			contextActionService:BindCoreAction("LeaveEntryMode", function(_, p2)
				-- upvalues: p1 (copy), value (ref)
				if p2 == Enum.UserInputState.End then
					p1:setState({ entryMode = false })
					p1.props.valueChanged(value)
					
					return Enum.ContextActionResult.Sink
				end
				return Enum.ContextActionResult.Pass
			end, false, Enum.KeyCode.ButtonB)
		end,
		didBlur = function()
			-- upvalues: p1 (ref), guiService (copy), contextActionService (copy)
			p1.joystickListener:Disconnect()
			guiService.CoreGuiNavigationEnabled = true
			contextActionService:UnbindCoreAction("LeaveEntryMode")
			p1:setState({ entryMode = false })
		end
	}) or nil
end

function slider.renderWithSelectionCursor(p1, p2)
	-- upvalues: withFoundationOrUIBloxStyle (ref), roact (ref), imageSetButton (ref), assetImageModule (ref), divideTransparencyModule (ref), var2 (ref)
	local min = p1.props.min
	local var3 = (p1.props.value - min) / (p1.props.max - min)
	local absValue = math.abs(var3)
	local var4 = var3 / 2
	local canCaptureFocus = p1.state.entryMode and p1.props.canCaptureFocus
	
	return withFoundationOrUIBloxStyle(function(p3)
		return {
			Theme = {
				UIMuted = {
					Color = p3.Color.Shift.Shift_100.Color3,
					Transparency = p3.Color.Shift.Shift_100.Transparency
				},
				ContextualPrimaryDefault = {
					Color = p3.Color.ActionEmphasis.Background.Color3,
					Transparency = p3.Color.ActionEmphasis.Background.Transparency
				}
			}
		}
	end, function(p3)
		-- upvalues: roact (copy), imageSetButton (copy), p1 (ref), assetImageModule (copy), divideTransparencyModule (copy), var4 (ref), absValue (ref), var3 (ref), p2 (ref), canCaptureFocus (ref), var2 (copy)
		return roact.createElement(imageSetButton, {
			AnchorPoint = p1.props.AnchorPoint,
			BackgroundTransparency = 1,
			Image = "",
			LayoutOrder = p1.props.LayoutOrder,
			Position = p1.props.Position,
			Size = UDim2.new(p1.props.width.Scale, p1.props.width.Offset, 0, 36),
			[roact.Ref] = p1.rootButtonRef,
			[roact.Event.InputBegan] = p1.onInputBegan,
			Selectable = false
		}, {
			FocusHandler = p1:renderFocusHandler(),
			Gutter = roact.createElement(assetImageModule.Label, {
				BackgroundTransparency = 1,
				imageKey = "SliderCircle",
				AnchorPoint = Vector2.new(0.5, 0.5),
				ImageColor3 = p3.Theme.UIMuted.Color,
				ImageTransparency = p3.Theme.UIMuted.Transparency,
				Position = UDim2.new(0.5, 0, 0.5, 0),
				Size = UDim2.new(1, 0, 0, 4)
			}, {
				FilledGutter = roact.createElement(assetImageModule.Label, {
					BackgroundTransparency = 1,
					imageKey = "SliderCircle",
					AnchorPoint = Vector2.new(0.5, 0.5),
					ImageColor3 = p3.Theme.ContextualPrimaryDefault.Color,
					ImageTransparency = divideTransparencyModule(p3.Theme.ContextualPrimaryDefault.Transparency, if p1.props.disabled then 2 else 1),
					Position = UDim2.new(var4, 0, 0.5, 0),
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
					Position = UDim2.new(var3, 0, 0.5, 0),
					Size = UDim2.new(0, 42, 0, 42),
					ImageTransparency = if p1.props.disabled then 0.5 else 0,
					ZIndex = 2,
					SelectionImageObject = p2(if canCaptureFocus then var2.SelectedKnob else var2.UnselectedKnob),
					[roact.Event.Activated] = function(_, p4)
						-- upvalues: p1 (copy)
						if p4.KeyCode == Enum.KeyCode.ButtonA then
							p1:setState({ entryMode = not p1.state.entryMode })
						end
					end,
					[roact.Event.InputBegan] = function(p4, p5)
						-- upvalues: p1 (copy)
						if p1.props.disabled then return end
						if p5.UserInputType == Enum.UserInputType.MouseMovement then
							p1:setState({ hovering = true })
							
							return
						end
						p1.onInputBegan(p4, p5)
					end,
					[roact.Event.InputEnded] = function(_, p4)
						-- upvalues: p1 (copy)
						if p1.props.disabled then return end
						if p4.UserInputType == Enum.UserInputType.MouseMovement then
							p1:setState({ hovering = false })
						end
					end,
					[roact.Ref] = p1.props.sliderDotRef,
					[roact.Event.SelectionLost] = p1.props.onSelectionLost,
					[roact.Event.SelectionGained] = p1.props.onSelectionGained,
					NextSelectionRight = p1.props.NextSelectionRight
				}),
				HoverOverlay = roact.createElement(assetImageModule.Label, {
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundTransparency = 1,
					imageKey = "SliderHover",
					Position = UDim2.new(var3, 0, 0.5, 0),
					Size = UDim2.new(0, 0, 0, 0),
					[roact.Ref] = p1.hoverRef
				})
			})
		})
	end)
end

function slider.render(p1)
	-- upvalues: var1 (ref)
	return var1(function(p2)
		-- upvalues: p1 (ref)
		return p1:renderWithSelectionCursor(p2)
	end)
end

function slider.didMount(p1)
	local current = p1.rootButtonRef.current
	local ancestryChangedConnection = nil
	ancestryChangedConnection = current.AncestryChanged:Connect(function()
		-- upvalues: current (ref), ancestryChangedConnection (write), p1 (ref)
		if current:IsDescendantOf(game) then
			ancestryChangedConnection:Disconnect()
			p1.canUseUserInputService = current:FindFirstAncestorWhichIsA("PluginGui") == nil
			
			return
		end
	end)
	p1.hoverMotor:start()
end

function slider.didUpdate(p1)
	-- upvalues: otter (ref), t_1 (ref)
	if p1.props.disabled then
		p1:stopListeningForDrag()
	end
	p1.hoverMotor:setGoal(otter.spring(if not (p1.props.disabled or not p1.state.dragging and not p1.state.hovering) then 42 else 0, t_1))
end

function slider.willUnmount(p1)
	p1.hoverMotor:stop()
	p1:disconnectDragEvents()
end

function slider.startListeningForDrag(p1)
	-- upvalues: userInputService (ref)
	local current = p1.rootButtonRef.current
	
	if current == nil then return end
	if p1.state.dragging then return end
	if p1.canUseUserInputService then
		p1.moveConnection = userInputService.InputChanged:Connect(function(p2)
			-- upvalues: p1 (ref)
			if not p1.state.dragging then return end
			local userInputType = p2.UserInputType
			
			if userInputType ~= Enum.UserInputType.MouseMovement and userInputType ~= Enum.UserInputType.Touch then return end
			if p2.UserInputState == Enum.UserInputState.Change then
				p1:processDrag(p2.Position.X)
				
				return
			end
		end)
		p1.releaseConnection = userInputService.InputEnded:Connect(function(p2)
			-- upvalues: p1 (ref)
			local userInputType = p2.UserInputType
			
			if userInputType == Enum.UserInputType.MouseButton1 or userInputType == Enum.UserInputType.Touch then
				p1:stopListeningForDrag()
				p1:processDrag(p2.Position.X)
				
				return
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
			p1:processDrag(p2)
		end)
		p1.focusLostConnection = sliderPluginGuiInputCapturer.MouseLeave:Connect(function(p2)
			-- upvalues: p1 (ref)
			p1:stopListeningForDrag()
			p1:processDrag(p2)
		end)
		sliderPluginGuiInputCapturer.Parent = pluginGui
		p1.inputCapturerButton = sliderPluginGuiInputCapturer
	end
	p1:setState({ dragging = true })
end

function slider.processDrag(p1, p2)
	local current = p1.rootButtonRef.current
	
	if current == nil then return end
	local min = p1.props.min
	local max = p1.props.max
	local stepInterval = p1.props.stepInterval
	local x = current.AbsoluteSize.X
	local var3 = math.floor((math.clamp(p2 - current.AbsolutePosition.X, 0, x) / x * (max - min) + min) / stepInterval + 0.5) * stepInterval
	
	if var3 ~= p1.props.value then
		p1.props.valueChanged(var3)
	end
end

function slider.disconnectDragEvents(p1)
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
end

function slider.stopListeningForDrag(p1)
	if p1.state.dragging then
		p1:disconnectDragEvents()
		p1:setState({ dragging = false })
		
		return
	end
end

function slider.processGamepadInput(p1, p2, p3)
	local maxValue = math.max(math.min(p1.props.value + p1.props.stepInterval * p2 * p3, p1.props.max), p1.props.min)
	
	if maxValue ~= p1.props.value then
		p1.props.valueChanged(maxValue)
	end
end

function slider.onMoveStep(p1, p2, p3)
	local var3, var4, var5
	local position = p3[Enum.KeyCode.Thumbstick1].Position
	local var6 = position.Magnitude > 0.2
	local var7 = 0
	local _ = nil
	local _ = nil
	local _ = nil
	p1.totalMoveTime += p2
	
	if var6 then
		var3 = if position.x > 0 then 1 else -1
		var4 = 0.2
		var5 = 12
	else
		var3 = (if p3[Enum.KeyCode.DPadLeft].UserInputState == Enum.UserInputState.Begin then -1 else 0) + (if p3[Enum.KeyCode.DPadRight].UserInputState == Enum.UserInputState.Begin then 1 else 0)
		var4 = 0.5
		var5 = 8
	end
	if var3 == 0 then
		p1.totalMoveTime = 0
		p1.isFirstMove = true
	elseif p1.isFirstMove then
		p1.isFirstMove = false
		p1.totalMoveTime = 0
		p1.unhandledTime = 0
		var7 = 1
	elseif var4 < p1.totalMoveTime then
		local var8 = p2 - math.max(var4 - p1.totalMoveTime - p2, 0) + p1.unhandledTime
		var7 = math.floor(var5 * var8)
		p1.unhandledTime = var8 - var7 / var5
	else
		var7 = 0
		p1.unhandledTime = 0
	end
	if var7 > 0 then
		p1:processGamepadInput(var3, var7)
	end
end

function slider.getDerivedStateFromProps(p1)
	return if p1.isMenuOpen then nil else { entryMode = false }
end

return slider