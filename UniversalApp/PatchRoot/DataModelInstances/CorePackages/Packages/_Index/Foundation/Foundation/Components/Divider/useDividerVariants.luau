local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Components.Types)
local DividerVariantModule = require(Foundation.Enums.DividerVariant)
local OrientationModule = require(Foundation.Enums.Orientation)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)

local function variantsFactory(p1) --[[ Line: 26 ]]
	-- upvalues: OrientationModule (copy), DividerVariantModule (copy)
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
			[DividerVariantModule.Inset] = { container = { tag = "padding-x-xlarge" } },
			[DividerVariantModule.InsetLeft] = { container = { tag = "padding-left-xlarge" } },
			[DividerVariantModule.InsetRight] = { container = { tag = "padding-right-xlarge" } }
		},
		orientation = {
			[OrientationModule.Horizontal] = {
				container = { tag = "size-full-0 auto-y" },
				stroke = { Size = UDim2.new(1, 0, 0, p1.Stroke.Standard) }
			},
			[OrientationModule.Vertical] = {
				container = { tag = "size-0-full auto-x" },
				stroke = { Size = UDim2.new(0, p1.Stroke.Standard, 1, 0) }
			}
		}
	}
end

return function(p1, p2, Horizontal) --[[ Line: 81 ]]
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), ComposeStyleVariantModule (copy), OrientationModule (copy)
	local Divider = VariantsContextModule.useVariants("Divider", variantsFactory, p1)
	
	return ComposeStyleVariantModule(Divider.common, if Horizontal == OrientationModule.Horizontal then Divider.padding[p2] else {}, Divider.orientation[Horizontal])
end