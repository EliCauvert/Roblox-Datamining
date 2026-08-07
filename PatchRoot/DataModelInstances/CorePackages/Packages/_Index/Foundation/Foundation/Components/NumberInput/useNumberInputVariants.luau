-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:06 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local flagsModule = require(foundation.Utility.Flags)
local numberInputControlsVariantModule = require(foundation.Enums.NumberInputControlsVariant)
local inputSizeModule = require(foundation.Enums.InputSize)
local iconSizeModule = require(foundation.Enums.IconSize)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)

local function computeProps(p0) --[[ line: 23 ]]
	local var9 = if p0.width and p0.horizontalPadding then UDim.new(0, (p0.buttonWidth - p0.horizontalPadding) / 2) else nil
	
	return {
		container = { width = p0.width },
		button = {
			tag = "fill size-full",
			width = p0.buttonWidth,
			padding = if var9 then { left = var9, right = var9 } else nil
		},
		upButton = { tag = p0.upButtonTag },
		downButton = { tag = p0.downButtonTag },
		splitButton = { size = p0.splitButtonSize, tag = p0.splitButtonTag },
		icon = { tag = p0.iconTag }
	}
end

local function variantsFactory(p1) --[[ line: 66 ]]
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

return function(p2, p3, p4) --[[ line: 174 ]]
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), flagsModule (ref), composeStyleVariantModule (ref)
	local numberInput = variantsContextModule.useVariants("NumberInput", variantsFactory, p2)
	
	return if flagsModule.FoundationNumberInputBeta then composeStyleVariantModule(numberInput.common, numberInput.sizes[p3]) else composeStyleVariantModule(numberInput.common, numberInput.sizes[p3], numberInput.controlVariants[p4])
end