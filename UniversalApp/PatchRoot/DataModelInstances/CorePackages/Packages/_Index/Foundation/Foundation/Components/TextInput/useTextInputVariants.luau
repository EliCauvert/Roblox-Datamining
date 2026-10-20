local Foundation = script:FindFirstAncestor("Foundation")
local BuilderIconsModule = require(Foundation.Parent.BuilderIcons)
local _ = require(Foundation.Components.Types)
local InputSizeModule = require(Foundation.Enums.InputSize)
local InputVariantModule = require(Foundation.Enums.InputVariant)
local IconSizeModule = require(Foundation.Enums.IconSize)
local _ = require(Foundation.Enums.Radius)
local FlagsModule = require(Foundation.Utility.Flags)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local GetInputVariantsFactoryModule = require(Foundation.Components.InputField.getInputVariantsFactory)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)

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
	-- upvalues: FlagsModule (copy), InputSizeModule (copy), computeProps (copy), IconSizeModule (copy), BuilderIconsModule (copy)
	return {
		common = {
			container = {
				tag = "row",
				fgStyle = if FlagsModule.FoundationFixColorOnScrubbableNumberInput then p1.Color.Shift.Shift_200 else nil,
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
			[InputSizeModule.XSmall] = computeProps({
				containerTag = "size-full-600 gap-small",
				radius = p1.Radius.Small,
				horizontalPadding = p1.Padding.XSmall,
				typography = p1.Typography.BodySmall,
				iconSize = IconSizeModule.XSmall,
				minContainerHeight = p1.Size.Size_600,
				clearButtonIcon = BuilderIconsModule.Icon.XSmall,
				clearButtonPadding = p1.Padding.XSmall
			}),
			[InputSizeModule.Small] = computeProps({
				containerTag = "size-full-800 gap-medium",
				radius = p1.Radius.Medium,
				horizontalPadding = p1.Padding.Small,
				typography = p1.Typography.BodyMedium,
				iconSize = IconSizeModule.XSmall,
				minContainerHeight = p1.Size.Size_800,
				clearButtonIcon = BuilderIconsModule.Icon.XSmall,
				clearButtonPadding = p1.Size.Size_150
			}),
			[InputSizeModule.Medium] = computeProps({
				containerTag = "size-full-1000 gap-large",
				radius = p1.Radius.Medium,
				horizontalPadding = if FlagsModule.FoundationNumberInputBeta then p1.Padding.Medium else p1.Padding.Small,
				typography = p1.Typography.BodyMedium,
				iconSize = IconSizeModule.Small,
				minContainerHeight = p1.Size.Size_1000,
				clearButtonIcon = BuilderIconsModule.Icon.X,
				clearButtonPadding = p1.Padding.Small
			}),
			[InputSizeModule.Large] = computeProps({
				containerTag = "size-full-1200 gap-large",
				radius = p1.Radius.Medium,
				horizontalPadding = p1.Padding.Medium,
				typography = p1.Typography.BodyLarge,
				iconSize = IconSizeModule.Small,
				minContainerHeight = p1.Size.Size_1200,
				clearButtonIcon = BuilderIconsModule.Icon.X,
				clearButtonPadding = p1.Padding.Small
			})
		}
	}
end

return function(p1, p2, Utility, p3, p4, p5)
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), GetInputVariantsFactoryModule (copy), InputVariantModule (copy), ComposeStyleVariantModule (copy)
	local TextInput = VariantsContextModule.useVariants("TextInput", variantsFactory, p1)
	local InputField = VariantsContextModule.useVariants("InputField", GetInputVariantsFactoryModule, p1)
	local Variant = InputField.variants[Utility or InputVariantModule.Standard]
	
	return ComposeStyleVariantModule(TextInput.common, InputField.sizes[p2], TextInput.sizes[p2], if Utility == InputVariantModule.Utility then {} else Variant, if p3 then InputField.radius[p3] else InputField.defaultRadius[p2], if p4 == nil then {} else InputField.focusedState[p4], if p5 == nil then {} else InputField.errorState[p5], if Utility == InputVariantModule.Utility then Variant else {})
end