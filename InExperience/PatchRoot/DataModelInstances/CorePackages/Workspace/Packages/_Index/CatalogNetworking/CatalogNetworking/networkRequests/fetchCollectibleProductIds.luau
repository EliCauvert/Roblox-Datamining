local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("CatalogNetworking").Parent
local dashModule = require(parent.Dash)
local text = require(parent.SocialCommon).Utils.buildApiSiteUrl("apis") .. "/marketplace-items/v1/items/details"

return function(p0, p1)
	-- upvalues: httpService (ref), text (ref), dashModule (ref)
	return p0(text, "POST", { postBody = httpService:JSONEncode({ itemIds = p1 }) }):andThen(function(p3)
		-- upvalues: dashModule (copy)
		return dashModule.collectArray(p3.responseBody or {}, function(_, p4)
			return if p4.collectibleItemId and p4.collectibleProductId then {
				collectibleItemId = p4.collectibleItemId,
				collectibleProductId = p4.collectibleProductId,
				resaleProductId = p4.lowestAvailableResaleProductId
			} else nil
		end)
	end):catch(function(p2)
		warn("[CatalogNetworking] fetchCollectibleProductIds failed:", tostring(p2))
		
		return {}
	end)
end