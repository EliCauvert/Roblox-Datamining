local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local _ = require(inExperienceShop.Parent.Promise)
local _ = require(inExperienceShop.Types)
local buildShopDataFromWidgetsModule = require(inExperienceShop.Api.buildShopDataFromWidgets)
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
	end
}