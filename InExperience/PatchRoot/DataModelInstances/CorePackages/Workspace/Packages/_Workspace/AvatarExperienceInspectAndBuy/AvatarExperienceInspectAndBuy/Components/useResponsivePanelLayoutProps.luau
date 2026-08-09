local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local marketplaceService = game:GetService("MarketplaceService")
local localizationService = game:GetService("LocalizationService")
local parent = avatarExperienceInspectAndBuy.Parent
local tutilsModule = require(parent.tutils)
local reactModule = require(parent.React)
local useEventConnection = require(parent.ReactUtils).useEventConnection
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local verifiedBadgesModule = require(parent.VerifiedBadges)
local localizationModule = require(parent.Localization)
local numberLocalization = localizationModule.NumberLocalization
local useLocalization = localizationModule.Hooks.useLocalization
local useItemSelectionStore = require(avatarExperienceInspectAndBuy.Contexts.ItemSelectionStoreContext).useItemSelectionStore
local _ = require(avatarExperienceInspectAndBuy.Stores.createItemSelectionStore)
local fFlagAXEnableIaBTimedOptionsBulkPurchase = require(parent.AvatarExperienceFlags).FFlagAXEnableIaBTimedOptionsBulkPurchase
local _ = require(avatarExperienceInspectAndBuy.Components.Common.ResponsivePanelLayout)
local avatarItemsViewLayoutModule = require(avatarExperienceInspectAndBuy.Components.ItemsView.AvatarItemsViewLayout)
local itemDetailsLayoutModule = require(avatarExperienceInspectAndBuy.Components.ItemDetails.ItemDetailsLayout)
local viewportLayoutModule = require(avatarExperienceInspectAndBuy.Components.ItemsView.ViewportLayout)
local viewTypeModule = require(avatarExperienceInspectAndBuy.Enums.ViewType)
local _ = require(avatarExperienceInspectAndBuy.Types)
local useRemoteBulkPurchaseEventModule = require(avatarExperienceInspectAndBuy.Hooks.useRemoteBulkPurchaseEvent)
local _ = require(avatarExperienceInspectAndBuy.Components.Common.BuyActionBar)
local getItemThumbnailUrlModule = require(avatarExperienceInspectAndBuy.Utils.getItemThumbnailUrl)
local usePurchaseButtonPropsModule = require(avatarExperienceInspectAndBuy.Components.usePurchaseButtonProps)
local useInspectPlayerModule = require(avatarExperienceInspectAndBuy.Hooks.useInspectPlayer)
local useTokens = require(parent.Foundation).Hooks.useTokens
local fFlagAXFixBulkPurchaseFreeItems = require(parent.AvatarExperienceFlags).FFlagAXFixBulkPurchaseFreeItems
local fFlagIBV2Attribution = require(parent.SharedFlags).FFlagIBV2Attribution
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXReportTryOnAnalyticsIaB = avatarExperienceFlagsModule.FFlagAXReportTryOnAnalyticsIaB
local var16 = if avatarExperienceFlagsModule.FFlagAXFormatPDPPriceLabel then require(avatarExperienceInspectAndBuy.Utils.formatNumber) else function(p0) --[[ line: 61 ]]
	-- upvalues: numberLocalization (ref), localizationService (ref)
	return numberLocalization.localize(string.format("%.0f", p0 or 0), localizationService.RobloxLocaleId)
end

local function selectView(p1) --[[ line: 66 ]]
	return p1.view
end

local function selectInspectPreviewDetails(p2) --[[ line: 70 ]]
	return p2.avatarPreviewDetails
end

local function _(p3, p4) --[[ line: 81 | named "shouldRenderSecondPanel" ]]
	-- upvalues: viewTypeModule (ref)
	return p3 == viewTypeModule.WideLandscape or ((p3 == viewTypeModule.Wide or p3 == viewTypeModule.Compact) and not p4)
end

local t = {
	[viewTypeModule.WideLandscape] = {
		tag = "size-full row align-y-center align-x-center",
		showRightBorder = true,
		layoutOrder = { first = 1, second = 2 },
		panelSizes = {
			first = UDim2.new(0.65, 0, 1, 0),
			second = UDim2.new(0.35, 0, 1, 0)
		}
	},
	[viewTypeModule.Wide] = {
		tag = "size-full col align-y-center align-x-center",
		showRightBorder = false,
		layoutOrder = { first = 2, second = 1 },
		panelSizes = {
			first = UDim2.new(1, 0, 0.65, 0),
			second = UDim2.new(1, 0, 0.35, 0)
		}
	},
	[viewTypeModule.Compact] = {
		tag = "size-full col align-y-center align-x-center",
		showRightBorder = false,
		layoutOrder = { first = 2, second = 1 },
		panelSizes = {
			first = UDim2.new(1, 0, 0.7, 0),
			second = UDim2.new(1, 0, 0.3, 0)
		}
	}
}

return function(p5) --[[ line: 143 ]]
	-- upvalues: useSelector (ref), selectView (ref), tutilsModule (ref), viewTypeModule (ref), reactModule (ref), selectInspectPreviewDetails (ref), useRemoteBulkPurchaseEventModule (ref), useInspectPlayerModule (ref), var16 (ref), useTokens (ref), fFlagAXEnableIaBTimedOptionsBulkPurchase (ref), useItemSelectionStore (ref), useLocalization (ref), verifiedBadgesModule (ref), fFlagAXReportTryOnAnalyticsIaB (ref), usePurchaseButtonPropsModule (ref), fFlagAXFixBulkPurchaseFreeItems (ref), useEventConnection (ref), marketplaceService (ref), itemDetailsLayoutModule (ref), fFlagIBV2Attribution (ref), avatarItemsViewLayoutModule (ref), viewportLayoutModule (ref), getItemThumbnailUrlModule (ref), t (ref)
	local var20 = useSelector(selectView, tutilsModule.deepEqual)
	local var21 = var20 == viewTypeModule.WideLandscape
	local var22, var23 = reactModule.useState(nil)
	local var24, var25 = reactModule.useState({ isTryOnEnabled = false, tryOnItem = {} })
	local items = useSelector(selectInspectPreviewDetails, tutilsModule.deepEqual).items
	local var26, var27, var28 = useRemoteBulkPurchaseEventModule(items, p5.analytics)
	local var29 = useInspectPlayerModule()
	local var30 = var16(var28)
	local var31 = useTokens()
	local var32 = if fFlagAXEnableIaBTimedOptionsBulkPurchase then useItemSelectionStore() else nil
	local var33 = reactModule.useRef(nil)
	local var34 = reactModule.useRef(0)
	local var35 = useLocalization({
		bulkPurchaseButtonText = "Feature.Catalog.Label.BuyItems",
		total = "Feature.Catalog.Label.TotalUnformatted",
		headerText = if var29.hasVerifiedBadge then {
			"InGame.InspectMenu.Label.VerifiedAvatar",
			PLAYER_NAME = var29.playerName,
			VERIFIED_BADGE = verifiedBadgesModule.emoji.verified
		} else {
			"InGame.InspectMenu.Label.Avatar",
			PLAYER_NAME = var29.playerName
		},
		totalItems = if items then {
			"Feature.Catalog.Feature.Catalog.Label.TotalItemsParenthesis",
			itemCount = #items
		} else nil
	})
	local var36 = reactModule.useCallback(function(p6) --[[ line: 189 ]]
		-- upvalues: var25 (ref), fFlagAXReportTryOnAnalyticsIaB (copy), p5 (ref)
		var25(function(p7) --[[ line: 190 ]]
			-- upvalues: p6 (ref), fFlagAXReportTryOnAnalyticsIaB (copy), p5 (copy)
			local var39 = p6
			local var40 = not p7.isTryOnEnabled
			
			if fFlagAXReportTryOnAnalyticsIaB and var40 then
				p5.analytics.reportTryOnButtonClicked(p6.itemType, p6.itemId)
			end
			if not var40 then
				var39 = {}
			end
			return { isTryOnEnabled = var40, tryOnItem = var39 }
		end)
	end, if fFlagAXReportTryOnAnalyticsIaB then { p5.analytics } else {})
	local var37 = usePurchaseButtonPropsModule({
		purchaseButtonText = var35.bulkPurchaseButtonText,
		onBulkPurchase = var26,
		isDisabled = if fFlagAXFixBulkPurchaseFreeItems then not var27 elseif items ~= nil then if var28 ~= 0 then not var27 else true else true,
		selectedItem = var22,
		localizedStrings = var35,
		formattedTotalPrice = var30,
		onPromptPurchase = p5.onPromptPurchase
	})
	useEventConnection(marketplaceService.PromptBulkPurchaseFinished, p5.onBulkPurchaseFinished)
	reactModule.useEffect(function() --[[ line: 231 ]]
		-- upvalues: var33 (ref), var34 (ref)
		if var33.current then
			var33.current.CanvasPosition = Vector2.new(0, var34.current)
		end
	end, { var22 })
	reactModule.useEffect(function() --[[ line: 238 ]]
		-- upvalues: var22 (ref), p5 (ref)
		if var22 then
			p5.onItemDetailsOpened(var22)
		end
	end, { var22, p5.onItemDetailsOpened })
	local var38 = if fFlagAXEnableIaBTimedOptionsBulkPurchase then reactModule.useCallback(function() --[[ line: 245 ]]
		-- upvalues: var32 (ref), p5 (ref)
		var32.clearAll()
		p5.onInspectMenuClosed()
	end, { var32, p5.onInspectMenuClosed }) else nil
	
	return {
		view = var20,
		renderFirstPanel = function() --[[ line: 252 ]]
			-- upvalues: var22 (ref), reactModule (copy), itemDetailsLayoutModule (copy), var20 (ref), var23 (ref), var25 (ref), p5 (ref), fFlagIBV2Attribution (copy), viewTypeModule (copy), var37 (ref), var36 (ref), var24 (ref), var16 (copy), avatarItemsViewLayoutModule (copy), items (ref), var35 (ref), fFlagAXEnableIaBTimedOptionsBulkPurchase (copy), var38 (ref), var33 (ref), var34 (ref), var30 (ref)
			return if var22 then reactModule.createElement(itemDetailsLayoutModule, {
				itemDetailsViewProps = {
					view = var20,
					item = var22,
					onItemDetailsClosed = function() --[[ line: 258 ]]
						-- upvalues: var23 (copy), var25 (copy)
						var23(nil)
						var25({ isTryOnEnabled = false, tryOnItem = {} })
					end,
					onToggleFavorite = p5.onToggleFavorite,
					openAttributionOverlay = if fFlagIBV2Attribution then p5.openAttributionOverlay else nil,
					purchaseButtonProps = if var20 == viewTypeModule.Wide then var37.purchaseButtonProps else nil,
					onToggleTryOn = var36,
					renderTryOnViewport = p5.renderTryOnViewport,
					tryOnState = var24,
					localPlayerModel = p5.localPlayerModel,
					formatNumber = var16
				},
				buyActionBarProps = var37,
				view = var20
			}) else reactModule.createElement(avatarItemsViewLayoutModule, {
				view = var20,
				items = items,
				headerText = var35.headerText,
				onInspectMenuClosed = if fFlagAXEnableIaBTimedOptionsBulkPurchase and var38 then var38 else p5.onInspectMenuClosed,
				onItemCardActivated = function(p8) --[[ line: 286 ]]
					-- upvalues: var33 (copy), var34 (copy), var23 (copy)
					if var33.current then
						var34.current = var33.current.CanvasPosition.Y
					end
					var23(p8)
				end,
				subheaderText = {
					leftSlotLabel = var35.totalItems or "",
					rightSlotPrice = var30
				},
				buyActionBarProps = var37,
				ref = var33
			})
		end,
		renderSecondPanel = if var20 == viewTypeModule.WideLandscape or ((var20 == viewTypeModule.Wide or var20 == viewTypeModule.Compact) and not var22) then function() --[[ line: 302 ]]
			-- upvalues: reactModule (copy), viewportLayoutModule (copy), var20 (ref), var22 (ref), getItemThumbnailUrlModule (copy), var29 (ref), var23 (ref), p5 (ref), var21 (ref), var37 (ref), var24 (ref), var31 (ref)
			return reactModule.createElement(viewportLayoutModule, {
				view = var20,
				thumbnailUrl = if var22 then getItemThumbnailUrlModule(var22) or "" else "rbxthumb://type=Avatar&id=" .. tostring(var29.playerId) .. "&w=420&h=420",
				backButtonProps = {
					onBackButtonClick = if var22 then function() --[[ line: 310 ]]
						-- upvalues: var23 (copy)
						var23(nil)
					end else p5.onInspectMenuClosed
				},
				viewportProps = {
					AspectRatio = 1,
					ScaleType = Enum.ScaleType.Crop,
					Size = if var21 then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 1, 0)
				},
				buyActionBarProps = var37,
				Size = UDim2.new(1, 0, 1, 0),
				renderTryOnViewport = p5.renderTryOnViewport,
				tryOnState = var24,
				thumbnailPadding = if var22 then {
					left = UDim.new(0, var31.Padding.XXLarge),
					right = UDim.new(0, var31.Padding.XXLarge),
					top = UDim.new(0, var31.Padding.XXLarge),
					bottom = UDim.new(0, var31.Padding.XXLarge)
				} else nil
			})
		end else nil,
		panelConfig = t[var20] or t[viewTypeModule.Wide]
	}
end