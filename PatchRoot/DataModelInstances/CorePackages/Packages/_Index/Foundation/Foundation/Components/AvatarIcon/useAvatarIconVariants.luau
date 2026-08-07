-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:59 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local avatarIconSizeModule = require(foundation.Enums.AvatarIconSize)
local _ = require(foundation.Components.Types)
local indexBindableModule = require(foundation.Utility.indexBindable)

local function composeStroke(p0, p1) --[[ line: 18 ]]
	-- upvalues: indexBindableModule (ref)
	return if p0 and p1 then {
		container = {
			stroke = {
				Color = indexBindableModule(p0, "Color3"),
				Transparency = indexBindableModule(p0, "Transparency"),
				Thickness = p1
			}
		}
	} else {}
end

local function variantsFactory(p2) --[[ line: 34 ]]
	-- upvalues: avatarIconSizeModule (ref)
	return {
		strokes = {
			[true] = {
				[avatarIconSizeModule.XSmall] = p2.Stroke.Standard,
				[avatarIconSizeModule.Small] = p2.Stroke.Standard,
				[avatarIconSizeModule.Medium] = p2.Stroke.Thick,
				[avatarIconSizeModule.Large] = p2.Stroke.Thicker,
				[avatarIconSizeModule.XLarge] = p2.Stroke.Thicker
			},
			[false] = {}
		},
		common = {
			container = { tag = "radius-circle" },
			avatar = { tag = "size-full radius-circle" }
		},
		sizes = {
			[avatarIconSizeModule.XSmall] = { container = { size = p2.Size.Size_300 } },
			[avatarIconSizeModule.Small] = { container = { size = p2.Size.Size_400 } },
			[avatarIconSizeModule.Medium] = { container = { size = p2.Size.Size_500 } },
			[avatarIconSizeModule.Large] = { container = { size = p2.Size.Size_600 } },
			[avatarIconSizeModule.XLarge] = { container = { size = p2.Size.Size_700 } }
		}
	}
end

return function(p3, p4, p5) --[[ line: 66 ]]
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref), composeStroke (ref)
	local avatarIcon = variantsContextModule.useVariants("AvatarIcon", variantsFactory, p3)
	
	return composeStyleVariantModule(avatarIcon.common, avatarIcon.sizes[p4], composeStroke(p5, avatarIcon.strokes[p5 ~= nil][p4]))
end