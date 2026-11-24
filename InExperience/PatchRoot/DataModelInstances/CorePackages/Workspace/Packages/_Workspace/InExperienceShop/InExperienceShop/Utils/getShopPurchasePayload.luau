local HttpService = game:GetService("HttpService")
local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local FFlagCategoryLoggingInShopPurchaseModule = require(InExperienceShop.Flags.FFlagCategoryLoggingInShopPurchase)
local FFlagEnableNotificationsBuyModalSurfaceModule = require(InExperienceShop.Flags.FFlagEnableNotificationsBuyModalSurface)
local _ = require(InExperienceShop.Types)
local SHOPPURCHASELOCATION = HttpService:JSONEncode("__SHOP_PURCHASE_LOCATION__")
local Inputs = {
	"categoryGroup", "categoryPosition", "gridPositionRow", "gridPositionColumn",
	"categoryName", "stableCategoryId"
}

local function encodeLocation(p1): string
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

local function encodePayload(p2): string
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

local function encodeSurface(Text): string
	-- upvalues: HttpService (copy), SHOPPURCHASELOCATION (copy)
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
	
	return string.sub(Json, 1, StartIndex - 1) .. Text .. string.sub(Json, EndIndex + 1)
end

local EncodeSurfaceResult = if FFlagEnableNotificationsBuyModalSurfaceModule then encodeSurface("{" .. table.concat({
	`"locationType":{HttpService:JSONEncode("personalizedShop")}`
}, ",") .. "}") else HttpService:JSONEncode({
	surface = {
		scopeType = "inExperience",
		universeId = game.GameId,
		placeId = game.PlaceId,
		location = { locationType = "personalizedShop" }
	}
})

local function _(Input)
	-- upvalues: encodeSurface (copy), HttpService (copy)
	return (encodeSurface("{" .. `"locationType":{HttpService:JSONEncode(Input)},` .. `"feature":{HttpService:JSONEncode("FreeTrials")}` .. "}"))
end

return function(p2, Input)
	-- upvalues: FFlagEnableNotificationsBuyModalSurfaceModule (copy), encodeSurface (copy), HttpService (copy), FFlagCategoryLoggingInShopPurchaseModule (copy), encodePayload (copy), EncodeSurfaceResult (copy)
	return if FFlagEnableNotificationsBuyModalSurfaceModule and Input ~= nil then encodeSurface("{" .. `"locationType":{HttpService:JSONEncode(Input)},` .. `"feature":{HttpService:JSONEncode("FreeTrials")}` .. "}") elseif FFlagCategoryLoggingInShopPurchaseModule then encodePayload(p2) else EncodeSurfaceResult
end