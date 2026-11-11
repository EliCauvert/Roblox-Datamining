local Modules = game:GetService("CoreGui").RobloxGui.Modules
local SetGameSubscriptionProductsModule = require(Modules.LuaApp.Actions.Subscription.SetGameSubscriptionProducts)
local PromiseModule = require(Modules.LuaApp.Promise)
local PerformFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local ApiFetchSubscriptionsThumbnailsModule = require(Modules.LuaApp.Thunks.Subscription.ApiFetchSubscriptionsThumbnails)
local ApiFetchSubscriptionsStatusModule = require(Modules.LuaApp.Thunks.Subscription.ApiFetchSubscriptionsStatus)
local GameGetActiveSubscriptionProductsModule = require(Modules.LuaApp.Http.Requests.EconomyAPI.GameGetActiveSubscriptionProducts)
local SubscriptionProductInfoModelModule = require(Modules.LuaApp.Models.SubscriptionApi.SubscriptionProductInfoModel)
local ReduceActiveSubscriptionFetch = game:DefineFastFlag("ReduceActiveSubscriptionFetch", false)

return function(p1, Text)
	-- upvalues: PerformFetch (copy), GameGetActiveSubscriptionProductsModule (copy), ReduceActiveSubscriptionFetch (copy), PromiseModule (copy), SubscriptionProductInfoModelModule (copy), SetGameSubscriptionProductsModule (copy), ApiFetchSubscriptionsThumbnailsModule (copy), ApiFetchSubscriptionsStatusModule (copy)
	return PerformFetch.Single("ApiFetchGameSubscriptionProducts" .. Text, function(p2)
		-- upvalues: GameGetActiveSubscriptionProductsModule (upval), p1 (copy), Text (copy), ReduceActiveSubscriptionFetch (upval), PromiseModule (upval), SubscriptionProductInfoModelModule (upval), SetGameSubscriptionProductsModule (upval), ApiFetchSubscriptionsThumbnailsModule (upval), ApiFetchSubscriptionsStatusModule (upval)
		return GameGetActiveSubscriptionProductsModule(p1, Text):andThen(function(Result)
			-- upvalues: ReduceActiveSubscriptionFetch (upval), PromiseModule (upval), SubscriptionProductInfoModelModule (upval), p2 (copy), SetGameSubscriptionProductsModule (upval), Text (upval), ApiFetchSubscriptionsThumbnailsModule (upval), p1 (upval), ApiFetchSubscriptionsStatusModule (upval)
			if ReduceActiveSubscriptionFetch then
				if Result == nil or Result.responseBody == nil or Result.responseBody.subscriptionProductsInfo == nil then
					return PromiseModule.reject()
				end
				local FromJsonDataResults1 = {}
				local IconImageAssetIds1 = {}
				local List1 = {}
				
				for _, value in Result.responseBody.subscriptionProductsInfo do
					local FromJsonDataResult = SubscriptionProductInfoModelModule.fromJsonData(value)
					table.insert(FromJsonDataResults1, FromJsonDataResult)
					table.insert(IconImageAssetIds1, FromJsonDataResult.iconImageAssetId)
					table.insert(List1, FromJsonDataResult.subscriptionTargetKey)
				end
				p2:dispatch(SetGameSubscriptionProductsModule(Text, FromJsonDataResults1))
				p2:dispatch(ApiFetchSubscriptionsThumbnailsModule(p1, IconImageAssetIds1))
				p2:dispatch(ApiFetchSubscriptionsStatusModule(p1, List1, Text))
				
				return PromiseModule.resolve()
			else
				local SubscriptionProductsInfo = if Result and Result.responseBody and Result.responseBody.subscriptionProductsInfo then Result.responseBody.subscriptionProductsInfo else {}
				local FromJsonDataResults = {}
				local IconImageAssetIds = {}
				local List = {}
				
				if #SubscriptionProductsInfo == 0 then
					return PromiseModule.resolve()
				end
				for _, value1 in SubscriptionProductsInfo do
					local FromJsonDataResult = SubscriptionProductInfoModelModule.fromJsonData(value1)
					table.insert(FromJsonDataResults, FromJsonDataResult)
					table.insert(IconImageAssetIds, FromJsonDataResult.iconImageAssetId)
					table.insert(List, FromJsonDataResult.subscriptionTargetKey)
				end
				p2:dispatch(SetGameSubscriptionProductsModule(Text, FromJsonDataResults))
				p2:dispatch(ApiFetchSubscriptionsThumbnailsModule(p1, IconImageAssetIds))
				p2:dispatch(ApiFetchSubscriptionsStatusModule(p1, List, Text))
				
				return PromiseModule.resolve()
			end
		end, function(_)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve()
		end)
	end)
end