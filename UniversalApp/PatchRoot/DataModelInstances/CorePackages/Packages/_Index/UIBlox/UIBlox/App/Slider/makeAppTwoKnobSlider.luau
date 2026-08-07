local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local parent_3 = parent_2.Parent
local roactModule = require(parent_3.Roact)
local cryoModule = require(parent_3.Cryo)
local tModule = require(parent_3.t)
local makeAppSliderModule = require(parent.makeAppSlider)
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

return function(p4) --[[ line: 28 | named "makeAppTwoKnobSlider" ]]
	-- upvalues: roactModule (ref), makeAppSliderModule (ref), tModule (ref), validateStyleModule (ref), wrapStyleAndRef (ref)
	local var7 = roactModule.PureComponent:extend("TwoKnobAppSliderFor" .. p4)
	local var8 = makeAppSliderModule(p4, true)
	var7.validateProps = tModule.intersection(tModule.strictInterface({
		lowerValue = tModule.number,
		upperValue = tModule.number,
		min = tModule.number,
		max = tModule.number,
		stepInterval = tModule.optional(tModule.numberPositive),
		onValueChanged = tModule.callback,
		onDragStartLower = tModule.optional(tModule.callback),
		onDragStartUpper = tModule.optional(tModule.callback),
		onDragEnd = tModule.optional(tModule.callback),
		isDisabled = tModule.optional(tModule.boolean),
		width = tModule.optional(tModule.UDim),
		position = tModule.optional(tModule.UDim2),
		anchorPoint = tModule.optional(tModule.Vector2),
		layoutOrder = tModule.optional(tModule.integer),
		forwardedRef = tModule.optional(tModule.table),
		NextSelectionUp = tModule.optional(tModule.table),
		NextSelectionDown = tModule.optional(tModule.table),
		focusController = tModule.optional(tModule.table),
		style = validateStyleModule
	}), function(p5) --[[ line: 76 | named "valueValidator" ]]
		if p5.upperValue < p5.lowerValue then
			return false, "The upper value must be greater than or equal to the lower"
		end
		return true
	end)
	var7.defaultProps = { stepInterval = 1, width = UDim.new(1, 0) }
	
	function var7.render(p6) --[[ line: 91 ]]
		-- upvalues: roactModule (copy), var8 (ref)
		return roactModule.createElement(var8, p6.props)
	end
	
	return wrapStyleAndRef(var7)
end