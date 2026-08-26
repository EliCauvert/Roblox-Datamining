local foundation = script:FindFirstAncestor("Foundation")
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)
local indicatorShapeModule = require(foundation.Enums.IndicatorShape)
local indicatorVariantModule = require(foundation.Enums.IndicatorVariant)
local _ = require(foundation.Components.Types)

function mapToProps(p1, p2, p3)
	-- upvalues: indicatorShapeModule (ref)
	local uDim2 = UDim2.fromOffset(p3, p3)
	
	return if p1 == indicatorShapeModule.Ring then {
		indicator = {
			Image = "component_assets/circle_15_stroke_3",
			imageStyle = p2,
			Size = UDim2.fromOffset(p3, p3)
		}
	} elseif p1 == indicatorShapeModule.Circle then {
		indicator = {
			Image = "component_assets/circle_16",
			imageStyle = p2,
			Size = uDim2
		}
	} else { indicator = { imageStyle = p2, Size = uDim2 } }
end

local function variantsFactory(p1)
	-- upvalues: indicatorVariantModule (ref), indicatorShapeModule (ref)
	return {
		shapes = {
			[indicatorShapeModule.Circle] = { indicator = { tag = "radius-circle" } },
			[indicatorShapeModule.Ring] = { indicator = { tag = "radius-circle" } }
		},
		variants = {
			[indicatorVariantModule.Success] = p1.Color.System.Success,
			[indicatorVariantModule.Neutral] = p1.Color.System.Neutral,
			[indicatorVariantModule.Warning] = p1.Color.System.Warning,
			[indicatorVariantModule.Emphasis] = p1.Color.System.Emphasis,
			[indicatorVariantModule.Alert] = p1.Color.System.Alert
		}
	}
end

return function(p1, p2, p3, p4)
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref)
	local indicator = variantsContextModule.useVariants("Indicator", variantsFactory, p1)
	
	return composeStyleVariantModule(indicator.shapes[p2], mapToProps(p2, indicator.variants[p3], p4))
end