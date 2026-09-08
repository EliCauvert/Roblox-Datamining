local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local jest = require(parent.Dev.JestGlobals).jest
local signalsModule = require(parent.Signals)
local constantsModule = require(inExperienceShop.Constants)
local _ = require(inExperienceShop.Types)
local _ = require(inExperienceShop.Api.BonusPromotionEligibility)

return function()
	-- upvalues: signalsModule (ref), constantsModule (ref), jest (ref)
	local var1, var2 = signalsModule.createSignal({})
	local var3, var4 = signalsModule.createSignal({})
	local var5, var6 = signalsModule.createSignal(false)
	local var7, var8 = signalsModule.createSignal(nil)
	local var9, var10 = signalsModule.createSignal({})
	local var11, var12 = signalsModule.createSignal({ available = {}, active = {} })
	local var13, var14 = signalsModule.createSignal({})
	local var15, var16 = signalsModule.createSignal(constantsModule.MIN_COLUMNS)
	local var17, var18 = signalsModule.createSignal(false)
	
	return {
		store = {
			getCategories = var1,
			getSections = var3,
			getLoading = var5,
			getError = var7,
			getOwnership = var9,
			getTrialAvailabilities = var11,
			getBonusPromotionEligibility = var13,
			getItemsPerRow = var15,
			getShouldOpenToRobuxTab = var17,
			onShopOpened = jest.fn(),
			fetchAllShopData = jest.fn(),
			prefetchWidgetsOnly = jest.fn(),
			refreshShopItemInfo = jest.fn(),
			fetchGamePassOwnership = jest.fn(),
			pollGamePassOwnership = jest.fn(),
			setItemsPerRow = var16,
			setShouldOpenToRobuxTab = var18
		},
		setCategories = var2,
		setSections = var4,
		setLoading = var6,
		setError = var8,
		setOwnership = var10,
		setTrialAvailabilities = var12,
		setBonusPromotionEligibility = var14,
		setItemsPerRow = var16
	}
end