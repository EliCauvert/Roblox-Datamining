-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:07 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Components.InternalInput)
local inputSizeModule = require(foundation.Enums.InputSize)
local _ = require(foundation.Enums.ControlState)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local _ = require(foundation.Components.Types)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)

local function variantsFactory(p0) --[[ line: 28 ]]
	-- upvalues: inputSizeModule (ref)
	return {
		common = {
			input = {
				tag = "radius-circle",
				cursorRadius = UDim.new(0, p0.Radius.Circle)
			},
			checkmark = {
				tag = "position-center-center anchor-center-center radius-circle",
				style = p0.Inverse.Content.Emphasis
			}
		},
		sizes = {
			[inputSizeModule.XSmall] = {
				input = {
					size = UDim2.fromOffset(p0.Size.Size_400, p0.Size.Size_400)
				},
				checkmark = { tag = "size-150" }
			},
			[inputSizeModule.Small] = {
				input = {
					size = UDim2.fromOffset(p0.Size.Size_500, p0.Size.Size_500)
				},
				checkmark = { tag = "size-200" }
			},
			[inputSizeModule.Medium] = {
				input = {
					size = UDim2.fromOffset(p0.Size.Size_600, p0.Size.Size_600)
				},
				checkmark = { tag = "size-250" }
			},
			[inputSizeModule.Large] = {
				input = {
					size = UDim2.fromOffset(p0.Size.Size_700, p0.Size.Size_700)
				},
				checkmark = { tag = "size-300" }
			}
		}
	}
end

return function(p1, p2) --[[ line: 59 ]]
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref)
	local radioItem = variantsContextModule.useVariants("RadioItem", variantsFactory, p1)
	
	return composeStyleVariantModule(radioItem.common, radioItem.sizes[p2])
end