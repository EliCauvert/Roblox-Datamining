local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local ReactModule = require(Parent2.React)
local CryoModule = require(Parent2.Cryo)
local _ = require(Parent.ImageSet.ImagesTypes)
local _ = require(Parent.Style.StyleTypes)
local Label = require(Parent1.Core.ImageSet.ImageSetComponent).Label
local Skeleton = require(Parent2.Foundation).Skeleton
local UseStyleModule = require(Parent1.Core.Style.useStyle)
local UIBloxConfigModule = require(Parent1.UIBloxConfig)
local OpenTypeSupportModule = require(Parent1.Utility.OpenTypeSupport)

local function getStyleDefaults(Tokens)
	return {
		iconLabelSpacing = Tokens.Global.Space_25,
		iconSize = Tokens.Semantic.Icon.Size.Small,
		iconColorStyle = Tokens.Semantic.Color.Icon.Default,
		labelTypography = Tokens.Semantic.Typography.CaptionHeader,
		labelColorStyle = Tokens.Semantic.Color.Text.Default
	}
end

local function _(p1)
	return {
		iconLabelSpacing = p1.Global.Space_25,
		iconSize = p1.Semantic.Icon.Size.Small,
		labelTypography = p1.Semantic.Typography.Subheader,
		labelColorStyle = p1.Semantic.Color.Text.Emphasis
	}
end

local function getUserNameStyleDefaults(Tokens)
	return {
		iconLabelSpacing = Tokens.Global.Space_25,
		iconSize = Tokens.Global.Size_150,
		iconColorStyle = Tokens.Semantic.Color.Icon.Default,
		labelTypography = Tokens.Semantic.Typography.CaptionHeader,
		labelColorStyle = Tokens.Semantic.Color.Text.Default
	}
end

local function NameItem(p1)
	-- upvalues: CryoModule (copy), ReactModule (copy), Label (copy), Skeleton (copy), UIBloxConfigModule (copy)
	local IsReversed = p1.isReversed
	local ItemProps = p1.itemProps
	local Icon = ItemProps.icon
	local LabelText = ItemProps.labelText
	local UseTextAsIcon = ItemProps.useTextAsIcon
	local OnActivated = ItemProps.onActivated
	local IsLoading = ItemProps.isLoading ~= nil and ItemProps.isLoading
	local JoinResult = CryoModule.Dictionary.join(p1.itemStyleDefaults, ItemProps.styleProps or {})
	local IconSize: number = JoinResult.iconSize
	local IconColorStyle = JoinResult.iconColorStyle or {}
	local LabelTypography = JoinResult.labelTypography
	local LabelColorStyle = JoinResult.labelColorStyle
	local Icon1 = not IsLoading and Icon
	local OnActivated1 = not IsLoading and OnActivated
	local Largest = if IsLoading then if Icon then math.max(IconSize, LabelTypography.FontSize) else LabelTypography.FontSize else nil
	
	return ReactModule.createElement(if OnActivated1 then "TextButton" else "Frame", {
		Text = if OnActivated1 then "" else nil,
		AutoButtonColor = not OnActivated1 and nil,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		Selectable = if OnActivated1 then true else false,
		[ReactModule.Event.Activated] = if OnActivated1 then OnActivated else nil
	}, {
		ListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, JoinResult.iconLabelSpacing)
		}),
		Shimmer = if IsLoading then ReactModule.createElement(Skeleton, { Size = UDim2.new(1, 0, 0, Largest) }) else nil,
		Icon = if Icon1 then if UseTextAsIcon then ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Selectable = false,
			LayoutOrder = if IsReversed then 2 else 1,
			Size = UDim2.fromOffset(IconSize, IconSize),
			Text = Icon,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			Font = LabelTypography.Font,
			TextSize = IconSize,
			TextColor3 = IconColorStyle.Color3,
			TextTransparency = if IconColorStyle.Transparency then IconColorStyle.Transparency else 0
		}) else ReactModule.createElement(Label, {
			BackgroundTransparency = 1,
			Selectable = false,
			LayoutOrder = if IsReversed then 2 else 1,
			Size = UDim2.fromOffset(IconSize, IconSize),
			Image = Icon,
			ImageColor3 = IconColorStyle.Color3,
			ImageTransparency = if IconColorStyle.Transparency then IconColorStyle.Transparency else 0
		}) else nil,
		Label = if IsLoading then nil else ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Selectable = false,
			LayoutOrder = if IsReversed then 1 else 2,
			AutomaticSize = Enum.AutomaticSize.XY,
			Size = UDim2.fromScale(0, 0),
			Text = LabelText,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			Font = LabelTypography.Font,
			TextSize = LabelTypography.FontSize,
			TextColor3 = LabelColorStyle.Color3,
			TextTransparency = LabelColorStyle.Transparency,
			OpenTypeFeatures = if UIBloxConfigModule.enableOpenTypeSupport and p1.openTypeFeatures then p1.openTypeFeatures else nil
		})
	})
end

return function(p1)
	-- upvalues: UseStyleModule (copy), ReactModule (copy), NameItem (copy), UIBloxConfigModule (copy), OpenTypeSupportModule (copy), getUserNameStyleDefaults (copy), getStyleDefaults (copy)
	local UseStyleModuleResult = UseStyleModule()
	local DisplayNameItem = p1.displayNameItem
	local UserNameItem = p1.userNameItem
	local VendorNameItem = p1.vendorNameItem
	local AliasItem = p1.aliasItem
	local CreateElementFunction = ReactModule.createElement
	local v1 = "Frame"
	local config = {
		BackgroundTransparency = 1,
		Selectable = false,
		Position = p1.position,
		AnchorPoint = p1.anchorPoint,
		Size = p1.size,
		AutomaticSize = p1.automaticSize or Enum.AutomaticSize.Y,
		LayoutOrder = p1.layoutOrder
	}
	local config1 = {
		ListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, p1.namesSpacing or UseStyleModuleResult.Tokens.Global.Space_50)
		})
	}
	local Element = nil
	
	if DisplayNameItem then
		local Tokens = UseStyleModuleResult.Tokens
		Element = ReactModule.createElement(NameItem, {
			layoutOrder = 1,
			isReversed = true,
			itemProps = DisplayNameItem,
			itemStyleDefaults = {
				iconLabelSpacing = Tokens.Global.Space_25,
				iconSize = Tokens.Semantic.Icon.Size.Small,
				labelTypography = Tokens.Semantic.Typography.Subheader,
				labelColorStyle = Tokens.Semantic.Color.Text.Emphasis
			}
		})
	else
		Element = nil
	end
	config1.DisplayName = Element
	config1.UserName = if UserNameItem then ReactModule.createElement(NameItem, {
		layoutOrder = 2,
		itemProps = UserNameItem,
		openTypeFeatures = if UIBloxConfigModule.enableOpenTypeSupport then OpenTypeSupportModule:getUserNameStylisticAlternative() else nil,
		itemStyleDefaults = getUserNameStyleDefaults(UseStyleModuleResult.Tokens)
	}) else nil
	config1.VendorName = if VendorNameItem then ReactModule.createElement(NameItem, {
		layoutOrder = 3,
		itemProps = VendorNameItem,
		itemStyleDefaults = getStyleDefaults(UseStyleModuleResult.Tokens)
	}) else nil
	config1.Alias = if AliasItem then ReactModule.createElement(NameItem, {
		layoutOrder = 4,
		itemProps = AliasItem,
		itemStyleDefaults = getStyleDefaults(UseStyleModuleResult.Tokens)
	}) else nil
	
	return CreateElementFunction(v1, config, config1)
end