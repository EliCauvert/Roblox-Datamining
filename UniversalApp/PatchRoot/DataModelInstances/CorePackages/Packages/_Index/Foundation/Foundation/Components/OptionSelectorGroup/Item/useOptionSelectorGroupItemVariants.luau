local foundation = script:FindFirstAncestor("Foundation")
local iconSizeModule = require(foundation.Enums.IconSize)
local inputSizeModule = require(foundation.Enums.InputSize)
local optionSelectorGroupSizeModule = require(foundation.Enums.OptionSelectorGroupSize)
local fillBehaviorModule = require(foundation.Enums.FillBehavior)
local orientationModule = require(foundation.Enums.Orientation)
local flagsModule = require(foundation.Utility.Flags)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local _ = require(foundation.Components.Types)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)

local function legacyVariantsFactory(p1)
	-- upvalues: flagsModule (ref), inputSizeModule (ref), iconSizeModule (ref)
	return {
		common = {
			container = {
				tag = "col wrap align-x-left align-y-center gap-xsmall radius-medium",
				radius = p1.Radius.Medium
			},
			content = p1.Color.Content.Default,
			itemInner = if flagsModule.FoundationOptionSelectorGroupFixes then nil else { tag = "col gap-xsmall size-full-0 auto-y" },
			header = { tag = "row align-y-center gap-small size-full-0 auto-y" },
			label = { tag = "fill auto-xy" },
			metadata = { tag = "shrink auto-xy" },
			description = { tag = "grow auto-xy" }
		},
		sizes = {
			[inputSizeModule.XSmall] = {
				container = { tag = "padding-medium" },
				icon = { size = iconSizeModule.XSmall },
				label = { tag = "text-title-small" },
				metadata = { tag = "text-caption-small" },
				description = { tag = "text-body-small" }
			},
			[inputSizeModule.Small] = {
				container = { tag = "padding-large" },
				icon = { size = iconSizeModule.Small },
				label = { tag = "text-title-small" },
				metadata = { tag = "text-caption-small" },
				description = { tag = "text-body-small" }
			},
			[inputSizeModule.Medium] = {
				container = { tag = "padding-xlarge" },
				icon = { size = iconSizeModule.Medium },
				label = { tag = "text-title-medium" },
				metadata = { tag = "text-caption-medium" },
				description = { tag = "text-body-medium" }
			},
			[inputSizeModule.Large] = {
				container = { tag = "padding-xxlarge" },
				icon = { size = iconSizeModule.Large },
				label = { tag = "text-title-large" },
				metadata = { tag = "text-caption-large" },
				description = { tag = "text-body-large" }
			}
		},
		layouts = if flagsModule.FoundationOptionSelectorGroupFixes then {
			Inline = {
				container = { tag = "size-full-0 auto-y" },
				itemInner = { tag = "col gap-xsmall size-full-0 auto-y" }
			},
			StackedFill = {
				container = { tag = "fill auto-y" },
				itemInner = { tag = "col gap-xsmall size-full-0 auto-y" }
			},
			StackedFit = {
				container = { tag = "auto-xy" },
				itemInner = { tag = "col gap-xsmall auto-xy" },
				header = { tag = "flex-x-between" },
				textContainer = { tag = "col gap-xsmall auto-xy" }
			}
		} else {}
	}
end

local function groupSizeVariantsFactory(p1)
	-- upvalues: iconSizeModule (ref), optionSelectorGroupSizeModule (ref), composeStyleVariantModule (ref)
	local t = {
		label = { tag = "size-full-0 auto-y" },
		metadata = { tag = "size-full-0 auto-y" },
		description = { tag = "size-full-0 auto-y" }
	}
	
	return {
		common = {
			container = { tag = "col align-x-left align-y-center gap-xsmall" },
			content = p1.Color.Content.Emphasis,
			supportingContent = p1.Color.Content.Default,
			label = { tag = "content-emphasis" },
			metadata = { tag = "content-default" },
			description = { tag = "content-default" }
		},
		sizes = {
			[optionSelectorGroupSizeModule.XSmall] = {
				container = {
					tag = "padding-medium radius-small",
					radius = p1.Radius.Small
				},
				icon = { size = iconSizeModule.XSmall, extent = p1.Size.Size_300 },
				label = { tag = "text-title-small" },
				metadata = { tag = "text-caption-small" },
				description = { tag = "text-body-small" }
			},
			[optionSelectorGroupSizeModule.Small] = {
				container = {
					tag = "padding-large radius-medium",
					radius = p1.Radius.Medium
				},
				icon = { size = iconSizeModule.Small, extent = p1.Size.Size_400 },
				label = { tag = "text-title-small" },
				metadata = { tag = "text-caption-small" },
				description = { tag = "text-body-small" }
			},
			[optionSelectorGroupSizeModule.Medium] = {
				container = {
					tag = "padding-xlarge radius-medium",
					radius = p1.Radius.Medium
				},
				icon = { size = iconSizeModule.Medium, extent = p1.Size.Size_500 },
				label = { tag = "text-title-medium" },
				metadata = { tag = "text-caption-medium" },
				description = { tag = "text-body-medium" }
			}
		},
		layouts = {
			Inline = composeStyleVariantModule({
				container = { tag = "size-full-0 auto-y" },
				itemInner = { tag = "row align-y-center gap-small size-full-0 auto-y" },
				textContainer = { tag = "col fill gap-xsmall size-full-0 auto-y" }
			}, t),
			StackedFill = composeStyleVariantModule({
				container = { tag = "fill auto-y" },
				itemInner = { tag = "col gap-small size-full-0 auto-y" },
				textContainer = { tag = "col gap-xsmall size-full-0 auto-y" }
			}, t),
			StackedFit = composeStyleVariantModule({
				container = { tag = "auto-xy" },
				itemInner = { tag = "col gap-small auto-xy" },
				textContainer = { tag = "col gap-xsmall auto-xy" }
			}, {
				label = { tag = "auto-xy" },
				metadata = { tag = "auto-xy" },
				description = { tag = "auto-xy" }
			})
		},
		selection = {
			[false] = { container = { stroke = p1.Color.Stroke.Emphasis } },
			[true] = { container = { stroke = p1.Color.System.Contrast } }
		}
	}
end

local function variantsFactory(p1)
	-- upvalues: legacyVariantsFactory (ref), groupSizeVariantsFactory (ref)
	return {
		legacy = legacyVariantsFactory(p1),
		groupSize = groupSizeVariantsFactory(p1)
	}
end

return function(p1, p2, p3, p4, p5)
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), flagsModule (ref), orientationModule (ref), fillBehaviorModule (ref), composeStyleVariantModule (ref)
	local optionSelectorGroupItem = variantsContextModule.useVariants("OptionSelectorGroupItem", variantsFactory, p1)
	
	if flagsModule.FoundationOptionSelectorGroupBeta then
		local groupSize = optionSelectorGroupItem.groupSize
		
		return composeStyleVariantModule(groupSize.common, groupSize.sizes[p2], if p3 == orientationModule.Horizontal then groupSize.layouts.Inline elseif p3 == orientationModule.Vertical and p4 == fillBehaviorModule.Fit then groupSize.layouts.StackedFit else groupSize.layouts.StackedFill, groupSize.selection[p5 == true])
	end
	local legacy = optionSelectorGroupItem.legacy
	
	return if flagsModule.FoundationOptionSelectorGroupFixes then composeStyleVariantModule(legacy.common, legacy.sizes[p2], if p3 == orientationModule.Horizontal then legacy.layouts.Inline elseif p3 == orientationModule.Vertical and p4 == fillBehaviorModule.Fit then legacy.layouts.StackedFit else legacy.layouts.StackedFill) else composeStyleVariantModule(legacy.common, legacy.sizes[p2])
end