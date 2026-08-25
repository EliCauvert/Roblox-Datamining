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

local function selectView(p0)
	return p0.view
end

local function selectInspectPreviewDetails(p1)
	return p1.avatarPreviewDetails
end

local function _(p2, p3)
	-- upvalues: viewTypeModule (ref)
	return p2 == viewTypeModule.WideLandscape or ((p2 == viewTypeModule.Wide or p2 == viewTypeModule.Compact) and not p3)
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

return function(p4)
	-- upvalues: useSelector (ref), selectView (ref), tutilsModule (ref), viewTypeModule (ref), reactModule (ref), selectInspectPreviewDetails (ref), useRemoteBulkPurchaseEventModule (ref), useInspectPlayerModule (ref), formatNumberModule (ref), useTokens (ref), fFlagAXEnableIaBTimedOptionsBulkPurchase (ref), useItemSelectionStore (ref), useLocalization (ref), verifiedBadgesModule (ref), usePurchaseButtonPropsModule (ref), useEventConnection (ref), marketplaceService (ref), itemDetailsLayoutModule (ref), avatarItemsViewLayoutModule (ref), viewportLayoutModule (ref), getItemThumbnailUrlModule (ref), t (ref)
	local var17 = useSelector(selectView, tutilsModule.deepEqual)
	local var18 = var17 == viewTypeModule.WideLandscape
	local var19, var20 = reactModule.useState(nil)
	local var21, var22 = reactModule.useState({ isTryOnEnabled = false, tryOnItem = {} })
	local items = useSelector(selectInspectPreviewDetails, tutilsModule.deepEqual).items
	local var23, var24, var25 = useRemoteBulkPurchaseEventModule(items, p4.analytics)
	local var26 = useInspectPlayerModule()
	local var27 = formatNumberModule(var25)
	local var28 = useTokens()
	local var29 = if fFlagAXEnableIaBTimedOptionsBulkPurchase then useItemSelectionStore() else nil
	local var30 = reactModule.useRef(nil)
	local var31 = reactModule.useRef(0)
	local var32 = useLocalization({
		bulkPurchaseButtonText = "Feature.Catalog.Label.BuyItems",
		total = "Feature.Catalog.Label.TotalUnformatted",
		headerText = if var26.hasVerifiedBadge then {
			"InGame.InspectMenu.Label.VerifiedAvatar",
			PLAYER_NAME = var26.playerName,
			VERIFIED_BADGE = verifiedBadgesModule.emoji.verified
		} else {
			"InGame.InspectMenu.Label.Avatar",
			PLAYER_NAME = var26.playerName
		},
		totalItems = if items then {
			"Feature.Catalog.Feature.Catalog.Label.TotalItemsParenthesis",
			itemCount = #items
		} else nil
	})
	local var33 = reactModule.useCallback(function(p5)
		-- upvalues: var22 (ref), p4 (ref)
		var22(function(p6)
			-- upvalues: p5 (ref), p4 (copy)
			local var36 = p5
			local var37 = not p6.isTryOnEnabled
			
			if var37 then
				p4.analytics.reportTryOnButtonClicked(p5.itemType, p5.itemId)
			end
			if not var37 then
				var36 = {}
			end
			return { isTryOnEnabled = var37, tryOnItem = var36 }
		end)
	end, { p4.analytics })
	local var34 = usePurchaseButtonPropsModule({
		purchaseButtonText = var32.bulkPurchaseButtonText,
		onBulkPurchase = var23,
		isDisabled = not var24,
		selectedItem = var19,
		localizedStrings = var32,
		formattedTotalPrice = var27,
		onPromptPurchase = p4.onPromptPurchase
	})
	useEventConnection(marketplaceService.PromptBulkPurchaseFinished, p4.onBulkPurchaseFinished)
	reactModule.useEffect(function()
		-- upvalues: var30 (ref), var31 (ref)
		if var30.current then
			var30.current.CanvasPosition = Vector2.new(0, var31.current)
		end
	end, { var19 })
	reactModule.useEffect(function()
		-- upvalues: var19 (ref), p4 (ref)
		if var19 then
			p4.onItemDetailsOpened(var19)
		end
	end, { var19, p4.onItemDetailsOpened })
	local var35 = if fFlagAXEnableIaBTimedOptionsBulkPurchase then reactModule.useCallback(function()
		-- upvalues: var29 (ref), p4 (ref)
		var29.clearAll()
		p4.onInspectMenuClosed()
	end, { var29, p4.onInspectMenuClosed }) else nil
	
	return {
		view = var17,
		renderFirstPanel = function()
			-- upvalues: var19 (ref), reactModule (copy), itemDetailsLayoutModule (copy), var17 (ref), var20 (ref), var22 (ref), p4 (ref), viewTypeModule (copy), var34 (ref), var33 (ref), var21 (ref), formatNumberModule (copy), avatarItemsViewLayoutModule (copy), items (ref), var32 (ref), fFlagAXEnableIaBTimedOptionsBulkPurchase (copy), var35 (ref), var30 (ref), var31 (ref), var27 (ref)
			return if var19 then reactModule.createElement(itemDetailsLayoutModule, {
				itemDetailsViewProps = {
					view = var17,
					item = var19,
					onItemDetailsClosed = function()
						-- upvalues: var20 (copy), var22 (copy)
						var20(nil)
						var22({ isTryOnEnabled = false, tryOnItem = {} })
					end,
					onToggleFavorite = p4.onToggleFavorite,
					openAttributionOverlay = p4.openAttributionOverlay,
					purchaseButtonProps = if var17 == viewTypeModule.Wide then var34.purchaseButtonProps else nil,
					onToggleTryOn = var33,
					renderTryOnViewport = p4.renderTryOnViewport,
					tryOnState = var21,
					localPlayerModel = p4.localPlayerModel,
					formatNumber = formatNumberModule
				},
				buyActionBarProps = var34,
				view = var17
			}) else reactModule.createElement(avatarItemsViewLayoutModule, {
				view = var17,
				items = items,
				headerText = var32.headerText,
				onInspectMenuClosed = if fFlagAXEnableIaBTimedOptionsBulkPurchase and var35 then var35 else p4.onInspectMenuClosed,
				onItemCardActivated = function(p7)
					-- upvalues: var30 (copy), var31 (copy), var20 (copy)
					if var30.current then
						var31.current = var30.current.CanvasPosition.Y
					end
					var20(p7)
				end,
				subheaderText = {
					leftSlotLabel = var32.totalItems or "",
					rightSlotPrice = var27
				},
				buyActionBarProps = var34,
				ref = var30
			})
		end,
		renderSecondPanel = if var17 == viewTypeModule.WideLandscape or ((var17 == viewTypeModule.Wide or var17 == viewTypeModule.Compact) and not var19) then function()
			-- upvalues: reactModule (copy), viewportLayoutModule (copy), var17 (ref), var19 (ref), getItemThumbnailUrlModule (copy), var26 (ref), var20 (ref), p4 (ref), var18 (ref), var34 (ref), var21 (ref), var28 (ref)
			return reactModule.createElement(viewportLayoutModule, {
				view = var17,
				thumbnailUrl = if var19 then getItemThumbnailUrlModule(var19) or "" else "rbxthumb://type=Avatar&id=" .. tostring(var26.playerId) .. "&w=420&h=420",
				backButtonProps = {
					onBackButtonClick = if var19 then function()
						-- upvalues: var20 (copy)
						var20(nil)
					end else p4.onInspectMenuClosed
				},
				viewportProps = {
					AspectRatio = 1,
					ScaleType = Enum.ScaleType.Crop,
					Size = if var18 then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 1, 0)
				},
				buyActionBarProps = var34,
				Size = UDim2.new(1, 0, 1, 0),
				renderTryOnViewport = p4.renderTryOnViewport,
				tryOnState = var21,
				thumbnailPadding = if var19 then {
					left = UDim.new(0, var28.Padding.XXLarge),
					right = UDim.new(0, var28.Padding.XXLarge),
					top = UDim.new(0, var28.Padding.XXLarge),
					bottom = UDim.new(0, var28.Padding.XXLarge)
				} else nil
			})
		end else nil,
		panelConfig = t[var17] or t[viewTypeModule.Wide]
	}
end