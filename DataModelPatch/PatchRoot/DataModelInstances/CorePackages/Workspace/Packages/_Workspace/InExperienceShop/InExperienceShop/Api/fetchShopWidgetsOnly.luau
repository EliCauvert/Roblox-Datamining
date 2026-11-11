local HttpService = game:GetService("HttpService")
local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local _ = require(InExperienceShop.Parent.Promise)
local _ = require(InExperienceShop.Types)
local FetchShopItemIdsModule = require(script.Parent.fetchShopItemIds)
local BuildShopDataFromWidgetsModule = require(script.Parent.buildShopDataFromWidgets)

return function()
	-- upvalues: HttpService (copy), FetchShopItemIdsModule (copy), BuildShopDataFromWidgetsModule (copy)
	return FetchShopItemIdsModule((HttpService:GenerateGUID(false))):andThen(function(Result)
		-- upvalues: BuildShopDataFromWidgetsModule (upval)
		return BuildShopDataFromWidgetsModule(Result, nil)
	end)
end