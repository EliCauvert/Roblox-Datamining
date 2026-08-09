local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local parent = bulkPurchaseApp.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useDesignTokens = require(parent.Style).useDesignTokens
local UIBloxModule = require(parent.UIBlox)
local fFlagRenameDeprecatedUIBloxTokens = require(parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
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

local function _(p0, p1) --[[ line: 34 | named "toCardPropsWithId" ]]
	local cloned = table.clone(p0)
	cloned.id = p1
	
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

local function mapTokens(p2) --[[ line: 60 ]]
	-- upvalues: fFlagRenameDeprecatedUIBloxTokens (ref)
	return {
		boxBackground = (if fFlagRenameDeprecatedUIBloxTokens then p2.Color.Surface.Surface_100 else p2.Semantic.Color.Background.Contrast).Color3,
		boxPadding = if fFlagRenameDeprecatedUIBloxTokens then p2.Size.Size_600 else p2.Global.Space_300,
		boxCornerRadius = if fFlagRenameDeprecatedUIBloxTokens then p2.Radius.Medium else p2.Semantic.Radius.Medium,
		buttonMarginTop = if fFlagRenameDeprecatedUIBloxTokens then p2.Size.Size_400 else p2.Global.Space_200,
		buttonHeight = if fFlagRenameDeprecatedUIBloxTokens then p2.Size.Size_900 else p2.Global.Size_450,
		lineItemSpacing = if fFlagRenameDeprecatedUIBloxTokens then p2.Size.Size_100 else p2.Global.Space_50,
		noticeFontStyle = if fFlagRenameDeprecatedUIBloxTokens then p2.Typography.BodyLarge else p2.Semantic.Typography.Body,
		noticeColorStyle = if fFlagRenameDeprecatedUIBloxTokens then p2.Color.Content.Muted else p2.Semantic.Color.Text.Muted,
		noticeMarginBottom = if fFlagRenameDeprecatedUIBloxTokens then p2.Size.Size_600 else p2.Global.Space_300,
		successColor = if fFlagRenameDeprecatedUIBloxTokens then p2.Color.System.Success else p2.Semantic.Color.Common.Success,
		failureColor = if fFlagRenameDeprecatedUIBloxTokens then p2.Color.System.Alert else p2.Semantic.Color.Common.Alert
	}
end

local function mapBulkPurchasePartialSuccessItemsToRowPresentation(p3, p4, p5, p6) --[[ line: 90 ]]
	-- upvalues: itemStatusToItemStatusKeyModule (ref), reactModule (ref), itemCardThumbnail (ref)
	local t = {}
	
	for i, v in p3 do
		local cloned = table.clone({
			presentationSlot = reactModule.createElement(itemCardThumbnail, { url = v.image }),
			title = v.name,
			priceLineContent = {
				{
					type = "text",
					text = p4[itemStatusToItemStatusKeyModule[v.status]],
					colorStyle = if v.status == Enum.MarketplaceItemPurchaseStatus.Success then p5 else p6
				}
			}
		})
		cloned.id = v.id
		table.insert(t, cloned)
	end
	return t
end

return function(p7) --[[ line: 127 | named "BulkPurchasePartialSuccess" ]]
	-- upvalues: useDesignTokens (ref), mapTokens (ref), useLocalization (ref), t (ref), itemStatusKeyToLocalizationKeyModule (ref), reactModule (ref), fullPagePromptModule (ref), styledTextLabel (ref), fullPagePromptTwoPanelLayoutModule (ref), fullPagePromptScrollListModule (ref), itemListHeaderModule (ref), itemListModule (ref), mapBulkPurchasePartialSuccessItemsToRowPresentation (ref), dividerModule (ref), boxModule (ref), priceBoxLineDEPRECATEDModule (ref), button (ref), buttonType (ref)
	local var19 = useDesignTokens(mapTokens)
	local var20 = useLocalization(t)
	local var21 = useLocalization(itemStatusKeyToLocalizationKeyModule)
	local var22, var23 = reactModule.useBinding(Vector2.new(0, 0))
	local var24 = #p7.successfulItems > 0
	
	return reactModule.createElement(fullPagePromptModule, {
		onClose = p7.onDismiss,
		title = if var24 then var20.heading else var20.unsuccessfulHeading
	}, reactModule.createElement("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		Padding = UDim.new(0, var19.noticeMarginBottom)
	}), reactModule.createElement("Frame", {
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		[reactModule.Change.AbsoluteSize] = function(p8) --[[ line: 153 ]]
			-- upvalues: var23 (ref)
			var23(p8.AbsoluteSize)
		end
	}, reactModule.createElement(styledTextLabel, {
		layoutOrder = 1,
		fontStyle = var19.noticeFontStyle,
		colorStyle = var19.noticeColorStyle,
		text = var20.notice,
		automaticSize = Enum.AutomaticSize.XY
	})), reactModule.createElement(fullPagePromptTwoPanelLayoutModule, {
		LayoutOrder = 2,
		size = var22:map(function(p9) --[[ line: 167 ]]
			-- upvalues: var19 (ref)
			return UDim2.new(1, 0, 1, -(p9.Y + var19.noticeMarginBottom))
		end),
		startSlot = reactModule.createElement(fullPagePromptScrollListModule, {
			LayoutOrder = 1,
			size = reactModule.createBinding(UDim2.fromScale(1, 1))
		}, reactModule.createElement(itemListHeaderModule, {
			LayoutOrder = 1,
			heading = var20.itemListUnsuccessfulHeading,
			itemCount = var20.itemListUnsuccessfulCount:gsub("{.*}", tostring(#p7.unsuccessfulItems))
		}), reactModule.createElement(itemListModule, {
			LayoutOrder = 2,
			items = mapBulkPurchasePartialSuccessItemsToRowPresentation(p7.unsuccessfulItems, var21, var19.successColor, var19.failureColor)
		}), if var24 then reactModule.createElement(dividerModule, { LayoutOrder = 3 }) else nil, if var24 then reactModule.createElement(itemListHeaderModule, {
			LayoutOrder = 4,
			heading = var20.itemListSuccessfulHeading,
			itemCount = var20.itemListSuccessfulCount:gsub("{.*}", tostring(#p7.successfulItems))
		}) else nil, if var24 then reactModule.createElement(itemListModule, {
			LayoutOrder = 5,
			items = mapBulkPurchasePartialSuccessItemsToRowPresentation(p7.successfulItems, var21, var19.successColor, var19.failureColor)
		}) else nil),
		endSlot = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, var19.buttonMarginTop)
		}), reactModule.createElement(boxModule, {
			BorderSizePixel = 0,
			padding = var19.boxPadding,
			cornerRadius = UDim.new(0, var19.boxCornerRadius),
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundColor3 = var19.boxBackground
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				Padding = UDim.new(0, var19.lineItemSpacing)
			}),
			RobuxSpent = reactModule.createElement(priceBoxLineDEPRECATEDModule, {
				highlight = true,
				LayoutOrder = 1,
				text = var20.robuxSpent,
				amount = p7.robuxSpent
			}),
			CurrentBalance = reactModule.createElement(priceBoxLineDEPRECATEDModule, {
				LayoutOrder = 2,
				text = var20.currentBalance,
				amount = p7.currentBalance
			})
		}), reactModule.createElement(button, {
			text = var20.dismissCTA,
			onActivated = p7.onDismiss,
			buttonType = buttonType.PrimarySystem,
			size = UDim2.new(1, 0, 0, var19.buttonHeight)
		}))
	}))
end