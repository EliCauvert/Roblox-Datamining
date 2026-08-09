local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local parent = bulkPurchaseApp.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationRoactContext = require(parent.Localization).LocalizationRoactContext
local useDesignTokens = require(parent.Style).useDesignTokens
local fFlagRenameDeprecatedUIBloxTokens = require(parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
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

return function(p0) --[[ line: 63 | named "BulkPurchaseRequest" ]]
	-- upvalues: useLocalization (ref), t (ref), reactModule (ref), localizationRoactContext (ref), reactFocusNavigationModule (ref), fFlagFixVP8143Module (ref), useDesignTokens (ref), fFlagRenameDeprecatedUIBloxTokens (ref), itemStatusKeyToLocalizationKeyModule (ref), mapItemsToRowPresentation (ref), fFlagBulkPurchaseEnablePurchaseOptionsModule (ref), mapOwnedItemsToRowPresentation (ref), mapUnpurchasableItemsToRowPresentation (ref), fullPagePromptModule (ref), fullPagePromptTwoPanelLayoutModule (ref), lineItemLayoutModule (ref), styledTextLabel (ref), fullPagePromptScrollListModule (ref), itemListModule (ref), dividerModule (ref), priceBoxModule (ref)
	local var15 = useLocalization(t)
	local var16 = reactModule.useContext(localizationRoactContext)
	local var17, var18 = reactFocusNavigationModule.useDefaultFocusBehavior()
	local var19 = if fFlagFixVP8143Module then reactModule.useCallback(function(p1) --[[ line: 68 ]]
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
		LineHeight = if fFlagRenameDeprecatedUIBloxTokens then var20.Typography.BodyLarge.LineHeight else var20.Semantic.Typography.Body.LineHeight,
		Font = if fFlagRenameDeprecatedUIBloxTokens then var20.Typography.TitleLarge.Font else var20.Semantic.Typography.Subheader.Font,
		FontSize = if fFlagRenameDeprecatedUIBloxTokens then var20.Typography.BodyLarge.FontSize else var20.Semantic.Typography.Body.FontSize,
		LetterSpacing = if fFlagRenameDeprecatedUIBloxTokens then var20.Typography.BodyLarge.LetterSpacing else var20.Semantic.Typography.Body.LetterSpacing
	}
	local var22 = if fFlagRenameDeprecatedUIBloxTokens then var20.Color.Content.Emphasis else var20.Semantic.Color.Text.Emphasis
	local var23, var24 = reactModule.useBinding(Vector2.new(0, 0))
	local var25 = useLocalization(itemStatusKeyToLocalizationKeyModule)
	local var26 = if fFlagRenameDeprecatedUIBloxTokens then var20.Color.System.Success else var20.Semantic.Color.Common.Success
	local var27 = if fFlagRenameDeprecatedUIBloxTokens then var20.Color.System.Alert else var20.Semantic.Color.Common.Alert
	local var28 = mapItemsToRowPresentation(p0.items, if fFlagBulkPurchaseEnablePurchaseOptionsModule then var16 else nil)
	local t_2 = {}
	local var30 = mapOwnedItemsToRowPresentation(p0.ownedItems, var22, var15)
	local var31 = mapUnpurchasableItemsToRowPresentation(p0.unpurchasableItems, var25, var26, var27)
	table.move(var30, 1, #var30, #t_2 + 1, t_2)
	table.move(var31, 1, #var31, #t_2 + 1, t_2)
	local var32 = #t_2 <= 0
	
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
			Padding = UDim.new(0, if fFlagRenameDeprecatedUIBloxTokens then var20.Size.Size_600 else var20.Global.Space_300)
		}), reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = 1,
			[reactModule.Change.AbsoluteSize] = function(p2) --[[ line: 163 ]]
				-- upvalues: var24 (ref)
				var24(p2.AbsoluteSize)
			end
		}, reactModule.createElement("UIPadding", {
			PaddingRight = UDim.new(0, if fFlagRenameDeprecatedUIBloxTokens then var20.Size.Size_250 else var20.Global.Space_125)
		}), reactModule.createElement(lineItemLayoutModule, {
			LayoutOrder = 1,
			startSlot = reactModule.createElement(styledTextLabel, {
				fontStyle = t_1,
				colorStyle = var22,
				text = var15.listHeading
			}),
			endSlot = reactModule.createElement(styledTextLabel, {
				fontStyle = t_1,
				colorStyle = var22,
				text = var15.itemCount:gsub("{.*}", tostring(#p0.items))
			})
		})), reactModule.createElement(fullPagePromptScrollListModule, {
			LayoutOrder = 2,
			size = var23:map(function(p3) --[[ line: 194 ]]
				-- upvalues: fFlagRenameDeprecatedUIBloxTokens (copy), var20 (ref)
				return UDim2.new(1, 0, 1, -(p3.Y + (if fFlagRenameDeprecatedUIBloxTokens then var20.Size.Size_600 else var20.Global.Space_300)))
			end)
		}, reactModule.createElement(itemListModule, { items = var28 }), if var32 then reactModule.createElement(dividerModule) else nil, if var32 then reactModule.createElement(itemListModule, { items = t_2 }) else nil)),
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