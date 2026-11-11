local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local PromiseModule = require(Modules.LuaApp.Promise)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local SetDevSubsModule = require(Modules.LuaApp.Actions.SetDevSubs)
local GetDevSubsModule = require(Modules.LuaApp.Http.Requests.GetDevSubs)
local ApiFetchGameIconsFunction = require(CorePackages.Workspace.Packages.GameIconRodux).GameIcons.ApiFetchGameIcons
local DevSubStatusModule = require(Modules.LuaApp.Enum.DevSubStatus)
local DevSubTypesModule = require(Modules.LuaApp.Types.DevSubTypes)
local DevSubModule = require(Modules.LuaApp.Models.DevSub)

local function getSubscriptionData(p1, UserId, Active, p2, NextPageCursor)
	-- upvalues: GetDevSubsModule (copy), DevSubTypesModule (copy), getSubscriptionData (copy)
	local P3 = p2 or { subscriptions = {}, games = {}, plans = {} }
	
	return GetDevSubsModule(p1, UserId, Active, NextPageCursor):andThen(function(Result)
		-- upvalues: DevSubTypesModule (upval), P3 (ref), getSubscriptionData (upval), p1 (copy), UserId (copy), Active (copy)
		if not DevSubTypesModule.SubscriptionsResponseCheck(Result.responseBody) then
			return nil, false
		end
		for _, entry in pairs(Result.responseBody.data) do
			P3.subscriptions[entry.id] = entry
		end
		for _, plan in pairs(Result.responseBody.auxiliaryData.plans) do
			P3.plans[plan.id] = plan
		end
		for _, univers in pairs(Result.responseBody.auxiliaryData.universes) do
			P3.games[univers.id] = univers
		end
		local NextPageCursor = Result.responseBody.nextPageCursor
		
		if NextPageCursor then
			return getSubscriptionData(p1, UserId, Active, P3, NextPageCursor)
		else
			return P3, true
		end
	end)
end

local function _(p3, p4)
	-- upvalues: getSubscriptionData (copy), DevSubStatusModule (copy)
	return getSubscriptionData(p3, p4, DevSubStatusModule.Active):andThen(function(Result)
		-- upvalues: getSubscriptionData (upval), p3 (copy), p4 (copy), DevSubStatusModule (upval)
		return getSubscriptionData(p3, p4, DevSubStatusModule.Inactive, Result)
	end)
end

return {
	Fetch = function(p3)
		-- upvalues: PerformFetch (copy), getSubscriptionData (copy), DevSubStatusModule (copy), PromiseModule (copy), ApiFetchGameIconsFunction (copy), DevSubModule (copy), SetDevSubsModule (copy)
		local LocalPlayer = game:GetService("Players").LocalPlayer
		assert(LocalPlayer)
		local UserId = LocalPlayer.UserId
		
		return PerformFetch.Single("DevSubs", function(p4)
			-- upvalues: p3 (copy), UserId (copy), getSubscriptionData (upval), DevSubStatusModule (upval), PromiseModule (upval), ApiFetchGameIconsFunction (upval), DevSubModule (upval), SetDevSubsModule (upval)
			return getSubscriptionData(p3, UserId, DevSubStatusModule.Active):andThen(function(Result)
				-- upvalues: getSubscriptionData (upval), p3 (copy), UserId (copy), DevSubStatusModule (upval)
				return getSubscriptionData(p3, UserId, DevSubStatusModule.Inactive, Result)
			end):andThen(function(Result, p5)
				-- upvalues: PromiseModule (upval), p4 (copy), ApiFetchGameIconsFunction (upval), p3 (upval), DevSubModule (upval), SetDevSubsModule (upval)
				if not p5 then
					return PromiseModule.resolve()
				end
				local List = {}
				
				for i, _ in pairs(Result.games) do
					table.insert(List, i)
				end
				p4:dispatch(ApiFetchGameIconsFunction(p3, List))
				local FromJsonDataResults = {}
				
				for _, subscription in pairs(Result.subscriptions) do
					subscription.planData = Result.plans[subscription.planId]
					
					if subscription.planData then
						subscription.gameData = Result.games[subscription.planData.universeId]
						
						if subscription.gameData then
							table.insert(FromJsonDataResults, DevSubModule.fromJsonData(subscription))
						end
					end
				end
				p4:dispatch(SetDevSubsModule(FromJsonDataResults))
				
				return PromiseModule.resolve()
			end, function(p6)
				-- upvalues: PromiseModule (upval)
				return PromiseModule.reject(p6)
			end)
		end)
	end,
	GetFetchingStatus = function(p5)
		-- upvalues: PerformFetch (copy)
		return PerformFetch.GetStatus(p5, "DevSubs")
	end
}