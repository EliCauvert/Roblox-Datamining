local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local ReactModule = require(Parent.React)
local TModule = require(Parent.t)
local ValidatePropsFunction = require(Parent.DiscoveryUtils).validateProps
local RetrievalStatus = require(Parent.Http).Enum.RetrievalStatus
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local AppLogging = require(Parent.RoactServiceTags).AppLogging
local FetchStatusRoduxModule = require(Parent.FetchStatusRodux)
local FetchStatusReducer = FetchStatusRoduxModule.FetchStatusReducer
local FetchStatusNamespace = FetchStatusRoduxModule.FetchStatusNamespace
local NextDataExpirationTimeRoduxModule = require(Parent.NextDataExpirationTimeRodux)
local NextDataExpirationTimeReducer = NextDataExpirationTimeRoduxModule.NextDataExpirationTimeReducer
local ExpirationTimeNamespace = NextDataExpirationTimeRoduxModule.ExpirationTimeNamespace
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactUtilsModule = require(Parent.RoactUtils)
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local OmniFeedConstants = require(Parent.DiscoveryTypes).OmniFeedConstants
local Modules = DiscoveryMonolith.Modules
local ApiFetchSortTokensModule = require(Modules.LuaApp.Thunks.Games.ApiFetchSortTokens)
local ApiFetchOmniRecommendationsModule = require(Modules.LuaApp.Thunks.Omni.ApiFetchOmniRecommendations)
local StrictInterfaceResult = TModule.strictInterface({
	isOmni = TModule.boolean,
	pageType = TModule.string,
	sortToRefresh = TModule.string
})

return ReactModule.memo(function(p1)
	-- upvalues: ValidatePropsFunction (copy), StrictInterfaceResult (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), AppLogging (copy), ReactModule (copy), UseSelectorFunction (copy), FetchStatusNamespace (copy), FetchStatusReducer (copy), NextDataExpirationTimeReducer (copy), ExpirationTimeNamespace (copy), UseDispatchFunction (copy), ApiFetchOmniRecommendationsModule (copy), OmniFeedConstants (copy), ApiFetchSortTokensModule (copy), RetrievalStatus (copy)
	ValidatePropsFunction(StrictInterfaceResult, p1)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppLogging)
	local SortToRefresh = p1.sortToRefresh
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: p1 (copy), FetchStatusNamespace (upval), SortToRefresh (copy), FetchStatusReducer (upval)
		local OmniRecommendations = nil
		local PageType = nil
		if p1.isOmni then
			OmniRecommendations = FetchStatusNamespace.OmniRecommendations
			PageType = p1.pageType
		else
			OmniRecommendations = FetchStatusNamespace.GameSortToken
			PageType = SortToRefresh
		end
		local PersonalizationEntry = p2.Personalization[FetchStatusReducer.key][OmniRecommendations]
		
		return if PersonalizationEntry then PersonalizationEntry[PageType] else nil
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		-- upvalues: p1 (copy), NextDataExpirationTimeReducer (upval), ExpirationTimeNamespace (upval)
		if p1.isOmni then
			local OmniRecommendationsRefreshTime = p2.OmniRecommendationsRefreshTime
			
			if OmniRecommendationsRefreshTime then
				return OmniRecommendationsRefreshTime[p1.pageType]
			end
		else
			local PersonalizationEntry = p2.Personalization[NextDataExpirationTimeReducer.key][ExpirationTimeNamespace.GameSortGroup]
			
			if PersonalizationEntry then
				return PersonalizationEntry[p1.sortToRefresh]
			end
		end
		return nil
	end)
	local UseDispatchResult = UseDispatchFunction()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseSelectorResult1 (copy), p1 (copy), UseDispatchResult (copy), ApiFetchOmniRecommendationsModule (upval), UseRoactServiceResult (copy), OmniFeedConstants (upval), UseRoactServiceResult1 (copy), ApiFetchSortTokensModule (upval), SortToRefresh (copy)
		UseRefResult.current = UseSelectorResult1
		
		if p1.isOmni then
			UseDispatchResult(ApiFetchOmniRecommendationsModule(UseRoactServiceResult, nil, p1.pageType, nil, nil, OmniFeedConstants.OmniRecommendationsRequestIntent.AutoRefresh, UseRoactServiceResult1))
			
			return
		else
			UseDispatchResult(ApiFetchSortTokensModule(UseRoactServiceResult, SortToRefresh, nil)):catch(function() end)
		end
	end, {
		UseSelectorResult1, p1.isOmni, UseDispatchResult, UseRoactServiceResult, nil,
		p1.pageType, UseRoactServiceResult1, SortToRefresh
	})
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult (copy), RetrievalStatus (upval), UseSelectorResult1 (copy), UseRefResult (copy), UseRefResult1 (copy), UseResult (copy)
		if UseSelectorResult ~= RetrievalStatus.Done then return end
		if not UseSelectorResult1 or UseSelectorResult1 <= 0 then return end
		if UseRefResult.current and UseSelectorResult1 <= UseRefResult.current then return end
		local DeferredThread = task.defer(function(p2)
			-- upvalues: UseRefResult1 (upval), UseResult (upval)
			UseRefResult1.current = true
			local v1 = p2 - tick()
			while v1 > 0 and UseRefResult1.current do
				task.wait((math.min(v1, 300)))
				v1 = p2 - tick()
			end
			if UseRefResult1.current then
				UseResult()
				UseRefResult1.current = nil
			end
		end, UseSelectorResult1)
		
		return function()
			-- upvalues: DeferredThread (copy), UseRefResult1 (upval)
			if DeferredThread and UseRefResult1.current then
				task.cancel(DeferredThread)
				UseRefResult1.current = nil
			end
		end
	end, { UseSelectorResult, UseSelectorResult1, UseResult })
	
	return nil
end)