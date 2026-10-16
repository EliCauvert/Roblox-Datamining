local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Components.Types)
local _ = require(Foundation.Components.InternalInput)
local InputSizeModule = require(Foundation.Enums.InputSize)
local _ = require(Foundation.Enums.ControlState)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)

local function variantsFactory(p1) --[[ Line: 29 ]]
	-- upvalues: InputSizeModule (copy)
	return {
		common = {
			input = {
				tag = "radius-small",
				colors = { checkedStyle = p1.Color.ActionSubEmphasis.Background },
				cursorRadius = UDim.new(0, p1.Radius.Small)
			},
			checkmark = {
				tag = "position-center-center anchor-center-center content-action-sub-emphasis"
			}
		},
		sizes = {
			[InputSizeModule.XSmall] = {
				input = {
					size = UDim2.fromOffset(p1.Size.Size_400, p1.Size.Size_400)
				},
				checkmark = { tag = "size-400" }
			},
			[InputSizeModule.Small] = {
				input = {
					size = UDim2.fromOffset(p1.Size.Size_500, p1.Size.Size_500)
				},
				checkmark = { tag = "size-500" }
			},
			[InputSizeModule.Medium] = {
				input = {
					size = UDim2.fromOffset(p1.Size.Size_600, p1.Size.Size_600)
				},
				checkmark = { tag = "size-600" }
			},
			[InputSizeModule.Large] = {
				input = {
					size = UDim2.fromOffset(p1.Size.Size_600, p1.Size.Size_600)
				},
				checkmark = { tag = "size-600" }
			}
		}
	}
end

return function(p1, p2) --[[ Line: 67 ]]
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), ComposeStyleVariantModule (copy)
	local Checkbox = VariantsContextModule.useVariants("Checkbox", variantsFactory, p1)
	
	return ComposeStyleVariantModule(Checkbox.common, Checkbox.sizes[p2])
end