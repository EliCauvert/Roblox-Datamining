local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("CatalogNetworking").Parent
local dashModule = require(parent.Dash)
local text = require(parent.SocialCommon).Utils.buildApiSiteUrl("apis") .. "/marketplace-items/v1/items/details"

return function(p1, p2)
	-- upvalues: httpService (ref), text (ref), dashModule (ref)
	return p1(text, "POST", { postBody = httpService:JSONEncode({ itemIds = p2 }) }):andThen(function(p3)
		-- upvalues: dashModule (copy)
		return dashModule.collectArray(p3.responseBody or {}, function(_, p4)
			return if p4.collectibleItemId and p4.collectibleProductId then {
				collectibleItemId = p4.collectibleItemId,
				collectibleProductId = p4.collectibleProductId,
				resaleProductId = p4.lowestAvailableResaleProductId
			} else nil
		end)
	end):catch(function(p3)
		warn("[CatalogNetworking] fetchCollectibleProductIds failed:", tostring(p3))
		
		return {}
	end)
end