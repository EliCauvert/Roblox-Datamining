local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local _ = require(InExperienceShop.Parent.Promise)
local ConstantsModule = require(InExperienceShop.Constants)
local _ = require(InExperienceShop.Types)
local BuildShopDataFromWidgetsModule = require(InExperienceShop.Api.buildShopDataFromWidgets)
local FetchRobuxWidgetsAfterPurchaseModule = require(InExperienceShop.Api.fetchRobuxWidgetsAfterPurchase)
local MultiGetProductInfoModule = require(InExperienceShop.Api.multiGetProductInfo)
local MockShopItemIdsModule = require(InExperienceShop.Mocks.MockShopItemIds)
local MockMultiGetProductInfoModule = require(InExperienceShop.Mocks.MockMultiGetProductInfo)
local FFlagShopUseMockMultiGetProductInfoModule = require(InExperienceShop.Flags.FFlagShopUseMockMultiGetProductInfo)

return {
	fetchAllShopData = function(p1) --[[ Line: 36 ]]
		-- upvalues: MockShopItemIdsModule (copy), BuildShopDataFromWidgetsModule (copy), FFlagShopUseMockMultiGetProductInfoModule (copy), MockMultiGetProductInfoModule (copy), MultiGetProductInfoModule (copy)
		local v1 = if p1 == nil then 0.5 else p1
		
		return MockShopItemIdsModule.getShopItemIds(v1):andThen(function(Result) --[[ Line: 38 ]]
			-- upvalues: BuildShopDataFromWidgetsModule (upval), FFlagShopUseMockMultiGetProductInfoModule (upval), MockMultiGetProductInfoModule (upval), v1 (copy), MultiGetProductInfoModule (upval)
			return BuildShopDataFromWidgetsModule(Result, function(p2) --[[ Line: 39 ]]
				-- upvalues: FFlagShopUseMockMultiGetProductInfoModule (upval), MockMultiGetProductInfoModule (upval), v1 (upval), MultiGetProductInfoModule (upval)
				return if FFlagShopUseMockMultiGetProductInfoModule then MockMultiGetProductInfoModule.multiGetProductInfo(p2, v1) else MultiGetProductInfoModule(p2)
			end)
		end)
	end,
	fetchShopWidgetsOnly = function(p1) --[[ Line: 54 ]]
		-- upvalues: MockShopItemIdsModule (copy), BuildShopDataFromWidgetsModule (copy)
		return MockShopItemIdsModule.getShopItemIds(if p1 == nil then 0.5 else p1):andThen(function(Result) --[[ Line: 56 ]]
			-- upvalues: BuildShopDataFromWidgetsModule (upval)
			return BuildShopDataFromWidgetsModule(Result, nil)
		end)
	end,
	fetchRobuxWidgetsAfterPurchase = function(p1) --[[ Line: 64 ]]
		-- upvalues: MockShopItemIdsModule (copy), ConstantsModule (copy), FetchRobuxWidgetsAfterPurchaseModule (copy), FFlagShopUseMockMultiGetProductInfoModule (copy), MockMultiGetProductInfoModule (copy), MultiGetProductInfoModule (copy)
		local v1 = if p1 == nil then 0.5 else p1
		
		return MockShopItemIdsModule.getShopItemIds(v1):andThen(function(Result) --[[ Line: 68 ]]
			-- upvalues: ConstantsModule (upval), FetchRobuxWidgetsAfterPurchaseModule (upval), FFlagShopUseMockMultiGetProductInfoModule (upval), MockMultiGetProductInfoModule (upval), v1 (copy), MultiGetProductInfoModule (upval)
			local Category = nil
			
			for _, category in ipairs(Result.categories) do
				if category.name == ConstantsModule.ROBUX_CATEGORY_NAME then
					Category = category
					break
				end
			end
			return FetchRobuxWidgetsAfterPurchaseModule.buildFromWidgetResponse({ category = Category }, function(p2) --[[ Line: 76 ]]
				-- upvalues: FFlagShopUseMockMultiGetProductInfoModule (upval), MockMultiGetProductInfoModule (upval), v1 (upval), MultiGetProductInfoModule (upval)
				return if FFlagShopUseMockMultiGetProductInfoModule then MockMultiGetProductInfoModule.multiGetProductInfo(p2, v1) else MultiGetProductInfoModule(p2)
			end)
		end)
	end
}