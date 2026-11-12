local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UIBloxModule = require(Parent.UIBlox)
local IconWithTooltip = require(Parent.AppBlox).IconWithTooltip
local TooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local StandardButtonSize = UIBloxModule.App.Button.Enum.StandardButtonSize
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXWidgetHeaderTreatEmptyTextAsNil = AvatarExperienceFlagsModule.FFlagAXWidgetHeaderTreatEmptyTextAsNil
local FFlagAXCatalogItemInformationPopover = AvatarExperienceFlagsModule.FFlagAXCatalogItemInformationPopover
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local FFlagAXWidgetHeaderFlexLayout = AvatarExperienceFlagsModule.FFlagAXWidgetHeaderFlexLayout

local function _(p1)
	return if p1 == nil or p1 == "" then nil else p1
end

return function(Frame)
	-- upvalues: ReactModule (copy), UseDesignTokensFunction (copy), UseLocalizationFunction (copy), FFlagAXWidgetHeaderTreatEmptyTextAsNil (copy), FFlagAXCatalogItemInformationPopover (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), FFlagAXWidgetHeaderFlexLayout (copy), IconWithTooltip (copy), TooltipOrientation (copy), Button (copy), ButtonType (copy), StandardButtonSize (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Vector2.new())
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		seeAllButtonText = "Feature.Catalog.ActionSeeAll",
		title = Frame.titleKey,
		description = Frame.descriptionKey
	})
	local DescriptionText = nil
	local TitleText = nil
	
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
		Font = if FoundationFontFaceMigration then nil else UseDesignTokensResult.Typography.HeadingSmall.Font,
		FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseDesignTokensResult.Typography.HeadingSmall.Font) else nil,
		TextSize = UseDesignTokensResult.Typography.HeadingSmall.FontSize,
		LineHeight = UseDesignTokensResult.Typography.HeadingSmall.LineHeight,
		TextColor3 = UseDesignTokensResult.Color.Content.Emphasis.Color3,
		TextTransparency = UseDesignTokensResult.Color.Content.Emphasis.Transparency,
		TextTruncate = Enum.TextTruncate.AtEnd,
		Size = if HasOnInformationIconActivated then UDim2.fromOffset(0, 0) else UDim2.fromScale(1, 0),
		AutomaticSize = if HasOnInformationIconActivated then Enum.AutomaticSize.XY else Enum.AutomaticSize.Y,
		TextXAlignment = Enum.TextXAlignment.Left
	}, {
		UIFlexItem = if HasOnInformationIconActivated then ReactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Shrink }) else nil,
		UISizeConstraint = if FFlagAXWidgetHeaderFlexLayout then nil elseif Frame.seeAllCallback then ReactModule.createElement("UISizeConstraint", {
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
			Padding = UDim.new(0, UseDesignTokensResult.Size.Size_100)
		}),
		Title = TextLabel,
		InformationIcon = ReactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromOffset(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			UIFlexItem = ReactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.None }),
			Icon = ReactModule.createElement(IconWithTooltip, {
				triggerPointName = "CatalogItemInformationTooltip",
				supportTenFootUi = true,
				supportVR = true,
				tooltipOrientation = TooltipOrientation.Right,
				hoverText = Frame.informationPopoverText,
				onActivateTooltip = Frame.onInformationIconActivated
			})
		})
	}) else TextLabel else nil
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = Frame.LayoutOrder
	}, {
		UIListLayout = if FFlagAXWidgetHeaderFlexLayout then ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, UseDesignTokensResult.Size.Size_300)
		}) else nil,
		TitleDescriptionFrame = if TitleText or DescriptionText then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = if FFlagAXWidgetHeaderFlexLayout then 1 else nil,
			Size = if FFlagAXWidgetHeaderFlexLayout then UDim2.new(1, 0, 0, 0) elseif Frame.seeAllCallback then UseBindingResult:map(function(p1): UDim2
				-- upvalues: UseDesignTokensResult (copy)
				return UDim2.new(1, 0 - (p1.X + UseDesignTokensResult.Size.Size_300), 0, 0)
			end) else UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UIFlexItem = if FFlagAXWidgetHeaderFlexLayout then ReactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Shrink }) else nil,
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, UseDesignTokensResult.Size.Size_100)
			}),
			Title = Frame1,
			Description = if DescriptionText then ReactModule.createElement("TextLabel", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				Text = DescriptionText,
				Font = if FoundationFontFaceMigration then nil else UseDesignTokensResult.Typography.BodyLarge.Font,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseDesignTokensResult.Typography.BodyLarge.Font) else nil,
				TextSize = UseDesignTokensResult.Typography.BodyLarge.FontSize,
				TextColor3 = UseDesignTokensResult.Color.Content.Default.Color3,
				TextTransparency = UseDesignTokensResult.Color.Content.Default.Transparency,
				TextTruncate = Enum.TextTruncate.SplitWord,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				TextXAlignment = Enum.TextXAlignment.Left
			}) else nil
		}) else nil,
		SeeAll = if FFlagAXWidgetHeaderFlexLayout and Frame.seeAllCallback then ReactModule.createElement(Button, {
			layoutOrder = 2,
			fitContent = true,
			buttonType = ButtonType.Secondary,
			text = UseLocalizationResult.seeAllButtonText,
			standardSize = StandardButtonSize.XSmall,
			onActivated = Frame.seeAllCallback,
			buttonRef = Frame.seeAllRef,
			NextSelectionDown = Frame.NextSelectionDown,
			NextSelectionUp = Frame.NextSelectionUp
		}) elseif Frame.seeAllCallback then ReactModule.createElement(Button, {
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