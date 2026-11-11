local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local Parent = BulkPurchaseApp.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationRoactContext = require(Parent.Localization).LocalizationRoactContext
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local FFlagRenameDeprecatedUIBloxTokens = require(Parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local StyledTextLabel = require(Parent.UIBlox).App.Text.StyledTextLabel
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local FullPagePromptModule = require(BulkPurchaseApp.Components.FullPagePrompt)
local PriceBoxModule = require(BulkPurchaseApp.Components.PriceBox)
local LineItemLayoutModule = require(BulkPurchaseApp.Components.LineItemLayout)
local FullPagePromptTwoPanelLayoutModule = require(BulkPurchaseApp.Components.FullPagePromptTwoPanelLayout)
local DividerModule = require(BulkPurchaseApp.Components.Divider)
local FullPagePromptScrollListModule = require(BulkPurchaseApp.Components.FullPagePromptScrollList)
local FFlagFixVP8143Module = require(BulkPurchaseApp.Flags.FFlagFixVP8143)
local FFlagBulkPurchaseEnablePurchaseOptionsModule = require(BulkPurchaseApp.Flags.FFlagBulkPurchaseEnablePurchaseOptions)
local ItemListModule = require(BulkPurchaseApp.Components.ItemList)
local _ = require(Parent.AvatarExperienceCommon)
local ItemStatusKeyToLocalizationKeyModule = require(BulkPurchaseApp.Enums.ItemStatusKeyToLocalizationKey)
local _ = require(BulkPurchaseApp.Store.Types)
local _ = require(script.Parent.BulkPurchaseRequestItem)
local _ = require(script.Parent.BulkPurchaseRequestOwnedItem)
local _ = require(script.Parent.BulkPurchaseRequestUnpurchasableItem)
local ItemPresentationMapperModule = require(script.Parent.ItemPresentationMapper)
local MapItemsToRowPresentationFunction = ItemPresentationMapperModule.mapItemsToRowPresentation
local MapOwnedItemsToRowPresentationFunction = ItemPresentationMapperModule.mapOwnedItemsToRowPresentation
local MapUnpurchasableItemsToRowPresentationFunction = ItemPresentationMapperModule.mapUnpurchasableItemsToRowPresentation
local config = {
	heading = "CoreScripts.BulkPurchasePrompt.RequestPrompt.Heading",
	listHeading = "CoreScripts.BulkPurchasePrompt.RequestPrompt.ItemListPurchaseHeading",
	itemCount = "CoreScripts.BulkPurchasePrompt.RequestPrompt.ItemListPurchaseCount",
	itemOwned = "CoreScripts.BulkPurchasePrompt.RequestPrompt.ItemOwned"
}

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), config (copy), ReactModule (copy), LocalizationRoactContext (copy), ReactFocusNavigationModule (copy), FFlagFixVP8143Module (copy), UseDesignTokensFunction (copy), FFlagRenameDeprecatedUIBloxTokens (copy), ItemStatusKeyToLocalizationKeyModule (copy), MapItemsToRowPresentationFunction (copy), FFlagBulkPurchaseEnablePurchaseOptionsModule (copy), MapOwnedItemsToRowPresentationFunction (copy), MapUnpurchasableItemsToRowPresentationFunction (copy), FullPagePromptModule (copy), FullPagePromptTwoPanelLayoutModule (copy), LineItemLayoutModule (copy), StyledTextLabel (copy), FullPagePromptScrollListModule (copy), ItemListModule (copy), DividerModule (copy), PriceBoxModule (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	local UseContextResult = ReactModule.useContext(LocalizationRoactContext)
	local UseDefaultFocusBehaviorResult, UseDefaultFocusBehaviorResult2 = ReactFocusNavigationModule.useDefaultFocusBehavior()
	local UseResult = if FFlagFixVP8143Module then ReactModule.useCallback(function(Current)
		-- upvalues: p1 (copy), UseDefaultFocusBehaviorResult (copy)
		if typeof(p1.purchaseButtonRef) == "table" then
			p1.purchaseButtonRef.current = Current
		end
		if typeof(UseDefaultFocusBehaviorResult) == "function" then
			UseDefaultFocusBehaviorResult(Current)
			
			return
		end
		if typeof(UseDefaultFocusBehaviorResult) == "table" then
			UseDefaultFocusBehaviorResult.current = Current
		end
	end, { p1.purchaseButtonRef }) else nil
	local UseDesignTokensResult = UseDesignTokensFunction()
	local FontStyle = {
		LineHeight = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Typography.BodyLarge.LineHeight else UseDesignTokensResult.Semantic.Typography.Body.LineHeight,
		Font = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Typography.TitleLarge.Font else UseDesignTokensResult.Semantic.Typography.Subheader.Font,
		FontSize = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Typography.BodyLarge.FontSize else UseDesignTokensResult.Semantic.Typography.Body.FontSize,
		LetterSpacing = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Typography.BodyLarge.LetterSpacing else UseDesignTokensResult.Semantic.Typography.Body.LetterSpacing
	}
	local Emphasis = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Content.Emphasis else UseDesignTokensResult.Semantic.Color.Text.Emphasis
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Vector2.new(0, 0))
	local UseLocalizationResult1 = UseLocalizationFunction(ItemStatusKeyToLocalizationKeyModule)
	local MapItemsToRowPresentationResult = MapItemsToRowPresentationFunction(p1.items, if FFlagBulkPurchaseEnablePurchaseOptionsModule then UseContextResult else nil)
	local Items = {}
	local MapOwnedItemsToRowPresentationResult = MapOwnedItemsToRowPresentationFunction(p1.ownedItems, Emphasis, UseLocalizationResult)
	local MapUnpurchasableItemsToRowPresentationResult = MapUnpurchasableItemsToRowPresentationFunction(p1.unpurchasableItems, UseLocalizationResult1, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.System.Success else UseDesignTokensResult.Semantic.Color.Common.Success, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.System.Alert else UseDesignTokensResult.Semantic.Color.Common.Alert)
	table.move(MapOwnedItemsToRowPresentationResult, 1, #MapOwnedItemsToRowPresentationResult, #Items + 1, Items)
	table.move(MapUnpurchasableItemsToRowPresentationResult, 1, #MapUnpurchasableItemsToRowPresentationResult, #Items + 1, Items)
	local v1 = #Items > 0
	
	return ReactModule.createElement(FullPagePromptModule, {
		onClose = p1.onClose,
		title = UseLocalizationResult.heading,
		ref = UseDefaultFocusBehaviorResult2
	}, ReactModule.createElement(FullPagePromptTwoPanelLayoutModule, {
		size = ReactModule.createBinding(UDim2.fromScale(1, 1)),
		startSlot = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1)
		}, ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			Padding = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_600 else UseDesignTokensResult.Global.Space_300)
		}), ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = 1,
			[ReactModule.Change.AbsoluteSize] = function(Frame)
				-- upvalues: UseBindingResult2 (copy)
				UseBindingResult2(Frame.AbsoluteSize)
			end
		}, ReactModule.createElement("UIPadding", {
			PaddingRight = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_250 else UseDesignTokensResult.Global.Space_125)
		}), ReactModule.createElement(LineItemLayoutModule, {
			LayoutOrder = 1,
			startSlot = ReactModule.createElement(StyledTextLabel, {
				fontStyle = FontStyle,
				colorStyle = Emphasis,
				text = UseLocalizationResult.listHeading
			}),
			endSlot = ReactModule.createElement(StyledTextLabel, {
				fontStyle = FontStyle,
				colorStyle = Emphasis,
				text = UseLocalizationResult.itemCount:gsub("{.*}", (tostring(#p1.items)))
			})
		})), ReactModule.createElement(FullPagePromptScrollListModule, {
			LayoutOrder = 2,
			size = UseBindingResult:map(function(p2): UDim2
				-- upvalues: FFlagRenameDeprecatedUIBloxTokens (upval), UseDesignTokensResult (copy)
				return UDim2.new(1, 0, 1, -(p2.Y + (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_600 else UseDesignTokensResult.Global.Space_300)))
			end)
		}, ReactModule.createElement(ItemListModule, { items = MapItemsToRowPresentationResult }), if v1 then ReactModule.createElement(DividerModule) else nil, if v1 then ReactModule.createElement(ItemListModule, { items = Items }) else nil)),
		endSlot = ReactModule.createElement(PriceBoxModule, {
			currentBalance = p1.currentBalance,
			totalCost = p1.totalCost,
			discountInformation = p1.discountInformation,
			missingRobux = p1.currentBalance - p1.totalCost < 0,
			onAccept = p1.onAccept,
			buttonRef = if FFlagFixVP8143Module then UseResult else UseDefaultFocusBehaviorResult,
			isDisabled = p1.isDisabled
		})
	}))
end