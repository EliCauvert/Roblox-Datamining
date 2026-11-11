local CorePackages = game:GetService("CorePackages")
local Url = require(CorePackages.Workspace.Packages.Http).Url
local PromiseModule = require(CorePackages.Packages.Promise)
local DoNotFetchOnEmptySubscriptionKeys = game:DefineFastFlag("DoNotFetchOnEmptySubscriptionKeys", false)

return function(Callback, List)
	-- upvalues: DoNotFetchOnEmptySubscriptionKeys (copy), PromiseModule (copy), Url (copy)
	return if DoNotFetchOnEmptySubscriptionKeys and #List == 0 then PromiseModule.resolve({}) else Callback(string.format("%sv1/subscriptions/statuses?%s", Url.APIS_URL, (Url:makeQueryString({
		subscriptionProductTargetKeys = table.concat(List, "&subscriptionProductTargetKeys=")
	}))), "GET"):andThen(function(Result)
		return if Result and Result.responseBody and Result.responseBody.subscriptionStatuses then Result.responseBody.subscriptionStatuses else {}
	end)
end