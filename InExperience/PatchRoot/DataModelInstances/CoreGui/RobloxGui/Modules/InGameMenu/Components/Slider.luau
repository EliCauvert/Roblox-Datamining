local UserInputService = game:GetService("UserInputService")
local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local ContextActionService = game:GetService("ContextActionService")
local RunService = game:GetService("RunService")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local UIBlox = InGameMenuDependenciesModule.UIBlox
local T = InGameMenuDependenciesModule.t
local Otter = InGameMenuDependenciesModule.Otter
local FocusHandlerModule = require(script.Parent.Connection.FocusHandler)
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local FoundationModule = require(CorePackages.Packages.Foundation)
local FFlagCoreUiMigrateUIBloxToFoundation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local WithCursorMigration = if FFlagCoreUiMigrateUIBloxToFoundation then FoundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local CursorType = if FFlagCoreUiMigrateUIBloxToFoundation then FoundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
local DivideTransparencyModule = require(script.Parent.Parent.Utility.divideTransparency)
local AssetImageModule = require(script.Parent.AssetImage)
local ImageSetButton = UIBlox.Core.ImageSet.ImageSetButton
local config = { frequency = 5 }

local function isGamepad(UserInputType): boolean --[[ Line: 50 ]]
	return UserInputType == Enum.UserInputType.Gamepad1 or (UserInputType == Enum.UserInputType.Gamepad2 or (UserInputType == Enum.UserInputType.Gamepad3 or (UserInputType == Enum.UserInputType.Gamepad4 or (UserInputType == Enum.UserInputType.Gamepad5 or (UserInputType == Enum.UserInputType.Gamepad6 or (UserInputType == Enum.UserInputType.Gamepad7 or UserInputType == Enum.UserInputType.Gamepad8))))))
end

local t = {}

local function getInputObjects() --[[ Line: 63 ]]
	-- upvalues: UserInputService (copy), isGamepad (copy), t (copy)
	local LastInputType = UserInputService:GetLastInputType()
	
	if not isGamepad(LastInputType) then
		return nil
	end
	if t[LastInputType] == nil then
		local Inputs = {}
		
		for _, Input in ipairs((UserInputService:GetGamepadState(LastInputType))) do
			Inputs[Input.KeyCode] = Input
		end
		t[LastInputType] = Inputs
	end
	return t[LastInputType]
end

local Slider = Roact.PureComponent:extend("Slider")
Slider.validateProps = T.intersection(T.strictInterface({
	min = T.number,
	max = T.number,
	stepInterval = T.numberPositive,
	value = T.number,
	valueChanged = T.callback,
	disabled = T.optional(T.boolean),
	width = T.optional(T.UDim),
	AnchorPoint = T.optional(T.Vector2),
	LayoutOrder = T.optional(T.integer),
	Position = T.optional(T.UDim2),
	canCaptureFocus = T.optional(T.boolean),
	isMenuOpen = T.optional(T.boolean),
	onSelectionLost = T.optional(T.callback),
	onSelectionGained = T.optional(T.callback),
	NextSelectionRight = T.optional(T.table),
	sliderDotRef = T.optional(T.union(T.callback, T.table))
}), function(p1) --[[ Line: 122 ]]
	if p1.max < p1.min then
		return false, "min must be less than or equal to max"
	elseif p1.max < p1.value or p1.value < p1.min then
		return false, "value must be within min and max"
	else
		return true
	end
end)
Slider.defaultProps = { disabled = false, width = UDim.new(1, 0) }

function Slider.init(p1) --[[ Line: 140 ]]
	-- upvalues: Roact (copy), Otter (copy)
	p1.state = { dragging = false, hovering = false, entryMode = false }
	p1.totalMoveTime = 0
	p1.isFirstMove = true
	p1.unhandledTime = 0
	p1.rootButtonRef = Roact.createRef()
	p1.hoverRef = Roact.createRef()
	p1.hoverMotor = Otter.createSingleMotor(0)
	p1.hoverMotor:onStep(function(XOffset) --[[ Line: 155 ]]
		-- upvalues: p1 (copy)
		local Current = p1.hoverRef.current
		
		if Current ~= nil then
			Current.Size = UDim2.new(0, XOffset, 0, XOffset)
		end
	end)
	
	function p1:onInputBegan(Input) --[[ Line: 163 ]]
		-- upvalues: p1 (copy)
		if p1.props.disabled then return end
		local UserInputType = Input.UserInputType
		
		if UserInputType == Enum.UserInputType.MouseButton1 or UserInputType == Enum.UserInputType.Touch then
			p1:processDrag(Input.Position.X)
			p1:startListeningForDrag()
			
			return
		end
	end
end

function Slider.renderFocusHandler(p1) --[[ Line: 180 ]]
	-- upvalues: Roact (copy), FocusHandlerModule (copy), GuiService (copy), RunService (copy), getInputObjects (copy), ContextActionService (copy)
	return Roact.createElement(FocusHandlerModule, {
		isFocused = p1.state.entryMode and p1.props.canCaptureFocus,
		didFocus = function() --[[ Line: 184 ]]
			-- upvalues: GuiService (upval), p1 (copy), RunService (upval), getInputObjects (upval), ContextActionService (upval)
			GuiService.CoreGuiNavigationEnabled = false
			p1.joystickListener = RunService.Heartbeat:Connect(function(DeltaTime) --[[ Line: 188 ]]
				-- upvalues: p1 (upval), getInputObjects (upval)
				p1:onMoveStep(DeltaTime, (getInputObjects()))
			end)
			local Value = p1.props.value
			ContextActionService:BindCoreAction("LeaveEntryMode", function(_, UserInputState) --[[ Line: 197 ]]
				-- upvalues: p1 (upval), Value (copy)
				if UserInputState == Enum.UserInputState.End then
					p1:setState({ entryMode = false })
					p1.props.valueChanged(Value)
					
					return Enum.ContextActionResult.Sink
				else
					return Enum.ContextActionResult.Pass
				end
			end, false, Enum.KeyCode.ButtonB)
		end,
		didBlur = function() --[[ Line: 207 ]]
			-- upvalues: p1 (copy), GuiService (upval), ContextActionService (upval)
			p1.joystickListener:Disconnect()
			GuiService.CoreGuiNavigationEnabled = true
			ContextActionService:UnbindCoreAction("LeaveEntryMode")
			p1:setState({ entryMode = false })
		end
	}) or nil
end

function Slider.renderWithSelectionCursor(p1, Callback) --[[ Line: 216 ]]
	-- upvalues: WithFoundationOrUIBloxStyleFunction (copy), Roact (copy), ImageSetButton (copy), AssetImageModule (copy), DivideTransparencyModule (copy), CursorType (copy)
	local Min = p1.props.min
	local ValueRatio = (p1.props.value - Min) / (p1.props.max - Min)
	local Magnitude = math.abs(ValueRatio)
	local XScale = ValueRatio / 2
	local CanCaptureFocus = p1.state.entryMode and p1.props.canCaptureFocus
	
	return WithFoundationOrUIBloxStyleFunction(function(p2) --[[ Line: 227 ]]
		return {
			Theme = {
				UIMuted = {
					Color = p2.Color.Shift.Shift_100.Color3,
					Transparency = p2.Color.Shift.Shift_100.Transparency
				},
				ContextualPrimaryDefault = {
					Color = p2.Color.ActionEmphasis.Background.Color3,
					Transparency = p2.Color.ActionEmphasis.Background.Transparency
				}
			}
		}
	end, function(p2) --[[ Line: 234 ]]
		-- upvalues: Roact (upval), ImageSetButton (upval), p1 (copy), AssetImageModule (upval), DivideTransparencyModule (upval), XScale (copy), Magnitude (copy), ValueRatio (copy), Callback (copy), CanCaptureFocus (copy), CursorType (upval)
		return Roact.createElement(ImageSetButton, {
			AnchorPoint = p1.props.AnchorPoint,
			BackgroundTransparency = 1,
			Image = "",
			LayoutOrder = p1.props.LayoutOrder,
			Position = p1.props.Position,
			Size = UDim2.new(p1.props.width.Scale, p1.props.width.Offset, 0, 36),
			[Roact.Ref] = p1.rootButtonRef,
			[Roact.Event.InputBegan] = p1.onInputBegan,
			Selectable = false
		}, {
			FocusHandler = p1:renderFocusHandler(),
			Gutter = Roact.createElement(AssetImageModule.Label, {
				BackgroundTransparency = 1,
				imageKey = "SliderCircle",
				AnchorPoint = Vector2.new(0.5, 0.5),
				ImageColor3 = p2.Theme.UIMuted.Color,
				ImageTransparency = p2.Theme.UIMuted.Transparency,
				Position = UDim2.new(0.5, 0, 0.5, 0),
				Size = UDim2.new(1, 0, 0, 4)
			}, {
				FilledGutter = Roact.createElement(AssetImageModule.Label, {
					BackgroundTransparency = 1,
					imageKey = "SliderCircle",
					AnchorPoint = Vector2.new(0.5, 0.5),
					ImageColor3 = p2.Theme.ContextualPrimaryDefault.Color,
					ImageTransparency = DivideTransparencyModule(p2.Theme.ContextualPrimaryDefault.Transparency, if p1.props.disabled then 2 else 1),
					Position = UDim2.new(XScale, 0, 0.5, 0),
					Size = UDim2.new(Magnitude, 0, 1, 0)
				})
			}),
			DotTrack = Roact.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 4,
				Selectable = false,
				Size = UDim2.new(1, -12, 1, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0)
			}, {
				Dot = Roact.createElement(AssetImageModule.Button, {
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundTransparency = 1,
					imageKey = "SliderButton",
					Position = UDim2.new(ValueRatio, 0, 0.5, 0),
					Size = UDim2.new(0, 42, 0, 42),
					ImageTransparency = if p1.props.disabled then 0.5 else 0,
					ZIndex = 2,
					SelectionImageObject = Callback(CanCaptureFocus and CursorType.SelectedKnob or CursorType.UnselectedKnob),
					[Roact.Event.Activated] = function(_, Input) --[[ Line: 288 ]]
						-- upvalues: p1 (upval)
						if Input.KeyCode == Enum.KeyCode.ButtonA then
							p1:setState({ entryMode = not p1.state.entryMode })
						end
					end,
					[Roact.Event.InputBegan] = function(p3, Input) --[[ Line: 295 ]]
						-- upvalues: p1 (upval)
						if p1.props.disabled then return end
						if Input.UserInputType == Enum.UserInputType.MouseMovement then
							p1:setState({ hovering = true })
							
							return
						else
							p1.onInputBegan(p3, Input)
						end
					end,
					[Roact.Event.InputEnded] = function(_, Input) --[[ Line: 308 ]]
						-- upvalues: p1 (upval)
						if p1.props.disabled then return end
						if Input.UserInputType == Enum.UserInputType.MouseMovement then
							p1:setState({ hovering = false })
						end
					end,
					[Roact.Ref] = p1.props.sliderDotRef,
					[Roact.Event.SelectionLost] = p1.props.onSelectionLost,
					[Roact.Event.SelectionGained] = p1.props.onSelectionGained,
					NextSelectionRight = p1.props.NextSelectionRight
				}),
				HoverOverlay = Roact.createElement(AssetImageModule.Label, {
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundTransparency = 1,
					imageKey = "SliderHover",
					Position = UDim2.new(ValueRatio, 0, 0.5, 0),
					Size = UDim2.new(0, 0, 0, 0),
					[Roact.Ref] = p1.hoverRef
				})
			})
		})
	end)
end

function Slider.render(p1) --[[ Line: 337 ]]
	-- upvalues: WithCursorMigration (copy)
	return WithCursorMigration(function(p2) --[[ Line: 338 ]]
		-- upvalues: p1 (copy)
		return p1:renderWithSelectionCursor(p2)
	end)
end

function Slider.didMount(p1) --[[ Line: 343 ]]
	local Current = p1.rootButtonRef.current
	local Connection = nil
	Connection = Current.AncestryChanged:Connect(function() --[[ Line: 351 ]]
		-- upvalues: Current (copy), Connection (ref), p1 (copy)
		if Current:IsDescendantOf(game) then
			Connection:Disconnect()
			p1.canUseUserInputService = Current:FindFirstAncestorWhichIsA("PluginGui") == nil
			
			return
		end
	end)
	p1.hoverMotor:start()
end

function Slider.didUpdate(p1) --[[ Line: 366 ]]
	-- upvalues: Otter (copy), config (copy)
	if p1.props.disabled then
		p1:stopListeningForDrag()
	end
	p1.hoverMotor:setGoal(Otter.spring(if p1.props.disabled or not p1.state.dragging and not p1.state.hovering then 0 else 42, config))
end

function Slider.willUnmount(p1) --[[ Line: 379 ]]
	p1.hoverMotor:stop()
	p1:disconnectDragEvents()
end

function Slider.startListeningForDrag(p1) --[[ Line: 384 ]]
	-- upvalues: UserInputService (copy)
	local Current = p1.rootButtonRef.current
	
	if Current == nil then return end
	if p1.state.dragging then return end
	if p1.canUseUserInputService then
		p1.moveConnection = UserInputService.InputChanged:Connect(function(Input) --[[ Line: 397 ]]
			-- upvalues: p1 (copy)
			if not p1.state.dragging then return end
			local UserInputType = Input.UserInputType
			
			if UserInputType ~= Enum.UserInputType.MouseMovement and UserInputType ~= Enum.UserInputType.Touch then return end
			if Input.UserInputState == Enum.UserInputState.Change then
				p1:processDrag(Input.Position.X)
				
				return
			end
		end)
		p1.releaseConnection = UserInputService.InputEnded:Connect(function(Input) --[[ Line: 419 ]]
			-- upvalues: p1 (copy)
			local UserInputType = Input.UserInputType
			
			if UserInputType == Enum.UserInputType.MouseButton1 or UserInputType == Enum.UserInputType.Touch then
				p1:stopListeningForDrag()
				p1:processDrag(Input.Position.X)
				
				return
			end
		end)
		p1.focusLostConnection = UserInputService.WindowFocusReleased:Connect(function() --[[ Line: 434 ]]
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
		p1.moveConnection = SliderPluginGuiInputCapturer.MouseMoved:Connect(function(X) --[[ Line: 454 ]]
			-- upvalues: p1 (copy)
			p1:processDrag(X)
		end)
		p1.releaseConnection = SliderPluginGuiInputCapturer.MouseButton1Up:Connect(function(p2) --[[ Line: 458 ]]
			-- upvalues: p1 (copy)
			p1:stopListeningForDrag()
			p1:processDrag(p2)
		end)
		p1.focusLostConnection = SliderPluginGuiInputCapturer.MouseLeave:Connect(function(X) --[[ Line: 463 ]]
			-- upvalues: p1 (copy)
			p1:stopListeningForDrag()
			p1:processDrag(X)
		end)
		SliderPluginGuiInputCapturer.Parent = PluginGui
		p1.inputCapturerButton = SliderPluginGuiInputCapturer
	end
	p1:setState({ dragging = true })
end

function Slider.processDrag(p1, X) --[[ Line: 477 ]]
	local Current = p1.rootButtonRef.current
	
	if Current == nil then return end
	local Min = p1.props.min
	local StepInterval = p1.props.stepInterval
	local X1: number = Current.AbsoluteSize.X
	local ScaledFloored = math.floor((math.clamp(X - Current.AbsolutePosition.X, 0, X1) / X1 * (p1.props.max - Min) + Min) / StepInterval + 0.5) * StepInterval
	
	if ScaledFloored ~= p1.props.value then
		p1.props.valueChanged(ScaledFloored)
	end
end

function Slider.disconnectDragEvents(p1) --[[ Line: 500 ]]
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

function Slider.stopListeningForDrag(p1) --[[ Line: 522 ]]
	if p1.state.dragging then
		p1:disconnectDragEvents()
		p1:setState({ dragging = false })
		
		return
	end
end

function Slider.processGamepadInput(p1, p2, Floored) --[[ Line: 534 ]]
	local Largest = math.max(math.min(p1.props.value + p1.props.stepInterval * p2 * Floored, p1.props.max), p1.props.min)
	
	if Largest ~= p1.props.value then
		p1.props.valueChanged(Largest)
	end
end

function Slider.onMoveStep(p1, p2, p3) --[[ Line: 545 ]]
	local Position = p3[Enum.KeyCode.Thumbstick1].Position
	local IsMagnitudeAbove = Position.Magnitude > 0.2
	local Floored = 0
	p1.totalMoveTime += p2
	local v1 = nil
	local v2 = nil
	local v3 = nil
	
	if IsMagnitudeAbove then
		v2 = if Position.x > 0 then 1 else -1
		v3 = 0.2
		v1 = 12
	else
		v2 = (if p3[Enum.KeyCode.DPadLeft].UserInputState == Enum.UserInputState.Begin then -1 else 0) + (if p3[Enum.KeyCode.DPadRight].UserInputState == Enum.UserInputState.Begin then 1 else 0)
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
		local NewLargest = p2 - math.max(v3 - p1.totalMoveTime - p2, 0) + p1.unhandledTime
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

function Slider.getDerivedStateFromProps(p1) --[[ Line: 595 ]]
	return if p1.isMenuOpen then nil else { entryMode = false }
end

return Slider