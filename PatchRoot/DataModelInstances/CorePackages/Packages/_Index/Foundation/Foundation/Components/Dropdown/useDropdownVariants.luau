-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:03 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local dashModule = require(foundation.Parent.Dash)
local _ = require(foundation.Components.Types)
local controlStateModule = require(foundation.Enums.ControlState)
local inputSizeModule = require(foundation.Enums.InputSize)
local iconSizeModule = require(foundation.Enums.IconSize)
local _ = require(foundation.Enums.InputLabelSize)
local inputVariantModule = require(foundation.Enums.InputVariant)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local flagsModule = require(foundation.Utility.Flags)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)
local getInputVariantsFactoryModule = require(foundation.Components.InputField.getInputVariantsFactory)

local function variantsFactory() --[[ line: 49 ]]
	-- upvalues: flagsModule (ref), inputSizeModule (ref), iconSizeModule (ref), controlStateModule (ref), dashModule (ref)
	local t = {
		[controlStateModule.Disabled] = {
			container = if flagsModule.FoundationDropdownVariant then nil else { tag = "stroke-muted" },
			text = { tag = "content-muted" }
		},
		[controlStateModule.Initialize] = {
			container = if flagsModule.FoundationDropdownVariant then nil else { tag = "stroke-default" },
			text = { tag = "content-default" }
		},
		[controlStateModule.Default] = if flagsModule.FoundationDropdownVariant then nil else {
			container = { tag = "stroke-default" },
			text = { tag = "content-default" }
		},
		[controlStateModule.Hover] = if flagsModule.FoundationDropdownVariant then nil else {
			container = { tag = "stroke-emphasis" },
			text = { tag = "content-emphasis" }
		},
		[controlStateModule.Pressed] = if flagsModule.FoundationDropdownVariant then nil else {
			container = { tag = "stroke-emphasis" },
			text = { tag = "content-emphasis" }
		},
		Error = if not flagsModule.FoundationDropdownVariant then nil else {
			container = { tag = "stroke-alert" },
			text = { tag = "content-default" }
		}
	}
	
	return {
		common = {
			container = {
				tag = {
					["row flex-x-between align-y-center stroke-standard stroke-position-inner"] = not flagsModule.FoundationDropdownVariant,
					["row flex-x-between align-y-center"] = flagsModule.FoundationDropdownVariant
				}
			},
			text = {
				tag = {
					["shrink auto-xy text-truncate-split content-emphasis"] = flagsModule.FoundationDropdownVariant,
					["shrink auto-xy text-truncate-split"] = not flagsModule.FoundationDropdownVariant
				}
			}
		},
		sizes = {
			[inputSizeModule.XSmall] = {
				container = {
					tag = {
						["gap-small size-full-600 padding-small radius-small"] = flagsModule.FoundationDropdownSizeGap,
						["gap-xxsmall size-full-600 padding-small radius-small"] = not flagsModule.FoundationDropdownSizeGap
					}
				},
				text = { tag = "text-body-small" },
				arrow = { size = iconSizeModule.XSmall }
			},
			[inputSizeModule.Small] = {
				container = {
					tag = {
						["gap-small size-full-800 padding-medium radius-medium"] = flagsModule.FoundationDropdownSizeGap,
						["gap-xxsmall size-full-800 padding-medium radius-medium"] = not flagsModule.FoundationDropdownSizeGap
					}
				},
				text = { tag = "text-body-small" },
				arrow = { size = iconSizeModule.Small }
			},
			[inputSizeModule.Medium] = {
				container = {
					tag = {
						["gap-small size-full-1000 padding-medium radius-medium"] = flagsModule.FoundationDropdownSizeGap,
						["size-full-1000 padding-medium radius-medium"] = not flagsModule.FoundationDropdownSizeGap
					}
				},
				text = { tag = "text-body-medium" },
				arrow = { size = iconSizeModule.Medium }
			},
			[inputSizeModule.Large] = {
				container = {
					tag = {
						["gap-small size-full-1200 padding-medium radius-medium"] = flagsModule.FoundationDropdownSizeGap,
						["size-full-1200 padding-medium radius-medium"] = not flagsModule.FoundationDropdownSizeGap
					}
				},
				text = { tag = "text-body-large" },
				arrow = { size = iconSizeModule.Large }
			}
		},
		states = t,
		placeholderStates = dashModule.map(t, function(p0) --[[ line: 147 ]]
			-- upvalues: dashModule (copy)
			return dashModule.join(p0, { text = { tag = "content-muted" } })
		end)
	}
end

return function(p1, p2, p3, p4, p5, p6, p7, p8) --[[ line: 161 ]]
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), flagsModule (ref), getInputVariantsFactoryModule (ref), inputVariantModule (ref), composeStyleVariantModule (ref)
	local dropdown = variantsContextModule.useVariants("Dropdown", variantsFactory, p1)
	local var13 = if flagsModule.FoundationDropdownVariant then variantsContextModule.useVariants("InputField", getInputVariantsFactoryModule, p1) else nil
	local var14 = if flagsModule.FoundationDropdownVariant then var13.variants[p3 or inputVariantModule.Standard] else nil
	local var15 = if flagsModule.FoundationDropdownVariant or not p6 then p4 else "Error"
	
	return composeStyleVariantModule(if flagsModule.FoundationDropdownVariant then var13.common else {}, dropdown.common, if flagsModule.FoundationDropdownVariant then var13.sizes[p2] else {}, dropdown.sizes[p2], if flagsModule.FoundationDropdownVariant and p3 ~= inputVariantModule.Utility then var14 else {}, if flagsModule.FoundationDropdownVariant then var13.hoverState[p8] else {}, if flagsModule.FoundationDropdownVariant then var13.focusedState[p7] else {}, if flagsModule.FoundationDropdownVariant then var13.errorState[p6] else {}, if p5 then dropdown.placeholderStates[var15] else dropdown.states[var15], if flagsModule.FoundationDropdownVariant and p3 == inputVariantModule.Utility then var14 else {})
end