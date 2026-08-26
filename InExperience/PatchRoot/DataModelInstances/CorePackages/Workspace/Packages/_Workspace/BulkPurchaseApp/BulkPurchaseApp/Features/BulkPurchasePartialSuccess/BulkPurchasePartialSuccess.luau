local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local parent = bulkPurchaseApp.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useDesignTokens = require(parent.Style).useDesignTokens
local UIBloxModule = require(parent.UIBlox)
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local button = UIBloxModule.App.Button.Button
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local fullPagePromptModule = require(bulkPurchaseApp.Components.FullPagePrompt)
local fullPagePromptTwoPanelLayoutModule = require(bulkPurchaseApp.Components.FullPagePromptTwoPanelLayout)
local dividerModule = require(bulkPurchaseApp.Components.Divider)
local itemListHeaderModule = require(bulkPurchaseApp.Components.ItemListHeader)
local fullPagePromptScrollListModule = require(bulkPurchaseApp.Components.FullPagePromptScrollList)
local boxModule = require(bulkPurchaseApp.Components.Box)
local priceBoxLineDEPRECATEDModule = require(bulkPurchaseApp.Components.PriceBoxLine_DEPRECATED)
local _ = require(parent.Style)
local itemCardThumbnail = require(parent.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail
local itemListModule = require(bulkPurchaseApp.Components.ItemList)
local _ = require(parent.AvatarExperienceCommon)
local itemStatusToItemStatusKeyModule = require(bulkPurchaseApp.Enums.ItemStatusToItemStatusKey)
local itemStatusKeyToLocalizationKeyModule = require(bulkPurchaseApp.Enums.ItemStatusKeyToLocalizationKey)

local function _(p1, p2)
	local cloned = table.clone(p1)
	cloned.id = p2
	
	return cloned
end

local t = {
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

local function mapBulkPurchasePartialSuccessItemsToRowPresentation(p1, p2, p3, p4)
	-- upvalues: itemStatusToItemStatusKeyModule (ref), reactModule (ref), itemCardThumbnail (ref)
	local t = {}
	
	for i, v in p1 do
		local cloned = table.clone({
			presentationSlot = reactModule.createElement(itemCardThumbnail, { url = v.image }),
			title = v.name,
			priceLineContent = {
				{
					type = "text",
					text = p2[itemStatusToItemStatusKeyModule[v.status]],
					colorStyle = if v.status == Enum.MarketplaceItemPurchaseStatus.Success then p3 else p4
				}
			}
		})
		cloned.id = v.id
		table.insert(t, cloned)
	end
	return t
end

return function(p5)
	-- upvalues: useDesignTokens (ref), mapTokens (ref), useLocalization (ref), t (ref), itemStatusKeyToLocalizationKeyModule (ref), reactModule (ref), fullPagePromptModule (ref), styledTextLabel (ref), fullPagePromptTwoPanelLayoutModule (ref), fullPagePromptScrollListModule (ref), itemListHeaderModule (ref), itemListModule (ref), mapBulkPurchasePartialSuccessItemsToRowPresentation (ref), dividerModule (ref), boxModule (ref), priceBoxLineDEPRECATEDModule (ref), button (ref), buttonType (ref)
	local var1 = useDesignTokens(mapTokens)
	local var2 = useLocalization(t)
	local var3 = useLocalization(itemStatusKeyToLocalizationKeyModule)
	local var4, var5 = reactModule.useBinding(Vector2.new(0, 0))
	local var6 = #p5.successfulItems > 0
	
	return reactModule.createElement(fullPagePromptModule, {
		onClose = p5.onDismiss,
		title = if var6 then var2.heading else var2.unsuccessfulHeading
	}, reactModule.createElement("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		Padding = UDim.new(0, var1.noticeMarginBottom)
	}), reactModule.createElement("Frame", {
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		[reactModule.Change.AbsoluteSize] = function(p6)
			-- upvalues: var5 (ref)
			var5(p6.AbsoluteSize)
		end
	}, reactModule.createElement(styledTextLabel, {
		layoutOrder = 1,
		fontStyle = var1.noticeFontStyle,
		colorStyle = var1.noticeColorStyle,
		text = var2.notice,
		automaticSize = Enum.AutomaticSize.XY
	})), reactModule.createElement(fullPagePromptTwoPanelLayoutModule, {
		LayoutOrder = 2,
		size = var4:map(function(p6)
			-- upvalues: var1 (ref)
			return UDim2.new(1, 0, 1, -(p6.Y + var1.noticeMarginBottom))
		end),
		startSlot = reactModule.createElement(fullPagePromptScrollListModule, {
			LayoutOrder = 1,
			size = reactModule.createBinding(UDim2.fromScale(1, 1))
		}, reactModule.createElement(itemListHeaderModule, {
			LayoutOrder = 1,
			heading = var2.itemListUnsuccessfulHeading,
			itemCount = var2.itemListUnsuccessfulCount:gsub("{.*}", tostring(#p5.unsuccessfulItems))
		}), reactModule.createElement(itemListModule, {
			LayoutOrder = 2,
			items = mapBulkPurchasePartialSuccessItemsToRowPresentation(p5.unsuccessfulItems, var3, var1.successColor, var1.failureColor)
		}), if var6 then reactModule.createElement(dividerModule, { LayoutOrder = 3 }) else nil, if var6 then reactModule.createElement(itemListHeaderModule, {
			LayoutOrder = 4,
			heading = var2.itemListSuccessfulHeading,
			itemCount = var2.itemListSuccessfulCount:gsub("{.*}", tostring(#p5.successfulItems))
		}) else nil, if var6 then reactModule.createElement(itemListModule, {
			LayoutOrder = 5,
			items = mapBulkPurchasePartialSuccessItemsToRowPresentation(p5.successfulItems, var3, var1.successColor, var1.failureColor)
		}) else nil),
		endSlot = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, var1.buttonMarginTop)
		}), reactModule.createElement(boxModule, {
			BorderSizePixel = 0,
			padding = var1.boxPadding,
			cornerRadius = UDim.new(0, var1.boxCornerRadius),
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundColor3 = var1.boxBackground
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				Padding = UDim.new(0, var1.lineItemSpacing)
			}),
			RobuxSpent = reactModule.createElement(priceBoxLineDEPRECATEDModule, {
				highlight = true,
				LayoutOrder = 1,
				text = var2.robuxSpent,
				amount = p5.robuxSpent
			}),
			CurrentBalance = reactModule.createElement(priceBoxLineDEPRECATEDModule, {
				LayoutOrder = 2,
				text = var2.currentBalance,
				amount = p5.currentBalance
			})
		}), reactModule.createElement(button, {
			text = var2.dismissCTA,
			onActivated = p5.onDismiss,
			buttonType = buttonType.PrimarySystem,
			size = UDim2.new(1, 0, 0, var1.buttonHeight)
		}))
	}))
end