local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Components.Types)
local InputSizeModule = require(Foundation.Enums.InputSize)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)

local function variantsFactory(p1)
	-- upvalues: InputSizeModule (copy)
	local Ceiled = math.ceil(p1.Stroke.Standard)
	
	return {
		common = {
			container = {
				tag = "row align-x-left align-y-center auto-xy",
				padding = UDim.new(0, Ceiled)
			},
			input = { stroke = { thickness = Ceiled } }
		},
		sizes = {
			[InputSizeModule.XSmall] = { container = { tag = "gap-medium" } },
			[InputSizeModule.Small] = { container = { tag = "gap-medium" } },
			[InputSizeModule.Medium] = { container = { tag = "gap-medium" } },
			[InputSizeModule.Large] = { container = { tag = "gap-medium" } }
		},
		labelPosition = {
			[Enum.HorizontalAlignment.Left] = { container = { tag = "flex-x-between size-full-0" } },
			[Enum.HorizontalAlignment.Right] = { container = { tag = "" } }
		}
	}
end

return function(p1, p2, p3)
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), ComposeStyleVariantModule (copy)
	local InternalInput = VariantsContextModule.useVariants("InternalInput", variantsFactory, p1)
	
	return ComposeStyleVariantModule(InternalInput.common, InternalInput.sizes[p2], InternalInput.labelPosition[p3])
end