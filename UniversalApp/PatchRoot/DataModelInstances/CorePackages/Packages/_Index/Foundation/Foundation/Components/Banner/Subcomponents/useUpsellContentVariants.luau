local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Components.Types)
local CardDensityModule = require(Foundation.Enums.CardDensity)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)
local _ = require(script.Parent.Thumbnail)

local function variantsFactory(p1) --[[ Line: 26 ]]
	-- upvalues: CardDensityModule (copy)
	local BodySmall = p1.Typography.BodySmall
	
	local function _(p2) --[[ Line: 29 | Named "descriptionSizeConstraint" ]]
		-- upvalues: BodySmall (copy)
		return {
			MaxSize = Vector2.new(1e999, BodySmall.FontSize * BodySmall.LineHeight * p2)
		}
	end
	
	return {
		common = {
			container = { tag = "row align-y-center gap-medium size-full-0 auto-y" },
			content = { tag = "col fill auto-y" },
			title = {
				tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-left content-emphasis"
			},
			description = {
				tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-emphasis"
			}
		},
		densities = {
			[CardDensityModule.Compact] = {
				description = {
					sizeConstraint = {
						MaxSize = Vector2.new(1e999, BodySmall.FontSize * BodySmall.LineHeight * 1)
					}
				}
			},
			[CardDensityModule.Default] = {
				description = {
					sizeConstraint = {
						MaxSize = Vector2.new(1e999, BodySmall.FontSize * BodySmall.LineHeight * 2)
					}
				}
			}
		}
	}
end

return function(p1, p2) --[[ Line: 59 ]]
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), ComposeStyleVariantModule (copy)
	local BannerUpsellContent = VariantsContextModule.useVariants("Banner.UpsellContent", variantsFactory, p1)
	
	return ComposeStyleVariantModule(BannerUpsellContent.common, BannerUpsellContent.densities[p2])
end