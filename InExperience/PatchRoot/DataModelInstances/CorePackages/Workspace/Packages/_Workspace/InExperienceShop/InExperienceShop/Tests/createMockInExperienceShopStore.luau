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
	local Signal7, Signal2_6 = SignalsModule.createSignal({})
	local Signal8, Signal2_7 = SignalsModule.createSignal(nil)
	local Signal9, Signal2_8 = SignalsModule.createSignal({})
	local Signal10, Signal2_9 = SignalsModule.createSignal(ConstantsModule.MIN_COLUMNS)
	local Signal11, Signal2_10 = SignalsModule.createSignal(false)
	local Signal12, Signal2_11 = SignalsModule.createSignal(false)
	local Signal13, Signal2_12 = SignalsModule.createSignal(nil)
	
	return {
		store = {
			getCategories = Signal,
			getSections = Signal1,
			getLoading = Signal3,
			getError = Signal4,
			getOwnership = Signal5,
			getTrialAvailabilities = Signal6,
			getTrialRedemptionInFlight = Signal7,
			getTrialRedemptionError = Signal8,
			dismissTrialRedemptionError = function()
				-- upvalues: Signal2_7 (copy)
				Signal2_7(nil)
			end,
			getBonusPromotionEligibility = Signal9,
			getItemsPerRow = Signal10,
			getShouldOpenToRobuxTab = Signal11,
			getOpenedFromBuyRobux = Signal12,
			getPurchasedRobuxAmount = Signal13,
			dismissRobuxPurchaseSuccess = function()
				-- upvalues: Signal2_12 (copy)
				Signal2_12(nil)
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
			setItemsPerRow = Signal2_9,
			setShouldOpenToRobuxTab = Signal2_10,
			setOpenedFromBuyRobux = Signal2_11
		},
		setCategories = Signal2,
		setSections = Signal2_1,
		setLoading = Signal2_2,
		setError = Signal2_3,
		setOwnership = Signal2_4,
		setTrialAvailabilities = Signal2_5,
		setTrialRedemptionInFlight = Signal2_6,
		setTrialRedemptionError = Signal2_7,
		setBonusPromotionEligibility = Signal2_8,
		setItemsPerRow = Signal2_9,
		setPurchasedRobuxAmount = Signal2_12
	}
end