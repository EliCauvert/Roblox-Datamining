local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local Url = require(Parent.Http).Url
local _ = require(Parent.LuauPolyfill)
local MakeAXResponseHandlerModule = require(AvatarExperienceCatalog.Utils.makeAXResponseHandler)
local NormalizeFaeStatusModule = require(script.Parent.normalizeFaeStatus)
local ConstantsModule = require(script.Parent.constants)

return {
	getFaeStatus = function(Callback)
		-- upvalues: Url (copy), MakeAXResponseHandlerModule (copy), NormalizeFaeStatusModule (copy), ConstantsModule (copy)
		local GET, GET2 = Callback(`{Url.APIS_URL}access-management/v1/feature-access?{Url:makeQueryString({
			featureNames = "ShowFaeUpsellInMarketplace,AllowFaeItemToBeClaimed",
			nameSpace = "avatar_marketplace_user_journey/MarketplaceUserJourney"
		})}`, "GET")
		
		return MakeAXResponseHandlerModule(GET, NormalizeFaeStatusModule, {
			modelMismatchCounter = ConstantsModule.FETCH_FAE_STATUS_MODEL_MISMATCH_COUNTER_NAME,
			latencyCounter = ConstantsModule.FETCH_FAE_STATUS_LATENCY_COUNTER_NAME
		}), GET2
	end
}