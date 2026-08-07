local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local jest = require(parent.Dev.JestGlobals).jest
local signalsModule = require(parent.Signals)
local constantsModule = require(inExperienceShop.Constants)
local _ = require(inExperienceShop.Types)
local _ = require(inExperienceShop.Api.BonusPromotionEligibility)

return function() --[[ line: 68 | named "createMockInExperienceShopStore" ]]
	-- upvalues: signalsModule (ref), constantsModule (ref), jest (ref)
	local var3, var4 = signalsModule.createSignal({})
	local var5, var6 = signalsModule.createSignal({})
	local var7, var8 = signalsModule.createSignal(false)
	local var9, var10 = signalsModule.createSignal(nil)
	local var11, var12 = signalsModule.createSignal({})
	local var13, var14 = signalsModule.createSignal({})
	local var15, var16 = signalsModule.createSignal(constantsModule.MIN_COLUMNS)
	
	return {
		store = {
			getCategories = var3,
			getSections = var5,
			getLoading = var7,
			getError = var9,
			getOwnership = var11,
			getBonusPromotionEligibility = var13,
			getItemsPerRow = var15,
			onShopOpened = jest.fn(),
			fetchAllShopData = jest.fn(),
			prefetchWidgetsOnly = jest.fn(),
			refreshShopItemInfo = jest.fn(),
			fetchGamePassOwnership = jest.fn(),
			pollGamePassOwnership = jest.fn(),
			setItemsPerRow = var16
		},
		setCategories = var4,
		setSections = var6,
		setLoading = var8,
		setError = var10,
		setOwnership = var12,
		setBonusPromotionEligibility = var14,
		setItemsPerRow = var16
	}
end