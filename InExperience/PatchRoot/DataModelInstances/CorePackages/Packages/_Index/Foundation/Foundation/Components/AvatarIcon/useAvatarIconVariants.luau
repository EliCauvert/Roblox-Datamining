local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local avatarIconSizeModule = require(foundation.Enums.AvatarIconSize)
local _ = require(foundation.Components.Types)
local indexBindableModule = require(foundation.Utility.indexBindable)

local function composeStroke(p1, p2)
	-- upvalues: indexBindableModule (ref)
	return if p1 and p2 then {
		container = {
			stroke = {
				Color = indexBindableModule(p1, "Color3"),
				Transparency = indexBindableModule(p1, "Transparency"),
				Thickness = p2
			}
		}
	} else {}
end

local function variantsFactory(p1)
	-- upvalues: avatarIconSizeModule (ref)
	return {
		strokes = {
			[true] = {
				[avatarIconSizeModule.XSmall] = p1.Stroke.Standard,
				[avatarIconSizeModule.Small] = p1.Stroke.Standard,
				[avatarIconSizeModule.Medium] = p1.Stroke.Thick,
				[avatarIconSizeModule.Large] = p1.Stroke.Thicker,
				[avatarIconSizeModule.XLarge] = p1.Stroke.Thicker
			},
			[false] = {}
		},
		common = {
			container = { tag = "radius-circle" },
			avatar = { tag = "size-full radius-circle" }
		},
		sizes = {
			[avatarIconSizeModule.XSmall] = { container = { size = p1.Size.Size_300 } },
			[avatarIconSizeModule.Small] = { container = { size = p1.Size.Size_400 } },
			[avatarIconSizeModule.Medium] = { container = { size = p1.Size.Size_500 } },
			[avatarIconSizeModule.Large] = { container = { size = p1.Size.Size_600 } },
			[avatarIconSizeModule.XLarge] = { container = { size = p1.Size.Size_700 } }
		}
	}
end

return function(p1, p2, p3)
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref), composeStroke (ref)
	local avatarIcon = variantsContextModule.useVariants("AvatarIcon", variantsFactory, p1)
	
	return composeStyleVariantModule(avatarIcon.common, avatarIcon.sizes[p2], composeStroke(p3, avatarIcon.strokes[p3 ~= nil][p2]))
end