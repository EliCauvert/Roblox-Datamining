local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local view = foundationModule.View
local responsiveModule = require(parent.Responsive)
local tooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local iconWithTooltip = require(parent.AppBlox).IconWithTooltip
local sduiTextIconRowModule = require(serverDrivenUi.Content.SduiTextIconRow)
local images = require(parent.FoundationImages).Images
local getImageData = require(parent.RobloxAppAssets).GetImageData
local addLayoutOrderToSduiSectionHeaderIconComponent = game:DefineFastFlag("AddLayoutOrderToSduiSectionHeaderIconComponent", false)
local luaAppSduiSeeAllArrowIconMigration2 = game:DefineFastFlag("LuaAppSduiSeeAllArrowIconMigration2", false)

return reactModule.memo(function(p0)
	-- upvalues: useTokens (ref), responsiveModule (ref), luaAppSduiSeeAllArrowIconMigration2 (ref), getImageData (ref), images (ref), addLayoutOrderToSduiSectionHeaderIconComponent (ref), reactModule (ref), view (ref), sduiTextIconRowModule (ref), iconWithTooltip (ref), tooltipOrientation (ref)
	local var16
	local layoutOrder = p0.layoutOrder
	local anchorPoint = p0.anchorPoint
	local automaticSize = p0.automaticSize
	local size = p0.size
	local zIndex = p0.zIndex
	local position = p0.position
	local var8 = useTokens()
	local titleFontStyle = p0.titleFontStyle or var8.Typography.HeadingSmall
	local titleColor = p0.titleColor or var8.Color.Content.Emphasis
	local subtitleFontStyle = p0.subtitleFontStyle or var8.Typography.BodyMedium
	local subtitleColor = p0.subtitleColor or var8.Color.Content.Default
	local verticalGap = p0.verticalGap or var8.Gap.XXSmall
	local small = var8.Gap.Small
	local var14 = p0.titleGap or var8.Gap.XXSmall
	local var15 = p0.titleIconWidth or var8.Size.Size_600
	
	if p0.subtitleText ~= nil then
		var16 = if p0.subtitleText == "" then p0.subtitleComponent ~= nil else true
	end
	local var17 = if p0.onSubtitleActivated then p0.onSubtitleActivated else p0.onTitleActivated
	local subtitleGap = p0.subtitleGap or var8.Gap.XXSmall
	local subtitleIconWidth = p0.subtitleIconWidth or var8.Size.Size_400
	local size700 = var8.Size.Size_700
	local allowInteractionForDirectionalInput = p0.allowInteractionForDirectionalInput or responsiveModule.usePreferredInput() ~= responsiveModule.Input.Directional
	local var21 = allowInteractionForDirectionalInput and (if p0.infoText == nil then p0.iconComponent else true)
	local var22 = allowInteractionForDirectionalInput and p0.onTitleActivated ~= nil
	local var22_1 = allowInteractionForDirectionalInput and (var22 or p0.onSubtitleActivated ~= nil)
	local cycleRight = nil
	
	if luaAppSduiSeeAllArrowIconMigration2 then
		cycleRight = p0.titleIcon
		
		if cycleRight and (cycleRight == getImageData("LuaApp/icons/GameDetails/navigation/pushRight_small") or cycleRight == images["icons/navigation/pushRight_small"]) then
			cycleRight = images["icons/actions/cycleRight"]
			var15 = var8.Size.Size_500
			var14 = var8.Gap.XSmall
		end
	end
	return reactModule.createElement("Frame", {
		Position = position,
		AnchorPoint = anchorPoint,
		AutomaticSize = automaticSize or Enum.AutomaticSize.Y,
		Size = size or UDim2.new(1, 0, 0, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = layoutOrder,
		ZIndex = zIndex,
		[reactModule.Tag] = if p0.testId then `data-testid={p0.testId}` else nil
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, small),
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		LeftContentFrame = reactModule.createElement(if var22 then "TextButton" else "Frame", {
			LayoutOrder = 1,
			Text = if var22 then "" else nil,
			TextTransparency = if var22 then 1 else nil,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutoButtonColor = if var22 then false else nil,
			[reactModule.Event.Activated] = if var22 then p0.onTitleActivated else nil,
			Active = var22,
			Selectable = var22
		}, {
			UIFlexItem = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Shrink }),
			UIListLayout = reactModule.createElement("UIListLayout", {
				HorizontalFlex = Enum.UIFlexAlignment.Fill,
				SortOrder = Enum.SortOrder.Name,
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, verticalGap),
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			ContentRow1 = p0.titleComponent or (reactModule.createElement(sduiTextIconRowModule, {
				testId = "--sdui-section-header-title",
				gap = var14,
				text = p0.titleText,
				fontStyle = titleFontStyle,
				textColor = titleColor.Color3,
				textFlexMode = Enum.UIFlexMode.Shrink,
				icon = if allowInteractionForDirectionalInput then if luaAppSduiSeeAllArrowIconMigration2 then cycleRight else p0.titleIcon else nil,
				iconWidth = var15,
				iconColor = titleColor.Color3,
				selectable = var22
			}) or nil),
			ContentRow2 = p0.subtitleComponent or (var16 and reactModule.createElement(sduiTextIconRowModule, {
				testId = "--sdui-section-header-subtitle",
				onActivated = var17,
				gap = subtitleGap,
				text = p0.subtitleText,
				fontStyle = subtitleFontStyle,
				textColor = subtitleColor.Color3,
				textFlexMode = Enum.UIFlexMode.Shrink,
				icon = if allowInteractionForDirectionalInput then p0.subtitleIcon else nil,
				iconWidth = subtitleIconWidth,
				iconColor = subtitleColor.Color3,
				selectable = var22_1
			}) or nil)
		}),
		IconWithTooltip = (if addLayoutOrderToSduiSectionHeaderIconComponent and p0.iconComponent then reactModule.createElement(view, { tag = "auto-xy", LayoutOrder = 2 }, { IconComponent = p0.iconComponent }) else p0.iconComponent) or var21 and (p0.infoText and (reactModule.createElement(iconWithTooltip, {
			layoutOrder = 2,
			triggerPointName = "IconWithTooltip",
			supportVR = true,
			supportTenFootUi = true,
			tooltipOrientation = tooltipOrientation.Bottom,
			hoverText = p0.infoText,
			onActivateTooltip = p0.onInfoIconActivated,
			size = UDim2.new(0, size700, 0, size700),
			position = if var16 then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 0.5, 0),
			anchorPoint = if var16 then Vector2.new(1, 0) else Vector2.new(1, 0.5)
		}) or nil))
	})
end)