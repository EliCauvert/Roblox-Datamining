local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local SharedFlagsModule = require(Parent.SharedFlags)
local AbuseVectorModule = require(Parent.GenericAbuseReporting.AbuseVector)
local InitiateShopItemPurchaseModule = require(InExperienceShop.initiateShopItemPurchase)
local FormatUpdatedDateModule = require(InExperienceShop.Utils.formatUpdatedDate)
local GetInExperienceShopStoreModule = require(InExperienceShop.Stores.getInExperienceShopStore)
local UseShopReportOverflowModule = require(InExperienceShop.Hooks.useShopReportOverflow)
local _ = require(InExperienceShop.Types)
local _ = require(script.Parent.ItemDetailsView)
local config = { product = "Feature.DeveloperProducts.Label.Product" }

local function _(p1, p2)
	return if p1 == "GamePass" then "Game pass" else p2
end

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), config (copy), SignalsReactModule (copy), GetInExperienceShopStoreModule (copy), ReactModule (copy), InitiateShopItemPurchaseModule (copy), SharedFlagsModule (copy), AbuseVectorModule (copy), UseShopReportOverflowModule (copy), FormatUpdatedDateModule (copy)
	local Item = p1.item
	local UseLocalizationResult = UseLocalizationFunction(config)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetInExperienceShopStoreModule)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(function(p2)
		-- upvalues: UseSignalStateResult (copy), Item (copy)
		return UseSignalStateResult.getOwnership(p2)[Item.id]
	end)
	ReactModule.useEffect(function()
		-- upvalues: Item (copy), UseSignalStateResult (copy)
		if Item.itemType == "GamePass" then
			UseSignalStateResult.fetchGamePassOwnership(Item.id)
		end
	end, {
		Item.id,
		Item.itemType,
		UseSignalStateResult.fetchGamePassOwnership
	})
	local IsOwned = if UseSignalStateResult1 == nil then Item.isOwned else UseSignalStateResult1
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: InitiateShopItemPurchaseModule (upval), Item (copy)
		InitiateShopItemPurchaseModule(Item.id, Item.itemType)
	end, { Item.id, Item.itemType })
	local UseShopReportOverflowResult = UseShopReportOverflowModule.useShopReportOverflow({
		isReportingEnabled = SharedFlagsModule.FFlagEnableReportingFlowForExperienceShop,
		buildReportSession = ReactModule.useCallback(function()
			-- upvalues: Item (copy), AbuseVectorModule (upval)
			return if Item.itemType == "GamePass" then {
				abuseVector = AbuseVectorModule.GamePass,
				targetId = Item.id
			} else {
				abuseVector = AbuseVectorModule.DeveloperProduct,
				targetId = Item.id
			}
		end, { Item.id, Item.itemType })
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FormatUpdatedDateModule (upval), Item (copy)
		return FormatUpdatedDateModule(Item.updated)
	end, { Item.updated })
	local Product = UseLocalizationResult.product
	local GamePass = if Item.itemType == "GamePass" then "Game pass" else Product
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	
	return {
		itemId = Item.id,
		name = Item.name,
		thumbnail = Item.thumbnail,
		price = Item.price,
		isOwned = IsOwned,
		isBuyDisabled = p1.disableBuy == true,
		description = Item.description,
		creator = Item.creator,
		categoryLabel = GamePass,
		updated = UseMemoResult,
		isCompact = UseStateResult,
		isOverflowMenuOpen = UseShopReportOverflowResult.isOverflowMenuOpen,
		isReportingEnabled = UseShopReportOverflowResult.isReportingEnabled,
		reportSession = UseShopReportOverflowResult.reportSession,
		onClose = p1.onClose,
		onBuyActivated = UseResult,
		onOverflowActivated = UseShopReportOverflowResult.onOverflowActivated,
		onOverflowMenuClosed = UseShopReportOverflowResult.onOverflowMenuClosed,
		onMenuItemActivated = UseShopReportOverflowResult.onMenuItemActivated,
		onReportClose = UseShopReportOverflowResult.onReportClose,
		onAbsoluteSizeChanged = ReactModule.useCallback(function(Frame)
			-- upvalues: UseStateResult2 (copy)
			local X: number = Frame.AbsoluteSize.X
			
			if X > 0 then
				local IsXBelow = X < 480
				UseStateResult2(function(p2)
					-- upvalues: IsXBelow (copy)
					return if p2 == IsXBelow then p2 else IsXBelow
				end)
				
				return
			end
		end, {})
	}
end