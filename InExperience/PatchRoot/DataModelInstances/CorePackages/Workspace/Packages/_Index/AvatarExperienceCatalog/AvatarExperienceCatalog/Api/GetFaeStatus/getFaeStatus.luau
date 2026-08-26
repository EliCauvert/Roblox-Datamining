local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local url = require(parent.Http).Url
local _ = require(parent.LuauPolyfill)
local makeAXResponseHandlerModule = require(avatarExperienceCatalog.Utils.makeAXResponseHandler)
local normalizeFaeStatusModule = require(script.Parent.normalizeFaeStatus)
local constantsModule = require(script.Parent.constants)

return {
	getFaeStatus = function(p1)
		-- upvalues: url (ref), makeAXResponseHandlerModule (ref), normalizeFaeStatusModule (ref), constantsModule (ref)
		local var1, var2 = p1(`{url.APIS_URL}access-management/v1/feature-access?{url:makeQueryString({
			featureNames = "ShowFaeUpsellInMarketplace,AllowFaeItemToBeClaimed",
			nameSpace = "avatar_marketplace_user_journey/MarketplaceUserJourney"
		})}`, "GET")
		
		return makeAXResponseHandlerModule(var1, normalizeFaeStatusModule, {
			modelMismatchCounter = constantsModule.FETCH_FAE_STATUS_MODEL_MISMATCH_COUNTER_NAME,
			latencyCounter = constantsModule.FETCH_FAE_STATUS_LATENCY_COUNTER_NAME
		}), var2
	end
}