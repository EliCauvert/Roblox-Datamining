local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local reactModule = require(parent.React)
local combineReactTags = require(parent.RoactUtils).combineReactTags
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
local fFlagLuaAppEnableSduiHomePage = require(parent.SharedFlags).FFlagLuaAppEnableSduiHomePage
local addLayoutOrderToSduiSectionHeaderIconComponent = game:DefineFastFlag("AddLayoutOrderToSduiSectionHeaderIconComponent", false)
local luaAppSduiSeeAllArrowIconMigration2 = game:DefineFastFlag("LuaAppSduiSeeAllArrowIconMigration2", false)

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), responsiveModule (ref), luaAppSduiSeeAllArrowIconMigration2 (ref), getImageData (ref), images (ref), addLayoutOrderToSduiSectionHeaderIconComponent (ref), reactModule (ref), view (ref), fFlagLuaAppEnableSduiHomePage (ref), combineReactTags (ref), sduiTextIconRowModule (ref), iconWithTooltip (ref), tooltipOrientation (ref)
	local var1
	local layoutOrder = p1.layoutOrder
	local anchorPoint = p1.anchorPoint
	local automaticSize = p1.automaticSize
	local size = p1.size
	local zIndex = p1.zIndex
	local position = p1.position
	local var2 = useTokens()
	local titleFontStyle = p1.titleFontStyle or var2.Typography.HeadingSmall
	local titleColor = p1.titleColor or var2.Color.Content.Emphasis
	local subtitleFontStyle = p1.subtitleFontStyle or var2.Typography.BodyMedium
	local subtitleColor = p1.subtitleColor or var2.Color.Content.Default
	local verticalGap = p1.verticalGap or var2.Gap.XXSmall
	local small = var2.Gap.Small
	local var3 = p1.titleGap or var2.Gap.XXSmall
	local var4 = p1.titleIconWidth or var2.Size.Size_600
	
	if p1.subtitleText ~= nil then
		var1 = if p1.subtitleText == "" then p1.subtitleComponent ~= nil else true
	end
	local var5 = if p1.onSubtitleActivated then p1.onSubtitleActivated else p1.onTitleActivated
	local subtitleGap = p1.subtitleGap or var2.Gap.XXSmall
	local subtitleIconWidth = p1.subtitleIconWidth or var2.Size.Size_400
	local size700 = var2.Size.Size_700
	local allowInteractionForDirectionalInput = p1.allowInteractionForDirectionalInput or responsiveModule.usePreferredInput() ~= responsiveModule.Input.Directional
	local var6 = allowInteractionForDirectionalInput and (if p1.infoText == nil then p1.iconComponent else true)
	local var7 = allowInteractionForDirectionalInput and p1.onTitleActivated ~= nil
	local var8 = allowInteractionForDirectionalInput and (var7 or p1.onSubtitleActivated ~= nil)
	local cycleRight = nil
	
	if luaAppSduiSeeAllArrowIconMigration2 then
		cycleRight = p1.titleIcon
		
		if cycleRight and (cycleRight == getImageData("LuaApp/icons/GameDetails/navigation/pushRight_small") or cycleRight == images["icons/navigation/pushRight_small"]) then
			cycleRight = images["icons/actions/cycleRight"]
			var4 = var2.Size.Size_500
			var3 = var2.Gap.XSmall
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
		[reactModule.Tag] = if fFlagLuaAppEnableSduiHomePage then if fFlagLuaAppEnableSduiHomePage then combineReactTags(p1.tag, if p1.testId then `data-testid={p1.testId}` else nil) else nil elseif p1.testId then `data-testid={p1.testId}` else nil
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, small),
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		LeftContentFrame = reactModule.createElement(if var7 then "TextButton" else "Frame", {
			LayoutOrder = 1,
			Text = if var7 then "" else nil,
			TextTransparency = if var7 then 1 else nil,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutoButtonColor = if var7 then false else nil,
			[reactModule.Event.Activated] = if var7 then p1.onTitleActivated else nil,
			Active = var7,
			Selectable = var7
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
			ContentRow1 = p1.titleComponent or (reactModule.createElement(sduiTextIconRowModule, {
				testId = "--sdui-section-header-title",
				gap = var3,
				text = p1.titleText,
				fontStyle = titleFontStyle,
				textColor = titleColor.Color3,
				textFlexMode = Enum.UIFlexMode.Shrink,
				icon = if allowInteractionForDirectionalInput then if luaAppSduiSeeAllArrowIconMigration2 then cycleRight else p1.titleIcon else nil,
				iconWidth = var4,
				iconColor = titleColor.Color3,
				selectable = var7
			}) or nil),
			ContentRow2 = p1.subtitleComponent or (var1 and reactModule.createElement(sduiTextIconRowModule, {
				testId = "--sdui-section-header-subtitle",
				onActivated = var5,
				gap = subtitleGap,
				text = p1.subtitleText,
				fontStyle = subtitleFontStyle,
				textColor = subtitleColor.Color3,
				textFlexMode = Enum.UIFlexMode.Shrink,
				icon = if allowInteractionForDirectionalInput then p1.subtitleIcon else nil,
				iconWidth = subtitleIconWidth,
				iconColor = subtitleColor.Color3,
				selectable = var8
			}) or nil)
		}),
		IconWithTooltip = (if addLayoutOrderToSduiSectionHeaderIconComponent and p1.iconComponent then reactModule.createElement(view, { tag = "auto-xy", LayoutOrder = 2 }, { IconComponent = p1.iconComponent }) else p1.iconComponent) or var6 and (p1.infoText and (reactModule.createElement(iconWithTooltip, {
			layoutOrder = 2,
			triggerPointName = "IconWithTooltip",
			supportVR = true,
			supportTenFootUi = true,
			tooltipOrientation = tooltipOrientation.Bottom,
			hoverText = p1.infoText,
			onActivateTooltip = p1.onInfoIconActivated,
			size = UDim2.new(0, size700, 0, size700),
			position = if var1 then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 0.5, 0),
			anchorPoint = if var1 then Vector2.new(1, 0) else Vector2.new(1, 0.5)
		}) or nil))
	})
end)