local httpService = game:GetService("HttpService")
local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local _ = require(inExperienceShop.Parent.Promise)
local _ = require(inExperienceShop.Types)
local fetchShopItemIdsModule = require(script.Parent.fetchShopItemIds)
local buildShopDataFromWidgetsModule = require(script.Parent.buildShopDataFromWidgets)

return function() --[[ line: 30 | named "fetchShopWidgetsOnly" ]]
	-- upvalues: httpService (ref), fetchShopItemIdsModule (ref), buildShopDataFromWidgetsModule (ref)
	return fetchShopItemIdsModule(httpService:GenerateGUID(false)):andThen(function(p0) --[[ line: 35 ]]
		-- upvalues: buildShopDataFromWidgetsModule (copy)
		return buildShopDataFromWidgetsModule(p0, nil)
	end)
end