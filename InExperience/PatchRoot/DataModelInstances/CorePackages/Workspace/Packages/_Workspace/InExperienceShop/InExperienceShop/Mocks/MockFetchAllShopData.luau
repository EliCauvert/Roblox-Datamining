local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local _ = require(inExperienceShop.Parent.Promise)
local constantsModule = require(inExperienceShop.Constants)
local _ = require(inExperienceShop.Types)
local buildShopDataFromWidgetsModule = require(inExperienceShop.Api.buildShopDataFromWidgets)
local fetchRobuxWidgetsAfterPurchaseModule = require(inExperienceShop.Api.fetchRobuxWidgetsAfterPurchase)
local multiGetProductInfoModule = require(inExperienceShop.Api.multiGetProductInfo)
local mockShopItemIdsModule = require(inExperienceShop.Mocks.MockShopItemIds)
local mockMultiGetProductInfoModule = require(inExperienceShop.Mocks.MockMultiGetProductInfo)
local fFlagShopUseMockMultiGetProductInfoModule = require(inExperienceShop.Flags.FFlagShopUseMockMultiGetProductInfo)

return {
	fetchAllShopData = function(p1)
		-- upvalues: mockShopItemIdsModule (ref), buildShopDataFromWidgetsModule (ref), fFlagShopUseMockMultiGetProductInfoModule (ref), mockMultiGetProductInfoModule (ref), multiGetProductInfoModule (ref)
		local var1 = if p1 ~= nil then 0.5 else p1
		
		return mockShopItemIdsModule.getShopItemIds(var1):andThen(function(p2)
			-- upvalues: buildShopDataFromWidgetsModule (copy), fFlagShopUseMockMultiGetProductInfoModule (copy), mockMultiGetProductInfoModule (copy), var1 (ref), multiGetProductInfoModule (copy)
			return buildShopDataFromWidgetsModule(p2, function(p3)
				-- upvalues: fFlagShopUseMockMultiGetProductInfoModule (copy), mockMultiGetProductInfoModule (copy), var1 (copy), multiGetProductInfoModule (copy)
				return if fFlagShopUseMockMultiGetProductInfoModule then mockMultiGetProductInfoModule.multiGetProductInfo(p3, var1) else multiGetProductInfoModule(p3)
			end)
		end)
	end,
	fetchShopWidgetsOnly = function(p1)
		-- upvalues: mockShopItemIdsModule (ref), buildShopDataFromWidgetsModule (ref)
		return mockShopItemIdsModule.getShopItemIds(if p1 ~= nil then 0.5 else p1):andThen(function(p2)
			-- upvalues: buildShopDataFromWidgetsModule (copy)
			return buildShopDataFromWidgetsModule(p2, nil)
		end)
	end,
	fetchRobuxWidgetsAfterPurchase = function(p1)
		-- upvalues: mockShopItemIdsModule (ref), constantsModule (ref), fetchRobuxWidgetsAfterPurchaseModule (ref), fFlagShopUseMockMultiGetProductInfoModule (ref), mockMultiGetProductInfoModule (ref), multiGetProductInfoModule (ref)
		local var1 = if p1 ~= nil then 0.5 else p1
		
		return mockShopItemIdsModule.getShopItemIds(var1):andThen(function(p2)
			-- upvalues: constantsModule (copy), fetchRobuxWidgetsAfterPurchaseModule (copy), fFlagShopUseMockMultiGetProductInfoModule (copy), mockMultiGetProductInfoModule (copy), var1 (ref), multiGetProductInfoModule (copy)
			local var2 = nil
			
			for i, v in ipairs(p2.categories) do
				if v.name == constantsModule.ROBUX_CATEGORY_NAME then
					var2 = v
					break
				end
			end
			return fetchRobuxWidgetsAfterPurchaseModule.buildFromWidgetResponse({ category = var2 }, function(p3)
				-- upvalues: fFlagShopUseMockMultiGetProductInfoModule (copy), mockMultiGetProductInfoModule (copy), var1 (copy), multiGetProductInfoModule (copy)
				return if fFlagShopUseMockMultiGetProductInfoModule then mockMultiGetProductInfoModule.multiGetProductInfo(p3, var1) else multiGetProductInfoModule(p3)
			end)
		end)
	end
}