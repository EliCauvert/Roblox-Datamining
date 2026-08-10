local parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local UIBloxModule = require(parent.UIBlox)
local iconWithTooltip = require(parent.AppBlox).IconWithTooltip
local tooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local button = UIBloxModule.App.Button.Button
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local standardButtonSize = UIBloxModule.App.Button.Enum.StandardButtonSize
local useDesignTokens = require(parent.Style).useDesignTokens
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXWidgetHeaderTreatEmptyTextAsNil = avatarExperienceFlagsModule.FFlagAXWidgetHeaderTreatEmptyTextAsNil
local fFlagAXCatalogItemInformationPopover = avatarExperienceFlagsModule.FFlagAXCatalogItemInformationPopover

local function _(p0) --[[ line: 39 | named "nonEmptyOrNil" ]]
	return if p0 == nil or p0 == "" then nil else p0
end

return function(p1) --[[ line: 43 | named "WidgetHeader" ]]
	-- upvalues: reactModule (ref), useDesignTokens (ref), useLocalization (ref), fFlagAXWidgetHeaderTreatEmptyTextAsNil (ref), fFlagAXCatalogItemInformationPopover (ref), iconWithTooltip (ref), tooltipOrientation (ref), button (ref), buttonType (ref), standardButtonSize (ref)
	local titleText, var8, var10
	local var3, var4 = reactModule.useBinding(Vector2.new())
	local var5 = useDesignTokens()
	local var6 = useLocalization({
		seeAllButtonText = "Feature.Catalog.ActionSeeAll",
		title = p1.titleKey,
		description = p1.descriptionKey
	})
	local _ = nil
	local _ = nil
	
	if fFlagAXWidgetHeaderTreatEmptyTextAsNil then
		titleText = p1.titleText
		local var7 = if titleText == nil or titleText == "" then nil else titleText
		
		if not var7 then
			titleText = var6.title
			var7 = if titleText == nil or titleText == "" then nil else titleText
		end
		var8 = var7
		titleText = p1.descriptionText
		local var9 = if titleText == nil or titleText == "" then nil else titleText
		
		if not var9 then
			titleText = var6.description
			var9 = if titleText == nil or titleText == "" then nil else titleText
		end
		var10 = var9
	else
		var8 = if p1.titleText then p1.titleText else var6.title
		var10 = if p1.descriptionText then p1.descriptionText else var6.description
	end
	local var11 = fFlagAXCatalogItemInformationPopover and (p1.informationPopoverText ~= nil and (p1.informationPopoverText ~= "" and p1.onInformationIconActivated ~= nil))
	titleText = if var8 then reactModule.createElement("TextLabel", {
		LayoutOrder = 1,
		BackgroundTransparency = 1,
		Text = var8,
		Font = var5.Typography.HeadingSmall.Font,
		TextSize = var5.Typography.HeadingSmall.FontSize,
		LineHeight = var5.Typography.HeadingSmall.LineHeight,
		TextColor3 = var5.Color.Content.Emphasis.Color3,
		TextTransparency = var5.Color.Content.Emphasis.Transparency,
		TextTruncate = Enum.TextTruncate.AtEnd,
		Size = if var11 then UDim2.fromOffset(0, 0) else UDim2.fromScale(1, 0),
		AutomaticSize = if var11 then Enum.AutomaticSize.XY else Enum.AutomaticSize.Y,
		TextXAlignment = Enum.TextXAlignment.Left
	}, {
		UIFlexItem = if var11 then reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Shrink }) else nil,
		UISizeConstraint = if p1.seeAllCallback then reactModule.createElement("UISizeConstraint", {
			MinSize = var3:map(function(p2) --[[ line: 94 ]]
				return Vector2.new(0, p2.Y)
			end)
		}) else nil
	}) else nil
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.LayoutOrder
	}, {
		TitleDescriptionFrame = if var8 or var10 then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = if p1.seeAllCallback then var3:map(function(p3) --[[ line: 172 ]]
				-- upvalues: var5 (ref)
				return UDim2.new(1, 0 - (p3.X + var5.Size.Size_300), 0, 0)
			end) else UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, var5.Size.Size_100)
			}),
			Title = if var8 then if var11 then reactModule.createElement("Frame", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalFlex = Enum.UIFlexAlignment.Fill,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, var5.Size.Size_100)
				}),
				Title = titleText,
				InformationIcon = reactModule.createElement("Frame", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.fromOffset(0, 0),
					AutomaticSize = Enum.AutomaticSize.XY
				}, {
					UIFlexItem = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.None }),
					Icon = reactModule.createElement(iconWithTooltip, {
						triggerPointName = "CatalogItemInformationTooltip",
						supportTenFootUi = true,
						supportVR = true,
						tooltipOrientation = tooltipOrientation.Right,
						hoverText = p1.informationPopoverText,
						onActivateTooltip = p1.onInformationIconActivated
					})
				})
			}) else titleText else nil,
			Description = if var10 then reactModule.createElement("TextLabel", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				Text = var10,
				Font = var5.Typography.BodyLarge.Font,
				TextSize = var5.Typography.BodyLarge.FontSize,
				TextColor3 = var5.Color.Content.Default.Color3,
				TextTransparency = var5.Color.Content.Default.Transparency,
				TextTruncate = Enum.TextTruncate.SplitWord,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				TextXAlignment = Enum.TextXAlignment.Left
			}) else nil
		}) else nil,
		SeeAll = if p1.seeAllCallback then reactModule.createElement(button, {
			buttonType = buttonType.Secondary,
			anchorPoint = Vector2.new(1, 0),
			position = UDim2.fromScale(1, 0),
			text = var6.seeAllButtonText,
			fitContent = true,
			standardSize = standardButtonSize.XSmall,
			onActivated = p1.seeAllCallback,
			buttonRef = p1.seeAllRef,
			[reactModule.Change.AbsoluteSize] = function(p4) --[[ line: 213 ]]
				-- upvalues: var4 (ref)
				var4(p4.AbsoluteSize)
			end,
			NextSelectionDown = p1.NextSelectionDown,
			NextSelectionUp = p1.NextSelectionUp
		}) else nil
	})
end