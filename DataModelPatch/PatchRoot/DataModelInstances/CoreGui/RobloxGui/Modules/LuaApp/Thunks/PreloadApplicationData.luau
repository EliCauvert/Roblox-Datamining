local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local IXPService = game:GetService("IXPService")
local LocalizationService = game:GetService("LocalizationService")
local CryoModule = require(CorePackages.Packages.Cryo)
local PromiseModule = require(Modules.LuaApp.Promise)
local PromiseUtilitiesModule = require(Modules.LuaApp.PromiseUtilities)
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local NetworkProfiler = require(CorePackages.Workspace.Packages.Http).NetworkProfiler
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local WaitUntilIXPUserInitModule = require(Modules.LuaApp.Thunks.WaitUntilIXPUserInit)
local HttpCanceller = require(CorePackages.Workspace.Packages.Http).NetworkLayers.HttpCanceller
local OmniFeedConstants = require(CorePackages.Workspace.Packages.DiscoveryTypes).OmniFeedConstants
local Modules1 = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules
local FetchGamesPageDataFunction = Modules1.LuaApp.Thunks.FetchGamesPageData
local FetchHomePageDataFunction = Modules1.LuaApp.Thunks.FetchHomePageData
local FetchUserDataForHomePageFunction = Modules1.LuaApp.Thunks.FetchUserDataForHomePage
local FetchNotificationCountModule = require(Modules.LuaApp.Thunks.FetchNotificationCount)
local ApiFetchSiteMessageModule = require(Modules.LuaApp.Thunks.ApiFetchSiteMessage)
local ApiFetchAutocompleteLocalCacheModule = require(Modules.LuaApp.Thunks.ApiFetchAutocompleteLocalCache)
local ApiFetchEconomyCurrencyModule = require(Modules.LuaApp.Thunks.ApiFetchEconomyCurrency)
local ReportToDiagByCountryCode = require(CorePackages.Workspace.Packages.Analytics).ReportToDiagByCountryCode
local UsersFriendsPresenceOnAppStartupModule = require(Modules.LuaApp.Analytics.Events.usersFriendsPresenceOnAppStartup)
local FlagSettingsModule = require(Modules.LuaApp.FlagSettings)
local FFlagLuaAppChartsResetFetchingStatusOnFilterChange = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppChartsResetFetchingStatusOnFilterChange
local FFlagLuaAppChartsAppPage = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppChartsAppPage

local function _(_)
	return {}
end

local function startStandardAppFirstClassPagePreloadOperations(p1)
	-- upvalues: RetrievalStatusModule (copy), FetchHomePageDataFunction (copy), OmniFeedConstants (copy), PromiseModule (copy), PromiseUtilitiesModule (copy)
	local NetworkImpl = p1.networkImpl
	local Analytics = p1.analytics
	local Store = p1.store
	local UserId = p1.userId
	local LoggingProtocol = p1.loggingProtocol
	local OmniRecommendationsRequest = p1.omniRecommendationsRequest
	local PrefetchProtocol = p1.prefetchProtocol
	local List = {}
	
	if Store:getState().Startup.HomePageDataStatus == RetrievalStatusModule.NotStarted then
		if LoggingProtocol then
			LoggingProtocol:logEventOnce("preload_loading_home")
		end
		table.insert(List, (Store:dispatch(FetchHomePageDataFunction(NetworkImpl, OmniRecommendationsRequest, Analytics, UserId, p1.policyData.getUseOmniRecommendation(), LoggingProtocol, PrefetchProtocol, OmniFeedConstants.OmniRecommendationsRequestIntent.LogIn, nil, true))))
	elseif Store:getState().Startup.FetchHomePageDataStatusAll == RetrievalStatusModule.Fetching then
		if LoggingProtocol then
			LoggingProtocol:logEventOnce("preload_home_already_loading")
		end
		local ChangedConnection = nil
		table.insert(List, (PromiseModule.new(function(Callback, Callback1)
			-- upvalues: ChangedConnection (ref), Store (copy), RetrievalStatusModule (upval)
			ChangedConnection = Store.changed:connect(function(Value, p2)
				-- upvalues: RetrievalStatusModule (upval), ChangedConnection (upval), Callback (copy), Callback1 (copy)
				if p2.Startup.FetchHomePageDataStatusAll == RetrievalStatusModule.Fetching and Value.Startup.FetchHomePageDataStatusAll ~= p2.Startup.FetchHomePageDataStatusAll then
					if ChangedConnection ~= nil then
						ChangedConnection:disconnect()
						ChangedConnection = nil
					end
					if Value.Startup.FetchHomePageDataStatusAll == RetrievalStatusModule.Done then
						Callback()
						
						return
					end
					Callback1()
				end
			end)
		end)))
	end
	return PromiseUtilitiesModule.Batch(List):andThen(function(Result)
		-- upvalues: LoggingProtocol (copy), PromiseUtilitiesModule (upval), List (copy)
		if LoggingProtocol then
			LoggingProtocol:logEventOnce("preload_first_class_end")
		end
		local FailureCount = PromiseUtilitiesModule.CountResults(Result).failureCount
		
		if FailureCount ~= 0 then
			warn(string.format("%d of %d first-class preloading operations failed!", FailureCount, #List))
			
			if LoggingProtocol then
				LoggingProtocol:logEventOnce("preload_first_class_error")
			end
		end
	end)
end

local function startStandardAppSecondClassPagePreloadOperations(p1)
	-- upvalues: FetchUserDataForHomePageFunction (copy), FetchNotificationCountModule (copy), LocalizationService (copy), WaitUntilIXPUserInitModule (copy), IXPService (copy), AppUserLayers (copy), ApiFetchAutocompleteLocalCacheModule (copy), FFlagLuaAppChartsAppPage (copy), FlagSettingsModule (copy), CorePackages (copy), FFlagLuaAppChartsResetFetchingStatusOnFilterChange (copy), RetrievalStatusModule (copy), FetchGamesPageDataFunction (copy), CryoModule (copy), ApiFetchEconomyCurrencyModule (copy), ApiFetchSiteMessageModule (copy), PromiseUtilitiesModule (copy)
	if p1.loggingProtocol then
		p1.loggingProtocol:logEventOnce("preload_second_class_begin")
	end
	local NetworkImpl = p1.networkImpl
	local Analytics = p1.analytics
	local Store = p1.store
	local Platform = p1.platform
	local List = {}
	Store:dispatch(FetchUserDataForHomePageFunction(NetworkImpl, p1.userId))
	table.insert(List, Store:dispatch(FetchNotificationCountModule(NetworkImpl)))
	local RobloxLocaleId = LocalizationService.RobloxLocaleId
	table.insert(List, (Store:dispatch(WaitUntilIXPUserInitModule(IXPService, p1.userId)):andThen(function()
		-- upvalues: IXPService (upval), AppUserLayers (upval), Store (copy), ApiFetchAutocompleteLocalCacheModule (upval), NetworkImpl (copy), RobloxLocaleId (copy)
		return Store:dispatch(ApiFetchAutocompleteLocalCacheModule.Fetch(NetworkImpl, 0, RobloxLocaleId, IXPService:GetUserLayerVariables(AppUserLayers.SearchAutocompleteLayer).variationId))
	end)))
	
	if FFlagLuaAppChartsAppPage then
		if FlagSettingsModule.IsLuaGamesPagePreloadingEnabled(Platform) then
			local ChartsModule = require(CorePackages.Workspace.Packages.Charts)
			local LoadTimerWithSurfaceLoadTime = require(CorePackages.Workspace.Packages.SduiSharedUtilities).SduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(ChartsModule.ChartsConstants.ConfigKey, {
				eventName = ChartsModule.ChartsConstants.SurfaceLoadTimeEventName,
				metadata = { page = "preload" }
			})
			LoadTimerWithSurfaceLoadTime.start("preload")
			table.insert(List, (ChartsModule.fetchChartsPage(LoadTimerWithSurfaceLoadTime)))
		end
	elseif FlagSettingsModule.IsLuaGamesPagePreloadingEnabled(Platform) and (if FFlagLuaAppChartsResetFetchingStatusOnFilterChange then Store:getState().Startup.GamesPageDataStatus.status else Store:getState().Startup.GamesPageDataStatus) == RetrievalStatusModule.NotStarted then
		table.insert(List, (Store:dispatch(FetchGamesPageDataFunction(NetworkImpl, Analytics, nil))))
	end
	local JoinResult = CryoModule.Dictionary.join(List, {})
	table.insert(JoinResult, (Store:dispatch(ApiFetchEconomyCurrencyModule(NetworkImpl, p1.userId, true))))
	table.insert(JoinResult, Store:dispatch(ApiFetchSiteMessageModule(NetworkImpl)))
	
	return PromiseUtilitiesModule.Batch(JoinResult):andThen(function(Result)
		-- upvalues: PromiseUtilitiesModule (upval), JoinResult (ref)
		local FailureCount = PromiseUtilitiesModule.CountResults(Result).failureCount
		
		if FailureCount ~= 0 then
			warn(string.format("%d of %d second-class preloading operations failed!", FailureCount, #JoinResult))
		end
	end)
end

return function(NetworkImpl, _, Analytics, PolicyData, LoggingProtocol, p1, PrefetchProtocol)
	-- upvalues: HttpCanceller (copy), Players (copy), startStandardAppFirstClassPagePreloadOperations (copy), NetworkProfiler (copy), ReportToDiagByCountryCode (copy), UsersFriendsPresenceOnAppStartupModule (copy), startStandardAppSecondClassPagePreloadOperations (copy), PromiseModule (copy)
	return function(Store)
		-- upvalues: LoggingProtocol (copy), HttpCanceller (upval), NetworkImpl (copy), Analytics (copy), PolicyData (copy), Players (upval), PrefetchProtocol (copy), startStandardAppFirstClassPagePreloadOperations (upval), NetworkProfiler (upval), ReportToDiagByCountryCode (upval), UsersFriendsPresenceOnAppStartupModule (upval), p1 (copy), startStandardAppSecondClassPagePreloadOperations (upval), PromiseModule (upval)
		if LoggingProtocol then
			LoggingProtocol:logEventOnce("preload_first_class_begin")
		end
		local CurrentSessionResult = HttpCanceller.currentSession()
		local config = {
			networkImpl = NetworkImpl,
			analytics = Analytics,
			store = Store,
			policyData = PolicyData,
			platform = Store:getState().Platform,
			userId = tostring(Players.LocalPlayer.UserId),
			loggingProtocol = LoggingProtocol,
			prefetchProtocol = PrefetchProtocol
		}
		
		return startStandardAppFirstClassPagePreloadOperations(config):andThen(function()
			-- upvalues: NetworkProfiler (upval), ReportToDiagByCountryCode (upval), UsersFriendsPresenceOnAppStartupModule (upval), Store (copy), Analytics (upval), CurrentSessionResult (copy), HttpCanceller (upval), p1 (upval), startStandardAppSecondClassPagePreloadOperations (upval), config (copy), PromiseModule (upval)
			NetworkProfiler:report(ReportToDiagByCountryCode)
			UsersFriendsPresenceOnAppStartupModule(Store:getState(), Analytics)
			
			if CurrentSessionResult ~= HttpCanceller.currentSession() then return end
			local NoP12 = not p1 or p1.isInteractive
			
			return if NoP12 then startStandardAppSecondClassPagePreloadOperations(config) else PromiseModule.new(function(Callback)
				-- upvalues: p1 (upval), CurrentSessionResult (upval), HttpCanceller (upval), startStandardAppSecondClassPagePreloadOperations (upval), config (upval)
				local ChangedConnection = nil
				ChangedConnection = p1.changed:connect(function()
					-- upvalues: p1 (upval), ChangedConnection (ref), CurrentSessionResult (upval), HttpCanceller (upval), Callback (copy), startStandardAppSecondClassPagePreloadOperations (upval), config (upval)
					if p1.isInteractive then
						if ChangedConnection ~= nil then
							ChangedConnection:disconnect()
							ChangedConnection = nil
						end
						if CurrentSessionResult ~= HttpCanceller.currentSession() then return end
						Callback(startStandardAppSecondClassPagePreloadOperations(config))
					end
				end)
			end)
		end)
	end
end