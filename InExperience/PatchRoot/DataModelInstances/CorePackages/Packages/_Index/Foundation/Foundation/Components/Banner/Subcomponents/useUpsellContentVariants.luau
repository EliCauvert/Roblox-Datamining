local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Components.Types)
local cardDensityModule = require(foundation.Enums.CardDensity)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)
local _ = require(script.Parent.Thumbnail)

local function variantsFactory(p1)
	-- upvalues: cardDensityModule (ref)
	local bodySmall = p1.Typography.BodySmall
	
	local function _(p2)
		-- upvalues: bodySmall (ref)
		return {
			MaxSize = Vector2.new(1e999, bodySmall.FontSize * bodySmall.LineHeight * p2)
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
			[cardDensityModule.Compact] = {
				description = {
					sizeConstraint = {
						MaxSize = Vector2.new(1e999, bodySmall.FontSize * bodySmall.LineHeight * 1)
					}
				}
			},
			[cardDensityModule.Default] = {
				description = {
					sizeConstraint = {
						MaxSize = Vector2.new(1e999, bodySmall.FontSize * bodySmall.LineHeight * 2)
					}
				}
			}
		}
	}
end

return function(p1, p2)
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref)
	local var1 = variantsContextModule.useVariants("Banner.UpsellContent", variantsFactory, p1)
	
	return composeStyleVariantModule(var1.common, var1.densities[p2])
end