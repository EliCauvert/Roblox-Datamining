local corePackagesService = game:GetService("CorePackages")
local userInputService = game:GetService("UserInputService")
local contextActionService = game:GetService("ContextActionService")
local guiService = game:GetService("GuiService")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local UIBlox = inGameMenuDependenciesModule.UIBlox
local cryo = inGameMenuDependenciesModule.Cryo
local t = inGameMenuDependenciesModule.t
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local foundationModule = require(corePackagesService.Packages.Foundation)
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local var1 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local var2 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
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
}), function(p1)
	if p1.max < p1.min then
		return false, "min must be less than or equal to max"
	elseif p1.max < p1.value or p1.value < p1.min then
		return false, "value must be within min and max"
	end
	return true
end)

function sliderWithInput.init(p1)
	-- upvalues: roact (ref)
	p1.textBoxRef = roact.createRef()
	p1.state = { textEntryMode = false }
end

function sliderWithInput.renderFocusHandler(p1)
	-- upvalues: roact (ref), focusHandlerModule (ref), guiService (ref), contextActionService (ref)
	return roact.createElement(focusHandlerModule, {
		isFocused = if p1.props.canCaptureFocus then p1.state.textEntryMode else false,
		didFocus = function()
			-- upvalues: guiService (copy), p1 (ref), contextActionService (copy)
			guiService.CoreGuiNavigationEnabled = false
			local value = p1.props.value
			contextActionService:BindCoreAction("LeaveTextEntryMode", function(_, p2)
				-- upvalues: p1 (copy), value (ref)
				if p2 == Enum.UserInputState.End then
					p1:setState({ textEntryMode = false })
					local current = p1.textBoxRef.current
					current.Text = value
					current:ReleaseFocus()
					
					return Enum.ContextActionResult.Sink
				end
				return Enum.ContextActionResult.Pass
			end, false, Enum.KeyCode.ButtonB)
		end,
		didBlur = function()
			-- upvalues: guiService (copy), contextActionService (copy)
			guiService.CoreGuiNavigationEnabled = true
			contextActionService:UnbindCoreAction("LeaveTextEntryMode")
		end
	}) or nil
end

function sliderWithInput.renderWithSelectionCursor(p1, p2)
	-- upvalues: cryo (ref), roact (ref), sliderModule (ref), withFoundationOrUIBloxStyle (ref), assetImageModule (ref), var2 (ref), externalEventConnectionModule (ref), userInputService (ref)
	local props = p1.props
	
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
			NextSelectionRight = p1.textBoxRef
		})),
		TextContainer = withFoundationOrUIBloxStyle(function(p3)
			return {
				Theme = {
					TextMuted = {
						Color = p3.Color.Content.Muted.Color3,
						Transparency = p3.Color.Content.Muted.Transparency
					},
					TextDefault = {
						Color = p3.Color.Content.Default.Color3,
						Transparency = p3.Color.Content.Default.Transparency
					},
					BackgroundUIContrast = {
						Color = p3.Color.OverMedia.OverMedia_0.Color3,
						Transparency = p3.Color.OverMedia.OverMedia_0.Transparency
					}
				},
				Font = {
					BaseSize = 1,
					Body = {
						Font = p3.Typography.BodyLarge.Font,
						RelativeSize = p3.Typography.BodyLarge.FontSize,
						RelativeMinSize = p3.Typography.BodyLarge.FontSize
					}
				}
			}
		end, function(p3)
			-- upvalues: props (ref), roact (copy), assetImageModule (copy), p1 (ref), p2 (ref), var2 (copy)
			local var3 = if props.disabled then p3.Theme.TextMuted else p3.Theme.TextDefault
			
			return roact.createElement(assetImageModule.Label, {
				BackgroundTransparency = 1,
				imageKey = "RoundedRect",
				ImageTransparency = p3.Theme.BackgroundUIContrast.Transparency,
				ImageColor3 = p3.Theme.BackgroundUIContrast.Color,
				Size = UDim2.new(0, 64, 0, 36),
				Position = UDim2.new(1, 0, 0.5, 0),
				AnchorPoint = Vector2.new(1, 0.5)
			}, {
				FocusHandler = p1:renderFocusHandler(),
				Box = roact.createElement("TextBox", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Font = p3.Font.Body.Font,
					TextScaled = true,
					ClearTextOnFocus = false,
					TextEditable = not props.disabled,
					TextColor3 = var3.Color,
					TextTransparency = var3.Transparency,
					Text = tostring(props.value),
					NextSelectionLeft = p1.props.sliderDotRef,
					SelectionImageObject = p2(var2.InputFields),
					[roact.Event.SelectionLost] = p1.props.onSelectionLost,
					[roact.Event.SelectionGained] = p1.props.onSelectionGained,
					[roact.Ref] = p1.textBoxRef,
					[roact.Event.Focused] = if props.disabled then function(p4)
						p4:ReleaseFocus(false)
					end else function()
						-- upvalues: p1 (copy)
						p1:setState({ textEntryMode = true })
					end,
					[roact.Event.FocusLost] = function(p4, _)
						-- upvalues: p1 (copy), props (copy)
						p1:setState({ textEntryMode = false })
						local var4 = tonumber(p4.Text)
						
						if var4 ~= props.value then
							if var4 == nil then
								p4.Text = tostring(props.value)
								
								return
							end
							local var5 = if props.keyboardInputStepInterval then props.keyboardInputStepInterval else props.stepInterval
							local clampedValue = math.clamp(math.floor(var4 / var5 + 0.5) * var5, props.min, props.max)
							p4.Text = tostring(clampedValue)
							
							if clampedValue ~= props.value then
								props.valueChanged(clampedValue)
							end
						end
					end
				}, {
					TextSizeConstraint = roact.createElement("UITextSizeConstraint", {
						MinTextSize = p3.Font.Body.RelativeMinSize * p3.Font.BaseSize,
						MaxTextSize = p3.Font.Body.RelativeSize * p3.Font.BaseSize
					})
				})
			})
		end),
		UserInputConnection = not props.disabled and roact.createElement(externalEventConnectionModule, {
			event = userInputService.InputBegan,
			callback = function(p3, _)
				-- upvalues: userInputService (copy), p1 (ref), props (ref)
				if p3.UserInputType ~= Enum.UserInputType.Keyboard then return end
				if userInputService:GetFocusedTextBox() ~= p1.textBoxRef.current then return end
				local var3 = 0
				
				if p3.KeyCode == Enum.KeyCode.Up then
					var3 = 1
				elseif p3.KeyCode == Enum.KeyCode.Down then
					var3 = -1
				end
				if userInputService:IsKeyDown(Enum.KeyCode.LeftShift) or userInputService:IsKeyDown(Enum.KeyCode.RightShift) then
					var3 *= 10
				end
				if var3 ~= 0 then
					local clampedValue = math.clamp(math.floor((props.value + props.stepInterval * var3) / props.stepInterval + 0.5) * props.stepInterval, props.min, props.max)
					
					if clampedValue ~= props.value then
						props.valueChanged(clampedValue)
					end
				end
			end
		})
	})
end

function sliderWithInput.render(p1)
	-- upvalues: var1 (ref)
	return var1(function(p2)
		-- upvalues: p1 (ref)
		return p1:renderWithSelectionCursor(p2)
	end)
end

return sliderWithInput