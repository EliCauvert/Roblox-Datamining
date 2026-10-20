local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local ContextActionService = game:GetService("ContextActionService")
local GuiService = game:GetService("GuiService")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local UIBlox = InGameMenuDependenciesModule.UIBlox
local Cryo = InGameMenuDependenciesModule.Cryo
local T = InGameMenuDependenciesModule.t
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local WithSelectionCursorProviderFunction = UIBlox.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBlox.App.SelectionImage.CursorKind
local ExternalEventConnectionModule = require(script.Parent.Parent.Utility.ExternalEventConnection)
local FocusHandlerModule = require(script.Parent.Connection.FocusHandler)
local SliderModule = require(script.Parent.Slider)
local AssetImageModule = require(script.Parent.AssetImage)
local SliderWithInput = Roact.PureComponent:extend("SliderWithInput")
SliderWithInput.defaultProps = { width = UDim.new(1, 0) }
SliderWithInput.validateProps = T.intersection(T.strictInterface({
	min = T.number,
	max = T.number,
	stepInterval = T.numberPositive,
	keyboardInputStepInterval = T.optional(T.numberPositive),
	value = T.number,
	valueChanged = T.callback,
	disabled = T.optional(T.boolean),
	width = T.optional(T.UDim),
	AnchorPoint = T.optional(T.Vector2),
	LayoutOrder = T.optional(T.integer),
	Position = T.optional(T.UDim2),
	canCaptureFocus = T.optional(T.boolean),
	isMenuOpen = T.optional(T.boolean),
	sliderDotRef = T.optional(T.table),
	onSelectionLost = T.callback,
	onSelectionGained = T.callback
}), function(p1)
	if p1.max < p1.min then
		return false, "min must be less than or equal to max"
	elseif p1.max < p1.value or p1.value < p1.min then
		return false, "value must be within min and max"
	else
		return true
	end
end)

function SliderWithInput.init(p1)
	-- upvalues: Roact (copy)
	p1.textBoxRef = Roact.createRef()
	p1.state = { textEntryMode = false }
end

function SliderWithInput.renderFocusHandler(p1)
	-- upvalues: Roact (copy), FocusHandlerModule (copy), GuiService (copy), ContextActionService (copy)
	return Roact.createElement(FocusHandlerModule, {
		isFocused = p1.props.canCaptureFocus and p1.state.textEntryMode or false,
		didFocus = function()
			-- upvalues: GuiService (upval), p1 (copy), ContextActionService (upval)
			GuiService.CoreGuiNavigationEnabled = false
			local Value = p1.props.value
			ContextActionService:BindCoreAction("LeaveTextEntryMode", function(_, UserInputState)
				-- upvalues: p1 (upval), Value (copy)
				if UserInputState == Enum.UserInputState.End then
					p1:setState({ textEntryMode = false })
					local Current = p1.textBoxRef.current
					Current.Text = Value
					Current:ReleaseFocus()
					
					return Enum.ContextActionResult.Sink
				else
					return Enum.ContextActionResult.Pass
				end
			end, false, Enum.KeyCode.ButtonB)
		end,
		didBlur = function()
			-- upvalues: GuiService (upval), ContextActionService (upval)
			GuiService.CoreGuiNavigationEnabled = true
			ContextActionService:UnbindCoreAction("LeaveTextEntryMode")
		end
	}) or nil
end

function SliderWithInput.renderWithSelectionCursor(p1, Callback)
	-- upvalues: Cryo (copy), Roact (copy), SliderModule (copy), WithFoundationOrUIBloxStyleFunction (copy), AssetImageModule (copy), CursorKind (copy), ExternalEventConnectionModule (copy), UserInputService (copy)
	local Props = p1.props
	
	return Roact.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(Props.width.Scale, Props.width.Offset, 0, 36),
		Position = Props.Position,
		LayoutOrder = Props.LayoutOrder
	}, {
		Slider = Roact.createElement(SliderModule, (Cryo.Dictionary.join(Props, {
			width = UDim.new(1, -80),
			LayoutOrder = Cryo.None,
			Position = Cryo.None,
			AnchorPoint = Cryo.None,
			keyboardInputStepInterval = Cryo.None,
			NextSelectionRight = p1.textBoxRef
		}))),
		TextContainer = WithFoundationOrUIBloxStyleFunction(function(p2)
			return {
				Theme = {
					TextMuted = {
						Color = p2.Color.Content.Muted.Color3,
						Transparency = p2.Color.Content.Muted.Transparency
					},
					TextDefault = {
						Color = p2.Color.Content.Default.Color3,
						Transparency = p2.Color.Content.Default.Transparency
					},
					BackgroundUIContrast = {
						Color = p2.Color.OverMedia.OverMedia_0.Color3,
						Transparency = p2.Color.OverMedia.OverMedia_0.Transparency
					}
				},
				Font = {
					BaseSize = 1,
					Body = {
						Font = p2.Typography.BodyLarge.Font,
						RelativeSize = p2.Typography.BodyLarge.FontSize,
						RelativeMinSize = p2.Typography.BodyLarge.FontSize
					}
				}
			}
		end, function(p2)
			-- upvalues: Props (copy), Roact (upval), AssetImageModule (upval), p1 (copy), Callback (copy), CursorKind (upval)
			local TextMuted = Props.disabled and p2.Theme.TextMuted or p2.Theme.TextDefault
			
			return Roact.createElement(AssetImageModule.Label, {
				BackgroundTransparency = 1,
				imageKey = "RoundedRect",
				ImageTransparency = p2.Theme.BackgroundUIContrast.Transparency,
				ImageColor3 = p2.Theme.BackgroundUIContrast.Color,
				Size = UDim2.new(0, 64, 0, 36),
				Position = UDim2.new(1, 0, 0.5, 0),
				AnchorPoint = Vector2.new(1, 0.5)
			}, {
				FocusHandler = p1:renderFocusHandler(),
				Box = Roact.createElement("TextBox", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Font = p2.Font.Body.Font,
					TextScaled = true,
					ClearTextOnFocus = false,
					TextEditable = not Props.disabled,
					TextColor3 = TextMuted.Color,
					TextTransparency = TextMuted.Transparency,
					Text = tostring(Props.value),
					NextSelectionLeft = p1.props.sliderDotRef,
					SelectionImageObject = Callback(CursorKind.InputFields),
					[Roact.Event.SelectionLost] = p1.props.onSelectionLost,
					[Roact.Event.SelectionGained] = p1.props.onSelectionGained,
					[Roact.Ref] = p1.textBoxRef,
					[Roact.Event.Focused] = Props.disabled and function(TextBox)
						TextBox:ReleaseFocus(false)
					end or function()
						-- upvalues: p1 (upval)
						p1:setState({ textEntryMode = true })
					end,
					[Roact.Event.FocusLost] = function(p3, _)
						-- upvalues: p1 (upval), Props (upval)
						p1:setState({ textEntryMode = false })
						local Number: number? = tonumber(p3.Text)
						
						if Number ~= Props.value then
							if Number == nil then
								p3.Text = tostring(Props.value)
								
								return
							end
							local KeyboardInputStepInterval = if Props.keyboardInputStepInterval then Props.keyboardInputStepInterval else Props.stepInterval
							local ClampedValue = math.clamp(math.floor(Number / KeyboardInputStepInterval + 0.5) * KeyboardInputStepInterval, Props.min, Props.max)
							p3.Text = tostring(ClampedValue)
							
							if ClampedValue ~= Props.value then
								Props.valueChanged(ClampedValue)
							end
						end
					end
				}, {
					TextSizeConstraint = Roact.createElement("UITextSizeConstraint", {
						MinTextSize = p2.Font.Body.RelativeMinSize * p2.Font.BaseSize,
						MaxTextSize = p2.Font.Body.RelativeSize * p2.Font.BaseSize
					})
				})
			})
		end),
		UserInputConnection = not Props.disabled and Roact.createElement(ExternalEventConnectionModule, {
			event = UserInputService.InputBegan,
			callback = function(Input, _)
				-- upvalues: UserInputService (upval), p1 (copy), Props (copy)
				if Input.UserInputType ~= Enum.UserInputType.Keyboard then return end
				if UserInputService:GetFocusedTextBox() ~= p1.textBoxRef.current then return end
				local v1 = 0
				
				if Input.KeyCode == Enum.KeyCode.Up then
					v1 = 1
				elseif Input.KeyCode == Enum.KeyCode.Down then
					v1 = -1
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.RightShift) then
					v1 *= 10
				end
				if v1 ~= 0 then
					local ClampedValue = math.clamp(math.floor((Props.value + Props.stepInterval * v1) / Props.stepInterval + 0.5) * Props.stepInterval, Props.min, Props.max)
					
					if ClampedValue ~= Props.value then
						Props.valueChanged(ClampedValue)
					end
				end
			end
		})
	})
end

function SliderWithInput.render(p1)
	-- upvalues: WithSelectionCursorProviderFunction (copy)
	return WithSelectionCursorProviderFunction(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithSelectionCursor(p2)
	end)
end

return SliderWithInput