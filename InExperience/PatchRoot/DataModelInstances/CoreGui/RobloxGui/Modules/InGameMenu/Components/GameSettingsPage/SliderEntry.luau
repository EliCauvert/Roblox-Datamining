local guiService = game:GetService("GuiService")
local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local inputLabelModule = require(script.Parent.InputLabel)
local sliderWithInputModule = require(script.Parent.Parent.Parent.Components.SliderWithInput)
local sliderEntry = roact.PureComponent:extend("SliderEntry")
sliderEntry.validateProps = t.strictInterface({
	LayoutOrder = t.integer,
	labelKey = t.string,
	min = t.number,
	max = t.number,
	stepInterval = t.number,
	keyboardInputStepInterval = t.optional(t.numberPositive),
	value = t.number,
	disabled = t.optional(t.boolean),
	valueChanged = t.callback,
	canCaptureFocus = t.optional(t.boolean),
	isMenuOpen = t.optional(t.boolean),
	buttonRef = t.optional(t.table)
})

function sliderEntry.init(p0) --[[ line: 29 ]]
	p0.state = { isFrameSelectable = true }
end

function sliderEntry.render(p1) --[[ line: 35 ]]
	-- upvalues: roact (ref), guiService (ref), inputLabelModule (ref), sliderWithInputModule (ref)
	local buttonRef = p1.props.buttonRef or roact.createRef()
	
	return roact.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 92),
		LayoutOrder = p1.props.LayoutOrder,
		Selectable = p1.state.isFrameSelectable,
		[roact.Event.SelectionGained] = function() --[[ line: 45 ]]
			-- upvalues: guiService (copy), buttonRef (ref), p1 (ref)
			guiService.SelectedCoreObject = buttonRef:getValue()
			p1:setState({ isFrameSelectable = false })
		end
	}, {
		Padding = roact.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 24),
			PaddingTop = UDim.new(0, 12),
			PaddingRight = UDim.new(0, 30),
			PaddingBottom = UDim.new(0, 24)
		}),
		Label = roact.createElement(inputLabelModule, {
			Size = UDim2.new(1, 0, 0, 24),
			localizationKey = p1.props.labelKey,
			Position = UDim2.new(0, 0, 0, 0),
			AnchorPoint = Vector2.new(0, 0)
		}),
		Slider = roact.createElement(sliderWithInputModule, {
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
			sliderDotRef = buttonRef,
			onSelectionLost = function() --[[ line: 81 ]]
				-- upvalues: p1 (ref)
				p1:setState({ isFrameSelectable = true })
			end,
			onSelectionGained = function() --[[ line: 86 ]]
				-- upvalues: p1 (ref)
				p1:setState({ isFrameSelectable = false })
			end
		})
	})
end

return sliderEntry