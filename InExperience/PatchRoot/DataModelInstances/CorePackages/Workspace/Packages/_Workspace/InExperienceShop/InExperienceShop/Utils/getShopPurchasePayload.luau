local httpService = game:GetService("HttpService")
local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local fFlagCategoryLoggingInShopPurchaseModule = require(inExperienceShop.Flags.FFlagCategoryLoggingInShopPurchase)
local _ = require(inExperienceShop.Types)
local __shop_purchase_location__ = httpService:JSONEncode("__SHOP_PURCHASE_LOCATION__")
local list = {
	"categoryGroup", "categoryPosition", "gridPositionRow", "gridPositionColumn",
	"categoryName", "stableCategoryId"
}

local function encodeLocation(p1)
	-- upvalues: httpService (ref), list (ref)
	local list_1 = {
		`"locationType":{httpService:JSONEncode("personalizedShop")}`
	}
	
	if p1 ~= nil then
		for i, v in list do
			local var1 = p1[v]
			
			if var1 ~= nil then
				table.insert(list_1, `{httpService:JSONEncode(v)}:{httpService:JSONEncode(var1)}`)
			end
		end
	end
	return "{" .. table.concat(list_1, ",") .. "}"
end

local function encodePayload(p2)
	-- upvalues: httpService (ref), __shop_purchase_location__ (ref), encodeLocation (ref)
	local var2 = httpService:JSONEncode({
		surface = {
			scopeType = "inExperience",
			location = "__SHOP_PURCHASE_LOCATION__",
			universeId = game.GameId,
			placeId = game.PlaceId
		}
	})
	local matchIndex, matchIndex_1 = string.find(var2, __shop_purchase_location__, 1, true)
	assert(matchIndex ~= nil and matchIndex_1 ~= nil, "location placeholder missing from shop purchase payload")
	
	return string.sub(var2, 1, matchIndex - 1) .. encodeLocation(p2) .. string.sub(var2, matchIndex_1 + 1)
end

local var2 = httpService:JSONEncode({
	surface = {
		scopeType = "inExperience",
		universeId = game.GameId,
		placeId = game.PlaceId,
		location = { locationType = "personalizedShop" }
	}
})

return function(p2)
	-- upvalues: fFlagCategoryLoggingInShopPurchaseModule (ref), encodePayload (ref), var2 (ref)
	return if fFlagCategoryLoggingInShopPurchaseModule then encodePayload(p2) else var2
end