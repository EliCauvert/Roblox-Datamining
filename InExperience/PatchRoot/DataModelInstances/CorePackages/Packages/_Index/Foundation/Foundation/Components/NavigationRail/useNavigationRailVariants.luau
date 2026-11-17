local Foundation = script:FindFirstAncestor("Foundation")
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)

local function variantsFactory(p1)
	local ScaledSize = p1.Size.Size_100 * 64
	local Size1800 = p1.Size.Size_1800
	
	return {
		common = {
			block = { tag = "col size-full-0 auto-y" },
			body = { tag = "fill size-full-0" },
			column = { tag = "col flex-y-between auto-y" },
			container = { tag = "clip" },
			content = { tag = "col size-full-full" },
			edge = {
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.fromScale(1, 0)
			},
			footerItems = {
				tag = "col gap-xxsmall size-full-0 auto-y padding-x-medium padding-bottom-small padding-top-xxsmall"
			},
			header = {
				tag = "col size-full-0 auto-y padding-x-medium padding-y-small"
			},
			items = {
				tag = "col gap-xxsmall size-full-0 auto-y padding-x-medium",
				heldWidth = ScaledSize - 2 * p1.Size.Size_300
			},
			labeledList = { tag = "col gap-small size-full-0 auto-y" },
			widths = { collapsed = Size1800, expanded = ScaledSize }
		},
		collapsed = {
			[false] = { container = { width = ScaledSize } },
			[true] = { container = { width = Size1800 } }
		}
	}
end

return function(p1, p2)
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), ComposeStyleVariantModule (copy)
	local NavigationRail = VariantsContextModule.useVariants("NavigationRail", variantsFactory, p1)
	
	return ComposeStyleVariantModule(NavigationRail.common, NavigationRail.collapsed[p2])
end