local foundation = script:FindFirstAncestor("Foundation")
local builderIconsModule = require(foundation.Parent.BuilderIcons)
local _ = require(foundation.Components.Types)
local inputSizeModule = require(foundation.Enums.InputSize)
local inputVariantModule = require(foundation.Enums.InputVariant)
local iconSizeModule = require(foundation.Enums.IconSize)
local _ = require(foundation.Enums.Radius)
local flagsModule = require(foundation.Utility.Flags)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local getInputVariantsFactoryModule = require(foundation.Components.InputField.getInputVariantsFactory)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)

local function computeProps(p1)
	return {
		container = {
			minHeight = p1.minContainerHeight,
			horizontalPadding = UDim.new(0, p1.horizontalPadding),
			radius = p1.radius,
			tag = p1.containerTag
		},
		textBox = { fontStyle = p1.typography },
		icon = { size = p1.iconSize },
		clearButton = {
			icon = p1.clearButtonIcon,
			padding = p1.clearButtonPadding
		}
	}
end

local function variantsFactory(p1)
	-- upvalues: inputSizeModule (ref), computeProps (ref), iconSizeModule (ref), builderIconsModule (ref), flagsModule (ref)
	return {
		common = {
			container = {
				tag = "row",
				strokeStyle = p1.Color.Stroke.Emphasis,
				strokeThickness = p1.Stroke.Standard
			},
			textBox = {
				tag = "text-align-x-left text-align-y-center clip content-emphasis gui-object-defaults"
			},
			icon = { style = p1.Color.Content.Muted },
			clearButton = { tag = "auto-xy" }
		},
		sizes = {
			[inputSizeModule.XSmall] = computeProps({
				containerTag = "size-full-600 gap-small",
				radius = p1.Radius.Small,
				horizontalPadding = p1.Padding.XSmall,
				typography = p1.Typography.BodySmall,
				iconSize = iconSizeModule.XSmall,
				minContainerHeight = p1.Size.Size_600,
				clearButtonIcon = builderIconsModule.Icon.XSmall,
				clearButtonPadding = p1.Padding.XSmall
			}),
			[inputSizeModule.Small] = computeProps({
				containerTag = "size-full-800 gap-medium",
				radius = p1.Radius.Medium,
				horizontalPadding = p1.Padding.Small,
				typography = p1.Typography.BodyMedium,
				iconSize = iconSizeModule.XSmall,
				minContainerHeight = p1.Size.Size_800,
				clearButtonIcon = builderIconsModule.Icon.XSmall,
				clearButtonPadding = p1.Size.Size_150
			}),
			[inputSizeModule.Medium] = computeProps({
				containerTag = "size-full-1000 gap-large",
				radius = p1.Radius.Medium,
				horizontalPadding = if flagsModule.FoundationNumberInputBeta then p1.Padding.Medium else p1.Padding.Small,
				typography = p1.Typography.BodyMedium,
				iconSize = iconSizeModule.Small,
				minContainerHeight = p1.Size.Size_1000,
				clearButtonIcon = builderIconsModule.Icon.X,
				clearButtonPadding = p1.Padding.Small
			}),
			[inputSizeModule.Large] = computeProps({
				containerTag = "size-full-1200 gap-large",
				radius = p1.Radius.Medium,
				horizontalPadding = p1.Padding.Medium,
				typography = p1.Typography.BodyLarge,
				iconSize = iconSizeModule.Small,
				minContainerHeight = p1.Size.Size_1200,
				clearButtonIcon = builderIconsModule.Icon.X,
				clearButtonPadding = p1.Padding.Small
			})
		}
	}
end

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), getInputVariantsFactoryModule (ref), inputVariantModule (ref), composeStyleVariantModule (ref)
	local textInput = variantsContextModule.useVariants("TextInput", variantsFactory, p1)
	local inputField = variantsContextModule.useVariants("InputField", getInputVariantsFactoryModule, p1)
	local var1 = inputField.variants[p3 or inputVariantModule.Standard]
	
	return composeStyleVariantModule(textInput.common, inputField.sizes[p2], textInput.sizes[p2], if p3 ~= inputVariantModule.Utility then {} else var1, if p4 then inputField.radius[p4] else inputField.defaultRadius[p2], if p5 ~= nil then {} else inputField.focusedState[p5], if p6 ~= nil then {} else inputField.errorState[p6], if p3 == inputVariantModule.Utility then var1 else {})
end