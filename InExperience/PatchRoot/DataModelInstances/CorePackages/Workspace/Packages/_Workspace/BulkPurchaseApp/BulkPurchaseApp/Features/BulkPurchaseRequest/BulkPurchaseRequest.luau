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

return function(p1)
	-- upvalues: useLocalization (ref), t (ref), reactModule (ref), localizationRoactContext (ref), reactFocusNavigationModule (ref), fFlagFixVP8143Module (ref), useDesignTokens (ref), itemStatusKeyToLocalizationKeyModule (ref), mapItemsToRowPresentation (ref), fFlagBulkPurchaseEnablePurchaseOptionsModule (ref), mapOwnedItemsToRowPresentation (ref), mapUnpurchasableItemsToRowPresentation (ref), fullPagePromptModule (ref), fullPagePromptTwoPanelLayoutModule (ref), lineItemLayoutModule (ref), styledTextLabel (ref), fullPagePromptScrollListModule (ref), itemListModule (ref), dividerModule (ref), priceBoxModule (ref)
	local var1 = useLocalization(t)
	local var2 = reactModule.useContext(localizationRoactContext)
	local var3, var4 = reactFocusNavigationModule.useDefaultFocusBehavior()
	local var5 = if fFlagFixVP8143Module then reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), var3 (ref)
		if typeof(p1.purchaseButtonRef) == "table" then
			p1.purchaseButtonRef.current = p2
		end
		if typeof(var3) == "function" then
			var3(p2)
			
			return
		elseif typeof(var3) == "table" then
			var3.current = p2
		end
	end, { p1.purchaseButtonRef }) else nil
	local var6 = useDesignTokens()
	local t_1 = {
		LineHeight = var6.Typography.BodyLarge.LineHeight,
		Font = var6.Typography.TitleLarge.Font,
		FontSize = var6.Typography.BodyLarge.FontSize,
		LetterSpacing = var6.Typography.BodyLarge.LetterSpacing
	}
	local emphasis = var6.Color.Content.Emphasis
	local var7, var8 = reactModule.useBinding(Vector2.new(0, 0))
	local var9 = useLocalization(itemStatusKeyToLocalizationKeyModule)
	local success = var6.Color.System.Success
	local alert = var6.Color.System.Alert
	local var10 = mapItemsToRowPresentation(p1.items, if fFlagBulkPurchaseEnablePurchaseOptionsModule then var2 else nil)
	local t_2 = {}
	local var11 = mapOwnedItemsToRowPresentation(p1.ownedItems, emphasis, var1)
	local var12 = mapUnpurchasableItemsToRowPresentation(p1.unpurchasableItems, var9, success, alert)
	table.move(var11, 1, #var11, #t_2 + 1, t_2)
	table.move(var12, 1, #var12, #t_2 + 1, t_2)
	local var13 = #t_2 <= 0
	
	return reactModule.createElement(fullPagePromptModule, { onClose = p1.onClose, title = var1.heading, ref = var4 }, reactModule.createElement(fullPagePromptTwoPanelLayoutModule, {
		size = reactModule.createBinding(UDim2.fromScale(1, 1)),
		startSlot = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1)
		}, reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			Padding = UDim.new(0, var6.Size.Size_600)
		}), reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = 1,
			[reactModule.Change.AbsoluteSize] = function(p2)
				-- upvalues: var8 (ref)
				var8(p2.AbsoluteSize)
			end
		}, reactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, var6.Size.Size_250) }), reactModule.createElement(lineItemLayoutModule, {
			LayoutOrder = 1,
			startSlot = reactModule.createElement(styledTextLabel, {
				fontStyle = t_1,
				colorStyle = emphasis,
				text = var1.listHeading
			}),
			endSlot = reactModule.createElement(styledTextLabel, {
				fontStyle = t_1,
				colorStyle = emphasis,
				text = var1.itemCount:gsub("{.*}", tostring(#p1.items))
			})
		})), reactModule.createElement(fullPagePromptScrollListModule, {
			LayoutOrder = 2,
			size = var7:map(function(p2)
				-- upvalues: var6 (ref)
				return UDim2.new(1, 0, 1, -(p2.Y + var6.Size.Size_600))
			end)
		}, reactModule.createElement(itemListModule, { items = var10 }), if var13 then reactModule.createElement(dividerModule) else nil, if var13 then reactModule.createElement(itemListModule, { items = t_2 }) else nil)),
		endSlot = reactModule.createElement(priceBoxModule, {
			currentBalance = p1.currentBalance,
			totalCost = p1.totalCost,
			discountInformation = p1.discountInformation,
			missingRobux = p1.currentBalance - p1.totalCost < 0,
			onAccept = p1.onAccept,
			buttonRef = if fFlagFixVP8143Module then var5 else var3,
			isDisabled = p1.isDisabled
		})
	}))
end