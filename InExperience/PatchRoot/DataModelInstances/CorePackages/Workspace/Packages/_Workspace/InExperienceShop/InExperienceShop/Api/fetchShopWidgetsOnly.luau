local httpService = game:GetService("HttpService")
local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local _ = require(inExperienceShop.Parent.Promise)
local _ = require(inExperienceShop.Types)
local fetchShopItemIdsModule = require(script.Parent.fetchShopItemIds)
local buildShopDataFromWidgetsModule = require(script.Parent.buildShopDataFromWidgets)

return function()
	-- upvalues: httpService (ref), fetchShopItemIdsModule (ref), buildShopDataFromWidgetsModule (ref)
	return fetchShopItemIdsModule(httpService:GenerateGUID(false)):andThen(function(p1)
		-- upvalues: buildShopDataFromWidgetsModule (copy)
		return buildShopDataFromWidgetsModule(p1, nil)
	end)
end