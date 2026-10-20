local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("CatalogNetworking").Parent
local DashModule = require(Parent.Dash)
local Text = require(Parent.SocialCommon).Utils.buildApiSiteUrl("apis") .. "/marketplace-items/v1/items/details"

return function(Callback, ItemIds)
	-- upvalues: HttpService (copy), Text (copy), DashModule (copy)
	return Callback(Text, "POST", { postBody = HttpService:JSONEncode({ itemIds = ItemIds }) }):andThen(function(Result)
		-- upvalues: DashModule (upval)
		return DashModule.collectArray(Result.responseBody or {}, function(_, p1)
			return if p1.collectibleItemId and p1.collectibleProductId then {
				collectibleItemId = p1.collectibleItemId,
				collectibleProductId = p1.collectibleProductId,
				resaleProductId = p1.lowestAvailableResaleProductId
			} else nil
		end)
	end):catch(function(Err)
		warn("[CatalogNetworking] fetchCollectibleProductIds failed:", (tostring(Err)))
		
		return {}
	end)
end