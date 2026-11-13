local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local Jest = require(Parent.Dev.JestGlobals).jest
local PromiseModule = require(Parent.Promise)
local SignalsModule = require(Parent.Signals)
local ConstantsModule = require(InExperienceShop.Constants)
local _ = require(InExperienceShop.Types)
local _ = require(InExperienceShop.Api.BonusPromotionEligibility)

return function()
	-- upvalues: SignalsModule (copy), ConstantsModule (copy), Jest (copy), PromiseModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal({})
	local Signal1, Signal2_1 = SignalsModule.createSignal({})
	local Signal3, Signal2_2 = SignalsModule.createSignal(false)
	local Signal4, Signal2_3 = SignalsModule.createSignal(nil)
	local Signal5, Signal2_4 = SignalsModule.createSignal({})
	local Signal6, Signal2_5 = SignalsModule.createSignal({ available = {}, active = {}, redeemed = {} })
	local Settled, Settled2 = SignalsModule.createSignal("settled")
	local Signal7, Signal2_6 = SignalsModule.createSignal({})
	local Signal8, Signal2_7 = SignalsModule.createSignal(nil)
	local Signal9, Signal2_8 = SignalsModule.createSignal(0)
	local Signal10, Signal2_9 = SignalsModule.createSignal(false)
	local Signal11, Signal2_10 = SignalsModule.createSignal(nil)
	local Signal12, Signal2_11 = SignalsModule.createSignal(nil)
	local Signal13, Signal2_12 = SignalsModule.createSignal({})
	local Signal14, Signal2_13 = SignalsModule.createSignal(ConstantsModule.MIN_COLUMNS)
	local Signal15, Signal2_14 = SignalsModule.createSignal(false)
	local Signal16, Signal2_15 = SignalsModule.createSignal(false)
	local Signal17, Signal2_16 = SignalsModule.createSignal(nil)
	
	return {
		store = {
			getCategories = Signal,
			getSections = Signal1,
			getLoading = Signal3,
			getError = Signal4,
			getOwnership = Signal5,
			getTrialAvailabilities = Signal6,
			getTrialAvailabilityPhase = Settled,
			getTrialRedemptionInFlight = Signal7,
			getTrialRedeemThumbnail = Signal8,
			getTrialRedeemSuccessCount = Signal9,
			getNotificationFreeTrialTopBarChip = Signal10,
			getPurchasedOwnedGamePass = Signal11,
			getTrialRedemptionError = Signal12,
			dismissTrialRedemptionError = function()
				-- upvalues: Signal2_11 (copy)
				Signal2_11(nil)
			end,
			getBonusPromotionEligibility = Signal13,
			getItemsPerRow = Signal14,
			getShouldOpenToRobuxTab = Signal15,
			getOpenedFromBuyRobux = Signal16,
			getPurchasedRobuxAmount = Signal17,
			dismissRobuxPurchaseSuccess = function()
				-- upvalues: Signal2_16 (copy)
				Signal2_16(nil)
			end,
			onShopOpened = Jest.fn(),
			fetchAllShopData = Jest.fn(),
			prefetchWidgetsOnly = Jest.fn(),
			refreshShopItemInfo = Jest.fn(),
			refreshRobuxWidgetsAfterPurchase = Jest.fn(),
			fetchGamePassOwnership = Jest.fn(),
			currentlyOwnsGamePass = Jest.fn(function()
				-- upvalues: PromiseModule (upval)
				return PromiseModule.resolve(false)
			end),
			redeemGamePassTrial = Jest.fn(),
			pollGamePassOwnership = Jest.fn(),
			bonusGamePassIdForNativePurchase = Jest.fn(),
			setItemsPerRow = Signal2_13,
			setShouldOpenToRobuxTab = Signal2_14,
			setOpenedFromBuyRobux = Signal2_15
		},
		setCategories = Signal2,
		setSections = Signal2_1,
		setLoading = Signal2_2,
		setError = Signal2_3,
		setOwnership = Signal2_4,
		setTrialAvailabilities = Signal2_5,
		setTrialAvailabilityPhase = Settled2,
		setTrialRedemptionInFlight = Signal2_6,
		setTrialRedeemThumbnail = Signal2_7,
		setTrialRedeemSuccessCount = Signal2_8,
		setNotificationFreeTrialTopBarChip = Signal2_9,
		setPurchasedOwnedGamePass = Signal2_10,
		setTrialRedemptionError = Signal2_11,
		setBonusPromotionEligibility = Signal2_12,
		setItemsPerRow = Signal2_13,
		setPurchasedRobuxAmount = Signal2_16
	}
end