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
	local var11, var12 = signalsModule.createSignal({})
	local var13, var14 = signalsModule.createSignal(constantsModule.MIN_COLUMNS)
	
	return {
		store = {
			getCategories = var1,
			getSections = var3,
			getLoading = var5,
			getError = var7,
			getOwnership = var9,
			getBonusPromotionEligibility = var11,
			getItemsPerRow = var13,
			onShopOpened = jest.fn(),
			fetchAllShopData = jest.fn(),
			prefetchWidgetsOnly = jest.fn(),
			refreshShopItemInfo = jest.fn(),
			fetchGamePassOwnership = jest.fn(),
			pollGamePassOwnership = jest.fn(),
			setItemsPerRow = var14
		},
		setCategories = var2,
		setSections = var4,
		setLoading = var6,
		setError = var8,
		setOwnership = var10,
		setBonusPromotionEligibility = var12,
		setItemsPerRow = var14
	}
end