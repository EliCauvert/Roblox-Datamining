local Foundation = script:FindFirstAncestor("Foundation")
local IconSizeModule = require(Foundation.Enums.IconSize)
local InputSizeModule = require(Foundation.Enums.InputSize)
local OptionSelectorGroupSizeModule = require(Foundation.Enums.OptionSelectorGroupSize)
local FillBehaviorModule = require(Foundation.Enums.FillBehavior)
local OrientationModule = require(Foundation.Enums.Orientation)
local FlagsModule = require(Foundation.Utility.Flags)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local _ = require(Foundation.Components.Types)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)

local function legacyVariantsFactory(p1)
	-- upvalues: FlagsModule (copy), InputSizeModule (copy), IconSizeModule (copy)
	return {
		common = {
			container = {
				tag = "col wrap align-x-left align-y-center gap-xsmall radius-medium",
				radius = p1.Radius.Medium
			},
			content = p1.Color.Content.Default,
			itemInner = if FlagsModule.FoundationOptionSelectorGroupFixes then nil else { tag = "col gap-xsmall size-full-0 auto-y" },
			header = { tag = "row align-y-center gap-small size-full-0 auto-y" },
			label = { tag = "fill auto-xy" },
			metadata = { tag = "shrink auto-xy" },
			description = { tag = "grow auto-xy" }
		},
		sizes = {
			[InputSizeModule.XSmall] = {
				container = { tag = "padding-medium" },
				icon = { size = IconSizeModule.XSmall },
				label = { tag = "text-title-small" },
				metadata = { tag = "text-caption-small" },
				description = { tag = "text-body-small" }
			},
			[InputSizeModule.Small] = {
				container = { tag = "padding-large" },
				icon = { size = IconSizeModule.Small },
				label = { tag = "text-title-small" },
				metadata = { tag = "text-caption-small" },
				description = { tag = "text-body-small" }
			},
			[InputSizeModule.Medium] = {
				container = { tag = "padding-xlarge" },
				icon = { size = IconSizeModule.Medium },
				label = { tag = "text-title-medium" },
				metadata = { tag = "text-caption-medium" },
				description = { tag = "text-body-medium" }
			},
			[InputSizeModule.Large] = {
				container = { tag = "padding-xxlarge" },
				icon = { size = IconSizeModule.Large },
				label = { tag = "text-title-large" },
				metadata = { tag = "text-caption-large" },
				description = { tag = "text-body-large" }
			}
		},
		layouts = if FlagsModule.FoundationOptionSelectorGroupFixes then {
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
	-- upvalues: IconSizeModule (copy), OptionSelectorGroupSizeModule (copy), ComposeStyleVariantModule (copy)
	local config = {
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
			[OptionSelectorGroupSizeModule.XSmall] = {
				container = {
					tag = "padding-medium radius-small",
					radius = p1.Radius.Small
				},
				icon = { size = IconSizeModule.XSmall, extent = p1.Size.Size_300 },
				label = { tag = "text-title-small" },
				metadata = { tag = "text-caption-small" },
				description = { tag = "text-body-small" }
			},
			[OptionSelectorGroupSizeModule.Small] = {
				container = {
					tag = "padding-large radius-medium",
					radius = p1.Radius.Medium
				},
				icon = { size = IconSizeModule.Small, extent = p1.Size.Size_400 },
				label = { tag = "text-title-small" },
				metadata = { tag = "text-caption-small" },
				description = { tag = "text-body-small" }
			},
			[OptionSelectorGroupSizeModule.Medium] = {
				container = {
					tag = "padding-xlarge radius-medium",
					radius = p1.Radius.Medium
				},
				icon = { size = IconSizeModule.Medium, extent = p1.Size.Size_500 },
				label = { tag = "text-title-medium" },
				metadata = { tag = "text-caption-medium" },
				description = { tag = "text-body-medium" }
			}
		},
		layouts = {
			Inline = ComposeStyleVariantModule({
				container = { tag = "size-full-0 auto-y" },
				itemInner = { tag = "row align-y-center gap-small size-full-0 auto-y" },
				textContainer = { tag = "col fill gap-xsmall size-full-0 auto-y" }
			}, config),
			StackedFill = ComposeStyleVariantModule({
				container = { tag = "fill auto-y" },
				itemInner = { tag = "col gap-small size-full-0 auto-y" },
				textContainer = { tag = "col gap-xsmall size-full-0 auto-y" }
			}, config),
			StackedFit = ComposeStyleVariantModule({
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
	-- upvalues: legacyVariantsFactory (copy), groupSizeVariantsFactory (copy)
	return {
		legacy = legacyVariantsFactory(p1),
		groupSize = groupSizeVariantsFactory(p1)
	}
end

return function(p1, p2, Horizontal, Fit, Enabled)
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), FlagsModule (copy), OrientationModule (copy), FillBehaviorModule (copy), ComposeStyleVariantModule (copy)
	local OptionSelectorGroupItem = VariantsContextModule.useVariants("OptionSelectorGroupItem", variantsFactory, p1)
	
	if FlagsModule.FoundationOptionSelectorGroupBeta then
		local GroupSize = OptionSelectorGroupItem.groupSize
		local IsFitMatch: boolean = Horizontal == OrientationModule.Vertical and Fit == FillBehaviorModule.Fit
		
		return (ComposeStyleVariantModule(GroupSize.common, GroupSize.sizes[p2], if Horizontal == OrientationModule.Horizontal then GroupSize.layouts.Inline elseif IsFitMatch then GroupSize.layouts.StackedFit else GroupSize.layouts.StackedFill, GroupSize.selection[Enabled == true]))
	end
	local Legacy = OptionSelectorGroupItem.legacy
	
	if FlagsModule.FoundationOptionSelectorGroupFixes then
		local IsFitMatch: boolean = Horizontal == OrientationModule.Vertical and Fit == FillBehaviorModule.Fit
		
		return (ComposeStyleVariantModule(Legacy.common, Legacy.sizes[p2], if Horizontal == OrientationModule.Horizontal then Legacy.layouts.Inline elseif IsFitMatch then Legacy.layouts.StackedFit else Legacy.layouts.StackedFill))
	else
		return (ComposeStyleVariantModule(Legacy.common, Legacy.sizes[p2]))
	end
end