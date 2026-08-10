local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Components.Types)
local _ = require(foundation.Components.InternalInput)
local inputSizeModule = require(foundation.Enums.InputSize)
local _ = require(foundation.Enums.ControlState)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)
local flagsModule = require(foundation.Utility.Flags)

local function variantsFactory(p0) --[[ line: 31 ]]
	-- upvalues: inputSizeModule (ref), flagsModule (ref)
	return {
		common = {
			input = {
				tag = "radius-small",
				colors = { checkedStyle = p0.Color.ActionSubEmphasis.Background },
				cursorRadius = UDim.new(0, p0.Radius.Small)
			},
			checkmark = {
				tag = "position-center-center anchor-center-center content-action-sub-emphasis"
			}
		},
		sizes = {
			[inputSizeModule.XSmall] = {
				input = {
					size = UDim2.fromOffset(p0.Size.Size_400, p0.Size.Size_400)
				},
				checkmark = { tag = "size-400" }
			},
			[inputSizeModule.Small] = {
				input = {
					size = UDim2.fromOffset(p0.Size.Size_500, p0.Size.Size_500)
				},
				checkmark = { tag = "size-500" }
			},
			[inputSizeModule.Medium] = {
				input = {
					size = UDim2.fromOffset(p0.Size.Size_600, p0.Size.Size_600)
				},
				checkmark = { tag = "size-600" }
			},
			[inputSizeModule.Large] = {
				input = {
					size = if flagsModule.FoundationCheckboxBeta then UDim2.fromOffset(p0.Size.Size_600, p0.Size.Size_600) else UDim2.fromOffset(p0.Size.Size_700, p0.Size.Size_700)
				},
				checkmark = {
					tag = if flagsModule.FoundationCheckboxBeta then "size-600" else "size-700"
				}
			}
		}
	}
end

return function(p1, p2) --[[ line: 71 ]]
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref)
	local checkbox = variantsContextModule.useVariants("Checkbox", variantsFactory, p1)
	
	return composeStyleVariantModule(checkbox.common, checkbox.sizes[p2])
end