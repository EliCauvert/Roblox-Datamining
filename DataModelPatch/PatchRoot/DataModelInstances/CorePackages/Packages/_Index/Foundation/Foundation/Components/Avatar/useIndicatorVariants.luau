local Foundation = script:FindFirstAncestor("Foundation")
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)
local IndicatorShapeModule = require(Foundation.Enums.IndicatorShape)
local IndicatorVariantModule = require(Foundation.Enums.IndicatorVariant)
local _ = require(Foundation.Components.Types)

function mapToProps(Circle, ImageStyle, XOffset)
	-- upvalues: IndicatorShapeModule (copy)
	local _UDim2 = UDim2.fromOffset(XOffset, XOffset)
	
	return if Circle == IndicatorShapeModule.Ring then {
		indicator = {
			Image = "component_assets/circle_15_stroke_3",
			imageStyle = ImageStyle,
			Size = UDim2.fromOffset(XOffset, XOffset)
		}
	} elseif Circle == IndicatorShapeModule.Circle then {
		indicator = {
			Image = "component_assets/circle_16",
			imageStyle = ImageStyle,
			Size = _UDim2
		}
	} else { indicator = { imageStyle = ImageStyle, Size = _UDim2 } }
end

local function variantsFactory(p1)
	-- upvalues: IndicatorVariantModule (copy), IndicatorShapeModule (copy)
	return {
		shapes = {
			[IndicatorShapeModule.Circle] = { indicator = { tag = "radius-circle" } },
			[IndicatorShapeModule.Ring] = { indicator = { tag = "radius-circle" } }
		},
		variants = {
			[IndicatorVariantModule.Success] = p1.Color.System.Success,
			[IndicatorVariantModule.Neutral] = p1.Color.System.Neutral,
			[IndicatorVariantModule.Warning] = p1.Color.System.Warning,
			[IndicatorVariantModule.Emphasis] = p1.Color.System.Emphasis,
			[IndicatorVariantModule.Alert] = p1.Color.System.Alert
		}
	}
end

return function(p1, p2, p3, p4)
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), ComposeStyleVariantModule (copy)
	local Indicator = VariantsContextModule.useVariants("Indicator", variantsFactory, p1)
	
	return ComposeStyleVariantModule(Indicator.shapes[p2], mapToProps(p2, Indicator.variants[p3], p4))
end