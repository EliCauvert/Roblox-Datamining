local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local _ = require(inExperienceShop.Parent.Promise)
local _ = require(inExperienceShop.Types)
local buildShopDataFromWidgetsModule = require(inExperienceShop.Api.buildShopDataFromWidgets)
local multiGetProductInfoModule = require(inExperienceShop.Api.multiGetProductInfo)
local mockShopItemIdsModule = require(inExperienceShop.Mocks.MockShopItemIds)
local mockMultiGetProductInfoModule = require(inExperienceShop.Mocks.MockMultiGetProductInfo)
local fFlagShopUseMockMultiGetProductInfoModule = require(inExperienceShop.Flags.FFlagShopUseMockMultiGetProductInfo)

return {
	fetchAllShopData = function(p0) --[[ line: 34 ]]
		-- upvalues: mockShopItemIdsModule (ref), buildShopDataFromWidgetsModule (ref), fFlagShopUseMockMultiGetProductInfoModule (ref), mockMultiGetProductInfoModule (ref), multiGetProductInfoModule (ref)
		local var6 = if p0 ~= nil then 0.5 else p0
		
		return mockShopItemIdsModule.getShopItemIds(var6):andThen(function(p1) --[[ line: 36 ]]
			-- upvalues: buildShopDataFromWidgetsModule (copy), fFlagShopUseMockMultiGetProductInfoModule (copy), mockMultiGetProductInfoModule (copy), var6 (ref), multiGetProductInfoModule (copy)
			return buildShopDataFromWidgetsModule(p1, function(p2) --[[ line: 37 ]]
				-- upvalues: fFlagShopUseMockMultiGetProductInfoModule (copy), mockMultiGetProductInfoModule (copy), var6 (copy), multiGetProductInfoModule (copy)
				return if fFlagShopUseMockMultiGetProductInfoModule then mockMultiGetProductInfoModule.multiGetProductInfo(p2, var6) else multiGetProductInfoModule(p2)
			end)
		end)
	end,
	fetchShopWidgetsOnly = function(p3) --[[ line: 52 ]]
		-- upvalues: mockShopItemIdsModule (ref), buildShopDataFromWidgetsModule (ref)
		return mockShopItemIdsModule.getShopItemIds(if p3 ~= nil then 0.5 else p3):andThen(function(p4) --[[ line: 54 ]]
			-- upvalues: buildShopDataFromWidgetsModule (copy)
			return buildShopDataFromWidgetsModule(p4, nil)
		end)
	end
}