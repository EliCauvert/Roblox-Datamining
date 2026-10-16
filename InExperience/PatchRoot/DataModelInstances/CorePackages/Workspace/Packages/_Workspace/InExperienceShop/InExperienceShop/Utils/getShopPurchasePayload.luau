local HttpService = game:GetService("HttpService")
local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local FFlagCategoryLoggingInShopPurchaseModule = require(InExperienceShop.Flags.FFlagCategoryLoggingInShopPurchase)
local _ = require(InExperienceShop.Types)
local SHOPPURCHASELOCATION = HttpService:JSONEncode("__SHOP_PURCHASE_LOCATION__")
local Inputs = {
	"categoryGroup", "categoryPosition", "gridPositionRow", "gridPositionColumn",
	"categoryName", "stableCategoryId"
}

local function encodeLocation(p1): string --[[ Line: 33 ]]
	-- upvalues: HttpService (copy), Inputs (copy)
	local List = {
		`"locationType":{HttpService:JSONEncode("personalizedShop")}`
	}
	
	if p1 ~= nil then
		for _, input in Inputs do
			local Input = p1[input]
			
			if Input ~= nil then
				table.insert(List, `{HttpService:JSONEncode(input)}:{HttpService:JSONEncode(Input)}`)
			end
		end
	end
	return "{" .. table.concat(List, ",") .. "}"
end

local function encodePayload(p2): string --[[ Line: 46 ]]
	-- upvalues: HttpService (copy), SHOPPURCHASELOCATION (copy), encodeLocation (copy)
	local Json: string = HttpService:JSONEncode({
		surface = {
			scopeType = "inExperience",
			location = "__SHOP_PURCHASE_LOCATION__",
			universeId = game.GameId,
			placeId = game.PlaceId
		}
	})
	local StartIndex, EndIndex = string.find(Json, SHOPPURCHASELOCATION, 1, true)
	assert(StartIndex ~= nil and EndIndex ~= nil, "location placeholder missing from shop purchase payload")
	
	return string.sub(Json, 1, StartIndex - 1) .. encodeLocation(p2) .. string.sub(Json, EndIndex + 1)
end

local Json = HttpService:JSONEncode({
	surface = {
		scopeType = "inExperience",
		universeId = game.GameId,
		placeId = game.PlaceId,
		location = { locationType = "personalizedShop" }
	}
})

return function(p2) --[[ Line: 73 | Named "getShopPurchasePayload" ]]
	-- upvalues: FFlagCategoryLoggingInShopPurchaseModule (copy), encodePayload (copy), Json (copy)
	return if FFlagCategoryLoggingInShopPurchaseModule then encodePayload(p2) else Json
end