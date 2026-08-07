-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:04 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Components.Types)
local inputSizeModule = require(foundation.Enums.InputSize)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)

local function variantsFactory(p0) --[[ line: 27 ]]
	-- upvalues: inputSizeModule (ref)
	local ceiled = math.ceil(p0.Stroke.Standard)
	
	return {
		common = {
			container = {
				tag = "row align-x-left align-y-center auto-xy",
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

return function(p1, p2, p3) --[[ line: 52 ]]
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref)
	local internalInput = variantsContextModule.useVariants("InternalInput", variantsFactory, p1)
	
	return composeStyleVariantModule(internalInput.common, internalInput.sizes[p2], internalInput.labelPosition[p3])
end