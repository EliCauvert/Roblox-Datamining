local foundation = script:FindFirstAncestor("Foundation")
local dashModule = require(foundation.Parent.Dash)
local _ = require(foundation.Components.Types)
local controlStateModule = require(foundation.Enums.ControlState)
local inputSizeModule = require(foundation.Enums.InputSize)
local iconSizeModule = require(foundation.Enums.IconSize)
local _ = require(foundation.Enums.InputLabelSize)
local inputVariantModule = require(foundation.Enums.InputVariant)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)
local getInputVariantsFactoryModule = require(foundation.Components.InputField.getInputVariantsFactory)

local function variantsFactory()
	-- upvalues: inputSizeModule (ref), iconSizeModule (ref), controlStateModule (ref), dashModule (ref)
	local t = {
		[controlStateModule.Disabled] = { container = nil, text = { tag = "content-muted" } },
		[controlStateModule.Initialize] = { container = nil, text = { tag = "content-default" } },
		[controlStateModule.Default] = nil,
		[controlStateModule.Hover] = nil,
		[controlStateModule.Pressed] = nil
	}
	
	return {
		common = {
			container = { tag = "row flex-x-between align-y-center" },
			text = {
				tag = "shrink auto-xy text-truncate-split content-emphasis"
			}
		},
		sizes = {
			[inputSizeModule.XSmall] = {
				container = {
					tag = "gap-small size-full-600 padding-small radius-small"
				},
				text = { tag = "text-body-small" },
				arrow = { size = iconSizeModule.XSmall }
			},
			[inputSizeModule.Small] = {
				container = {
					tag = "gap-small size-full-800 padding-medium radius-medium"
				},
				text = { tag = "text-body-small" },
				arrow = { size = iconSizeModule.Small }
			},
			[inputSizeModule.Medium] = {
				container = {
					tag = "gap-small size-full-1000 padding-medium radius-medium"
				},
				text = { tag = "text-body-medium" },
				arrow = { size = iconSizeModule.Medium }
			},
			[inputSizeModule.Large] = {
				container = {
					tag = "gap-small size-full-1200 padding-medium radius-medium"
				},
				text = { tag = "text-body-large" },
				arrow = { size = iconSizeModule.Large }
			}
		},
		states = t,
		placeholderStates = dashModule.map(t, function(p1)
			-- upvalues: dashModule (copy)
			return dashModule.join(p1, { text = { tag = "content-muted" } })
		end)
	}
end

return function(p1, p2, p3, p4, p5, p6, p7, p8)
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), getInputVariantsFactoryModule (ref), inputVariantModule (ref), composeStyleVariantModule (ref)
	local dropdown = variantsContextModule.useVariants("Dropdown", variantsFactory, p1)
	local inputField = variantsContextModule.useVariants("InputField", getInputVariantsFactoryModule, p1)
	local var1 = inputField.variants[p3 or inputVariantModule.Standard]
	
	return composeStyleVariantModule(inputField.common, dropdown.common, inputField.sizes[p2], dropdown.sizes[p2], if p3 ~= inputVariantModule.Utility then {} else var1, inputField.hoverState[p8], inputField.focusedState[p7], inputField.errorState[p6], if p5 then dropdown.placeholderStates[p4] else dropdown.states[p4], if p3 == inputVariantModule.Utility then var1 else {})
end