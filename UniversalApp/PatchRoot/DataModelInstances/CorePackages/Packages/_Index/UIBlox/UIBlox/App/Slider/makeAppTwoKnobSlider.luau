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
	-- upvalues: roactModule (ref), makeAppSliderModule (ref), tModule (ref), validateStyleModule (ref), wrapStyleAndRef (ref)
	local var1 = roactModule.PureComponent:extend("TwoKnobAppSliderFor" .. p4)
	local var2 = makeAppSliderModule(p1, true)
	var1.validateProps = tModule.intersection(tModule.strictInterface({
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
	}), function(p2)
		if p2.upperValue < p2.lowerValue then
			return false, "The upper value must be greater than or equal to the lower"
		end
		return true
	end)
	var1.defaultProps = { stepInterval = 1, width = UDim.new(1, 0) }
	
	function var7.render(p2)
		-- upvalues: roactModule (copy), var2 (ref)
		return roactModule.createElement(var2, p2.props)
	end
	
	return wrapStyleAndRef(var1)
end