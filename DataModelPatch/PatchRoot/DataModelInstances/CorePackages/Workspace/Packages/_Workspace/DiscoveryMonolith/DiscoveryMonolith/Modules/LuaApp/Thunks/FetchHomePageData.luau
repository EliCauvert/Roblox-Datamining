local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local GameSortGroups = require(Parent.DiscoveryTypes).GameSortGroups
local PromiseModule = require(Parent.Promise)
local RetrievalStatus = require(Parent.Http).Enum.RetrievalStatus
local AppPage = require(Parent.RobloxAppEnums).AppPage
local CallOnceFunction = require(Parent.AppCommonLib).callOnce
local MemStorageKeys = require(Parent.RobloxAppEnums).MemStorageKeys
local Modules = DiscoveryMonolith.Modules
local ApiFetchOmniRecommendationsModule = require(Modules.LuaApp.Thunks.Omni.ApiFetchOmniRecommendations)
local ApiFetchGamesDataModule = require(Modules.LuaApp.Thunks.Games.ApiFetchGamesData)
local ApiFetchSortTokensModule = require(Modules.LuaApp.Thunks.Games.ApiFetchSortTokens)
local SetHomePageDataStatusModule = require(Modules.LuaApp.Actions.SetHomePageDataStatus)
local SetFetchHomePageDataStatusAllModule = require(Modules.LuaApp.Actions.SetFetchHomePageDataStatusAll)
local FetchHomePageContactMethodModuleVariationModule = require(Modules.LuaApp.Thunks.FetchHomePageContactMethodModuleVariation)
local FetchUserDataForHomePageModule = require(Modules.LuaApp.Thunks.FetchUserDataForHomePage)
local GetIxpPerfRegressionTestSecondsModule = require(Modules.LuaApp.Flags.GetIxpPerfRegressionTestSeconds)
local GetFFlagEnableHomePageUpsellCardModule = require(Modules.LuaApp.Flags.GetFFlagEnableHomePageUpsellCard)
local LuaAppsDiagPageLoadTimeHomeFVariable = settings():GetFVariable("LuaAppsDiagPageLoadTimeHome")

local function fetchHomePageData(p1, p2, p3, p4, p5, p6, p7, p8, p9, _, p10)
	-- upvalues: RetrievalStatus (copy), PromiseModule (copy), SetHomePageDataStatusModule (copy), SetFetchHomePageDataStatusAllModule (copy), GetFFlagEnableHomePageUpsellCardModule (copy), FetchHomePageContactMethodModuleVariationModule (copy), ApiFetchOmniRecommendationsModule (copy), AppPage (copy), ApiFetchSortTokensModule (copy), GameSortGroups (copy), GetIxpPerfRegressionTestSecondsModule (copy), CallOnceFunction (copy), MemStorageKeys (copy), FetchUserDataForHomePageModule (copy), LuaAppsDiagPageLoadTimeHomeFVariable (copy), ApiFetchGamesDataModule (copy)
	if p5:getState().Startup.HomePageDataStatus == RetrievalStatus.Fetching then
		return PromiseModule.resolve("home page data is already fetching")
	end
	if p7 then
		p7:logEvent("fetch_homepage_data_begin")
	end
	local CurrentTime = tick()
	p5:dispatch(SetHomePageDataStatusModule(RetrievalStatus.Fetching))
	p5:dispatch(SetFetchHomePageDataStatusAllModule(RetrievalStatus.Fetching))
	
	if GetFFlagEnableHomePageUpsellCardModule() then
		p5:dispatch(FetchHomePageContactMethodModuleVariationModule(p1))
	end
	local Callback = p6 and function()
		-- upvalues: p8 (copy), p5 (copy), ApiFetchOmniRecommendationsModule (upval), p1 (copy), p2 (copy), AppPage (upval), p9 (copy), p7 (copy)
		return p5:dispatch(ApiFetchOmniRecommendationsModule(p1, p2, AppPage.Home, nil, if p8 then p8:popPendingPrefetchGuid() else nil, p9, p7, true))
	end or function()
		-- upvalues: p5 (copy), ApiFetchSortTokensModule (upval), p1 (copy), GameSortGroups (upval)
		return p5:dispatch(ApiFetchSortTokensModule(p1, GameSortGroups.HomeGames, nil))
	end
	
	local function _()
		-- upvalues: GetIxpPerfRegressionTestSecondsModule (upval), CallOnceFunction (upval), MemStorageKeys (upval)
		local IxpPerfRegressionTestSecondsModule, IxpPerfRegressionTestSecondsModule2 = GetIxpPerfRegressionTestSecondsModule()
		
		if IxpPerfRegressionTestSecondsModule then
			CallOnceFunction(MemStorageKeys.PerfRegressionTestTTI, function()
				-- upvalues: IxpPerfRegressionTestSecondsModule2 (copy)
				if IxpPerfRegressionTestSecondsModule2 ~= 0 then
					task.wait(IxpPerfRegressionTestSecondsModule2)
				end
			end)
			
			return
		end
	end
	
	if not p10 then
		p5:dispatch(FetchUserDataForHomePageModule(p1, p4))
	end
	return if p6 then Callback():andThen(function(_)
		-- upvalues: GetIxpPerfRegressionTestSecondsModule (upval), CallOnceFunction (upval), MemStorageKeys (upval), p5 (copy), SetHomePageDataStatusModule (upval), RetrievalStatus (upval), SetFetchHomePageDataStatusAllModule (upval), CurrentTime (copy), p3 (copy), LuaAppsDiagPageLoadTimeHomeFVariable (upval), p7 (copy)
		local IxpPerfRegressionTestSecondsModule, IxpPerfRegressionTestSecondsModule2 = GetIxpPerfRegressionTestSecondsModule()
		
		if IxpPerfRegressionTestSecondsModule then
			CallOnceFunction(MemStorageKeys.PerfRegressionTestTTI, function()
				-- upvalues: IxpPerfRegressionTestSecondsModule2 (copy)
				if IxpPerfRegressionTestSecondsModule2 ~= 0 then
					task.wait(IxpPerfRegressionTestSecondsModule2)
				end
			end)
		end
		p5:dispatch(SetHomePageDataStatusModule(RetrievalStatus.Done))
		p5:dispatch(SetFetchHomePageDataStatusAllModule(RetrievalStatus.Done))
		p3.Diag:reportStats(LuaAppsDiagPageLoadTimeHomeFVariable, (tick() - CurrentTime) * 1000)
		
		if p7 then
			p7:logEvent("fetch_homepage_data_end")
		end
	end, function(_)
		-- upvalues: p5 (copy), SetHomePageDataStatusModule (upval), RetrievalStatus (upval), SetFetchHomePageDataStatusAllModule (upval), p7 (copy)
		p5:dispatch(SetHomePageDataStatusModule(RetrievalStatus.Failed))
		p5:dispatch(SetFetchHomePageDataStatusAllModule(RetrievalStatus.Failed))
		
		if p7 then
			p7:logEvent("fetch_homepage_data_error")
		end
	end) else Callback():andThen(function(_)
		-- upvalues: p5 (copy), SetHomePageDataStatusModule (upval), RetrievalStatus (upval), ApiFetchGamesDataModule (upval), p1 (copy), GameSortGroups (upval), PromiseModule (upval)
		p5:dispatch(SetHomePageDataStatusModule(RetrievalStatus.Done))
		
		return PromiseModule.all({
			p5:dispatch(ApiFetchGamesDataModule(p1, GameSortGroups.HomeGames))
		})
	end, function(p11)
		-- upvalues: p5 (copy), SetHomePageDataStatusModule (upval), RetrievalStatus (upval), PromiseModule (upval)
		p5:dispatch(SetHomePageDataStatusModule(RetrievalStatus.Failed))
		
		return PromiseModule.reject(p11)
	end):andThen(function(_)
		-- upvalues: p5 (copy), RetrievalStatus (upval), SetFetchHomePageDataStatusAllModule (upval), CurrentTime (copy), p3 (copy), LuaAppsDiagPageLoadTimeHomeFVariable (upval), p7 (copy)
		p5:dispatch(SetFetchHomePageDataStatusAllModule(p5:getState().Startup.HomePageDataStatus == RetrievalStatus.Failed and RetrievalStatus.Failed or RetrievalStatus.Done))
		p3.Diag:reportStats(LuaAppsDiagPageLoadTimeHomeFVariable, (tick() - CurrentTime) * 1000)
		
		if p7 then
			p7:logEvent("fetch_homepage_data_end")
		end
	end, function(_)
		-- upvalues: p5 (copy), SetFetchHomePageDataStatusAllModule (upval), RetrievalStatus (upval), p7 (copy)
		p5:dispatch(SetFetchHomePageDataStatusAllModule(RetrievalStatus.Failed))
		
		if p7 then
			p7:logEvent("fetch_homepage_data_error")
		end
	end)
end

return function(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10)
	-- upvalues: fetchHomePageData (copy)
	return function(p11)
		-- upvalues: fetchHomePageData (upval), p1 (copy), p2 (copy), p3 (copy), p4 (copy), p5 (copy), p6 (copy), p7 (copy), p8 (copy), p9 (copy), p10 (copy)
		return fetchHomePageData(p1, p2, p3, p4, p11, p5, p6, p7, p8, p9, p10)
	end
end