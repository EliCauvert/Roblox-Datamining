local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(CorePackages.Packages.Promise)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local SubscriptionGetStatusesModule = require(Modules.LuaApp.Http.Requests.EconomyAPI.SubscriptionGetStatuses)
local SetSubscriptionStatusesModule = require(Modules.LuaApp.Actions.Subscription.SetSubscriptionStatuses)
local SubscriptionStatusModelModule = require(Modules.LuaApp.Models.SubscriptionApi.SubscriptionStatusModel)

return function(p1, p2, Text)
	-- upvalues: PerformFetch (copy), SubscriptionGetStatusesModule (copy), SubscriptionStatusModelModule (copy), SetSubscriptionStatusesModule (copy), PromiseModule (copy)
	return PerformFetch.Single("ApiFetchSubscriptionsStatus" .. Text, function(p3)
		-- upvalues: SubscriptionGetStatusesModule (upval), p1 (copy), p2 (copy), SubscriptionStatusModelModule (upval), SetSubscriptionStatusesModule (upval), PromiseModule (upval)
		return SubscriptionGetStatusesModule(p1, p2):andThen(function(Result)
			-- upvalues: p2 (upval), SubscriptionStatusModelModule (upval), p3 (copy), SetSubscriptionStatusesModule (upval)
			local FromJsonDataResults = {}
			
			for _, value in p2 do
				local Entry = Result[value]
				
				if Entry then
					FromJsonDataResults[value] = SubscriptionStatusModelModule.fromJsonData(Entry)
				end
			end
			return p3:dispatch(SetSubscriptionStatusesModule(FromJsonDataResults))
		end, function(_)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve()
		end)
	end)
end