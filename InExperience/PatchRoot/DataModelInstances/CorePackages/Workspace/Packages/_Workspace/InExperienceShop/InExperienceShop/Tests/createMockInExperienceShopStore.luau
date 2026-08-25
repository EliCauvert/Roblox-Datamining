local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local jest = require(parent.Dev.JestGlobals).jest
local signalsModule = require(parent.Signals)
local constantsModule = require(inExperienceShop.Constants)
local _ = require(inExperienceShop.Types)
local _ = require(inExperienceShop.Api.BonusPromotionEligibility)

return function()
	-- upvalues: signalsModule (ref), constantsModule (ref), jest (ref)
	local var3, var4 = signalsModule.createSignal({})
	local var5, var6 = signalsModule.createSignal({})
	local var7, var8 = signalsModule.createSignal(false)
	local var9, var10 = signalsModule.createSignal(nil)
	local var11, var12 = signalsModule.createSignal({})
	local var13, var14 = signalsModule.createSignal({ available = {}, active = {} })
	local var15, var16 = signalsModule.createSignal({})
	local var17, var18 = signalsModule.createSignal(constantsModule.MIN_COLUMNS)
	
	return {
		store = {
			getCategories = var3,
			getSections = var5,
			getLoading = var7,
			getError = var9,
			getOwnership = var11,
			getTrialAvailabilities = var13,
			getBonusPromotionEligibility = var15,
			getItemsPerRow = var17,
			onShopOpened = jest.fn(),
			fetchAllShopData = jest.fn(),
			prefetchWidgetsOnly = jest.fn(),
			refreshShopItemInfo = jest.fn(),
			fetchGamePassOwnership = jest.fn(),
			pollGamePassOwnership = jest.fn(),
			setItemsPerRow = var18
		},
		setCategories = var4,
		setSections = var6,
		setLoading = var8,
		setError = var10,
		setOwnership = var12,
		setTrialAvailabilities = var14,
		setBonusPromotionEligibility = var16,
		setItemsPerRow = var18
	}
end