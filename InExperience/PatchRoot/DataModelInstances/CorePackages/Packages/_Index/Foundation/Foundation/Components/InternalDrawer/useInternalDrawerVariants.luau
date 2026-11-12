local Foundation = script:FindFirstAncestor("Foundation")
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local InternalDrawerLayoutModule = require(Foundation.Enums.InternalDrawerLayout)
local InternalDrawerSideModule = require(Foundation.Enums.InternalDrawerSide)
local _ = require(Foundation.Providers.Style.Tokens)
local _ = require(Foundation.Components.Types)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)

local function variantsFactory(p1)
	-- upvalues: InternalDrawerLayoutModule (copy), InternalDrawerSideModule (copy)
	return {
		common = {
			innerEdge = {
				backgroundStyle = p1.Color.Stroke.Default,
				thickness = p1.Stroke.Standard
			},
			shadow = { tag = "shadow-overlay-300" }
		},
		layout = {
			[InternalDrawerLayoutModule.FullBleed] = {
				surface = { margin = 0 },
				innerEdge = { isVisible = true }
			},
			[InternalDrawerLayoutModule.Inset] = {
				surface = {
					tag = "stroke-standard stroke-default radius-large",
					margin = p1.Padding.Medium
				},
				innerEdge = { isVisible = false },
				shadow = { tag = "radius-large" }
			}
		},
		side = {
			[InternalDrawerSideModule.Start] = {
				surface = {
					tag = "anchor-top-left",
					anchorScaleX = 0,
					openOffsetSign = 1,
					hiddenOffsetSign = -1
				},
				innerEdge = { tag = "position-top-right anchor-top-right" },
				shadow = { tag = "anchor-top-left" }
			},
			[InternalDrawerSideModule.End] = {
				surface = {
					tag = "anchor-top-left",
					anchorScaleX = 1,
					openOffsetSign = -1,
					hiddenOffsetSign = 1
				},
				innerEdge = { tag = "position-top-left anchor-top-left" },
				shadow = { tag = "anchor-top-left" }
			}
		}
	}
end

return function(p1, p2)
	-- upvalues: UseTokensModule (copy), VariantsContextModule (copy), variantsFactory (copy), ComposeStyleVariantModule (copy)
	local InternalDrawer = VariantsContextModule.useVariants("InternalDrawer", variantsFactory, (UseTokensModule()))
	
	return ComposeStyleVariantModule(InternalDrawer.common, InternalDrawer.layout[p1], InternalDrawer.side[p2])
end