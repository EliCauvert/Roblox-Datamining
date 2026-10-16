local GuiService = game:GetService("GuiService")
local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local T = InGameMenuDependenciesModule.t
local InputLabelModule = require(script.Parent.InputLabel)
local SliderWithInputModule = require(script.Parent.Parent.Parent.Components.SliderWithInput)
local SliderEntry = Roact.PureComponent:extend("SliderEntry")
SliderEntry.validateProps = T.strictInterface({
	LayoutOrder = T.integer,
	labelKey = T.string,
	min = T.number,
	max = T.number,
	stepInterval = T.number,
	keyboardInputStepInterval = T.optional(T.numberPositive),
	value = T.number,
	disabled = T.optional(T.boolean),
	valueChanged = T.callback,
	canCaptureFocus = T.optional(T.boolean),
	isMenuOpen = T.optional(T.boolean),
	buttonRef = T.optional(T.table)
})

function SliderEntry.init(p1) --[[ Line: 29 ]]
	p1.state = { isFrameSelectable = true }
end

function SliderEntry.render(p1) --[[ Line: 35 ]]
	-- upvalues: Roact (copy), GuiService (copy), InputLabelModule (copy), SliderWithInputModule (copy)
	local ButtonRef = p1.props.buttonRef or Roact.createRef()
	
	return Roact.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 92),
		LayoutOrder = p1.props.LayoutOrder,
		Selectable = p1.state.isFrameSelectable,
		[Roact.Event.SelectionGained] = function() --[[ Line: 45 ]]
			-- upvalues: GuiService (upval), ButtonRef (copy), p1 (copy)
			GuiService.SelectedCoreObject = ButtonRef:getValue()
			p1:setState({ isFrameSelectable = false })
		end
	}, {
		Padding = Roact.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 24),
			PaddingTop = UDim.new(0, 12),
			PaddingRight = UDim.new(0, 30),
			PaddingBottom = UDim.new(0, 24)
		}),
		Label = Roact.createElement(InputLabelModule, {
			Size = UDim2.new(1, 0, 0, 24),
			localizationKey = p1.props.labelKey,
			Position = UDim2.new(0, 0, 0, 0),
			AnchorPoint = Vector2.new(0, 0)
		}),
		Slider = Roact.createElement(SliderWithInputModule, {
			min = p1.props.min,
			max = p1.props.max,
			stepInterval = p1.props.stepInterval,
			keyboardInputStepInterval = p1.props.keyboardInputStepInterval,
			value = p1.props.value,
			Position = UDim2.new(0, 0, 0, 32),
			disabled = p1.props.disabled,
			valueChanged = p1.props.valueChanged,
			canCaptureFocus = p1.props.canCaptureFocus,
			isMenuOpen = p1.props.isMenuOpen,
			sliderDotRef = ButtonRef,
			onSelectionLost = function() --[[ Line: 81 ]]
				-- upvalues: p1 (copy)
				p1:setState({ isFrameSelectable = true })
			end,
			onSelectionGained = function() --[[ Line: 86 ]]
				-- upvalues: p1 (copy)
				p1:setState({ isFrameSelectable = false })
			end
		})
	})
end

return SliderEntry