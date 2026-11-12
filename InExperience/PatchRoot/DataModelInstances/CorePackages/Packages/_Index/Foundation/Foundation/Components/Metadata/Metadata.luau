local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local FlagsModule = require(Foundation.Utility.Flags)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local GetMultiLineTextHeightModule = require(Foundation.Utility.getMultiLineTextHeight)
local UseTextSizeOffsetModule = require(Foundation.Providers.Style.useTextSizeOffset)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local MetadataAccessoryModule = require(script.Parent.MetadataAccessory)
local MetadataItemsModule = require(script.Parent.MetadataItems)
local UseMetadataVariantsModule = require(script.Parent.useMetadataVariants)
local config = {
	maxLines = 1,
	hasSeparator = true,
	testId = "--foundation-metadata",
	size = require(Foundation.Enums.MetadataSize).Medium
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UseTextSizeOffsetModule (copy), UseMetadataVariantsModule (copy), GetMultiLineTextHeightModule (copy), FlagsModule (copy), ReactModule (copy), MetadataItemsModule (copy), TextModule (copy), MetadataAccessoryModule (copy), ViewModule (copy), WithCommonPropsModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local UseTextSizeOffsetModuleResult = UseTextSizeOffsetModule()
	local UseMetadataVariantsModuleResult = UseMetadataVariantsModule(UseTokensModuleResult, WithDefaultsModuleResult.size, not WithDefaultsModuleResult.hasSeparator)
	local FontStyle = UseMetadataVariantsModuleResult.text.fontStyle
	local IsString: boolean = type(WithDefaultsModuleResult.text) == "string" or WithDefaultsModuleResult.text.text ~= nil
	local Items = {}
	
	for _, Text in if IsString then { WithDefaultsModuleResult.text } else WithDefaultsModuleResult.text do
		table.insert(Items, if type(Text) == "string" then { text = Text } else Text)
	end
	local CountItems = #Items
	local ClampedValue = math.clamp(WithDefaultsModuleResult.truncateIndex or CountItems, 1, (math.max(CountItems, 1)))
	local Largest: number = if IsString then math.max(WithDefaultsModuleResult.maxLines, 1) else 1
	local MultiLineTextHeightModule = GetMultiLineTextHeightModule((FontStyle.FontSize or 0) + UseTextSizeOffsetModuleResult, Largest, FontStyle.LineHeight or 1)
	local Elements = {}
	
	if FlagsModule.FoundationMetadataTruncateFallback then
		Elements.Items = ReactModule.createElement(MetadataItemsModule, {
			items = Items,
			trailing = WithDefaultsModuleResult.trailing,
			truncateIndex = ClampedValue,
			maxLines = Largest,
			textHeight = MultiLineTextHeightModule,
			hasSeparator = WithDefaultsModuleResult.hasSeparator,
			size = WithDefaultsModuleResult.size,
			variantProps = UseMetadataVariantsModuleResult,
			testId = WithDefaultsModuleResult.testId
		})
	else
		for ClampedValue1, item in Items do
			if ClampedValue1 > 1 and WithDefaultsModuleResult.hasSeparator then
				Elements[`Separator{ClampedValue1 - 1}`] = ReactModule.createElement(TextModule, {
					Text = "·",
					tag = UseMetadataVariantsModuleResult.text.tag,
					LayoutOrder = ClampedValue1 * 2 - 1,
					testId = `{WithDefaultsModuleResult.testId}--separator-{ClampedValue1 - 1}`
				})
			end
			Elements[`Item{ClampedValue1}`] = ReactModule.createElement(ViewModule, {
				tag = if ClampedValue1 == ClampedValue then UseMetadataVariantsModuleResult.truncatedItem.tag else UseMetadataVariantsModuleResult.item.tag,
				LayoutOrder = ClampedValue1 * 2,
				testId = `{WithDefaultsModuleResult.testId}--item-{ClampedValue1}`
			}, {
				Leading = if item.leading then ReactModule.createElement(MetadataAccessoryModule, {
					LayoutOrder = 1,
					config = item.leading,
					variant = UseMetadataVariantsModuleResult.accessory,
					testId = `{WithDefaultsModuleResult.testId}--item-{ClampedValue1}--leading`
				}) else nil,
				Text = ReactModule.createElement(TextModule, {
					LayoutOrder = 3,
					Text = item.text,
					OpenTypeFeatures = UseMetadataVariantsModuleResult.text.openTypeFeatures,
					tag = if Largest > 1 then UseMetadataVariantsModuleResult.wrappedText.tag elseif ClampedValue1 == ClampedValue then UseMetadataVariantsModuleResult.truncatedText.tag else UseMetadataVariantsModuleResult.text.tag,
					sizeConstraint = if Largest > 1 then { MaxSize = Vector2.new(1e999, MultiLineTextHeightModule) } else nil,
					testId = `{WithDefaultsModuleResult.testId}--text-{ClampedValue1}`
				}),
				Trailing = if ClampedValue1 == CountItems and WithDefaultsModuleResult.trailing then ReactModule.createElement(MetadataAccessoryModule, {
					LayoutOrder = 4,
					config = WithDefaultsModuleResult.trailing,
					variant = UseMetadataVariantsModuleResult.accessory,
					testId = `{WithDefaultsModuleResult.testId}--trailing`
				}) else nil
			})
		end
	end
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = UseMetadataVariantsModuleResult.container.tag,
		ref = Ref
	}), Elements)
end))