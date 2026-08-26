local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Components.Types)
local dividerVariantModule = require(foundation.Enums.DividerVariant)
local orientationModule = require(foundation.Enums.Orientation)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)

local function variantsFactory(p1)
	-- upvalues: orientationModule (ref), dividerVariantModule (ref)
	return {
		common = {
			container = { tag = "col" },
			stroke = { backgroundStyle = p1.Color.Stroke.Default },
			line = {
				tag = "size-full-200",
				position = UDim2.fromOffset(0, p1.Size.Size_50),
				backgroundStyle = p1.Color.Common.HeavyDivider
			}
		},
		padding = {
			[dividerVariantModule.Inset] = { container = { tag = "padding-x-xlarge" } },
			[dividerVariantModule.InsetLeft] = { container = { tag = "padding-left-xlarge" } },
			[dividerVariantModule.InsetRight] = { container = { tag = "padding-right-xlarge" } }
		},
		orientation = {
			[orientationModule.Horizontal] = {
				container = { tag = "size-full-0 auto-y" },
				stroke = { Size = UDim2.new(1, 0, 0, p1.Stroke.Standard) }
			},
			[orientationModule.Vertical] = {
				container = { tag = "size-0-full auto-x" },
				stroke = { Size = UDim2.new(0, p1.Stroke.Standard, 1, 0) }
			}
		}
	}
end

return function(p1, p2, p3)
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref), orientationModule (ref)
	local divider = variantsContextModule.useVariants("Divider", variantsFactory, p1)
	
	return composeStyleVariantModule(divider.common, if p3 == orientationModule.Horizontal then divider.padding[p2] else {}, divider.orientation[p3])
end