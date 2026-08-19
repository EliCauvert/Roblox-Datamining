local parent = script.Parent.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local reactModule = require(parent_2.React)
local cryoModule = require(parent_2.Cryo)
local foundationModule = require(parent_2.Foundation)
local _ = require(parent.ImageSet.ImagesTypes)
local _ = require(parent.Style.StyleTypes)
local label = require(parent_1.Core.ImageSet.ImageSetComponent).Label
local skeleton = foundationModule.Skeleton
local useStyleModule = require(parent_1.Core.Style.useStyle)
local UIBloxConfigModule = require(parent_1.UIBloxConfig)
local openTypeSupportModule = require(parent_1.Utility.OpenTypeSupport)

local function getStyleDefaults(p0) --[[ line: 81 ]]
	-- upvalues: UIBloxConfigModule (ref)
	return {
		iconLabelSpacing = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p0.Size.Size_50 else p0.Global.Space_25,
		iconSize = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p0.Size.Size_400 else p0.Semantic.Icon.Size.Small,
		iconColorStyle = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p0.Color.Content.Default else p0.Semantic.Color.Icon.Default,
		labelTypography = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p0.Typography.CaptionMedium else p0.Semantic.Typography.CaptionHeader,
		labelColorStyle = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p0.Color.Content.Default else p0.Semantic.Color.Text.Default
	}
end

local function getDisplayNameStyleDefaults(p1) --[[ line: 101 ]]
	-- upvalues: UIBloxConfigModule (ref)
	return {
		iconLabelSpacing = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Size.Size_50 else p1.Global.Space_25,
		iconSize = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Size.Size_400 else p1.Semantic.Icon.Size.Small,
		labelTypography = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Typography.TitleLarge else p1.Semantic.Typography.Subheader,
		labelColorStyle = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Color.Content.Emphasis else p1.Semantic.Color.Text.Emphasis
	}
end

local function getUserNameStyleDefaults(p2) --[[ line: 118 ]]
	-- upvalues: UIBloxConfigModule (ref)
	return {
		iconLabelSpacing = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p2.Size.Size_50 else p2.Global.Space_25,
		iconSize = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p2.Size.Size_300 else p2.Global.Size_150,
		iconColorStyle = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p2.Color.Content.Default else p2.Semantic.Color.Icon.Default,
		labelTypography = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p2.Typography.CaptionMedium else p2.Semantic.Typography.CaptionHeader,
		labelColorStyle = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p2.Color.Content.Default else p2.Semantic.Color.Text.Default
	}
end

local function NameItem(p3) --[[ line: 138 ]]
	-- upvalues: cryoModule (ref), reactModule (ref), label (ref), skeleton (ref), UIBloxConfigModule (ref)
	local createElement_1
	local layoutOrder = p3.layoutOrder
	local isReversed = p3.isReversed
	local itemProps = p3.itemProps
	local itemStyleDefaults = p3.itemStyleDefaults
	local icon = itemProps.icon
	local labelText = itemProps.labelText
	local useTextAsIcon = itemProps.useTextAsIcon
	local onActivated = itemProps.onActivated
	local var10 = if itemProps.isLoading ~= nil then false else itemProps.isLoading
	local var11 = cryoModule.Dictionary.join(itemStyleDefaults, itemProps.styleProps or {})
	local iconLabelSpacing = var11.iconLabelSpacing
	local iconSize = var11.iconSize
	local iconColorStyle = var11.iconColorStyle or {}
	local labelTypography = var11.labelTypography
	local labelColorStyle = var11.labelColorStyle
	local var13 = if var10 or not icon then false else true
	local var14 = if var10 or not onActivated then false else true
	local var15 = if var10 then if icon then math.max(iconSize, labelTypography.FontSize) else labelTypography.FontSize else nil
	local var16 = if var13 then if useTextAsIcon then reactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		Selectable = false,
		LayoutOrder = if isReversed then 2 else 1,
		Size = UDim2.fromOffset(iconSize, iconSize),
		Text = icon,
		TextXAlignment = Enum.TextXAlignment.Center,
		TextYAlignment = Enum.TextYAlignment.Center,
		Font = labelTypography.Font,
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
	local var17 = if var14 then "TextButton" else "Frame"
	local t = {
		Text = if var14 then "" else nil,
		AutoButtonColor = if var14 then false else nil,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		LayoutOrder = layoutOrder,
		Selectable = if var14 then true else false,
		[reactModule.Event.Activated] = if var14 then onActivated else nil
	}
	local t_1 = {
		ListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, iconLabelSpacing)
		}),
		Shimmer = if var10 then reactModule.createElement(skeleton, { Size = UDim2.new(1, 0, 0, var15) }) else nil,
		Icon = var16
	}
	
	if var10 then
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
			Font = labelTypography.Font,
			TextSize = labelTypography.FontSize,
			TextColor3 = labelColorStyle.Color3,
			TextTransparency = labelColorStyle.Transparency,
			OpenTypeFeatures = if UIBloxConfigModule.enableOpenTypeSupport and p3.openTypeFeatures then p3.openTypeFeatures else nil
		})
	end
	t_1.Label = createElement_1
	
	return createElement(var17, t, t_1)
end

return function(p4) --[[ line: 243 | named "PlayerName" ]]
	-- upvalues: useStyleModule (ref), UIBloxConfigModule (ref), reactModule (ref), NameItem (ref), getDisplayNameStyleDefaults (ref), openTypeSupportModule (ref), getUserNameStyleDefaults (ref), getStyleDefaults (ref)
	local var20 = useStyleModule()
	local position = p4.position
	local anchorPoint = p4.anchorPoint
	local size = p4.size
	local automaticSize = p4.automaticSize or Enum.AutomaticSize.Y
	local layoutOrder = p4.layoutOrder
	local namesSpacing = p4.namesSpacing or (if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var20.Tokens.Size.Size_100 else var20.Tokens.Global.Space_50)
	local displayNameItem = p4.displayNameItem
	local userNameItem = p4.userNameItem
	local vendorNameItem = p4.vendorNameItem
	local aliasItem = p4.aliasItem
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Selectable = false,
		Position = position,
		AnchorPoint = anchorPoint,
		Size = size,
		AutomaticSize = automaticSize,
		LayoutOrder = layoutOrder
	}, {
		ListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, namesSpacing)
		}),
		DisplayName = if displayNameItem then reactModule.createElement(NameItem, {
			layoutOrder = 1,
			isReversed = true,
			itemProps = displayNameItem,
			itemStyleDefaults = getDisplayNameStyleDefaults(var20.Tokens)
		}) else nil,
		UserName = if userNameItem then reactModule.createElement(NameItem, {
			layoutOrder = 2,
			itemProps = userNameItem,
			openTypeFeatures = if UIBloxConfigModule.enableOpenTypeSupport then openTypeSupportModule:getUserNameStylisticAlternative() else nil,
			itemStyleDefaults = getUserNameStyleDefaults(var20.Tokens)
		}) else nil,
		VendorName = if vendorNameItem then reactModule.createElement(NameItem, {
			layoutOrder = 3,
			itemProps = vendorNameItem,
			itemStyleDefaults = getStyleDefaults(var20.Tokens)
		}) else nil,
		Alias = if aliasItem then reactModule.createElement(NameItem, {
			layoutOrder = 4,
			itemProps = aliasItem,
			itemStyleDefaults = getStyleDefaults(var20.Tokens)
		}) else nil
	})
end