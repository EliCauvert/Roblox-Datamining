local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Components.Types)
local inputSizeModule = require(foundation.Enums.InputSize)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)
local flagsModule = require(foundation.Utility.Flags)

local function variantsFactory(p0)
	-- upvalues: flagsModule (ref), inputSizeModule (ref)
	local ceiled = math.ceil(p0.Stroke.Standard)
	
	return {
		common = {
			container = {
				tag = if flagsModule.FoundationInternalInputBeta then "row align-x-left align-y-top auto-xy" else "row align-x-left align-y-center auto-xy",
				padding = UDim.new(0, ceiled)
			},
			input = { stroke = { thickness = ceiled } }
		},
		sizes = {
			[inputSizeModule.XSmall] = { container = { tag = "gap-medium" } },
			[inputSizeModule.Small] = { container = { tag = "gap-medium" } },
			[inputSizeModule.Medium] = { container = { tag = "gap-medium" } },
			[inputSizeModule.Large] = { container = { tag = "gap-medium" } }
		},
		labelPosition = {
			[Enum.HorizontalAlignment.Left] = { container = { tag = "flex-x-between size-full-0" } },
			[Enum.HorizontalAlignment.Right] = { container = { tag = "" } }
		}
	}
end

return function(p1, p2, p3)
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref)
	local internalInput = variantsContextModule.useVariants("InternalInput", variantsFactory, p1)
	
	return composeStyleVariantModule(internalInput.common, internalInput.sizes[p2], internalInput.labelPosition[p3])
end