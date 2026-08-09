local corePackagesService = game:GetService("CorePackages")
local userInputService = game:GetService("UserInputService")
local contextActionService = game:GetService("ContextActionService")
local guiService = game:GetService("GuiService")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local UIBlox = inGameMenuDependenciesModule.UIBlox
local cryo = inGameMenuDependenciesModule.Cryo
local t = inGameMenuDependenciesModule.t
local withStyle = UIBlox.Core.Style.withStyle
local withSelectionCursorProvider = UIBlox.App.SelectionImage.withSelectionCursorProvider
local cursorKind = UIBlox.App.SelectionImage.CursorKind
local externalEventConnectionModule = require(script.Parent.Parent.Utility.ExternalEventConnection)
local focusHandlerModule = require(script.Parent.Connection.FocusHandler)
local sliderModule = require(script.Parent.Slider)
local assetImageModule = require(script.Parent.AssetImage)
local sliderWithInput = roact.PureComponent:extend("SliderWithInput")
sliderWithInput.defaultProps = { width = UDim.new(1, 0) }
sliderWithInput.validateProps = t.intersection(t.strictInterface({
	min = t.number,
	max = t.number,
	stepInterval = t.numberPositive,
	keyboardInputStepInterval = t.optional(t.numberPositive),
	value = t.number,
	valueChanged = t.callback,
	disabled = t.optional(t.boolean),
	width = t.optional(t.UDim),
	AnchorPoint = t.optional(t.Vector2),
	LayoutOrder = t.optional(t.integer),
	Position = t.optional(t.UDim2),
	canCaptureFocus = t.optional(t.boolean),
	isMenuOpen = t.optional(t.boolean),
	sliderDotRef = t.optional(t.table),
	onSelectionLost = t.callback,
	onSelectionGained = t.callback
}), function(p0) --[[ line: 66 ]]
	if p0.max < p0.min then
		return false, "min must be less than or equal to max"
	elseif p0.max < p0.value or p0.value < p0.min then
		return false, "value must be within min and max"
	end
	return true
end)

function sliderWithInput.init(p1) --[[ line: 79 ]]
	-- upvalues: roact (ref)
	p1.textBoxRef = roact.createRef()
	p1.state = { textEntryMode = false }
end

function sliderWithInput.renderFocusHandler(p2) --[[ line: 87 ]]
	-- upvalues: roact (ref), focusHandlerModule (ref), guiService (ref), contextActionService (ref)
	return roact.createElement(focusHandlerModule, {
		isFocused = if p2.props.canCaptureFocus then p2.state.textEntryMode else false,
		didFocus = function() --[[ line: 91 ]]
			-- upvalues: guiService (copy), p2 (ref), contextActionService (copy)
			guiService.CoreGuiNavigationEnabled = false
			local value = p2.props.value
			contextActionService:BindCoreAction("LeaveTextEntryMode", function(_, p3) --[[ line: 100 ]]
				-- upvalues: p2 (copy), value (ref)
				if p3 == Enum.UserInputState.End then
					p2:setState({ textEntryMode = false })
					local current = p2.textBoxRef.current
					current.Text = value
					current:ReleaseFocus()
					
					return Enum.ContextActionResult.Sink
				end
				return Enum.ContextActionResult.Pass
			end, false, Enum.KeyCode.ButtonB)
		end,
		didBlur = function() --[[ line: 112 ]]
			-- upvalues: guiService (copy), contextActionService (copy)
			guiService.CoreGuiNavigationEnabled = true
			contextActionService:UnbindCoreAction("LeaveTextEntryMode")
		end
	}) or nil
end

function sliderWithInput.renderWithSelectionCursor(p4, p5) --[[ line: 119 ]]
	-- upvalues: cryo (ref), roact (ref), sliderModule (ref), withStyle (ref), assetImageModule (ref), cursorKind (ref), externalEventConnectionModule (ref), userInputService (ref)
	local props = p4.props
	
	return roact.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(props.width.Scale, props.width.Offset, 0, 36),
		Position = props.Position,
		LayoutOrder = props.LayoutOrder
	}, {
		Slider = roact.createElement(sliderModule, cryo.Dictionary.join(props, {
			width = UDim.new(1, -80),
			LayoutOrder = cryo.None,
			Position = cryo.None,
			AnchorPoint = cryo.None,
			keyboardInputStepInterval = cryo.None,
			NextSelectionRight = p4.textBoxRef
		})),
		TextContainer = withStyle(function(p6) --[[ line: 137 ]]
			-- upvalues: props (ref), roact (copy), assetImageModule (copy), p4 (ref), p5 (ref), cursorKind (copy)
			local var10 = if props.disabled then p6.Theme.TextMuted else p6.Theme.TextDefault
			
			return roact.createElement(assetImageModule.Label, {
				BackgroundTransparency = 1,
				imageKey = "RoundedRect",
				ImageTransparency = p6.Theme.BackgroundUIContrast.Transparency,
				ImageColor3 = p6.Theme.BackgroundUIContrast.Color,
				Size = UDim2.new(0, 64, 0, 36),
				Position = UDim2.new(1, 0, 0.5, 0),
				AnchorPoint = Vector2.new(1, 0.5)
			}, {
				FocusHandler = p4:renderFocusHandler(),
				Box = roact.createElement("TextBox", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Font = p6.Font.Body.Font,
					TextScaled = true,
					ClearTextOnFocus = false,
					TextEditable = not props.disabled,
					TextColor3 = var10.Color,
					TextTransparency = var10.Transparency,
					Text = tostring(props.value),
					NextSelectionLeft = p4.props.sliderDotRef,
					SelectionImageObject = p5(cursorKind.InputFields),
					[roact.Event.SelectionLost] = p4.props.onSelectionLost,
					[roact.Event.SelectionGained] = p4.props.onSelectionGained,
					[roact.Ref] = p4.textBoxRef,
					[roact.Event.Focused] = if props.disabled then function(p7) --[[ line: 167 ]]
						p7:ReleaseFocus(false)
					end else function() --[[ line: 169 ]]
						-- upvalues: p4 (copy)
						p4:setState({ textEntryMode = true })
					end,
					[roact.Event.FocusLost] = function(p8, _) --[[ line: 172 ]]
						-- upvalues: p4 (copy), props (copy)
						p4:setState({ textEntryMode = false })
						local var11 = tonumber(p8.Text)
						
						if var11 ~= props.value then
							if var11 == nil then
								p8.Text = tostring(props.value)
								
								return
							end
							local var12 = if props.keyboardInputStepInterval then props.keyboardInputStepInterval else props.stepInterval
							local clampedValue = math.clamp(math.floor(var11 / var12 + 0.5) * var12, props.min, props.max)
							p8.Text = tostring(clampedValue)
							
							if clampedValue ~= props.value then
								props.valueChanged(clampedValue)
							end
						end
					end
				}, {
					TextSizeConstraint = roact.createElement("UITextSizeConstraint", {
						MinTextSize = p6.Font.Body.RelativeMinSize * p6.Font.BaseSize,
						MaxTextSize = p6.Font.Body.RelativeSize * p6.Font.BaseSize
					})
				})
			})
		end),
		UserInputConnection = not props.disabled and roact.createElement(externalEventConnectionModule, {
			event = userInputService.InputBegan,
			callback = function(p9, _) --[[ line: 210 ]]
				-- upvalues: userInputService (copy), p4 (ref), props (ref)
				if p9.UserInputType ~= Enum.UserInputType.Keyboard then return end
				if userInputService:GetFocusedTextBox() ~= p4.textBoxRef.current then return end
				local var14 = 0
				
				if p9.KeyCode == Enum.KeyCode.Up then
					var14 = 1
				elseif p9.KeyCode == Enum.KeyCode.Down then
					var14 = -1
				end
				if userInputService:IsKeyDown(Enum.KeyCode.LeftShift) or userInputService:IsKeyDown(Enum.KeyCode.RightShift) then
					var14 *= 10
				end
				if var14 ~= 0 then
					local clampedValue = math.clamp(math.floor((props.value + props.stepInterval * var14) / props.stepInterval + 0.5) * props.stepInterval, props.min, props.max)
					
					if clampedValue ~= props.value then
						props.valueChanged(clampedValue)
					end
				end
			end
		})
	})
end

function sliderWithInput.render(p10) --[[ line: 250 ]]
	-- upvalues: withSelectionCursorProvider (ref)
	return withSelectionCursorProvider(function(p11) --[[ line: 251 ]]
		-- upvalues: p10 (ref)
		return p10:renderWithSelectionCursor(p11)
	end)
end

return sliderWithInput