local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local marketplaceService = game:GetService("MarketplaceService")
local parent = avatarExperienceInspectAndBuy.Parent
local tutilsModule = require(parent.tutils)
local reactModule = require(parent.React)
local useEventConnection = require(parent.ReactUtils).useEventConnection
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local verifiedBadgesModule = require(parent.VerifiedBadges)
local useLocalization = require(parent.Localization).Hooks.useLocalization
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
local formatNumberModule = require(avatarExperienceInspectAndBuy.Utils.formatNumber)

local function selectView(p1)
	return p1.view
end

local function selectInspectPreviewDetails(p1)
	return p1.avatarPreviewDetails
end

local function _(p1, p2)
	-- upvalues: viewTypeModule (ref)
	return p1 == viewTypeModule.WideLandscape or ((p1 == viewTypeModule.Wide or p1 == viewTypeModule.Compact) and not p2)
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

return function(p1)
	-- upvalues: useSelector (ref), selectView (ref), tutilsModule (ref), viewTypeModule (ref), reactModule (ref), selectInspectPreviewDetails (ref), useRemoteBulkPurchaseEventModule (ref), useInspectPlayerModule (ref), formatNumberModule (ref), useTokens (ref), fFlagAXEnableIaBTimedOptionsBulkPurchase (ref), useItemSelectionStore (ref), useLocalization (ref), verifiedBadgesModule (ref), usePurchaseButtonPropsModule (ref), useEventConnection (ref), marketplaceService (ref), itemDetailsLayoutModule (ref), avatarItemsViewLayoutModule (ref), viewportLayoutModule (ref), getItemThumbnailUrlModule (ref), t (ref)
	local var1 = useSelector(selectView, tutilsModule.deepEqual)
	local var2 = var1 == viewTypeModule.WideLandscape
	local var3, var4 = reactModule.useState(nil)
	local var5, var6 = reactModule.useState({ isTryOnEnabled = false, tryOnItem = {} })
	local items = useSelector(selectInspectPreviewDetails, tutilsModule.deepEqual).items
	local var7, var8, var9 = useRemoteBulkPurchaseEventModule(items, p1.analytics)
	local var10 = useInspectPlayerModule()
	local var11 = formatNumberModule(var9)
	local var12 = useTokens()
	local var13 = if fFlagAXEnableIaBTimedOptionsBulkPurchase then useItemSelectionStore() else nil
	local var14 = reactModule.useRef(nil)
	local var15 = reactModule.useRef(0)
	local var16 = useLocalization({
		bulkPurchaseButtonText = "Feature.Catalog.Label.BuyItems",
		total = "Feature.Catalog.Label.TotalUnformatted",
		headerText = if var10.hasVerifiedBadge then {
			"InGame.InspectMenu.Label.VerifiedAvatar",
			PLAYER_NAME = var10.playerName,
			VERIFIED_BADGE = verifiedBadgesModule.emoji.verified
		} else {
			"InGame.InspectMenu.Label.Avatar",
			PLAYER_NAME = var10.playerName
		},
		totalItems = if items then {
			"Feature.Catalog.Feature.Catalog.Label.TotalItemsParenthesis",
			itemCount = #items
		} else nil
	})
	local var17 = reactModule.useCallback(function(p2)
		-- upvalues: var6 (ref), p1 (ref)
		var6(function(p3)
			-- upvalues: p2 (ref), p1 (copy)
			local var18 = p2
			local var19 = not p3.isTryOnEnabled
			
			if var19 then
				p1.analytics.reportTryOnButtonClicked(p2.itemType, p2.itemId)
			end
			if not var19 then
				var18 = {}
			end
			return { isTryOnEnabled = var19, tryOnItem = var18 }
		end)
	end, { p1.analytics })
	local var18 = usePurchaseButtonPropsModule({
		purchaseButtonText = var16.bulkPurchaseButtonText,
		onBulkPurchase = var7,
		isDisabled = not var8,
		selectedItem = var3,
		localizedStrings = var16,
		formattedTotalPrice = var11,
		onPromptPurchase = p1.onPromptPurchase
	})
	useEventConnection(marketplaceService.PromptBulkPurchaseFinished, p1.onBulkPurchaseFinished)
	reactModule.useEffect(function()
		-- upvalues: var14 (ref), var15 (ref)
		if var14.current then
			var14.current.CanvasPosition = Vector2.new(0, var15.current)
		end
	end, { var3 })
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), p1 (ref)
		if var3 then
			p1.onItemDetailsOpened(var3)
		end
	end, { var3, p1.onItemDetailsOpened })
	local var19 = if fFlagAXEnableIaBTimedOptionsBulkPurchase then reactModule.useCallback(function()
		-- upvalues: var13 (ref), p1 (ref)
		var13.clearAll()
		p1.onInspectMenuClosed()
	end, { var13, p1.onInspectMenuClosed }) else nil
	
	return {
		view = var1,
		renderFirstPanel = function()
			-- upvalues: var3 (ref), reactModule (copy), itemDetailsLayoutModule (copy), var1 (ref), var4 (ref), var6 (ref), p1 (ref), viewTypeModule (copy), var18 (ref), var17 (ref), var5 (ref), formatNumberModule (copy), avatarItemsViewLayoutModule (copy), items (ref), var16 (ref), fFlagAXEnableIaBTimedOptionsBulkPurchase (copy), var19 (ref), var14 (ref), var15 (ref), var11 (ref)
			return if var3 then reactModule.createElement(itemDetailsLayoutModule, {
				itemDetailsViewProps = {
					view = var1,
					item = var3,
					onItemDetailsClosed = function()
						-- upvalues: var4 (copy), var6 (copy)
						var4(nil)
						var6({ isTryOnEnabled = false, tryOnItem = {} })
					end,
					onToggleFavorite = p1.onToggleFavorite,
					openAttributionOverlay = p1.openAttributionOverlay,
					purchaseButtonProps = if var1 == viewTypeModule.Wide then var18.purchaseButtonProps else nil,
					onToggleTryOn = var17,
					renderTryOnViewport = p1.renderTryOnViewport,
					tryOnState = var5,
					localPlayerModel = p1.localPlayerModel,
					formatNumber = formatNumberModule
				},
				buyActionBarProps = var18,
				view = var1
			}) else reactModule.createElement(avatarItemsViewLayoutModule, {
				view = var1,
				items = items,
				headerText = var16.headerText,
				onInspectMenuClosed = if fFlagAXEnableIaBTimedOptionsBulkPurchase and var19 then var19 else p1.onInspectMenuClosed,
				onItemCardActivated = function(p2)
					-- upvalues: var14 (copy), var15 (copy), var4 (copy)
					if var14.current then
						var15.current = var14.current.CanvasPosition.Y
					end
					var4(p2)
				end,
				subheaderText = {
					leftSlotLabel = var16.totalItems or "",
					rightSlotPrice = var11
				},
				buyActionBarProps = var18,
				ref = var14
			})
		end,
		renderSecondPanel = if var1 == viewTypeModule.WideLandscape or ((var1 == viewTypeModule.Wide or var1 == viewTypeModule.Compact) and not var3) then function()
			-- upvalues: reactModule (copy), viewportLayoutModule (copy), var1 (ref), var3 (ref), getItemThumbnailUrlModule (copy), var10 (ref), var4 (ref), p1 (ref), var2 (ref), var18 (ref), var5 (ref), var12 (ref)
			return reactModule.createElement(viewportLayoutModule, {
				view = var1,
				thumbnailUrl = if var3 then getItemThumbnailUrlModule(var3) or "" else "rbxthumb://type=Avatar&id=" .. tostring(var10.playerId) .. "&w=420&h=420",
				backButtonProps = {
					onBackButtonClick = if var3 then function()
						-- upvalues: var4 (copy)
						var4(nil)
					end else p1.onInspectMenuClosed
				},
				viewportProps = {
					AspectRatio = 1,
					ScaleType = Enum.ScaleType.Crop,
					Size = if var2 then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 1, 0)
				},
				buyActionBarProps = var18,
				Size = UDim2.new(1, 0, 1, 0),
				renderTryOnViewport = p1.renderTryOnViewport,
				tryOnState = var5,
				thumbnailPadding = if var3 then {
					left = UDim.new(0, var12.Padding.XXLarge),
					right = UDim.new(0, var12.Padding.XXLarge),
					top = UDim.new(0, var12.Padding.XXLarge),
					bottom = UDim.new(0, var12.Padding.XXLarge)
				} else nil
			})
		end else nil,
		panelConfig = t[var1] or t[viewTypeModule.Wide]
	}
end