local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local MarketplaceService = game:GetService("MarketplaceService")
local Parent = AvatarExperienceInspectAndBuy.Parent
local TutilsModule = require(Parent.tutils)
local ReactModule = require(Parent.React)
local UseEventConnectionFunction = require(Parent.ReactUtils).useEventConnection
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local VerifiedBadgesModule = require(Parent.VerifiedBadges)
local FFlagAXInspectAndBuyAvatarBackground = require(Parent.AvatarExperienceFlags).FFlagAXInspectAndBuyAvatarBackground
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseItemSelectionStoreFunction = require(AvatarExperienceInspectAndBuy.Contexts.ItemSelectionStoreContext).useItemSelectionStore
local _ = require(AvatarExperienceInspectAndBuy.Components.Common.ResponsivePanelLayout)
local AvatarItemsViewLayoutModule = require(AvatarExperienceInspectAndBuy.Components.ItemsView.AvatarItemsViewLayout)
local ItemDetailsLayoutModule = require(AvatarExperienceInspectAndBuy.Components.ItemDetails.ItemDetailsLayout)
local ViewportLayoutModule = require(AvatarExperienceInspectAndBuy.Components.ItemsView.ViewportLayout)
local ViewTypeModule = require(AvatarExperienceInspectAndBuy.Enums.ViewType)
local _ = require(AvatarExperienceInspectAndBuy.Types)
local UseRemoteBulkPurchaseEventModule = require(AvatarExperienceInspectAndBuy.Hooks.useRemoteBulkPurchaseEvent)
local _ = require(AvatarExperienceInspectAndBuy.Components.Common.BuyActionBar)
local GetItemThumbnailUrlModule = require(AvatarExperienceInspectAndBuy.Utils.getItemThumbnailUrl)
local UsePurchaseButtonPropsModule = require(AvatarExperienceInspectAndBuy.Components.usePurchaseButtonProps)
local UseInspectPlayerModule = require(AvatarExperienceInspectAndBuy.Hooks.useInspectPlayer)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local FormatNumberModule = require(AvatarExperienceInspectAndBuy.Utils.formatNumber)

local function selectView(p1)
	return p1.view
end

local function selectInspectPreviewDetails(p1)
	return p1.avatarPreviewDetails
end

local function _(Compact, p1): boolean
	-- upvalues: ViewTypeModule (copy)
	return Compact == ViewTypeModule.WideLandscape or (Compact == ViewTypeModule.Wide or Compact == ViewTypeModule.Compact) and not p1
end

local config = {
	[ViewTypeModule.WideLandscape] = {
		tag = "size-full row align-y-center align-x-center",
		showRightBorder = true,
		layoutOrder = { first = 1, second = 2 },
		panelSizes = {
			first = UDim2.new(0.65, 0, 1, 0),
			second = UDim2.new(0.35, 0, 1, 0)
		}
	},
	[ViewTypeModule.Wide] = {
		tag = "size-full col align-y-center align-x-center",
		showRightBorder = false,
		layoutOrder = { first = 2, second = 1 },
		panelSizes = {
			first = UDim2.new(1, 0, 0.65, 0),
			second = UDim2.new(1, 0, 0.35, 0)
		}
	},
	[ViewTypeModule.Compact] = {
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
	-- upvalues: UseSelectorFunction (copy), selectView (copy), TutilsModule (copy), ViewTypeModule (copy), ReactModule (copy), selectInspectPreviewDetails (copy), UseRemoteBulkPurchaseEventModule (copy), UseInspectPlayerModule (copy), FormatNumberModule (copy), UseTokensFunction (copy), UseItemSelectionStoreFunction (copy), UseLocalizationFunction (copy), VerifiedBadgesModule (copy), UsePurchaseButtonPropsModule (copy), UseEventConnectionFunction (copy), MarketplaceService (copy), ItemDetailsLayoutModule (copy), AvatarItemsViewLayoutModule (copy), FFlagAXInspectAndBuyAvatarBackground (copy), ViewportLayoutModule (copy), GetItemThumbnailUrlModule (copy), config (copy)
	local UseSelectorResult = UseSelectorFunction(selectView, TutilsModule.deepEqual)
	local IsUseSelectorResultMatch = UseSelectorResult == ViewTypeModule.WideLandscape
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState({ isTryOnEnabled = false, tryOnItem = {} })
	local Items = UseSelectorFunction(selectInspectPreviewDetails, TutilsModule.deepEqual).items
	local UseRemoteBulkPurchaseEventModuleResult, UseRemoteBulkPurchaseEventModuleResult2, UseRemoteBulkPurchaseEventModuleResult3 = UseRemoteBulkPurchaseEventModule(Items, p1.analytics)
	local UseInspectPlayerModuleResult = UseInspectPlayerModule()
	local FormatNumberModuleResult = FormatNumberModule(UseRemoteBulkPurchaseEventModuleResult3)
	local UseTokensResult = UseTokensFunction()
	local UseItemSelectionStoreResult = UseItemSelectionStoreFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(0)
	local UseLocalizationResult = UseLocalizationFunction({
		bulkPurchaseButtonText = "Feature.Catalog.Label.BuyItems",
		total = "Feature.Catalog.Label.TotalUnformatted",
		headerText = if UseInspectPlayerModuleResult.hasVerifiedBadge then {
			"InGame.InspectMenu.Label.VerifiedAvatar",
			PLAYER_NAME = UseInspectPlayerModuleResult.playerName,
			VERIFIED_BADGE = VerifiedBadgesModule.emoji.verified
		} else {
			"InGame.InspectMenu.Label.Avatar",
			PLAYER_NAME = UseInspectPlayerModuleResult.playerName
		},
		totalItems = if Items then {
			"Feature.Catalog.Feature.Catalog.Label.TotalItemsParenthesis",
			itemCount = #Items
		} else nil
	})
	local UseResult = ReactModule.useCallback(function(TryOnItem)
		-- upvalues: UseStateResult2_1 (copy), p1 (copy)
		UseStateResult2_1(function(p2)
			-- upvalues: TryOnItem (copy), p1 (upval)
			local TryOnItem1 = TryOnItem
			local NoIsTryOnEnabled = not p2.isTryOnEnabled
			
			if NoIsTryOnEnabled then
				p1.analytics.reportTryOnButtonClicked(TryOnItem.itemType, TryOnItem.itemId)
			end
			if not NoIsTryOnEnabled then
				TryOnItem1 = {}
			end
			return {
				isTryOnEnabled = NoIsTryOnEnabled,
				tryOnItem = TryOnItem1
			}
		end)
	end, { p1.analytics })
	local UsePurchaseButtonPropsModuleResult = UsePurchaseButtonPropsModule({
		purchaseButtonText = UseLocalizationResult.bulkPurchaseButtonText,
		onBulkPurchase = UseRemoteBulkPurchaseEventModuleResult,
		isDisabled = not UseRemoteBulkPurchaseEventModuleResult2,
		selectedItem = UseStateResult,
		localizedStrings = UseLocalizationResult,
		formattedTotalPrice = FormatNumberModuleResult,
		onPromptPurchase = p1.onPromptPurchase
	})
	UseEventConnectionFunction(MarketplaceService.PromptBulkPurchaseFinished, p1.onBulkPurchaseFinished)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy)
		if UseRefResult.current then
			UseRefResult.current.CanvasPosition = Vector2.new(0, UseRefResult1.current)
		end
	end, { UseStateResult })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), p1 (copy)
		if UseStateResult then
			p1.onItemDetailsOpened(UseStateResult)
		end
	end, { UseStateResult, p1.onItemDetailsOpened })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseItemSelectionStoreResult (copy), p1 (copy)
		UseItemSelectionStoreResult.clearAll()
		p1.onInspectMenuClosed()
	end, { UseItemSelectionStoreResult, p1.onInspectMenuClosed })
	local AvatarBackgroundImageUrl = if FFlagAXInspectAndBuyAvatarBackground and not UseStateResult then p1.avatarBackgroundImageUrl else nil
	
	local function v44()
		-- upvalues: ReactModule (upval), ViewportLayoutModule (upval), UseSelectorResult (copy), UseStateResult (copy), GetItemThumbnailUrlModule (upval), UseInspectPlayerModuleResult (copy), UseStateResult2 (copy), p1 (copy), IsUseSelectorResultMatch (copy), UsePurchaseButtonPropsModuleResult (copy), UseStateResult1 (copy), AvatarBackgroundImageUrl (copy), UseTokensResult (copy)
		return ReactModule.createElement(ViewportLayoutModule, {
			view = UseSelectorResult,
			thumbnailUrl = if UseStateResult then GetItemThumbnailUrlModule(UseStateResult) or "" else "rbxthumb://type=Avatar&id=" .. tostring(UseInspectPlayerModuleResult.playerId) .. "&w=420&h=420",
			backButtonProps = {
				onBackButtonClick = if UseStateResult then function()
					-- upvalues: UseStateResult2 (upval)
					UseStateResult2(nil)
				end else p1.onInspectMenuClosed
			},
			viewportProps = {
				AspectRatio = 1,
				ScaleType = Enum.ScaleType.Crop,
				Size = if IsUseSelectorResultMatch then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 1, 0)
			},
			buyActionBarProps = UsePurchaseButtonPropsModuleResult,
			Size = UDim2.new(1, 0, 1, 0),
			renderTryOnViewport = p1.renderTryOnViewport,
			tryOnState = UseStateResult1,
			backgroundImageUrl = AvatarBackgroundImageUrl,
			thumbnailPadding = if UseStateResult then {
				left = UDim.new(0, UseTokensResult.Padding.XXLarge),
				right = UDim.new(0, UseTokensResult.Padding.XXLarge),
				top = UDim.new(0, UseTokensResult.Padding.XXLarge),
				bottom = UDim.new(0, UseTokensResult.Padding.XXLarge)
			} elseif AvatarBackgroundImageUrl then { top = UDim.new(0, UseTokensResult.Padding.Medium) } else nil
		})
	end
	
	local IsUseSelectorResultMatch1: boolean = UseSelectorResult == ViewTypeModule.WideLandscape or (UseSelectorResult == ViewTypeModule.Wide or UseSelectorResult == ViewTypeModule.Compact) and not UseStateResult
	
	return {
		view = UseSelectorResult,
		renderFirstPanel = function()
			-- upvalues: UseStateResult (copy), ReactModule (upval), ItemDetailsLayoutModule (upval), UseSelectorResult (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), p1 (copy), ViewTypeModule (upval), UsePurchaseButtonPropsModuleResult (copy), UseResult (copy), UseStateResult1 (copy), FormatNumberModule (upval), AvatarItemsViewLayoutModule (upval), Items (copy), UseLocalizationResult (copy), UseResult1 (copy), UseRefResult (copy), UseRefResult1 (copy), FormatNumberModuleResult (copy)
			return if UseStateResult then ReactModule.createElement(ItemDetailsLayoutModule, {
				itemDetailsViewProps = {
					view = UseSelectorResult,
					item = UseStateResult,
					onItemDetailsClosed = function()
						-- upvalues: UseStateResult2 (upval), UseStateResult2_1 (upval)
						UseStateResult2(nil)
						UseStateResult2_1({ isTryOnEnabled = false, tryOnItem = {} })
					end,
					onToggleFavorite = p1.onToggleFavorite,
					openAttributionOverlay = p1.openAttributionOverlay,
					purchaseButtonProps = if UseSelectorResult == ViewTypeModule.Wide then UsePurchaseButtonPropsModuleResult.purchaseButtonProps else nil,
					onToggleTryOn = UseResult,
					renderTryOnViewport = p1.renderTryOnViewport,
					tryOnState = UseStateResult1,
					localPlayerModel = p1.localPlayerModel,
					formatNumber = FormatNumberModule
				},
				buyActionBarProps = UsePurchaseButtonPropsModuleResult,
				view = UseSelectorResult
			}) else ReactModule.createElement(AvatarItemsViewLayoutModule, {
				view = UseSelectorResult,
				items = Items,
				headerText = UseLocalizationResult.headerText,
				onInspectMenuClosed = UseResult1,
				onItemCardActivated = function(p2)
					-- upvalues: UseRefResult (upval), UseRefResult1 (upval), UseStateResult2 (upval)
					if UseRefResult.current then
						UseRefResult1.current = UseRefResult.current.CanvasPosition.Y
					end
					UseStateResult2(p2)
				end,
				subheaderText = {
					leftSlotLabel = UseLocalizationResult.totalItems or "",
					rightSlotPrice = FormatNumberModuleResult
				},
				buyActionBarProps = UsePurchaseButtonPropsModuleResult,
				ref = UseRefResult
			})
		end,
		renderSecondPanel = if IsUseSelectorResultMatch1 then v44 else nil,
		panelConfig = config[UseSelectorResult] or config[ViewTypeModule.Wide]
	}
end