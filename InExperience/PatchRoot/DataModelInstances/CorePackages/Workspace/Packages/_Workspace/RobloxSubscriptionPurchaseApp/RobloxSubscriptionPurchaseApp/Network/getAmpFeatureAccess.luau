local Parent = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent
local PromiseModule = require(Parent.Promise)
local Url = require(Parent.Http).Url
local HttpRequestModule = require(script.Parent.HttpRequest)
local RobloxPlusAmpFeatureName = game:DefineFastString("RobloxPlusAmpFeatureName", "IsRobloxPlusSubscribed")
local RobloxPlusAmpNamespace = game:DefineFastString("RobloxPlusAmpNamespace", "subscriptions/PlusSubscription")

return function()
	-- upvalues: Url (copy), RobloxPlusAmpFeatureName (copy), RobloxPlusAmpNamespace (copy), HttpRequestModule (copy), PromiseModule (copy)
	return HttpRequestModule.new():get(Url.APIS_URL .. "access-management/v1/feature-access?" .. Url:makeQueryString({
		featureNames = RobloxPlusAmpFeatureName,
		namespace = RobloxPlusAmpNamespace
	})):andThen(function(Result)
		local Features = Result and Result.features
		
		return if type(Features) == "table" and #Features > 0 then Features[1].access else nil
	end):catch(function()
		-- upvalues: PromiseModule (upval)
		return PromiseModule.resolve(nil)
	end)
end