local Foundation = script:FindFirstAncestor("Foundation")
local DashModule = require(Foundation.Parent.Dash)
local _ = require(Foundation.Components.Types)
local ControlStateModule = require(Foundation.Enums.ControlState)
local InputSizeModule = require(Foundation.Enums.InputSize)
local IconSizeModule = require(Foundation.Enums.IconSize)
local _ = require(Foundation.Enums.InputLabelSize)
local InputVariantModule = require(Foundation.Enums.InputVariant)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local FlagsModule = require(Foundation.Utility.Flags)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)
local GetInputVariantsFactoryModule = require(Foundation.Components.InputField.getInputVariantsFactory)

local function variantsFactory()
	-- upvalues: FlagsModule (copy), InputSizeModule (copy), IconSizeModule (copy), ControlStateModule (copy), DashModule (copy)
	local States = {
		[ControlStateModule.Disabled] = {
			container = if FlagsModule.FoundationDropdownVariant then nil else { tag = "stroke-muted" },
			text = { tag = "content-muted" }
		},
		[ControlStateModule.Initialize] = {
			container = if FlagsModule.FoundationDropdownVariant then nil else { tag = "stroke-default" },
			text = { tag = "content-default" }
		},
		[ControlStateModule.Default] = if FlagsModule.FoundationDropdownVariant then nil else {
			container = { tag = "stroke-default" },
			text = { tag = "content-default" }
		},
		[ControlStateModule.Hover] = if FlagsModule.FoundationDropdownVariant then nil else {
			container = { tag = "stroke-emphasis" },
			text = { tag = "content-emphasis" }
		},
		[ControlStateModule.Pressed] = if FlagsModule.FoundationDropdownVariant then nil else {
			container = { tag = "stroke-emphasis" },
			text = { tag = "content-emphasis" }
		},
		Error = if FlagsModule.FoundationDropdownVariant then {
			container = { tag = "stroke-alert" },
			text = { tag = "content-default" }
		} else nil
	}
	
	return {
		common = {
			container = {
				tag = {
					["row flex-x-between align-y-center stroke-standard stroke-position-inner"] = not FlagsModule.FoundationDropdownVariant,
					["row flex-x-between align-y-center"] = FlagsModule.FoundationDropdownVariant
				}
			},
			text = {
				tag = {
					["shrink auto-xy text-truncate-split content-emphasis"] = FlagsModule.FoundationDropdownVariant,
					["shrink auto-xy text-truncate-split"] = not FlagsModule.FoundationDropdownVariant
				}
			}
		},
		sizes = {
			[InputSizeModule.XSmall] = {
				container = {
					tag = {
						["gap-small size-full-600 padding-small radius-small"] = FlagsModule.FoundationDropdownSizeGap,
						["gap-xxsmall size-full-600 padding-small radius-small"] = not FlagsModule.FoundationDropdownSizeGap
					}
				},
				text = { tag = "text-body-small" },
				arrow = { size = IconSizeModule.XSmall }
			},
			[InputSizeModule.Small] = {
				container = {
					tag = {
						["gap-small size-full-800 padding-medium radius-medium"] = FlagsModule.FoundationDropdownSizeGap,
						["gap-xxsmall size-full-800 padding-medium radius-medium"] = not FlagsModule.FoundationDropdownSizeGap
					}
				},
				text = { tag = "text-body-small" },
				arrow = { size = IconSizeModule.Small }
			},
			[InputSizeModule.Medium] = {
				container = {
					tag = {
						["gap-small size-full-1000 padding-medium radius-medium"] = FlagsModule.FoundationDropdownSizeGap,
						["size-full-1000 padding-medium radius-medium"] = not FlagsModule.FoundationDropdownSizeGap
					}
				},
				text = { tag = "text-body-medium" },
				arrow = { size = IconSizeModule.Medium }
			},
			[InputSizeModule.Large] = {
				container = {
					tag = {
						["gap-small size-full-1200 padding-medium radius-medium"] = FlagsModule.FoundationDropdownSizeGap,
						["size-full-1200 padding-medium radius-medium"] = not FlagsModule.FoundationDropdownSizeGap
					}
				},
				text = { tag = "text-body-large" },
				arrow = { size = IconSizeModule.Large }
			}
		},
		states = States,
		placeholderStates = DashModule.map(States, function(p1)
			-- upvalues: DashModule (upval)
			return DashModule.join(p1, { text = { tag = "content-muted" } })
		end)
	}
end

return function(p1, p2, Utility, p3, p4, p5, p6, p7)
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), FlagsModule (copy), GetInputVariantsFactoryModule (copy), InputVariantModule (copy), ComposeStyleVariantModule (copy)
	local Dropdown = VariantsContextModule.useVariants("Dropdown", variantsFactory, p1)
	local InputField = if FlagsModule.FoundationDropdownVariant then VariantsContextModule.useVariants("InputField", GetInputVariantsFactoryModule, p1) else nil
	local Variant = if FlagsModule.FoundationDropdownVariant then InputField.variants[Utility or InputVariantModule.Standard] else nil
	local Error = if FlagsModule.FoundationDropdownVariant or not p5 then p3 else "Error"
	
	return ComposeStyleVariantModule(if FlagsModule.FoundationDropdownVariant then InputField.common else {}, Dropdown.common, if FlagsModule.FoundationDropdownVariant then InputField.sizes[p2] else {}, Dropdown.sizes[p2], if FlagsModule.FoundationDropdownVariant and Utility ~= InputVariantModule.Utility then Variant else {}, if FlagsModule.FoundationDropdownVariant then InputField.hoverState[p7] else {}, if FlagsModule.FoundationDropdownVariant then InputField.focusedState[p6] else {}, if FlagsModule.FoundationDropdownVariant then InputField.errorState[p5] else {}, if p4 then Dropdown.placeholderStates[Error] else Dropdown.states[Error], if FlagsModule.FoundationDropdownVariant and Utility == InputVariantModule.Utility then Variant else {})
end