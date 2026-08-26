local foundation = script:FindFirstAncestor("Foundation")
local flagsModule = require(foundation.Utility.Flags)
local numberInputControlsVariantModule = require(foundation.Enums.NumberInputControlsVariant)
local inputSizeModule = require(foundation.Enums.InputSize)
local iconSizeModule = require(foundation.Enums.IconSize)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)

local function computeProps(p1)
	local var1 = if p1.width and p1.horizontalPadding then UDim.new(0, (p1.buttonWidth - p1.horizontalPadding) / 2) else nil
	
	return {
		container = { width = p1.width },
		button = {
			tag = "fill size-full",
			width = p1.buttonWidth,
			padding = if var1 then { left = var1, right = var1 } else nil
		},
		upButton = { tag = p1.upButtonTag },
		downButton = { tag = p1.downButtonTag },
		splitButton = { size = p1.splitButtonSize, tag = p1.splitButtonTag },
		icon = { tag = p1.iconTag }
	}
end

local function variantsFactory(p1)
	-- upvalues: flagsModule (ref), inputSizeModule (ref), iconSizeModule (ref), computeProps (ref), numberInputControlsVariantModule (ref)
	return {
		common = if flagsModule.FoundationNumberInputBeta then {
			controls = { tag = "row align-y-center bg-action-standard" }
		} else {
			upButton = { tag = "fill size-full padding-bottom-xsmall" },
			downButton = { tag = "fill size-full padding-top-xsmall" },
			icon = { tag = "content-default" }
		},
		sizes = if flagsModule.FoundationNumberInputBeta then {
			[inputSizeModule.XSmall] = {
				controls = {
					tag = "radius-small",
					width = p1.Size.Size_1200,
					buttonSize = p1.Size.Size_600,
					iconSize = iconSizeModule.XSmall,
					radius = p1.Radius.Small
				}
			},
			[inputSizeModule.Small] = {
				controls = {
					tag = "radius-medium",
					width = p1.Size.Size_1600,
					buttonSize = p1.Size.Size_800,
					iconSize = iconSizeModule.Small,
					radius = p1.Radius.Medium
				}
			},
			[inputSizeModule.Medium] = {
				controls = {
					tag = "radius-medium",
					width = p1.Size.Size_2000,
					buttonSize = p1.Size.Size_1000,
					iconSize = iconSizeModule.Medium,
					radius = p1.Radius.Medium
				}
			},
			[inputSizeModule.Large] = {
				controls = {
					tag = "radius-medium",
					width = p1.Size.Size_2400,
					buttonSize = p1.Size.Size_1200,
					iconSize = iconSizeModule.Large,
					radius = p1.Radius.Medium
				}
			}
		} else {
			[inputSizeModule.XSmall] = computeProps({
				upButtonTag = "padding-top-xxsmall",
				downButtonTag = "padding-bottom-xxsmall",
				splitButtonTag = "radius-small",
				width = p1.Size.Size_3000 * 1.166666666667,
				buttonWidth = p1.Size.Size_400,
				horizontalPadding = p1.Size.Size_150,
				splitButtonSize = p1.Size.Size_600
			}),
			[inputSizeModule.Small] = computeProps({
				upButtonTag = "padding-top-xsmall",
				downButtonTag = "padding-bottom-xsmall",
				splitButtonTag = "radius-medium",
				width = p1.Size.Size_3000 * 1.333333333333,
				buttonWidth = p1.Size.Size_600,
				horizontalPadding = p1.Size.Size_150,
				splitButtonSize = p1.Size.Size_800
			}),
			[inputSizeModule.Medium] = computeProps({
				upButtonTag = "padding-top-small",
				downButtonTag = "padding-bottom-small",
				splitButtonTag = "radius-medium",
				width = p1.Size.Size_3000 * 1.5,
				buttonWidth = p1.Size.Size_600,
				horizontalPadding = p1.Size.Size_150,
				splitButtonSize = p1.Size.Size_1000
			}),
			[inputSizeModule.Large] = computeProps({
				upButtonTag = "padding-top-medium",
				downButtonTag = "padding-bottom-medium",
				splitButtonTag = "radius-medium",
				width = p1.Size.Size_3000 * 1.666666666667,
				buttonWidth = p1.Size.Size_800,
				horizontalPadding = p1.Size.Size_150,
				splitButtonSize = p1.Size.Size_1200
			})
		},
		controlVariants = if flagsModule.FoundationNumberInputBeta then nil else {
			[numberInputControlsVariantModule.Stacked] = computeProps({ iconTag = "size-150-100" })
		}
	}
end

return function(p1, p2, p3)
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), flagsModule (ref), composeStyleVariantModule (ref)
	local numberInput = variantsContextModule.useVariants("NumberInput", variantsFactory, p1)
	
	return if flagsModule.FoundationNumberInputBeta then composeStyleVariantModule(numberInput.common, numberInput.sizes[p2]) else composeStyleVariantModule(numberInput.common, numberInput.sizes[p2], numberInput.controlVariants[p3])
end