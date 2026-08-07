-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:59 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)
local indicatorShapeModule = require(foundation.Enums.IndicatorShape)
local indicatorVariantModule = require(foundation.Enums.IndicatorVariant)
local _ = require(foundation.Components.Types)

function mapToProps(p0, p1, p2) --[[ line: 29 ]]
	-- upvalues: indicatorShapeModule (ref)
	local uDim2 = UDim2.fromOffset(p2, p2)
	
	return if p0 == indicatorShapeModule.Ring then {
		indicator = {
			Image = "component_assets/circle_15_stroke_3",
			imageStyle = p1,
			Size = UDim2.fromOffset(p2, p2)
		}
	} elseif p0 == indicatorShapeModule.Circle then {
		indicator = {
			Image = "component_assets/circle_16",
			imageStyle = p1,
			Size = uDim2
		}
	} else { indicator = { imageStyle = p1, Size = uDim2 } }
end

local function variantsFactory(p3) --[[ line: 61 ]]
	-- upvalues: indicatorVariantModule (ref), indicatorShapeModule (ref)
	return {
		shapes = {
			[indicatorShapeModule.Circle] = { indicator = { tag = "radius-circle" } },
			[indicatorShapeModule.Ring] = { indicator = { tag = "radius-circle" } }
		},
		variants = {
			[indicatorVariantModule.Success] = p3.Color.System.Success,
			[indicatorVariantModule.Neutral] = p3.Color.System.Neutral,
			[indicatorVariantModule.Warning] = p3.Color.System.Warning,
			[indicatorVariantModule.Emphasis] = p3.Color.System.Emphasis,
			[indicatorVariantModule.Alert] = p3.Color.System.Alert
		}
	}
end

return function(p4, p5, p6, p7) --[[ line: 78 ]]
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref)
	local indicator = variantsContextModule.useVariants("Indicator", variantsFactory, p4)
	
	return composeStyleVariantModule(indicator.shapes[p5], mapToProps(p5, indicator.variants[p6], p7))
end