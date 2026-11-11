local Foundation = script:FindFirstAncestor("Foundation")
local FlagsModule = require(Foundation.Utility.Flags)
local NumberInputControlsVariantModule = require(Foundation.Enums.NumberInputControlsVariant)
local InputSizeModule = require(Foundation.Enums.InputSize)
local IconSizeModule = require(Foundation.Enums.IconSize)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)

local function computeProps(p1)
	local _UDim = if p1.width and p1.horizontalPadding then UDim.new(0, (p1.buttonWidth - p1.horizontalPadding) / 2) else nil
	
	return {
		container = { width = p1.width },
		button = {
			tag = "fill size-full",
			width = p1.buttonWidth,
			padding = if _UDim then { left = _UDim, right = _UDim } else nil
		},
		upButton = { tag = p1.upButtonTag },
		downButton = { tag = p1.downButtonTag },
		splitButton = { size = p1.splitButtonSize, tag = p1.splitButtonTag },
		icon = { tag = p1.iconTag }
	}
end

local function variantsFactory(p1)
	-- upvalues: FlagsModule (copy), InputSizeModule (copy), IconSizeModule (copy), computeProps (copy), NumberInputControlsVariantModule (copy)
	return {
		common = if FlagsModule.FoundationNumberInputBeta then {
			controls = { tag = "row align-y-center bg-action-standard" }
		} else {
			upButton = { tag = "fill size-full padding-bottom-xsmall" },
			downButton = { tag = "fill size-full padding-top-xsmall" },
			icon = { tag = "content-default" }
		},
		sizes = if FlagsModule.FoundationNumberInputBeta then {
			[InputSizeModule.XSmall] = {
				controls = {
					tag = "radius-small",
					width = p1.Size.Size_1200,
					buttonSize = p1.Size.Size_600,
					iconSize = IconSizeModule.XSmall,
					radius = p1.Radius.Small
				}
			},
			[InputSizeModule.Small] = {
				controls = {
					tag = "radius-medium",
					width = p1.Size.Size_1600,
					buttonSize = p1.Size.Size_800,
					iconSize = IconSizeModule.Small,
					radius = p1.Radius.Medium
				}
			},
			[InputSizeModule.Medium] = {
				controls = {
					tag = "radius-medium",
					width = p1.Size.Size_2000,
					buttonSize = p1.Size.Size_1000,
					iconSize = IconSizeModule.Medium,
					radius = p1.Radius.Medium
				}
			},
			[InputSizeModule.Large] = {
				controls = {
					tag = "radius-medium",
					width = p1.Size.Size_2400,
					buttonSize = p1.Size.Size_1200,
					iconSize = IconSizeModule.Large,
					radius = p1.Radius.Medium
				}
			}
		} else {
			[InputSizeModule.XSmall] = computeProps({
				upButtonTag = "padding-top-xxsmall",
				downButtonTag = "padding-bottom-xxsmall",
				splitButtonTag = "radius-small",
				width = p1.Size.Size_3000 * 1.1666666666666667,
				buttonWidth = p1.Size.Size_400,
				horizontalPadding = p1.Size.Size_150,
				splitButtonSize = p1.Size.Size_600
			}),
			[InputSizeModule.Small] = computeProps({
				upButtonTag = "padding-top-xsmall",
				downButtonTag = "padding-bottom-xsmall",
				splitButtonTag = "radius-medium",
				width = p1.Size.Size_3000 * 1.3333333333333333,
				buttonWidth = p1.Size.Size_600,
				horizontalPadding = p1.Size.Size_150,
				splitButtonSize = p1.Size.Size_800
			}),
			[InputSizeModule.Medium] = computeProps({
				upButtonTag = "padding-top-small",
				downButtonTag = "padding-bottom-small",
				splitButtonTag = "radius-medium",
				width = p1.Size.Size_3000 * 1.5,
				buttonWidth = p1.Size.Size_600,
				horizontalPadding = p1.Size.Size_150,
				splitButtonSize = p1.Size.Size_1000
			}),
			[InputSizeModule.Large] = computeProps({
				upButtonTag = "padding-top-medium",
				downButtonTag = "padding-bottom-medium",
				splitButtonTag = "radius-medium",
				width = p1.Size.Size_3000 * 1.6666666666666667,
				buttonWidth = p1.Size.Size_800,
				horizontalPadding = p1.Size.Size_150,
				splitButtonSize = p1.Size.Size_1200
			})
		},
		controlVariants = if FlagsModule.FoundationNumberInputBeta then nil else {
			[NumberInputControlsVariantModule.Stacked] = computeProps({ iconTag = "size-150-100" })
		}
	}
end

return function(p1, p2, p3)
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), FlagsModule (copy), ComposeStyleVariantModule (copy)
	local NumberInput = VariantsContextModule.useVariants("NumberInput", variantsFactory, p1)
	
	return if FlagsModule.FoundationNumberInputBeta then ComposeStyleVariantModule(NumberInput.common, NumberInput.sizes[p2]) else ComposeStyleVariantModule(NumberInput.common, NumberInput.sizes[p2], NumberInput.controlVariants[p3])
end