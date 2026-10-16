local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local Jest = require(Parent.Dev.JestGlobals).jest
local SignalsModule = require(Parent.Signals)
local ConstantsModule = require(InExperienceShop.Constants)
local _ = require(InExperienceShop.Types)
local _ = require(InExperienceShop.Api.BonusPromotionEligibility)

return function() --[[ Line: 75 | Named "createMockInExperienceShopStore" ]]
	-- upvalues: SignalsModule (copy), ConstantsModule (copy), Jest (copy)
	local Signal, Signal2 = SignalsModule.createSignal({})
	local Signal1, Signal2_1 = SignalsModule.createSignal({})
	local Signal3, Signal2_2 = SignalsModule.createSignal(false)
	local Signal4, Signal2_3 = SignalsModule.createSignal(nil)
	local Signal5, Signal2_4 = SignalsModule.createSignal({})
	local Signal6, Signal2_5 = SignalsModule.createSignal({ available = {}, active = {} })
	local Signal7, Signal2_6 = SignalsModule.createSignal({})
	local Signal8, Signal2_7 = SignalsModule.createSignal({})
	local Signal9, Signal2_8 = SignalsModule.createSignal(ConstantsModule.MIN_COLUMNS)
	local Signal10, Signal2_9 = SignalsModule.createSignal(false)
	local Signal11, Signal2_10 = SignalsModule.createSignal(false)
	local Signal12, Signal2_11 = SignalsModule.createSignal(nil)
	
	return {
		store = {
			getCategories = Signal,
			getSections = Signal1,
			getLoading = Signal3,
			getError = Signal4,
			getOwnership = Signal5,
			getTrialAvailabilities = Signal6,
			getTrialRedemptionInFlight = Signal7,
			getBonusPromotionEligibility = Signal8,
			getItemsPerRow = Signal9,
			getShouldOpenToRobuxTab = Signal10,
			getOpenedFromBuyRobux = Signal11,
			getPurchasedRobuxAmount = Signal12,
			dismissRobuxPurchaseSuccess = function() --[[ Line: 111 ]]
				-- upvalues: Signal2_11 (copy)
				Signal2_11(nil)
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
			setItemsPerRow = Signal2_8,
			setShouldOpenToRobuxTab = Signal2_9,
			setOpenedFromBuyRobux = Signal2_10
		},
		setCategories = Signal2,
		setSections = Signal2_1,
		setLoading = Signal2_2,
		setError = Signal2_3,
		setOwnership = Signal2_4,
		setTrialAvailabilities = Signal2_5,
		setTrialRedemptionInFlight = Signal2_6,
		setBonusPromotionEligibility = Signal2_7,
		setItemsPerRow = Signal2_8,
		setPurchasedRobuxAmount = Signal2_11
	}
end