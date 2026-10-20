local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local AvatarIconSizeModule = require(Foundation.Enums.AvatarIconSize)
local _ = require(Foundation.Components.Types)
local IndexBindableModule = require(Foundation.Utility.indexBindable)

local function composeStroke(p1, Thickness)
	-- upvalues: IndexBindableModule (copy)
	return if p1 and Thickness then {
		container = {
			stroke = {
				Color = IndexBindableModule(p1, "Color3"),
				Transparency = IndexBindableModule(p1, "Transparency"),
				Thickness = Thickness
			}
		}
	} else {}
end

local function variantsFactory(p1)
	-- upvalues: AvatarIconSizeModule (copy)
	return {
		strokes = {
			[true] = {
				[AvatarIconSizeModule.XSmall] = p1.Stroke.Standard,
				[AvatarIconSizeModule.Small] = p1.Stroke.Standard,
				[AvatarIconSizeModule.Medium] = p1.Stroke.Thick,
				[AvatarIconSizeModule.Large] = p1.Stroke.Thicker,
				[AvatarIconSizeModule.XLarge] = p1.Stroke.Thicker
			},
			[false] = {}
		},
		common = {
			container = { tag = "radius-circle" },
			avatar = { tag = "size-full radius-circle" }
		},
		sizes = {
			[AvatarIconSizeModule.XSmall] = { container = { size = p1.Size.Size_300 } },
			[AvatarIconSizeModule.Small] = { container = { size = p1.Size.Size_400 } },
			[AvatarIconSizeModule.Medium] = { container = { size = p1.Size.Size_500 } },
			[AvatarIconSizeModule.Large] = { container = { size = p1.Size.Size_600 } },
			[AvatarIconSizeModule.XLarge] = { container = { size = p1.Size.Size_700 } }
		}
	}
end

return function(p1, p2, p3)
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), ComposeStyleVariantModule (copy), composeStroke (copy)
	local AvatarIcon = VariantsContextModule.useVariants("AvatarIcon", variantsFactory, p1)
	
	return ComposeStyleVariantModule(AvatarIcon.common, AvatarIcon.sizes[p2], (composeStroke(p3, AvatarIcon.strokes[p3 ~= nil][p2])))
end