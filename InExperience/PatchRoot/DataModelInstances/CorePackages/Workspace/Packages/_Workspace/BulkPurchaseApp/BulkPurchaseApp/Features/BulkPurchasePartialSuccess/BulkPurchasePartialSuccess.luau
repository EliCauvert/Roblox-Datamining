local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local Parent = BulkPurchaseApp.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UIBloxModule = require(Parent.UIBlox)
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local FullPagePromptModule = require(BulkPurchaseApp.Components.FullPagePrompt)
local FullPagePromptTwoPanelLayoutModule = require(BulkPurchaseApp.Components.FullPagePromptTwoPanelLayout)
local DividerModule = require(BulkPurchaseApp.Components.Divider)
local ItemListHeaderModule = require(BulkPurchaseApp.Components.ItemListHeader)
local FullPagePromptScrollListModule = require(BulkPurchaseApp.Components.FullPagePromptScrollList)
local BoxModule = require(BulkPurchaseApp.Components.Box)
local PriceBoxLineDEPRECATEDModule = require(BulkPurchaseApp.Components.PriceBoxLine_DEPRECATED)
local _ = require(Parent.Style)
local ItemCardThumbnail = require(Parent.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail
local ItemListModule = require(BulkPurchaseApp.Components.ItemList)
local _ = require(Parent.AvatarExperienceCommon)
local ItemStatusToItemStatusKeyModule = require(BulkPurchaseApp.Enums.ItemStatusToItemStatusKey)
local ItemStatusKeyToLocalizationKeyModule = require(BulkPurchaseApp.Enums.ItemStatusKeyToLocalizationKey)

local function _(Tbl, Id)
	local Copy = table.clone(Tbl)
	Copy.id = Id
	
	return Copy
end

local config = {
	heading = "CoreScripts.BulkPurchasePrompt.PartialPurchaseCompletedPrompt.Heading",
	unsuccessfulHeading = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorHeading",
	notice = "CoreScripts.BulkPurchasePrompt.PartialPurchaseCompletedPrompt.Notice",
	itemListSuccessfulCount = "CoreScripts.BulkPurchasePrompt.PartialPurchaseCompletedPrompt.ItemListSuccessfulCount",
	itemListUnsuccessfulCount = "CoreScripts.BulkPurchasePrompt.PartialPurchaseCompletedPrompt.ItemListUnsuccessfulCount",
	itemListSuccessfulHeading = "CoreScripts.BulkPurchasePrompt.PartialPurchaseCompletedPrompt.ItemListSuccessfulHeading",
	itemListUnsuccessfulHeading = "CoreScripts.BulkPurchasePrompt.PartialPurchaseCompletedPrompt.ItemListUnsuccessfulHeading",
	robuxSpent = "CoreScripts.BulkPurchasePrompt.PartialPurchaseCompletedPrompt.PriceBox.RobuxSpent",
	currentBalance = "CoreScripts.BulkPurchasePrompt.PartialPurchaseCompletedPrompt.PriceBox.CurrentBalance",
	dismissCTA = "CoreScripts.BulkPurchasePrompt.PartialPurchaseCompletedPrompt.PriceBox.DismissCTA"
}

local function mapTokens(p1)
	return {
		boxBackground = p1.Color.Surface.Surface_100.Color3,
		boxPadding = p1.Size.Size_600,
		boxCornerRadius = p1.Radius.Medium,
		buttonMarginTop = p1.Size.Size_400,
		buttonHeight = p1.Size.Size_900,
		lineItemSpacing = p1.Size.Size_100,
		noticeFontStyle = p1.Typography.BodyLarge,
		noticeColorStyle = p1.Color.Content.Muted,
		noticeMarginBottom = p1.Size.Size_600,
		successColor = p1.Color.System.Success,
		failureColor = p1.Color.System.Alert
	}
end

local function mapBulkPurchasePartialSuccessItemsToRowPresentation(SuccessfulItems, p1, SuccessColor, FailureColor)
	-- upvalues: ItemStatusToItemStatusKeyModule (copy), ReactModule (copy), ItemCardThumbnail (copy)
	local List = {}
	
	for _, successfulItem in SuccessfulItems do
		local Copy = table.clone({
			presentationSlot = ReactModule.createElement(ItemCardThumbnail, { url = successfulItem.image }),
			title = successfulItem.name,
			priceLineContent = {
				{
					type = "text",
					text = p1[ItemStatusToItemStatusKeyModule[successfulItem.status]],
					colorStyle = if successfulItem.status == Enum.MarketplaceItemPurchaseStatus.Success then SuccessColor else FailureColor
				}
			}
		})
		Copy.id = successfulItem.id
		table.insert(List, Copy)
	end
	return List
end

return function(p2)
	-- upvalues: UseDesignTokensFunction (copy), mapTokens (copy), UseLocalizationFunction (copy), config (copy), ItemStatusKeyToLocalizationKeyModule (copy), ReactModule (copy), FullPagePromptModule (copy), StyledTextLabel (copy), FullPagePromptTwoPanelLayoutModule (copy), FullPagePromptScrollListModule (copy), ItemListHeaderModule (copy), ItemListModule (copy), mapBulkPurchasePartialSuccessItemsToRowPresentation (copy), DividerModule (copy), BoxModule (copy), PriceBoxLineDEPRECATEDModule (copy), Button (copy), ButtonType (copy)
	local UseDesignTokensResult = UseDesignTokensFunction(mapTokens)
	local UseLocalizationResult = UseLocalizationFunction(config)
	local UseLocalizationResult1 = UseLocalizationFunction(ItemStatusKeyToLocalizationKeyModule)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Vector2.new(0, 0))
	local v1 = #p2.successfulItems > 0
	
	return ReactModule.createElement(FullPagePromptModule, {
		onClose = p2.onDismiss,
		title = if v1 then UseLocalizationResult.heading else UseLocalizationResult.unsuccessfulHeading
	}, ReactModule.createElement("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		Padding = UDim.new(0, UseDesignTokensResult.noticeMarginBottom)
	}), ReactModule.createElement("Frame", {
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		[ReactModule.Change.AbsoluteSize] = function(Frame)
			-- upvalues: UseBindingResult2 (copy)
			UseBindingResult2(Frame.AbsoluteSize)
		end
	}, ReactModule.createElement(StyledTextLabel, {
		layoutOrder = 1,
		fontStyle = UseDesignTokensResult.noticeFontStyle,
		colorStyle = UseDesignTokensResult.noticeColorStyle,
		text = UseLocalizationResult.notice,
		automaticSize = Enum.AutomaticSize.XY
	})), ReactModule.createElement(FullPagePromptTwoPanelLayoutModule, {
		LayoutOrder = 2,
		size = UseBindingResult:map(function(p3): UDim2
			-- upvalues: UseDesignTokensResult (copy)
			return UDim2.new(1, 0, 1, -(p3.Y + UseDesignTokensResult.noticeMarginBottom))
		end),
		startSlot = ReactModule.createElement(FullPagePromptScrollListModule, {
			LayoutOrder = 1,
			size = ReactModule.createBinding(UDim2.fromScale(1, 1))
		}, ReactModule.createElement(ItemListHeaderModule, {
			LayoutOrder = 1,
			heading = UseLocalizationResult.itemListUnsuccessfulHeading,
			itemCount = UseLocalizationResult.itemListUnsuccessfulCount:gsub("{.*}", (tostring(#p2.unsuccessfulItems)))
		}), ReactModule.createElement(ItemListModule, {
			LayoutOrder = 2,
			items = mapBulkPurchasePartialSuccessItemsToRowPresentation(p2.unsuccessfulItems, UseLocalizationResult1, UseDesignTokensResult.successColor, UseDesignTokensResult.failureColor)
		}), if v1 then ReactModule.createElement(DividerModule, { LayoutOrder = 3 }) else nil, if v1 then ReactModule.createElement(ItemListHeaderModule, {
			LayoutOrder = 4,
			heading = UseLocalizationResult.itemListSuccessfulHeading,
			itemCount = UseLocalizationResult.itemListSuccessfulCount:gsub("{.*}", (tostring(#p2.successfulItems)))
		}) else nil, if v1 then ReactModule.createElement(ItemListModule, {
			LayoutOrder = 5,
			items = mapBulkPurchasePartialSuccessItemsToRowPresentation(p2.successfulItems, UseLocalizationResult1, UseDesignTokensResult.successColor, UseDesignTokensResult.failureColor)
		}) else nil),
		endSlot = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, UseDesignTokensResult.buttonMarginTop)
		}), ReactModule.createElement(BoxModule, {
			BorderSizePixel = 0,
			padding = UseDesignTokensResult.boxPadding,
			cornerRadius = UDim.new(0, UseDesignTokensResult.boxCornerRadius),
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundColor3 = UseDesignTokensResult.boxBackground
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				Padding = UDim.new(0, UseDesignTokensResult.lineItemSpacing)
			}),
			RobuxSpent = ReactModule.createElement(PriceBoxLineDEPRECATEDModule, {
				highlight = true,
				LayoutOrder = 1,
				text = UseLocalizationResult.robuxSpent,
				amount = p2.robuxSpent
			}),
			CurrentBalance = ReactModule.createElement(PriceBoxLineDEPRECATEDModule, {
				LayoutOrder = 2,
				text = UseLocalizationResult.currentBalance,
				amount = p2.currentBalance
			})
		}), ReactModule.createElement(Button, {
			text = UseLocalizationResult.dismissCTA,
			onActivated = p2.onDismiss,
			buttonType = ButtonType.PrimarySystem,
			size = UDim2.new(1, 0, 0, UseDesignTokensResult.buttonHeight)
		}))
	}))
end