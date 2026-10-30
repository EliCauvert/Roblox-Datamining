local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local ReactModule = require(Parent.React)
local CombineReactTagsFunction = require(Parent.RoactUtils).combineReactTags
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local ResponsiveModule = require(Parent.Responsive)
local TooltipOrientation = require(Parent.UIBlox).App.Dialog.Enum.TooltipOrientation
local IconWithTooltip = require(Parent.AppBlox).IconWithTooltip
local SduiTextIconRowModule = require(ServerDrivenUi.Content.SduiTextIconRow)
local Images = require(Parent.FoundationImages).Images
local GetImageDataFunction = require(Parent.RobloxAppAssets).GetImageData
local FFlagLuaAppEnableSduiHomePage = require(Parent.SharedFlags).FFlagLuaAppEnableSduiHomePage
local AddLayoutOrderToSduiSectionHeaderIconComponent = game:DefineFastFlag("AddLayoutOrderToSduiSectionHeaderIconComponent", false)
local LuaAppSduiSeeAllArrowIconMigration2 = game:DefineFastFlag("LuaAppSduiSeeAllArrowIconMigration2", false)

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), ResponsiveModule (copy), LuaAppSduiSeeAllArrowIconMigration2 (copy), GetImageDataFunction (copy), Images (copy), AddLayoutOrderToSduiSectionHeaderIconComponent (copy), ReactModule (copy), View (copy), FFlagLuaAppEnableSduiHomePage (copy), CombineReactTagsFunction (copy), SduiTextIconRowModule (copy), IconWithTooltip (copy), TooltipOrientation (copy)
	local LayoutOrder = p1.layoutOrder
	local AnchorPoint = p1.anchorPoint
	local AutomaticSize = p1.automaticSize
	local Size = p1.size
	local ZIndex = p1.zIndex
	local Position = p1.position
	local UseTokensResult = UseTokensFunction()
	local TitleFontStyle = p1.titleFontStyle or UseTokensResult.Typography.HeadingSmall
	local TitleColor = p1.titleColor or UseTokensResult.Color.Content.Emphasis
	local SubtitleFontStyle = p1.subtitleFontStyle or UseTokensResult.Typography.BodyMedium
	local SubtitleColor = p1.subtitleColor or UseTokensResult.Color.Content.Default
	local VerticalGap = p1.verticalGap or UseTokensResult.Gap.XXSmall
	local Small = UseTokensResult.Gap.Small
	local TitleGap = p1.titleGap or UseTokensResult.Gap.XXSmall
	local TitleIconWidth = p1.titleIconWidth or UseTokensResult.Size.Size_600
	local HasSubtitleComponent: boolean = if p1.subtitleText == nil then p1.subtitleComponent ~= nil else p1.subtitleText ~= "" or p1.subtitleComponent ~= nil
	local OnSubtitleActivated = if p1.onSubtitleActivated then p1.onSubtitleActivated else p1.onTitleActivated
	local SubtitleGap = p1.subtitleGap or UseTokensResult.Gap.XXSmall
	local SubtitleIconWidth = p1.subtitleIconWidth or UseTokensResult.Size.Size_400
	local Size700 = UseTokensResult.Size.Size_700
	local UsePreferredInputResult = ResponsiveModule.usePreferredInput()
	local AllowInteractionForDirectionalInput = p1.allowInteractionForDirectionalInput or UsePreferredInputResult ~= ResponsiveModule.Input.Directional
	local HasInfoText = AllowInteractionForDirectionalInput and (p1.infoText ~= nil or p1.iconComponent)
	local HasOnTitleActivated: boolean = AllowInteractionForDirectionalInput and p1.onTitleActivated ~= nil
	local HasOnTitleActivated1: boolean = AllowInteractionForDirectionalInput and (HasOnTitleActivated or p1.onSubtitleActivated ~= nil)
	local IconsActionsCycleRight = nil
	
	if LuaAppSduiSeeAllArrowIconMigration2 then
		IconsActionsCycleRight = p1.titleIcon
		
		if IconsActionsCycleRight and (IconsActionsCycleRight == GetImageDataFunction("LuaApp/icons/GameDetails/navigation/pushRight_small") or IconsActionsCycleRight == Images["icons/navigation/pushRight_small"]) then
			IconsActionsCycleRight = Images["icons/actions/cycleRight"]
			TitleIconWidth = UseTokensResult.Size.Size_500
			TitleGap = UseTokensResult.Gap.XSmall
		end
	end
	local CombineReactTagsResult = if FFlagLuaAppEnableSduiHomePage then CombineReactTagsFunction(p1.tag, if p1.testId then `data-testid={p1.testId}` else nil) else nil
	
	return ReactModule.createElement("Frame", {
		Position = Position,
		AnchorPoint = AnchorPoint,
		AutomaticSize = AutomaticSize or Enum.AutomaticSize.Y,
		Size = Size or UDim2.new(1, 0, 0, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = LayoutOrder,
		ZIndex = ZIndex,
		[ReactModule.Tag] = if FFlagLuaAppEnableSduiHomePage then CombineReactTagsResult elseif p1.testId then `data-testid={p1.testId}` else nil
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, Small),
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		LeftContentFrame = ReactModule.createElement(if HasOnTitleActivated then "TextButton" else "Frame", {
			LayoutOrder = 1,
			Text = if HasOnTitleActivated then "" else nil,
			TextTransparency = if HasOnTitleActivated then 1 else nil,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutoButtonColor = not HasOnTitleActivated and nil,
			[ReactModule.Event.Activated] = if HasOnTitleActivated then p1.onTitleActivated else nil,
			Active = HasOnTitleActivated,
			Selectable = HasOnTitleActivated
		}, {
			UIFlexItem = ReactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Shrink }),
			UIListLayout = ReactModule.createElement("UIListLayout", {
				HorizontalFlex = Enum.UIFlexAlignment.Fill,
				SortOrder = Enum.SortOrder.Name,
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, VerticalGap),
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			ContentRow1 = p1.titleComponent or (ReactModule.createElement(SduiTextIconRowModule, {
				testId = "--sdui-section-header-title",
				gap = TitleGap,
				text = p1.titleText,
				fontStyle = TitleFontStyle,
				textColor = TitleColor.Color3,
				textFlexMode = Enum.UIFlexMode.Shrink,
				icon = if AllowInteractionForDirectionalInput then if LuaAppSduiSeeAllArrowIconMigration2 then IconsActionsCycleRight else p1.titleIcon else nil,
				iconWidth = TitleIconWidth,
				iconColor = TitleColor.Color3,
				selectable = HasOnTitleActivated
			}) or nil),
			ContentRow2 = p1.subtitleComponent or (HasSubtitleComponent and ReactModule.createElement(SduiTextIconRowModule, {
				testId = "--sdui-section-header-subtitle",
				onActivated = OnSubtitleActivated,
				gap = SubtitleGap,
				text = p1.subtitleText,
				fontStyle = SubtitleFontStyle,
				textColor = SubtitleColor.Color3,
				textFlexMode = Enum.UIFlexMode.Shrink,
				icon = if AllowInteractionForDirectionalInput then p1.subtitleIcon else nil,
				iconWidth = SubtitleIconWidth,
				iconColor = SubtitleColor.Color3,
				selectable = HasOnTitleActivated1
			}) or nil)
		}),
		IconWithTooltip = (if AddLayoutOrderToSduiSectionHeaderIconComponent and p1.iconComponent then ReactModule.createElement(View, { tag = "auto-xy", LayoutOrder = 2 }, { IconComponent = p1.iconComponent }) else p1.iconComponent) or (HasInfoText and p1.infoText and ReactModule.createElement(IconWithTooltip, {
			layoutOrder = 2,
			triggerPointName = "IconWithTooltip",
			supportVR = true,
			supportTenFootUi = true,
			tooltipOrientation = TooltipOrientation.Bottom,
			hoverText = p1.infoText,
			onActivateTooltip = p1.onInfoIconActivated,
			size = UDim2.new(0, Size700, 0, Size700),
			position = if HasSubtitleComponent then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 0.5, 0),
			anchorPoint = if HasSubtitleComponent then Vector2.new(1, 0) else Vector2.new(1, 0.5)
		}) or nil)
	})
end)