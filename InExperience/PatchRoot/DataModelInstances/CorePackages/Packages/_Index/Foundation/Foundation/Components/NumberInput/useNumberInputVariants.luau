local foundation = script:FindFirstAncestor("Foundation")
local numberInputControlsVariantModule = require(foundation.Enums.NumberInputControlsVariant)
local inputSizeModule = require(foundation.Enums.InputSize)
local _ = require(foundation.Enums.InputVariant)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)

local function computeProps(p0) --[[ line: 22 ]]
	local var7 = if p0.width and p0.horizontalPadding then UDim.new(0, (p0.buttonWidth - p0.horizontalPadding) / 2) else nil
	
	return {
		container = { width = p0.width },
		button = {
			tag = "fill size-full",
			width = p0.buttonWidth,
			padding = if var7 then { left = var7, right = var7 } else nil
		},
		upButton = { tag = p0.upButtonTag },
		downButton = { tag = p0.downButtonTag },
		splitButton = { size = p0.splitButtonSize, tag = p0.splitButtonTag },
		icon = { tag = p0.iconTag }
	}
end

local function variantsFactory(p1) --[[ line: 65 ]]
	-- upvalues: inputSizeModule (ref), computeProps (ref), numberInputControlsVariantModule (ref)
	return {
		common = {
			upButton = { tag = "fill size-full padding-bottom-xsmall" },
			downButton = { tag = "fill size-full padding-top-xsmall" },
			icon = { tag = "content-default" }
		},
		sizes = {
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
		controlVariants = {
			[numberInputControlsVariantModule.Stacked] = computeProps({ iconTag = "size-150-100" })
		}
	}
end

return function(p2, p3, p4) --[[ line: 126 ]]
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref)
	local numberInput = variantsContextModule.useVariants("NumberInput", variantsFactory, p2)
	
	return composeStyleVariantModule(numberInput.common, numberInput.sizes[p3], numberInput.controlVariants[p4])
end