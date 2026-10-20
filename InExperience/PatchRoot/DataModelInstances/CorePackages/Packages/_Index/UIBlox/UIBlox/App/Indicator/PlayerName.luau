local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local ReactModule = require(Parent2.React)
local CryoModule = require(Parent2.Cryo)
local FoundationModule = require(Parent2.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local _ = require(Parent.ImageSet.ImagesTypes)
local _ = require(Parent.Style.StyleTypes)
local Label = require(Parent1.Core.ImageSet.ImageSetComponent).Label
local Skeleton = FoundationModule.Skeleton
local UseStyleModule = require(Parent1.Core.Style.useStyle)
local UIBloxConfigModule = require(Parent1.UIBloxConfig)
local OpenTypeSupportModule = require(Parent1.Utility.OpenTypeSupport)
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration

local function _(p1)
	return {
		iconLabelSpacing = p1.Size.Size_50,
		iconSize = p1.Size.Size_400,
		iconColorStyle = p1.Color.Content.Default,
		labelTypography = p1.Typography.CaptionMedium,
		labelColorStyle = p1.Color.Content.Default
	}
end

local _ = function(p1)
	return {
		iconLabelSpacing = p1.Size.Size_50,
		iconSize = p1.Size.Size_400,
		labelTypography = p1.Typography.TitleLarge,
		labelColorStyle = p1.Color.Content.Emphasis
	}
end

local _ = function(p1)
	return {
		iconLabelSpacing = p1.Size.Size_50,
		iconSize = p1.Size.Size_300,
		iconColorStyle = p1.Color.Content.Default,
		labelTypography = p1.Typography.CaptionMedium,
		labelColorStyle = p1.Color.Content.Default
	}
end

local function NameItem(p1)
	-- upvalues: CryoModule (copy), ReactModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), Label (copy), Skeleton (copy), UIBloxConfigModule (copy)
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
			Font = if FoundationFontFaceMigration then nil else LabelTypography.Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(LabelTypography.Font) else nil,
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
			Font = if FoundationFontFaceMigration then nil else LabelTypography.Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(LabelTypography.Font) else nil,
			TextSize = LabelTypography.FontSize,
			TextColor3 = LabelColorStyle.Color3,
			TextTransparency = LabelColorStyle.Transparency,
			OpenTypeFeatures = if UIBloxConfigModule.enableOpenTypeSupport and p1.openTypeFeatures then p1.openTypeFeatures else nil
		})
	})
end

return function(p1)
	-- upvalues: UseStyleModule (copy), ReactModule (copy), NameItem (copy), UIBloxConfigModule (copy), OpenTypeSupportModule (copy)
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
			Padding = UDim.new(0, p1.namesSpacing or UseStyleModuleResult.Tokens.Size.Size_100)
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
				iconLabelSpacing = Tokens.Size.Size_50,
				iconSize = Tokens.Size.Size_400,
				labelTypography = Tokens.Typography.TitleLarge,
				labelColorStyle = Tokens.Color.Content.Emphasis
			}
		})
	else
		Element = nil
	end
	config1.DisplayName = Element
	local Element1 = nil
	
	if UserNameItem then
		local Tokens = UseStyleModuleResult.Tokens
		Element1 = ReactModule.createElement(NameItem, {
			layoutOrder = 2,
			itemProps = UserNameItem,
			openTypeFeatures = if UIBloxConfigModule.enableOpenTypeSupport then OpenTypeSupportModule:getUserNameStylisticAlternative() else nil,
			itemStyleDefaults = {
				iconLabelSpacing = Tokens.Size.Size_50,
				iconSize = Tokens.Size.Size_300,
				iconColorStyle = Tokens.Color.Content.Default,
				labelTypography = Tokens.Typography.CaptionMedium,
				labelColorStyle = Tokens.Color.Content.Default
			}
		})
	else
		Element1 = nil
	end
	config1.UserName = Element1
	local Element2 = nil
	
	if VendorNameItem then
		local Tokens = UseStyleModuleResult.Tokens
		Element2 = ReactModule.createElement(NameItem, {
			layoutOrder = 3,
			itemProps = VendorNameItem,
			itemStyleDefaults = {
				iconLabelSpacing = Tokens.Size.Size_50,
				iconSize = Tokens.Size.Size_400,
				iconColorStyle = Tokens.Color.Content.Default,
				labelTypography = Tokens.Typography.CaptionMedium,
				labelColorStyle = Tokens.Color.Content.Default
			}
		})
	else
		Element2 = nil
	end
	config1.VendorName = Element2
	local Element3 = nil
	
	if AliasItem then
		local Tokens = UseStyleModuleResult.Tokens
		Element3 = ReactModule.createElement(NameItem, {
			layoutOrder = 4,
			itemProps = AliasItem,
			itemStyleDefaults = {
				iconLabelSpacing = Tokens.Size.Size_50,
				iconSize = Tokens.Size.Size_400,
				iconColorStyle = Tokens.Color.Content.Default,
				labelTypography = Tokens.Typography.CaptionMedium,
				labelColorStyle = Tokens.Color.Content.Default
			}
		})
	else
		Element3 = nil
	end
	config1.Alias = Element3
	
	return CreateElementFunction(v1, config, config1)
end