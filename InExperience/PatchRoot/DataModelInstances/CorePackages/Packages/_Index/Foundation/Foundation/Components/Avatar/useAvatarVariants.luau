local foundation = script:FindFirstAncestor("Foundation")
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)
local inputSizeModule = require(foundation.Enums.InputSize)
local userPresenceModule = require(foundation.Enums.UserPresence)
local indicatorVariantModule = require(foundation.Enums.IndicatorVariant)
local indicatorShapeModule = require(foundation.Enums.IndicatorShape)
local _ = require(foundation.Components.Types)
local indexBindableModule = require(foundation.Utility.indexBindable)

local function variantsFactory(p0) --[[ line: 45 ]]
	-- upvalues: inputSizeModule (ref), userPresenceModule (ref), indicatorShapeModule (ref), indicatorVariantModule (ref)
	return {
		common = {
			container = { tag = "radius-circle" },
			avatar = { tag = "size-full radius-circle" },
			indicatorBackplate = {
				ZIndex = 2,
				tag = "position-bottom-right anchor-bottom-right auto-xy radius-circle bg-surface-0",
				padding = UDim2.fromOffset(3, 3)
			}
		},
		sizes = {
			[inputSizeModule.XSmall] = { indicator = { size = p0.Size.Size_150 } },
			[inputSizeModule.Small] = { indicator = { size = p0.Size.Size_150 } },
			[inputSizeModule.Medium] = { indicator = { size = p0.Size.Size_200 } },
			[inputSizeModule.Large] = { indicator = { size = p0.Size.Size_200 } }
		},
		presence = {
			[userPresenceModule.InExperience] = {},
			[userPresenceModule.Away] = {
				indicator = {
					shape = indicatorShapeModule.Ring,
					variant = indicatorVariantModule.Neutral
				}
			},
			[userPresenceModule.Active] = {
				indicator = {
					shape = indicatorShapeModule.Circle,
					variant = indicatorVariantModule.Success
				}
			},
			[userPresenceModule.None] = {}
		},
		iconSizeStrokes = {
			[inputSizeModule.XSmall] = p0.Stroke.Standard,
			[inputSizeModule.Small] = p0.Stroke.Thick,
			[inputSizeModule.Medium] = p0.Stroke.Thick,
			[inputSizeModule.Large] = p0.Stroke.Thicker
		}
	}
end

return function(p1, p2, p3, p4, p5) --[[ line: 85 ]]
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), userPresenceModule (ref), composeStyleVariantModule (ref), indexBindableModule (ref)
	local avatar = variantsContextModule.useVariants("Avatar", variantsFactory, p1)
	local var10 = if p5 or p3 ~= userPresenceModule.InExperience then p4 else p1.Color.System.Emphasis
	
	return composeStyleVariantModule(avatar.common, avatar.sizes[p2], avatar.presence[p3], {
		container = {
			stroke = if var10 then {
				Color = indexBindableModule(var10, "Color3"),
				Transparency = indexBindableModule(var10, "Transparency"),
				Thickness = if not p5 then p1.Stroke.Thicker else avatar.iconSizeStrokes[p2]
			} else nil,
			backgroundStyle = p4
		},
		indicator = {
			isVisible = not p5 and (if p3 ~= userPresenceModule.Active then p3 == userPresenceModule.Away else true)
		}
	})
end