local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("CatalogNetworking").Parent
local DashModule = require(Parent.Dash)
local Text = require(Parent.SocialCommon).Utils.buildApiSiteUrl("apis") .. "/marketplace-items/v1/items/details"

return function(Callback, ItemIds) --[[ Line: 11 | Named "fetchCollectibleProductIds" ]]
	-- upvalues: HttpService (copy), Text (copy), DashModule (copy)
	return Callback(Text, "POST", { postBody = HttpService:JSONEncode({ itemIds = ItemIds }) }):andThen(function(Result) --[[ Line: 14 ]]
		-- upvalues: DashModule (upval)
		return DashModule.collectArray(Result.responseBody or {}, function(_, p1) --[[ Line: 15 ]]
			return if p1.collectibleItemId and p1.collectibleProductId then {
				collectibleItemId = p1.collectibleItemId,
				collectibleProductId = p1.collectibleProductId,
				resaleProductId = p1.lowestAvailableResaleProductId
			} else nil
		end)
	end):catch(function(Err) --[[ Line: 26 ]]
		warn("[CatalogNetworking] fetchCollectibleProductIds failed:", (tostring(Err)))
		
		return {}
	end)
end