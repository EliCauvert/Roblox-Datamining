local Parent = script.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local Parent3 = Parent2.Parent
local RoactModule = require(Parent3.Roact)
local CryoModule = require(Parent3.Cryo)
local TModule = require(Parent3.t)
local MakeAppSliderModule = require(Parent.makeAppSlider)
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

return function(Text) --[[ Line: 28 | Named "makeAppTwoKnobSlider" ]]
	-- upvalues: RoactModule (copy), MakeAppSliderModule (copy), TModule (copy), ValidateStyleModule (copy), wrapStyleAndRef (copy)
	local ExtendResult = RoactModule.PureComponent:extend("TwoKnobAppSliderFor" .. Text)
	local AppSliderModule = MakeAppSliderModule(Text, true)
	ExtendResult.validateProps = TModule.intersection(TModule.strictInterface({
		lowerValue = TModule.number,
		upperValue = TModule.number,
		min = TModule.number,
		max = TModule.number,
		stepInterval = TModule.optional(TModule.numberPositive),
		onValueChanged = TModule.callback,
		onDragStartLower = TModule.optional(TModule.callback),
		onDragStartUpper = TModule.optional(TModule.callback),
		onDragEnd = TModule.optional(TModule.callback),
		isDisabled = TModule.optional(TModule.boolean),
		width = TModule.optional(TModule.UDim),
		position = TModule.optional(TModule.UDim2),
		anchorPoint = TModule.optional(TModule.Vector2),
		layoutOrder = TModule.optional(TModule.integer),
		forwardedRef = TModule.optional(TModule.table),
		NextSelectionUp = TModule.optional(TModule.table),
		NextSelectionDown = TModule.optional(TModule.table),
		focusController = TModule.optional(TModule.table),
		style = ValidateStyleModule
	}), function(p1) --[[ Line: 76 | Named "valueValidator" ]]
		if p1.upperValue < p1.lowerValue then
			return false, "The upper value must be greater than or equal to the lower"
		else
			return true
		end
	end)
	ExtendResult.defaultProps = { stepInterval = 1, width = UDim.new(1, 0) }
	
	function ExtendResult.render(p1) --[[ Line: 91 ]]
		-- upvalues: RoactModule (upval), AppSliderModule (copy)
		return RoactModule.createElement(AppSliderModule, p1.props)
	end
	
	return wrapStyleAndRef(ExtendResult)
end