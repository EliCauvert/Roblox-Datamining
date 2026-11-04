local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local AccessoryTypeModule = require(Foundation.Enums.AccessoryType)
local AvatarIconModule = require(Foundation.Components.AvatarIcon)
local IconModule = require(Foundation.Components.Icon)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local GetMultiLineTextHeightModule = require(Foundation.Utility.getMultiLineTextHeight)
local UseTextSizeOffsetModule = require(Foundation.Providers.Style.useTextSizeOffset)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local UseMetadataVariantsModule = require(script.Parent.useMetadataVariants)
local config = {
	maxLines = 1,
	hasSeparator = true,
	testId = "--foundation-metadata",
	size = require(Foundation.Enums.MetadataSize).Medium
}

local function MetadataAccessoryElement(Frame: Frame)
	-- upvalues: AccessoryTypeModule (copy), ReactModule (copy), ViewModule (copy), AvatarIconModule (copy), IconModule (copy)
	local Variant = Frame.variant
	local Config = if type(Frame.config) == "string" then { iconName = Frame.config } else Frame.config
	
	return if Config.type == AccessoryTypeModule.Avatar then ReactModule.createElement(ViewModule, { tag = Variant.avatarTag, LayoutOrder = Frame.LayoutOrder }, {
		Avatar = ReactModule.createElement(AvatarIconModule, {
			userId = Config.userId,
			size = Variant.avatarSize,
			testId = Frame.testId
		})
	}) else ReactModule.createElement(IconModule, {
		name = Config.iconName,
		variant = Config.iconVariant,
		size = Variant.iconSize,
		style = Variant.style,
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId
	})
end

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UseTextSizeOffsetModule (copy), UseMetadataVariantsModule (copy), GetMultiLineTextHeightModule (copy), ReactModule (copy), TextModule (copy), MetadataAccessoryElement (copy), ViewModule (copy), WithCommonPropsModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local UseTextSizeOffsetModuleResult = UseTextSizeOffsetModule()
	local UseMetadataVariantsModuleResult = UseMetadataVariantsModule(UseTokensModuleResult, WithDefaultsModuleResult.size, not WithDefaultsModuleResult.hasSeparator)
	local FontStyle = UseMetadataVariantsModuleResult.text.fontStyle
	local IsString: boolean = type(WithDefaultsModuleResult.text) == "string" or WithDefaultsModuleResult.text.text ~= nil
	local List = {}
	
	for _, Text in if IsString then { WithDefaultsModuleResult.text } else WithDefaultsModuleResult.text do
		table.insert(List, if type(Text) == "string" then { text = Text } else Text)
	end
	local CountList = #List
	local ClampedValue = math.clamp(WithDefaultsModuleResult.truncateIndex or CountList, 1, (math.max(CountList, 1)))
	local Largest: number = if IsString then math.max(WithDefaultsModuleResult.maxLines, 1) else 1
	local MultiLineTextHeightModule = GetMultiLineTextHeightModule((FontStyle.FontSize or 0) + UseTextSizeOffsetModuleResult, Largest, FontStyle.LineHeight or 1)
	local Elements = {}
	
	for ClampedValue1, value in List do
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
			Leading = if value.leading then ReactModule.createElement(MetadataAccessoryElement, {
				LayoutOrder = 1,
				config = value.leading,
				variant = UseMetadataVariantsModuleResult.accessory,
				testId = `{WithDefaultsModuleResult.testId}--item-{ClampedValue1}--leading`
			}) else nil,
			Text = ReactModule.createElement(TextModule, {
				LayoutOrder = 3,
				Text = value.text,
				OpenTypeFeatures = UseMetadataVariantsModuleResult.text.openTypeFeatures,
				tag = if Largest > 1 then UseMetadataVariantsModuleResult.wrappedText.tag elseif ClampedValue1 == ClampedValue then UseMetadataVariantsModuleResult.truncatedText.tag else UseMetadataVariantsModuleResult.text.tag,
				sizeConstraint = if Largest > 1 then { MaxSize = Vector2.new(1e999, MultiLineTextHeightModule) } else nil,
				testId = `{WithDefaultsModuleResult.testId}--text-{ClampedValue1}`
			}),
			Trailing = if ClampedValue1 == CountList and WithDefaultsModuleResult.trailing then ReactModule.createElement(MetadataAccessoryElement, {
				LayoutOrder = 4,
				config = WithDefaultsModuleResult.trailing,
				variant = UseMetadataVariantsModuleResult.accessory,
				testId = `{WithDefaultsModuleResult.testId}--trailing`
			}) else nil
		})
	end
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = UseMetadataVariantsModuleResult.container.tag,
		ref = Ref
	}), Elements)
end))