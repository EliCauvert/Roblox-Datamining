local Parent = script.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local Parent3 = Parent2.Parent
local RoactModule = require(Parent3.Roact)
local CryoModule = require(Parent3.Cryo)
local TModule = require(Parent3.t)
local MakeAppSliderModule = require(Parent.makeAppSlider)
local SliderTextInputModule = require(Parent.SliderTextInput)
local WithStyleModule = require(Parent2.Core.Style.withStyle)
local ValidateStyleModule = require(Parent1.Style.Validator.validateStyle)

local function wrapStyleAndRef(ExtendResult) --[[ Line: 15 ]]
	-- upvalues: RoactModule (copy), WithStyleModule (copy), CryoModule (copy)
	return RoactModule.forwardRef(function(p1, ForwardedRef) --[[ Line: 16 ]]
		-- upvalues: WithStyleModule (upval), CryoModule (upval), RoactModule (upval), ExtendResult (copy)
		return WithStyleModule(function(Style) --[[ Line: 17 ]]
			-- upvalues: CryoModule (upval), p1 (copy), ForwardedRef (copy), RoactModule (upval), ExtendResult (upval)
			return RoactModule.createElement(ExtendResult, (CryoModule.Dictionary.join(p1, { style = Style, forwardedRef = ForwardedRef })))
		end)
	end)
end

return function(Text) --[[ Line: 28 | Named "makeAppOneKnobSlider" ]]
	-- upvalues: RoactModule (copy), MakeAppSliderModule (copy), TModule (copy), ValidateStyleModule (copy), SliderTextInputModule (copy), wrapStyleAndRef (copy)
	local ExtendResult = RoactModule.PureComponent:extend("OneKnobAppSliderFor" .. Text)
	local AppSliderModule = MakeAppSliderModule(Text, false)
	ExtendResult.validateProps = TModule.strictInterface({
		value = TModule.number,
		min = TModule.number,
		max = TModule.number,
		onValueChanged = TModule.callback,
		onDragStart = TModule.optional(TModule.callback),
		onDragEnd = TModule.optional(TModule.callback),
		stepInterval = TModule.optional(TModule.numberPositive),
		textInputEnabled = TModule.optional(TModule.boolean),
		isDisabled = TModule.optional(TModule.boolean),
		width = TModule.optional(TModule.UDim),
		position = TModule.optional(TModule.UDim2),
		anchorPoint = TModule.optional(TModule.Vector2),
		layoutOrder = TModule.optional(TModule.integer),
		forwardedRef = TModule.optional(TModule.table),
		NextSelectionUp = TModule.optional(TModule.table),
		NextSelectionDown = TModule.optional(TModule.table),
		customTrack = TModule.optional(TModule.table),
		customKnobColorLower = TModule.optional(TModule.Color3),
		customPressedKnobShadowTransparencyLower = TModule.optional(TModule.number),
		customKnobHeight = TModule.optional(TModule.number),
		customKnobBorderSize = TModule.optional(TModule.number),
		customKnobBorderColor = TModule.optional(TModule.Color3),
		style = ValidateStyleModule,
		containerRef = TModule.optional(TModule.table)
	})
	ExtendResult.defaultProps = {
		stepInterval = 1,
		textInputEnabled = false,
		width = UDim.new(1, 0)
	}
	
	function ExtendResult.render(p1) --[[ Line: 86 ]]
		-- upvalues: RoactModule (upval), AppSliderModule (copy), SliderTextInputModule (upval)
		local Props = p1.props
		local config = {
			value = Props.value,
			min = Props.min,
			max = Props.max,
			stepInterval = Props.stepInterval,
			isDisabled = Props.isDisabled,
			onValueChanged = Props.onValueChanged,
			onDragStartLower = Props.onDragStart,
			onDragEnd = Props.onDragEnd,
			style = Props.style,
			forwardedRef = Props.forwardedRef,
			NextSelectionUp = Props.NextSelectionUp,
			NextSelectionDown = Props.NextSelectionDown,
			customTrack = Props.customTrack,
			customKnobHeight = Props.customKnobHeight,
			customKnobBorderColor = Props.customKnobBorderColor,
			customKnobBorderSize = Props.customKnobBorderSize,
			customKnobColorLower = Props.customKnobColorLower,
			customPressedKnobShadowTransparencyLower = Props.customPressedKnobShadowTransparencyLower,
			containerRef = Props.containerRef
		}
		
		if Props.textInputEnabled then
			config.width = UDim.new(1, -68)
			
			return RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(Props.width.Scale, Props.width.Offset, 0, 44),
				AnchorPoint = Props.anchorPoint,
				LayoutOrder = Props.layoutOrder,
				Position = Props.position
			}, {
				Slider = RoactModule.createElement(AppSliderModule, config),
				TextInput = RoactModule.createElement(SliderTextInputModule, {
					position = UDim2.new(1, 0, 0.5, 0),
					anchorPoint = Vector2.new(1, 0.5),
					value = Props.value,
					min = Props.min,
					max = Props.max,
					disabled = Props.isDisabled,
					stepInterval = Props.stepInterval,
					onValueChanged = Props.onValueChanged
				})
			})
		else
			config.width = Props.width
			config.position = Props.position
			config.anchorPoint = Props.anchorPoint
			config.layoutOrder = Props.layoutOrder
			
			return RoactModule.createElement(AppSliderModule, config)
		end
	end
	
	return wrapStyleAndRef(ExtendResult)
end