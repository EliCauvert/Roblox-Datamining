local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local Jest = require(Parent.Dev.JestGlobals).jest
local SignalsModule = require(Parent.Signals)
local ConstantsModule = require(InExperienceShop.Constants)
local _ = require(InExperienceShop.Types)
local _ = require(InExperienceShop.Api.BonusPromotionEligibility)

return function()
	-- upvalues: SignalsModule (copy), ConstantsModule (copy), Jest (copy)
	local Signal, Signal2 = SignalsModule.createSignal({})
	local Signal1, Signal2_1 = SignalsModule.createSignal({})
	local Signal3, Signal2_2 = SignalsModule.createSignal(false)
	local Signal4, Signal2_3 = SignalsModule.createSignal(nil)
	local Signal5, Signal2_4 = SignalsModule.createSignal({})
	local Signal6, Signal2_5 = SignalsModule.createSignal({ available = {}, active = {}, redeemed = {} })
	local Settled, Settled2 = SignalsModule.createSignal("settled")
	local Signal7, Signal2_6 = SignalsModule.createSignal({})
	local Signal8, Signal2_7 = SignalsModule.createSignal(0)
	local Signal9, Signal2_8 = SignalsModule.createSignal(false)
	local Signal10, Signal2_9 = SignalsModule.createSignal(nil)
	local Signal11, Signal2_10 = SignalsModule.createSignal({})
	local Signal12, Signal2_11 = SignalsModule.createSignal(ConstantsModule.MIN_COLUMNS)
	local Signal13, Signal2_12 = SignalsModule.createSignal(false)
	local Signal14, Signal2_13 = SignalsModule.createSignal(false)
	local Signal15, Signal2_14 = SignalsModule.createSignal(nil)
	
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
			getTrialRedeemSuccessCount = Signal8,
			getNotificationFreeTrialTopBarChip = Signal9,
			getTrialRedemptionError = Signal10,
			dismissTrialRedemptionError = function()
				-- upvalues: Signal2_9 (copy)
				Signal2_9(nil)
			end,
			getBonusPromotionEligibility = Signal11,
			getItemsPerRow = Signal12,
			getShouldOpenToRobuxTab = Signal13,
			getOpenedFromBuyRobux = Signal14,
			getPurchasedRobuxAmount = Signal15,
			dismissRobuxPurchaseSuccess = function()
				-- upvalues: Signal2_14 (copy)
				Signal2_14(nil)
			end,
			onShopOpened = Jest.fn(),
			fetchAllShopData = Jest.fn(),
			prefetchWidgetsOnly = Jest.fn(),
			refreshShopItemInfo = Jest.fn(),
			refreshRobuxWidgetsAfterPurchase = Jest.fn(),
			fetchGamePassOwnership = Jest.fn(),
			redeemGamePassTrial = Jest.fn(),
			pollGamePassOwnership = Jest.fn(),
			bonusGamePassIdForNativePurchase = Jest.fn(),
			setItemsPerRow = Signal2_11,
			setShouldOpenToRobuxTab = Signal2_12,
			setOpenedFromBuyRobux = Signal2_13
		},
		setCategories = Signal2,
		setSections = Signal2_1,
		setLoading = Signal2_2,
		setError = Signal2_3,
		setOwnership = Signal2_4,
		setTrialAvailabilities = Signal2_5,
		setTrialAvailabilityPhase = Settled2,
		setTrialRedemptionInFlight = Signal2_6,
		setTrialRedeemSuccessCount = Signal2_7,
		setNotificationFreeTrialTopBarChip = Signal2_8,
		setTrialRedemptionError = Signal2_9,
		setBonusPromotionEligibility = Signal2_10,
		setItemsPerRow = Signal2_11,
		setPurchasedRobuxAmount = Signal2_14
	}
end