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
	return {
		iconLabelSpacing = p0.Global.Space_25,
		iconSize = p0.Semantic.Icon.Size.Small,
		iconColorStyle = p0.Semantic.Color.Icon.Default,
		labelTypography = p0.Semantic.Typography.CaptionHeader,
		labelColorStyle = p0.Semantic.Color.Text.Default
	}
end

local function _(p1) --[[ line: 91 | named "getDisplayNameStyleDefaults" ]]
	return {
		iconLabelSpacing = p1.Global.Space_25,
		iconSize = p1.Semantic.Icon.Size.Small,
		labelTypography = p1.Semantic.Typography.Subheader,
		labelColorStyle = p1.Semantic.Color.Text.Emphasis
	}
end

local function getUserNameStyleDefaults(p2) --[[ line: 100 ]]
	return {
		iconLabelSpacing = p2.Global.Space_25,
		iconSize = p2.Global.Size_150,
		iconColorStyle = p2.Semantic.Color.Icon.Default,
		labelTypography = p2.Semantic.Typography.CaptionHeader,
		labelColorStyle = p2.Semantic.Color.Text.Default
	}
end

local function NameItem(p3) --[[ line: 110 ]]
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
	local var9 = if itemProps.isLoading ~= nil then false else itemProps.isLoading
	local var10 = cryoModule.Dictionary.join(itemStyleDefaults, itemProps.styleProps or {})
	local iconLabelSpacing = var10.iconLabelSpacing
	local iconSize = var10.iconSize
	local iconColorStyle = var10.iconColorStyle or {}
	local labelTypography = var10.labelTypography
	local labelColorStyle = var10.labelColorStyle
	local var12 = if var9 or not icon then false else true
	local var13 = if var9 or not onActivated then false else true
	local var14 = if var9 then if icon then math.max(iconSize, labelTypography.FontSize) else labelTypography.FontSize else nil
	local var15 = if var12 then if useTextAsIcon then reactModule.createElement("TextLabel", {
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
	local var16 = if var13 then "TextButton" else "Frame"
	local t = {
		Text = if var13 then "" else nil,
		AutoButtonColor = if var13 then false else nil,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		LayoutOrder = layoutOrder,
		Selectable = if var13 then true else false,
		[reactModule.Event.Activated] = if var13 then onActivated else nil
	}
	local t_1 = {
		ListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, iconLabelSpacing)
		}),
		Shimmer = if var9 then reactModule.createElement(skeleton, { Size = UDim2.new(1, 0, 0, var14) }) else nil,
		Icon = var15
	}
	
	if var9 then
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
	
	return createElement(var16, t, t_1)
end

return function(p4) --[[ line: 215 | named "PlayerName" ]]
	-- upvalues: useStyleModule (ref), reactModule (ref), NameItem (ref), UIBloxConfigModule (ref), openTypeSupportModule (ref), getUserNameStyleDefaults (ref), getStyleDefaults (ref)
	local var25
	local var19 = useStyleModule()
	local position = p4.position
	local anchorPoint = p4.anchorPoint
	local size = p4.size
	local automaticSize = p4.automaticSize or Enum.AutomaticSize.Y
	local layoutOrder = p4.layoutOrder
	local namesSpacing = p4.namesSpacing or var19.Tokens.Global.Space_50
	local displayNameItem = p4.displayNameItem
	local userNameItem = p4.userNameItem
	local vendorNameItem = p4.vendorNameItem
	local aliasItem = p4.aliasItem
	local createElement = reactModule.createElement
	local var22 = "Frame"
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
		var25 = reactModule.createElement
		local var26 = NameItem
		local t_2 = {
			layoutOrder = 1,
			isReversed = true,
			itemProps = displayNameItem
		}
		local tokens = var19.Tokens
		t_2.itemStyleDefaults = {
			iconLabelSpacing = tokens.Global.Space_25,
			iconSize = tokens.Semantic.Icon.Size.Small,
			labelTypography = tokens.Semantic.Typography.Subheader,
			labelColorStyle = tokens.Semantic.Color.Text.Emphasis
		}
		var25 = var25(var26, t_2)
	else
		var25 = nil
	end
	t_1.DisplayName = var25
	t_1.UserName = if userNameItem then reactModule.createElement(NameItem, {
		layoutOrder = 2,
		itemProps = userNameItem,
		openTypeFeatures = if UIBloxConfigModule.enableOpenTypeSupport then openTypeSupportModule:getUserNameStylisticAlternative() else nil,
		itemStyleDefaults = getUserNameStyleDefaults(var19.Tokens)
	}) else nil
	t_1.VendorName = if vendorNameItem then reactModule.createElement(NameItem, {
		layoutOrder = 3,
		itemProps = vendorNameItem,
		itemStyleDefaults = getStyleDefaults(var19.Tokens)
	}) else nil
	t_1.Alias = if aliasItem then reactModule.createElement(NameItem, {
		layoutOrder = 4,
		itemProps = aliasItem,
		itemStyleDefaults = getStyleDefaults(var19.Tokens)
	}) else nil
	
	return createElement(var22, t, t_1)
end