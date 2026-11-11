local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UIBloxModule = require(Parent.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(Parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local IconWithTooltip = require(Parent.AppBlox).IconWithTooltip
local TooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local StandardButtonSize = UIBloxModule.App.Button.Enum.StandardButtonSize
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXWidgetHeaderTreatEmptyTextAsNil = AvatarExperienceFlagsModule.FFlagAXWidgetHeaderTreatEmptyTextAsNil
local FFlagAXCatalogItemInformationPopover = AvatarExperienceFlagsModule.FFlagAXCatalogItemInformationPopover

local function _(p1)
	return if p1 == nil or p1 == "" then nil else p1
end

return function(Frame)
	-- upvalues: ReactModule (copy), UseDesignTokensFunction (copy), UseLocalizationFunction (copy), FFlagAXWidgetHeaderTreatEmptyTextAsNil (copy), FFlagAXCatalogItemInformationPopover (copy), FFlagRenameDeprecatedUIBloxTokens (copy), IconWithTooltip (copy), TooltipOrientation (copy), Button (copy), ButtonType (copy), StandardButtonSize (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Vector2.new())
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		seeAllButtonText = "Feature.Catalog.ActionSeeAll",
		title = Frame.titleKey,
		description = Frame.descriptionKey
	})
	local TitleText = nil
	local DescriptionText = nil
	
	if FFlagAXWidgetHeaderTreatEmptyTextAsNil then
		local TitleText1 = Frame.titleText
		local TitleText11 = if TitleText1 == nil or TitleText1 == "" then nil else TitleText1
		
		if not TitleText11 then
			local Title = UseLocalizationResult.title
			TitleText11 = if Title == nil or Title == "" then nil else Title
		end
		TitleText = TitleText11
		local DescriptionText1 = Frame.descriptionText
		local DescriptionText2 = if DescriptionText1 == nil or DescriptionText1 == "" then nil else DescriptionText1
		
		if not DescriptionText2 then
			local Description = UseLocalizationResult.description
			DescriptionText2 = if Description == nil or Description == "" then nil else Description
		end
		DescriptionText = DescriptionText2
	else
		TitleText = if Frame.titleText then Frame.titleText else UseLocalizationResult.title
		DescriptionText = if Frame.descriptionText then Frame.descriptionText else UseLocalizationResult.description
	end
	local HasOnInformationIconActivated: boolean = FFlagAXCatalogItemInformationPopover and (Frame.informationPopoverText ~= nil and (Frame.informationPopoverText ~= "" and Frame.onInformationIconActivated ~= nil))
	local TextLabel = if TitleText then ReactModule.createElement("TextLabel", {
		LayoutOrder = 1,
		BackgroundTransparency = 1,
		Text = TitleText,
		Font = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Typography.HeadingSmall.Font else UseDesignTokensResult.Semantic.Typography.Header.Font,
		TextSize = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Typography.HeadingSmall.FontSize else UseDesignTokensResult.Semantic.Typography.Header.FontSize,
		LineHeight = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Typography.HeadingSmall.LineHeight else UseDesignTokensResult.Semantic.Typography.Header.LineHeight,
		TextColor3 = (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Content.Emphasis else UseDesignTokensResult.Semantic.Color.Text.Emphasis).Color3,
		TextTransparency = (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Content.Emphasis else UseDesignTokensResult.Semantic.Color.Text.Emphasis).Transparency,
		TextTruncate = Enum.TextTruncate.AtEnd,
		Size = if HasOnInformationIconActivated then UDim2.fromOffset(0, 0) else UDim2.fromScale(1, 0),
		AutomaticSize = if HasOnInformationIconActivated then Enum.AutomaticSize.XY else Enum.AutomaticSize.Y,
		TextXAlignment = Enum.TextXAlignment.Left
	}, {
		UIFlexItem = if HasOnInformationIconActivated then ReactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Shrink }) else nil,
		UISizeConstraint = if Frame.seeAllCallback then ReactModule.createElement("UISizeConstraint", {
			MinSize = UseBindingResult:map(function(p1): Vector2
				return Vector2.new(0, p1.Y)
			end)
		}) else nil
	}) else nil
	local Frame1 = if TitleText then if HasOnInformationIconActivated then ReactModule.createElement("Frame", {
		LayoutOrder = 1,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalFlex = Enum.UIFlexAlignment.Fill,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_100 else UseDesignTokensResult.Global.Space_50)
		}),
		Title = TextLabel,
		InformationIcon = ReactModule.createElement(IconWithTooltip, {
			layoutOrder = 2,
			triggerPointName = "CatalogItemInformationTooltip",
			supportTenFootUi = true,
			supportVR = true,
			tooltipOrientation = TooltipOrientation.Right,
			hoverText = Frame.informationPopoverText,
			onActivateTooltip = Frame.onInformationIconActivated
		})
	}) else TextLabel else nil
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = Frame.LayoutOrder
	}, {
		TitleDescriptionFrame = if TitleText or DescriptionText then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = if Frame.seeAllCallback then UseBindingResult:map(function(p1): UDim2
				-- upvalues: FFlagRenameDeprecatedUIBloxTokens (upval), UseDesignTokensResult (copy)
				return UDim2.new(1, 0 - (p1.X + (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_300 else UseDesignTokensResult.Global.Space_150)), 0, 0)
			end) else UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_100 else UseDesignTokensResult.Global.Space_50)
			}),
			Title = Frame1,
			Description = if DescriptionText then ReactModule.createElement("TextLabel", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				Text = DescriptionText,
				Font = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Typography.BodyLarge.Font else UseDesignTokensResult.Semantic.Typography.Body.Font,
				TextSize = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Typography.BodyLarge.FontSize else UseDesignTokensResult.Semantic.Typography.Body.FontSize,
				TextColor3 = (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Content.Default else UseDesignTokensResult.Semantic.Color.Text.Default).Color3,
				TextTransparency = (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Content.Default else UseDesignTokensResult.Semantic.Color.Text.Default).Transparency,
				TextTruncate = Enum.TextTruncate.SplitWord,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				TextXAlignment = Enum.TextXAlignment.Left
			}) else nil
		}) else nil,
		SeeAll = if Frame.seeAllCallback then ReactModule.createElement(Button, {
			buttonType = ButtonType.Secondary,
			anchorPoint = Vector2.new(1, 0),
			position = UDim2.fromScale(1, 0),
			text = UseLocalizationResult.seeAllButtonText,
			fitContent = true,
			standardSize = StandardButtonSize.XSmall,
			onActivated = Frame.seeAllCallback,
			buttonRef = Frame.seeAllRef,
			[ReactModule.Change.AbsoluteSize] = function(Frame)
				-- upvalues: UseBindingResult2 (copy)
				UseBindingResult2(Frame.AbsoluteSize)
			end,
			NextSelectionDown = Frame.NextSelectionDown,
			NextSelectionUp = Frame.NextSelectionUp
		}) else nil
	})
end