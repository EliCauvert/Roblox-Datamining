local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local parent_3 = parent_2.Parent
local roactModule = require(parent_3.Roact)
local cryoModule = require(parent_3.Cryo)
local tModule = require(parent_3.t)
local makeAppSliderModule = require(parent.makeAppSlider)
local sliderTextInputModule = require(parent.SliderTextInput)
local withStyleModule = require(parent_2.Core.Style.withStyle)
local validateStyleModule = require(parent_1.Style.Validator.validateStyle)

local function wrapStyleAndRef(p1)
	-- upvalues: roactModule (ref), withStyleModule (ref), cryoModule (ref)
	return roactModule.forwardRef(function(p2, p3)
		-- upvalues: withStyleModule (copy), cryoModule (copy), roactModule (copy), p1 (ref)
		return withStyleModule(function(p4)
			-- upvalues: cryoModule (copy), p2 (ref), p3 (ref), roactModule (copy), p1 (copy)
			return roactModule.createElement(p1, cryoModule.Dictionary.join(p2, { style = p4, forwardedRef = p3 }))
		end)
	end)
end

return function(p1)
	-- upvalues: roactModule (ref), makeAppSliderModule (ref), tModule (ref), validateStyleModule (ref), sliderTextInputModule (ref), wrapStyleAndRef (ref)
	local var1 = roactModule.PureComponent:extend("OneKnobAppSliderFor" .. p4)
	local var2 = makeAppSliderModule(p1, false)
	var1.validateProps = tModule.strictInterface({
		value = tModule.number,
		min = tModule.number,
		max = tModule.number,
		onValueChanged = tModule.callback,
		onDragStart = tModule.optional(tModule.callback),
		onDragEnd = tModule.optional(tModule.callback),
		stepInterval = tModule.optional(tModule.numberPositive),
		textInputEnabled = tModule.optional(tModule.boolean),
		isDisabled = tModule.optional(tModule.boolean),
		width = tModule.optional(tModule.UDim),
		position = tModule.optional(tModule.UDim2),
		anchorPoint = tModule.optional(tModule.Vector2),
		layoutOrder = tModule.optional(tModule.integer),
		forwardedRef = tModule.optional(tModule.table),
		NextSelectionUp = tModule.optional(tModule.table),
		NextSelectionDown = tModule.optional(tModule.table),
		customTrack = tModule.optional(tModule.table),
		customKnobColorLower = tModule.optional(tModule.Color3),
		customPressedKnobShadowTransparencyLower = tModule.optional(tModule.number),
		customKnobHeight = tModule.optional(tModule.number),
		customKnobBorderSize = tModule.optional(tModule.number),
		customKnobBorderColor = tModule.optional(tModule.Color3),
		style = validateStyleModule,
		containerRef = tModule.optional(tModule.table)
	})
	var1.defaultProps = {
		stepInterval = 1,
		textInputEnabled = false,
		width = UDim.new(1, 0)
	}
	
	function var8.render(p2)
		-- upvalues: roactModule (copy), var2 (ref), sliderTextInputModule (copy)
		local props = p2.props
		local t = {
			value = props.value,
			min = props.min,
			max = props.max,
			stepInterval = props.stepInterval,
			isDisabled = props.isDisabled,
			onValueChanged = props.onValueChanged,
			onDragStartLower = props.onDragStart,
			onDragEnd = props.onDragEnd,
			style = props.style,
			forwardedRef = props.forwardedRef,
			NextSelectionUp = props.NextSelectionUp,
			NextSelectionDown = props.NextSelectionDown,
			customTrack = props.customTrack,
			customKnobHeight = props.customKnobHeight,
			customKnobBorderColor = props.customKnobBorderColor,
			customKnobBorderSize = props.customKnobBorderSize,
			customKnobColorLower = props.customKnobColorLower,
			customPressedKnobShadowTransparencyLower = props.customPressedKnobShadowTransparencyLower,
			containerRef = props.containerRef
		}
		
		if props.textInputEnabled then
			t.width = UDim.new(1, -68)
			
			return roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(props.width.Scale, props.width.Offset, 0, 44),
				AnchorPoint = props.anchorPoint,
				LayoutOrder = props.layoutOrder,
				Position = props.position
			}, {
				Slider = roactModule.createElement(var2, t),
				TextInput = roactModule.createElement(sliderTextInputModule, {
					position = UDim2.new(1, 0, 0.5, 0),
					anchorPoint = Vector2.new(1, 0.5),
					value = props.value,
					min = props.min,
					max = props.max,
					disabled = props.isDisabled,
					stepInterval = props.stepInterval,
					onValueChanged = props.onValueChanged
				})
			})
		end
		t.width = props.width
		t.position = props.position
		t.anchorPoint = props.anchorPoint
		t.layoutOrder = props.layoutOrder
		
		return roactModule.createElement(var2, t)
	end
	
	return wrapStyleAndRef(var1)
end