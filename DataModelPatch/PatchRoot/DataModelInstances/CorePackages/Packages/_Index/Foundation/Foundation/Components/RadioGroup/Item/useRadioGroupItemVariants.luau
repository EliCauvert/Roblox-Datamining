local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Components.InternalInput)
local InputSizeModule = require(Foundation.Enums.InputSize)
local _ = require(Foundation.Enums.ControlState)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local _ = require(Foundation.Components.Types)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)

local function variantsFactory(p1)
	-- upvalues: InputSizeModule (copy)
	return {
		common = {
			input = {
				tag = "radius-circle",
				cursorRadius = UDim.new(0, p1.Radius.Circle)
			},
			checkmark = {
				tag = "position-center-center anchor-center-center radius-circle",
				style = p1.Inverse.Content.Emphasis
			}
		},
		sizes = {
			[InputSizeModule.XSmall] = {
				input = {
					size = UDim2.fromOffset(p1.Size.Size_400, p1.Size.Size_400)
				},
				checkmark = { tag = "size-150" }
			},
			[InputSizeModule.Small] = {
				input = {
					size = UDim2.fromOffset(p1.Size.Size_500, p1.Size.Size_500)
				},
				checkmark = { tag = "size-200" }
			},
			[InputSizeModule.Medium] = {
				input = {
					size = UDim2.fromOffset(p1.Size.Size_600, p1.Size.Size_600)
				},
				checkmark = { tag = "size-250" }
			},
			[InputSizeModule.Large] = {
				input = {
					size = UDim2.fromOffset(p1.Size.Size_700, p1.Size.Size_700)
				},
				checkmark = { tag = "size-300" }
			}
		}
	}
end

return function(p1, p2)
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), ComposeStyleVariantModule (copy)
	local RadioItem = VariantsContextModule.useVariants("RadioItem", variantsFactory, p1)
	
	return ComposeStyleVariantModule(RadioItem.common, RadioItem.sizes[p2])
end