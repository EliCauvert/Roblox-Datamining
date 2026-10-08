local parent = script.Parent.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local reactModule = require(parent_2.React)
local cryoModule = require(parent_2.Cryo)
local foundationModule = require(parent_2.Foundation)
local normalizeFontFace = foundationModule.Utility.normalizeFontFace
local _ = require(parent.ImageSet.ImagesTypes)
local _ = require(parent.Style.StyleTypes)
local label = require(parent_1.Core.ImageSet.ImageSetComponent).Label
local skeleton = foundationModule.Skeleton
local useStyleModule = require(parent_1.Core.Style.useStyle)
local UIBloxConfigModule = require(parent_1.UIBloxConfig)
local openTypeSupportModule = require(parent_1.Utility.OpenTypeSupport)
local foundationFontFaceMigration = foundationModule.Utility.Flags.FoundationFontFaceMigration

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
	-- upvalues: cryoModule (ref), reactModule (ref), foundationFontFaceMigration (ref), normalizeFontFace (ref), label (ref), skeleton (ref), UIBloxConfigModule (ref)
	local createElement_1
	local layoutOrder = p1.layoutOrder
	local isReversed = p1.isReversed
	local itemProps = p1.itemProps
	local itemStyleDefaults = p1.itemStyleDefaults
	local icon = itemProps.icon
	local labelText = itemProps.labelText
	local useTextAsIcon = itemProps.useTextAsIcon
	local onActivated = itemProps.onActivated
	local var1 = if itemProps.isLoading ~= nil then false else itemProps.isLoading
	local var2 = cryoModule.Dictionary.join(itemStyleDefaults, itemProps.styleProps or {})
	local iconLabelSpacing = var2.iconLabelSpacing
	local iconSize = var2.iconSize
	local iconColorStyle = var2.iconColorStyle or {}
	local labelTypography = var2.labelTypography
	local labelColorStyle = var2.labelColorStyle
	local var3 = if var1 or not icon then false else true
	local var4 = if var1 or not onActivated then false else true
	local var5 = if var1 then if icon then math.max(iconSize, labelTypography.FontSize) else labelTypography.FontSize else nil
	local var6 = if var3 then if useTextAsIcon then reactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		Selectable = false,
		LayoutOrder = if isReversed then 2 else 1,
		Size = UDim2.fromOffset(iconSize, iconSize),
		Text = icon,
		TextXAlignment = Enum.TextXAlignment.Center,
		TextYAlignment = Enum.TextYAlignment.Center,
		Font = if foundationFontFaceMigration then nil else labelTypography.Font,
		FontFace = if foundationFontFaceMigration then normalizeFontFace(labelTypography.Font) else nil,
		TextSize = iconSize,
		TextColor3 = iconColorStyle.Color3,
		TextTransparency = if iconColorStyle.Transparency then iconColorStyle.Transparency else 0
	}) else reactModule.createElement(label, {
		BackgroundTransparency = 1,
		Selectable = false,
		LayoutOrder = if isReversed then 2 else 1,
		Size = UDim2.fromOffset(iconSize, iconSize),
		Image = icon,
		ImageColor3 = iconColorStyle.Color3,
		ImageTransparency = if iconColorStyle.Transparency then iconColorStyle.Transparency else 0
	}) else nil
	local createElement = reactModule.createElement
	local var7 = if var4 then "TextButton" else "Frame"
	local t = {
		Text = if var4 then "" else nil,
		AutoButtonColor = if var4 then false else nil,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		LayoutOrder = layoutOrder,
		Selectable = if var4 then true else false,
		[reactModule.Event.Activated] = if var4 then onActivated else nil
	}
	local t_1 = {
		ListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, iconLabelSpacing)
		}),
		Shimmer = if var1 then reactModule.createElement(skeleton, { Size = UDim2.new(1, 0, 0, var5) }) else nil,
		Icon = var6
	}
	
	if var1 then
		createElement_1 = nil
	else
		createElement_1 = reactModule.createElement
		createElement_1 = createElement_1("TextLabel", {
			BackgroundTransparency = 1,
			Selectable = false,
			LayoutOrder = if isReversed then 1 else 2,
			AutomaticSize = Enum.AutomaticSize.XY,
			Size = UDim2.fromScale(0, 0),
			Text = labelText,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			Font = if foundationFontFaceMigration then nil else labelTypography.Font,
			FontFace = if foundationFontFaceMigration then normalizeFontFace(labelTypography.Font) else nil,
			TextSize = labelTypography.FontSize,
			TextColor3 = labelColorStyle.Color3,
			TextTransparency = labelColorStyle.Transparency,
			OpenTypeFeatures = if UIBloxConfigModule.enableOpenTypeSupport and p1.openTypeFeatures then p1.openTypeFeatures else nil
		})
	end
	t_1.Label = createElement_1
	
	return createElement(var7, t, t_1)
end

return function(p1)
	-- upvalues: useStyleModule (ref), reactModule (ref), NameItem (ref), UIBloxConfigModule (ref), openTypeSupportModule (ref)
	local var1
	local var2 = useStyleModule()
	local position = p1.position
	local anchorPoint = p1.anchorPoint
	local size = p1.size
	local automaticSize = p1.automaticSize or Enum.AutomaticSize.Y
	local layoutOrder = p1.layoutOrder
	local namesSpacing = p1.namesSpacing or var2.Tokens.Size.Size_100
	local displayNameItem = p1.displayNameItem
	local userNameItem = p1.userNameItem
	local vendorNameItem = p1.vendorNameItem
	local aliasItem = p1.aliasItem
	local createElement = reactModule.createElement
	local var3 = "Frame"
	local t = {
		BackgroundTransparency = 1,
		Selectable = false,
		Position = position,
		AnchorPoint = anchorPoint,
		Size = size,
		AutomaticSize = automaticSize,
		LayoutOrder = layoutOrder
	}
	local t_1 = {
		ListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, namesSpacing)
		})
	}
	
	if displayNameItem then
		var1 = reactModule.createElement
		local var4 = NameItem
		local t_2 = {
			layoutOrder = 1,
			isReversed = true,
			itemProps = displayNameItem
		}
		local tokens = var2.Tokens
		t_2.itemStyleDefaults = {
			iconLabelSpacing = tokens.Size.Size_50,
			iconSize = tokens.Size.Size_400,
			labelTypography = tokens.Typography.TitleLarge,
			labelColorStyle = tokens.Color.Content.Emphasis
		}
		var1 = var1(var4, t_2)
	else
		var1 = nil
	end
	local createElement_1
	t_1.DisplayName = var1
	
	if userNameItem then
		createElement_1 = reactModule.createElement
		local var5 = NameItem
		local t_2 = {
			layoutOrder = 2,
			itemProps = userNameItem,
			openTypeFeatures = if UIBloxConfigModule.enableOpenTypeSupport then openTypeSupportModule:getUserNameStylisticAlternative() else nil
		}
		local tokens = var2.Tokens
		t_2.itemStyleDefaults = {
			iconLabelSpacing = tokens.Size.Size_50,
			iconSize = tokens.Size.Size_300,
			iconColorStyle = tokens.Color.Content.Default,
			labelTypography = tokens.Typography.CaptionMedium,
			labelColorStyle = tokens.Color.Content.Default
		}
		createElement_1 = createElement_1(var5, t_2)
	else
		createElement_1 = nil
	end
	local createElement_2
	t_1.UserName = createElement_1
	
	if vendorNameItem then
		createElement_2 = reactModule.createElement
		local var6 = NameItem
		local t_2 = { layoutOrder = 3, itemProps = vendorNameItem }
		local tokens = var2.Tokens
		t_2.itemStyleDefaults = {
			iconLabelSpacing = tokens.Size.Size_50,
			iconSize = tokens.Size.Size_400,
			iconColorStyle = tokens.Color.Content.Default,
			labelTypography = tokens.Typography.CaptionMedium,
			labelColorStyle = tokens.Color.Content.Default
		}
		createElement_2 = createElement_2(var6, t_2)
	else
		createElement_2 = nil
	end
	local createElement_3
	t_1.VendorName = createElement_2
	
	if aliasItem then
		createElement_3 = reactModule.createElement
		local var7 = NameItem
		local t_2 = { layoutOrder = 4, itemProps = aliasItem }
		local tokens = var2.Tokens
		t_2.itemStyleDefaults = {
			iconLabelSpacing = tokens.Size.Size_50,
			iconSize = tokens.Size.Size_400,
			iconColorStyle = tokens.Color.Content.Default,
			labelTypography = tokens.Typography.CaptionMedium,
			labelColorStyle = tokens.Color.Content.Default
		}
		createElement_3 = createElement_3(var7, t_2)
	else
		createElement_3 = nil
	end
	t_1.Alias = createElement_3
	
	return createElement(var3, t, t_1)
end