local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local AccessoryTypeModule = require(Foundation.Enums.AccessoryType)
local AvatarIconModule = require(Foundation.Components.AvatarIcon)
local AvatarIconSizeModule = require(Foundation.Enums.AvatarIconSize)
local IconModule = require(Foundation.Components.Icon)
local IconSizeModule = require(Foundation.Enums.IconSize)
local SkeletonModule = require(Foundation.Components.Skeleton)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local GetMultiLineTextHeightModule = require(Foundation.Utility.getMultiLineTextHeight)
local UseTextSizeModule = require(Foundation.Utility.useTextSize)
local UseTextSizeOffsetModule = require(Foundation.Providers.Style.useTextSizeOffset)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local config = {
	maxLines = 1,
	isLoading = false,
	hasSeparator = true,
	testId = "--foundation-metadata"
}

local function MetadataAccessoryElement(Frame: Frame)
	-- upvalues: UseTokensModule (copy), AccessoryTypeModule (copy), ReactModule (copy), ViewModule (copy), AvatarIconModule (copy), AvatarIconSizeModule (copy), IconModule (copy), IconSizeModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local Config = if type(Frame.config) == "string" then { iconName = Frame.config } else Frame.config
	
	return if Config.type == AccessoryTypeModule.Avatar then ReactModule.createElement(ViewModule, {
		tag = "auto-xy padding-right-xxsmall",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Avatar = ReactModule.createElement(AvatarIconModule, {
			userId = Config.userId,
			size = AvatarIconSizeModule.Small,
			testId = Frame.testId
		})
	}) else ReactModule.createElement(IconModule, {
		name = Config.iconName,
		variant = Config.iconVariant,
		size = IconSizeModule.Small,
		style = UseTokensModuleResult.Color.Content.Default,
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId
	})
end

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UseTextSizeOffsetModule (copy), GetMultiLineTextHeightModule (copy), UseTextSizeModule (copy), ReactModule (copy), MetadataAccessoryElement (copy), ViewModule (copy), SkeletonModule (copy), TextModule (copy), WithCommonPropsModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local UseTextSizeOffsetModuleResult = UseTextSizeOffsetModule()
	local IsString: boolean = type(WithDefaultsModuleResult.text) == "string" or WithDefaultsModuleResult.text.text ~= nil
	local List = {}
	
	for _, Text in if IsString then { WithDefaultsModuleResult.text } else WithDefaultsModuleResult.text do
		table.insert(List, if type(Text) == "string" then { text = Text } else Text)
	end
	local CountList = #List
	local ClampedValue = math.clamp(WithDefaultsModuleResult.truncateIndex or CountList, 1, (math.max(CountList, 1)))
	local Largest: number = if IsString then math.max(WithDefaultsModuleResult.maxLines, 1) else 1
	local MultiLineTextHeightModule = GetMultiLineTextHeightModule(UseTokensModuleResult.Typography.BodyMedium.FontSize + UseTextSizeOffsetModuleResult, Largest, UseTokensModuleResult.Typography.BodyMedium.LineHeight)
	local Joined: string? = nil
	
	if WithDefaultsModuleResult.isLoading then
		local List1 = {}
		
		for _, value in List do
			table.insert(List1, value.text)
		end
		Joined = table.concat(List1, " · ")
	end
	local UseTextSizeModuleResult = UseTextSizeModule(if Joined == "" then nil else Joined, UseTokensModuleResult.Typography.BodyMedium)
	local Ceiled = if UseTextSizeModuleResult and UseTextSizeModuleResult.X > 0 then math.ceil(UseTextSizeModuleResult.X) else UseTokensModuleResult.Size.Size_2000
	local Elements = {}
	
	if WithDefaultsModuleResult.isLoading then
		local Leading = if List[1] then List[1].leading else nil
		Elements.Leading = if Leading then ReactModule.createElement(MetadataAccessoryElement, {
			LayoutOrder = 1,
			config = Leading,
			testId = `{WithDefaultsModuleResult.testId}--item-1--leading`
		}) else nil
		Elements.Skeleton = ReactModule.createElement(ViewModule, { tag = "shrink auto-xy clip", LayoutOrder = 2 }, {
			Skeleton = ReactModule.createElement(SkeletonModule, {
				Size = UDim2.fromOffset(Ceiled, MultiLineTextHeightModule),
				testId = `{WithDefaultsModuleResult.testId}--skeleton`
			})
		})
		Elements.Trailing = if WithDefaultsModuleResult.trailing then ReactModule.createElement(MetadataAccessoryElement, {
			LayoutOrder = 3,
			config = WithDefaultsModuleResult.trailing,
			testId = `{WithDefaultsModuleResult.testId}--trailing`
		}) else nil
	else
		for ClampedValue1, value1 in List do
			if ClampedValue1 > 1 and WithDefaultsModuleResult.hasSeparator then
				Elements[`Separator{ClampedValue1 - 1}`] = ReactModule.createElement(TextModule, {
					Text = "·",
					tag = "auto-xy text-body-medium content-default",
					LayoutOrder = ClampedValue1 * 2 - 1,
					testId = `{WithDefaultsModuleResult.testId}--separator-{ClampedValue1 - 1}`
				})
			end
			Elements[`Item{ClampedValue1}`] = ReactModule.createElement(ViewModule, {
				tag = if ClampedValue1 == ClampedValue then "row align-y-center shrink gap-xsmall auto-xy" else "row align-y-center gap-xsmall auto-xy",
				LayoutOrder = ClampedValue1 * 2,
				testId = `{WithDefaultsModuleResult.testId}--item-{ClampedValue1}`
			}, {
				Leading = if value1.leading then ReactModule.createElement(MetadataAccessoryElement, {
					LayoutOrder = 1,
					config = value1.leading,
					testId = `{WithDefaultsModuleResult.testId}--item-{ClampedValue1}--leading`
				}) else nil,
				Text = ReactModule.createElement(TextModule, {
					LayoutOrder = 3,
					Text = value1.text,
					tag = if Largest > 1 then "shrink auto-xy text-body-medium text-wrap text-truncate-split text-align-x-left text-align-y-top content-default" elseif ClampedValue1 == ClampedValue then "shrink auto-xy text-body-medium text-truncate-split content-default" else "auto-xy text-body-medium content-default",
					sizeConstraint = if Largest > 1 then { MaxSize = Vector2.new(1e999, MultiLineTextHeightModule) } else nil,
					testId = `{WithDefaultsModuleResult.testId}--text-{ClampedValue1}`
				}),
				Trailing = if ClampedValue1 == CountList and WithDefaultsModuleResult.trailing then ReactModule.createElement(MetadataAccessoryElement, {
					LayoutOrder = 4,
					config = WithDefaultsModuleResult.trailing,
					testId = `{WithDefaultsModuleResult.testId}--trailing`
				}) else nil
			})
		end
	end
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = if WithDefaultsModuleResult.hasSeparator or WithDefaultsModuleResult.isLoading then "row align-y-center gap-xsmall auto-xy" else "row align-y-center gap-small auto-xy",
		ref = Ref
	}), Elements)
end))