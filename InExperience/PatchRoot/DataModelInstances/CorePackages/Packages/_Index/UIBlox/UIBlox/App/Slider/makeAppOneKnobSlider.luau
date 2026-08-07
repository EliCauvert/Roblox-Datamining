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

local function wrapStyleAndRef(p0) --[[ line: 15 ]]
	-- upvalues: roactModule (ref), withStyleModule (ref), cryoModule (ref)
	return roactModule.forwardRef(function(p1, p2) --[[ line: 16 ]]
		-- upvalues: withStyleModule (copy), cryoModule (copy), roactModule (copy), p0 (ref)
		return withStyleModule(function(p3) --[[ line: 17 ]]
			-- upvalues: cryoModule (copy), p1 (ref), p2 (ref), roactModule (copy), p0 (copy)
			return roactModule.createElement(p0, cryoModule.Dictionary.join(p1, { style = p3, forwardedRef = p2 }))
		end)
	end)
end

return function(p4) --[[ line: 28 | named "makeAppOneKnobSlider" ]]
	-- upvalues: roactModule (ref), makeAppSliderModule (ref), tModule (ref), validateStyleModule (ref), sliderTextInputModule (ref), wrapStyleAndRef (ref)
	local var8 = roactModule.PureComponent:extend("OneKnobAppSliderFor" .. p4)
	local var9 = makeAppSliderModule(p4, false)
	var8.validateProps = tModule.strictInterface({
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
	var8.defaultProps = {
		stepInterval = 1,
		textInputEnabled = false,
		width = UDim.new(1, 0)
	}
	
	function var8.render(p5) --[[ line: 86 ]]
		-- upvalues: roactModule (copy), var9 (ref), sliderTextInputModule (copy)
		local props = p5.props
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
				Slider = roactModule.createElement(var9, t),
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
		
		return roactModule.createElement(var9, t)
	end
	
	return wrapStyleAndRef(var8)
end