local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Components.InternalInput)
local inputSizeModule = require(foundation.Enums.InputSize)
local _ = require(foundation.Enums.ControlState)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local _ = require(foundation.Components.Types)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)
local flagsModule = require(foundation.Utility.Flags)

local function variantsFactory(p0)
	-- upvalues: inputSizeModule (ref), flagsModule (ref)
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
					size = if flagsModule.FoundationRadioBeta then UDim2.fromOffset(p0.Size.Size_600, p0.Size.Size_600) else UDim2.fromOffset(p0.Size.Size_700, p0.Size.Size_700)
				},
				checkmark = {
					tag = if flagsModule.FoundationRadioBeta then "size-250" else "size-300"
				}
			}
		}
	}
end

return function(p1, p2)
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref)
	local radioItem = variantsContextModule.useVariants("RadioItem", variantsFactory, p1)
	
	return composeStyleVariantModule(radioItem.common, radioItem.sizes[p2])
end