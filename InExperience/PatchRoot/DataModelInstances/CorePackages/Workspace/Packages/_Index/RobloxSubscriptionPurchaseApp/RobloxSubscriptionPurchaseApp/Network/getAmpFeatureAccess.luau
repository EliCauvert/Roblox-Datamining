local parent = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent
local promiseModule = require(parent.Promise)
local url = require(parent.Http).Url
local httpRequestModule = require(script.Parent.HttpRequest)
local robloxPlusAmpFeatureName = game:DefineFastString("RobloxPlusAmpFeatureName", "IsRobloxPlusSubscribed")
local robloxPlusAmpNamespace = game:DefineFastString("RobloxPlusAmpNamespace", "subscriptions/PlusSubscription")

return function()
	-- upvalues: url (ref), robloxPlusAmpFeatureName (ref), robloxPlusAmpNamespace (ref), httpRequestModule (ref), promiseModule (ref)
	return httpRequestModule.new():get(url.APIS_URL .. "access-management/v1/feature-access?" .. url:makeQueryString({
		featureNames = robloxPlusAmpFeatureName,
		namespace = robloxPlusAmpNamespace
	})):andThen(function(p1)
		local features = p1 and p1.features
		
		return if type(features) == "table" and #features > 0 then features[1].access else nil
	end):catch(function()
		-- upvalues: promiseModule (copy)
		return promiseModule.resolve(nil)
	end)
end