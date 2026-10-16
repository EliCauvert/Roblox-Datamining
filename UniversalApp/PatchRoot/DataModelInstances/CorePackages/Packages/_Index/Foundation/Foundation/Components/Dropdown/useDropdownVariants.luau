local Foundation = script:FindFirstAncestor("Foundation")
local DashModule = require(Foundation.Parent.Dash)
local _ = require(Foundation.Components.Types)
local ControlStateModule = require(Foundation.Enums.ControlState)
local InputSizeModule = require(Foundation.Enums.InputSize)
local IconSizeModule = require(Foundation.Enums.IconSize)
local _ = require(Foundation.Enums.InputLabelSize)
local InputVariantModule = require(Foundation.Enums.InputVariant)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)
local GetInputVariantsFactoryModule = require(Foundation.Components.InputField.getInputVariantsFactory)

local function variantsFactory() --[[ Line: 45 ]]
	-- upvalues: InputSizeModule (copy), IconSizeModule (copy), ControlStateModule (copy), DashModule (copy)
	local States = {
		[ControlStateModule.Disabled] = { container = nil, text = { tag = "content-muted" } },
		[ControlStateModule.Initialize] = { container = nil, text = { tag = "content-default" } },
		[ControlStateModule.Default] = nil,
		[ControlStateModule.Hover] = nil,
		[ControlStateModule.Pressed] = nil
	}
	
	return {
		common = {
			container = { tag = "row flex-x-between align-y-center" },
			text = {
				tag = "shrink auto-xy text-truncate-split content-emphasis"
			}
		},
		sizes = {
			[InputSizeModule.XSmall] = {
				container = {
					tag = "gap-small size-full-600 padding-small radius-small"
				},
				text = { tag = "text-body-small" },
				arrow = { size = IconSizeModule.XSmall }
			},
			[InputSizeModule.Small] = {
				container = {
					tag = "gap-small size-full-800 padding-medium radius-medium"
				},
				text = { tag = "text-body-small" },
				arrow = { size = IconSizeModule.Small }
			},
			[InputSizeModule.Medium] = {
				container = {
					tag = "gap-small size-full-1000 padding-medium radius-medium"
				},
				text = { tag = "text-body-medium" },
				arrow = { size = IconSizeModule.Medium }
			},
			[InputSizeModule.Large] = {
				container = {
					tag = "gap-small size-full-1200 padding-medium radius-medium"
				},
				text = { tag = "text-body-large" },
				arrow = { size = IconSizeModule.Large }
			}
		},
		states = States,
		placeholderStates = DashModule.map(States, function(p1) --[[ Line: 102 ]]
			-- upvalues: DashModule (upval)
			return DashModule.join(p1, { text = { tag = "content-muted" } })
		end)
	}
end

return function(p1, p2, Utility, p3, p4, p5, p6, p7) --[[ Line: 116 ]]
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), GetInputVariantsFactoryModule (copy), InputVariantModule (copy), ComposeStyleVariantModule (copy)
	local Dropdown = VariantsContextModule.useVariants("Dropdown", variantsFactory, p1)
	local InputField = VariantsContextModule.useVariants("InputField", GetInputVariantsFactoryModule, p1)
	local Variant = InputField.variants[Utility or InputVariantModule.Standard]
	
	return ComposeStyleVariantModule(InputField.common, Dropdown.common, InputField.sizes[p2], Dropdown.sizes[p2], if Utility == InputVariantModule.Utility then {} else Variant, InputField.hoverState[p7], InputField.focusedState[p6], InputField.errorState[p5], if p4 then Dropdown.placeholderStates[p3] else Dropdown.states[p3], if Utility == InputVariantModule.Utility then Variant else {})
end