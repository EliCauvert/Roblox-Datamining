local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local parent = bulkPurchaseApp.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationRoactContext = require(parent.Localization).LocalizationRoactContext
local useDesignTokens = require(parent.Style).useDesignTokens
local styledTextLabel = require(parent.UIBlox).App.Text.StyledTextLabel
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local fullPagePromptModule = require(bulkPurchaseApp.Components.FullPagePrompt)
local priceBoxModule = require(bulkPurchaseApp.Components.PriceBox)
local lineItemLayoutModule = require(bulkPurchaseApp.Components.LineItemLayout)
local fullPagePromptTwoPanelLayoutModule = require(bulkPurchaseApp.Components.FullPagePromptTwoPanelLayout)
local dividerModule = require(bulkPurchaseApp.Components.Divider)
local fullPagePromptScrollListModule = require(bulkPurchaseApp.Components.FullPagePromptScrollList)
local fFlagFixVP8143Module = require(bulkPurchaseApp.Flags.FFlagFixVP8143)
local fFlagBulkPurchaseEnablePurchaseOptionsModule = require(bulkPurchaseApp.Flags.FFlagBulkPurchaseEnablePurchaseOptions)
local itemListModule = require(bulkPurchaseApp.Components.ItemList)
local _ = require(parent.AvatarExperienceCommon)
local itemStatusKeyToLocalizationKeyModule = require(bulkPurchaseApp.Enums.ItemStatusKeyToLocalizationKey)
local _ = require(bulkPurchaseApp.Store.Types)
local _ = require(script.Parent.BulkPurchaseRequestItem)
local _ = require(script.Parent.BulkPurchaseRequestOwnedItem)
local _ = require(script.Parent.BulkPurchaseRequestUnpurchasableItem)
local itemPresentationMapperModule = require(script.Parent.ItemPresentationMapper)
local mapItemsToRowPresentation = itemPresentationMapperModule.mapItemsToRowPresentation
local mapOwnedItemsToRowPresentation = itemPresentationMapperModule.mapOwnedItemsToRowPresentation
local mapUnpurchasableItemsToRowPresentation = itemPresentationMapperModule.mapUnpurchasableItemsToRowPresentation
local t = {
	heading = "CoreScripts.BulkPurchasePrompt.RequestPrompt.Heading",
	listHeading = "CoreScripts.BulkPurchasePrompt.RequestPrompt.ItemListPurchaseHeading",
	itemCount = "CoreScripts.BulkPurchasePrompt.RequestPrompt.ItemListPurchaseCount",
	itemOwned = "CoreScripts.BulkPurchasePrompt.RequestPrompt.ItemOwned"
}

return function(p0)
	-- upvalues: useLocalization (ref), t (ref), reactModule (ref), localizationRoactContext (ref), reactFocusNavigationModule (ref), fFlagFixVP8143Module (ref), useDesignTokens (ref), itemStatusKeyToLocalizationKeyModule (ref), mapItemsToRowPresentation (ref), fFlagBulkPurchaseEnablePurchaseOptionsModule (ref), mapOwnedItemsToRowPresentation (ref), mapUnpurchasableItemsToRowPresentation (ref), fullPagePromptModule (ref), fullPagePromptTwoPanelLayoutModule (ref), lineItemLayoutModule (ref), styledTextLabel (ref), fullPagePromptScrollListModule (ref), itemListModule (ref), dividerModule (ref), priceBoxModule (ref)
	local var15 = useLocalization(t)
	local var16 = reactModule.useContext(localizationRoactContext)
	local var17, var18 = reactFocusNavigationModule.useDefaultFocusBehavior()
	local var19 = if fFlagFixVP8143Module then reactModule.useCallback(function(p1)
		-- upvalues: p0 (ref), var17 (ref)
		if typeof(p0.purchaseButtonRef) == "table" then
			p0.purchaseButtonRef.current = p1
		end
		if typeof(var17) == "function" then
			var17(p1)
			
			return
		elseif typeof(var17) == "table" then
			var17.current = p1
		end
	end, { p0.purchaseButtonRef }) else nil
	local var20 = useDesignTokens()
	local t_1 = {
		LineHeight = var20.Typography.BodyLarge.LineHeight,
		Font = var20.Typography.TitleLarge.Font,
		FontSize = var20.Typography.BodyLarge.FontSize,
		LetterSpacing = var20.Typography.BodyLarge.LetterSpacing
	}
	local emphasis = var20.Color.Content.Emphasis
	local var22, var23 = reactModule.useBinding(Vector2.new(0, 0))
	local var24 = useLocalization(itemStatusKeyToLocalizationKeyModule)
	local success = var20.Color.System.Success
	local alert = var20.Color.System.Alert
	local var25 = mapItemsToRowPresentation(p0.items, if fFlagBulkPurchaseEnablePurchaseOptionsModule then var16 else nil)
	local t_2 = {}
	local var27 = mapOwnedItemsToRowPresentation(p0.ownedItems, emphasis, var15)
	local var28 = mapUnpurchasableItemsToRowPresentation(p0.unpurchasableItems, var24, success, alert)
	table.move(var27, 1, #var27, #t_2 + 1, t_2)
	table.move(var28, 1, #var28, #t_2 + 1, t_2)
	local var29 = #t_2 <= 0
	
	return reactModule.createElement(fullPagePromptModule, { onClose = p0.onClose, title = var15.heading, ref = var18 }, reactModule.createElement(fullPagePromptTwoPanelLayoutModule, {
		size = reactModule.createBinding(UDim2.fromScale(1, 1)),
		startSlot = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1)
		}, reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			Padding = UDim.new(0, var20.Size.Size_600)
		}), reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = 1,
			[reactModule.Change.AbsoluteSize] = function(p2)
				-- upvalues: var23 (ref)
				var23(p2.AbsoluteSize)
			end
		}, reactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, var20.Size.Size_250) }), reactModule.createElement(lineItemLayoutModule, {
			LayoutOrder = 1,
			startSlot = reactModule.createElement(styledTextLabel, {
				fontStyle = t_1,
				colorStyle = emphasis,
				text = var15.listHeading
			}),
			endSlot = reactModule.createElement(styledTextLabel, {
				fontStyle = t_1,
				colorStyle = emphasis,
				text = var15.itemCount:gsub("{.*}", tostring(#p0.items))
			})
		})), reactModule.createElement(fullPagePromptScrollListModule, {
			LayoutOrder = 2,
			size = var22:map(function(p3)
				-- upvalues: var20 (ref)
				return UDim2.new(1, 0, 1, -(p3.Y + var20.Size.Size_600))
			end)
		}, reactModule.createElement(itemListModule, { items = var25 }), if var29 then reactModule.createElement(dividerModule) else nil, if var29 then reactModule.createElement(itemListModule, { items = t_2 }) else nil)),
		endSlot = reactModule.createElement(priceBoxModule, {
			currentBalance = p0.currentBalance,
			totalCost = p0.totalCost,
			discountInformation = p0.discountInformation,
			missingRobux = p0.currentBalance - p0.totalCost < 0,
			onAccept = p0.onAccept,
			buttonRef = if fFlagFixVP8143Module then var19 else var17,
			isDisabled = p0.isDisabled
		})
	}))
end