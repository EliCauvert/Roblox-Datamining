local TiltLoadingScreen = script:FindFirstAncestor("TiltLoadingScreen")
local Parent = TiltLoadingScreen.Parent
local Parent1 = Parent.Parent
local SignalsModule = require(Parent1.Signals)
local HttpModule = require(Parent1.Http)
local DataHydrationModule = require(Parent1.DataHydration)
local QueueExperimentation = require(Parent1.SocialExperiments).QueueExperimentation
local CachedPolicyServiceModule = require(Parent1.CachedPolicyService)
local MarketplaceGetMarketplaceAssetStoreModule = require(Parent1.DataHydration.MarketplaceGetMarketplaceAssetStore)
local LoadingScreenTelemetryModule = require(Parent.LoadingScreenTelemetry)
local ConstantsModule = require(TiltLoadingScreen.Constants)
local MarketplaceService = game:GetService("MarketplaceService")
local ExperienceService = game:GetService("ExperienceService")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local FFlagEnableLuaAppsFollowUserId = require(Parent1.SharedFlags).FFlagEnableLuaAppsFollowUserId
local CreateDataCacheFunction = DataHydrationModule.createDataCache
local CreateDataResolverFunction = DataHydrationModule.createDataResolver
local QueuePositionEnabledEngineFeature = game:GetEngineFeature("QueuePositionEnabled")
local FFlagEnableLuaAppsFollowUserId1 = game:GetEngineFeature("ExperienceServiceFollowUserIdEnabled") and FFlagEnableLuaAppsFollowUserId
local PlaceJoinStateEnabledEngineFeature = game:GetEngineFeature("PlaceJoinStateEnabled")
local RequestInternalWrapperResult = HttpModule.NetworkLayers.requestInternalWrapper((game:GetService("HttpService")))

local function defaultFetchUniverseId(p1) --[[ Line: 79 ]]
	-- upvalues: HttpModule (copy), RequestInternalWrapperResult (copy)
	local v1, v2 = RequestInternalWrapperResult(string.format("%suniverses/v1/places/%d/universe", HttpModule.Url.APIS_URL, p1), "GET"):await()
	
	return if v1 and v2 and v2.responseBody then v2.responseBody.universeId else nil
end

local function defaultFetchProductInfo(AssetId) --[[ Line: 88 ]]
	-- upvalues: MarketplaceService (copy)
	return (MarketplaceService:GetProductInfoAsync(AssetId))
end

local function defaultFetchPlayerLocalizationChoice(UniverseId) --[[ Line: 92 ]]
	-- upvalues: RequestInternalWrapperResult (copy), HttpModule (copy)
	return RequestInternalWrapperResult(string.format("%sv1/user-localization-settings/player-choice/%s", HttpModule.Url.GAME_INTERNATIONALIZATION_URL, UniverseId), "GET"):andThen(function(Result) --[[ Line: 100 ]]
		-- upvalues: UniverseId (copy)
		if not Result or not Result.responseBody then
			error({
				errorType = "PlayerLocalizationChoiceResponseError",
				responseCode = Result and Result.responseCode,
				errorMessage = if Result then "Missing response body" else "No response",
				customFields = { universeId = UniverseId }
			})
		end
		local ResponseBody = Result.responseBody
		
		if ResponseBody.IsPlayerChoiceEnabled == nil then
			error({
				errorType = "PlayerLocalizationChoiceMissingKey",
				errorMessage = "Missing IsPlayerChoiceEnabled in response body",
				responseCode = Result.responseCode,
				customFields = { universeId = UniverseId, responseBody = ResponseBody }
			})
		end
		return ResponseBody
	end)
end

local function _() --[[ Line: 123 | Named "getQueueTreatment" ]]
	-- upvalues: PlaceJoinStateEnabledEngineFeature (copy), QueueExperimentation (copy), ConstantsModule (copy)
	return if PlaceJoinStateEnabledEngineFeature then if QueueExperimentation.getIsAutoJoinNewServerEnabled() then ConstantsModule.AUTO_JOIN_TREATMENT elseif QueueExperimentation.getIsJoinNewServerButtonEnabled() then ConstantsModule.JOIN_NEW_SERVER_TREATMENT else nil else nil
end

return function(p1: number, p2, p3) --[[ Line: 136 | Named "createTiltLoadingScreenModel" ]]
	-- upvalues: ExperienceService (copy), GuiService (copy), defaultFetchUniverseId (copy), defaultFetchProductInfo (copy), CachedPolicyServiceModule (copy), defaultFetchPlayerLocalizationChoice (copy), MarketplaceGetMarketplaceAssetStoreModule (copy), CreateDataCacheFunction (copy), CreateDataResolverFunction (copy), LoadingScreenTelemetryModule (copy), SignalsModule (copy), PlaceJoinStateEnabledEngineFeature (copy), QueueExperimentation (copy), ConstantsModule (copy), FFlagEnableLuaAppsFollowUserId1 (copy), QueuePositionEnabledEngineFeature (copy), UserInputService (copy)
	local DataModel = if p2 and p2.dataModel then p2.dataModel else game
	local ExperienceService1 = if p2 and p2.experienceService then p2.experienceService else ExperienceService
	local GuiService1 = if p2 and p2.guiService then p2.guiService else GuiService
	local FetchUniverseId = p2 and p2.fetchUniverseId or defaultFetchUniverseId
	local FetchProductInfo = p2 and p2.fetchProductInfo or defaultFetchProductInfo
	local FetchIsSubjectToChinaPolicies = p2 and p2.fetchIsSubjectToChinaPolicies or function() --[[ Line: 149 ]]
		-- upvalues: CachedPolicyServiceModule (upval)
		return CachedPolicyServiceModule:IsSubjectToChinaPolicies()
	end
	local FetchPlayerLocalizationChoice = p2 and p2.fetchPlayerLocalizationChoice or defaultFetchPlayerLocalizationChoice
	
	local function _() --[[ Line: 155 | Named "readServerStatusText" ]]
		-- upvalues: GuiService1 (copy)
		if GuiService1.GetUiMessage then
			local Success, Result = pcall(GuiService1.GetUiMessage, GuiService1)
			
			return if Success and type(Result) == "string" then Result else ""
		else
			return ""
		end
	end
	
	local MarketplaceGetMarketplaceAssetStoreModuleResult = MarketplaceGetMarketplaceAssetStoreModule(false)
	local DataCache = CreateDataCacheFunction()
	local DataResolver = CreateDataResolverFunction({
		supportsMultiGet = false,
		cache = DataCache,
		logError = function(p4) --[[ Line: 167 ]]
			-- upvalues: LoadingScreenTelemetryModule (upval)
			if type(p4) == "table" then
				LoadingScreenTelemetryModule.countPlayerLocalizationChoiceFailed({ responseCode = p4.responseCode, errorType = p4.errorType })
				
				return
			else
				LoadingScreenTelemetryModule.countPlayerLocalizationChoiceFailed({ errorType = "PlayerLocalizationChoiceFetchError" })
			end
		end,
		fetchFn = function(p4) --[[ Line: 179 ]]
			-- upvalues: FetchPlayerLocalizationChoice (copy)
			return FetchPlayerLocalizationChoice(p4)
		end
	})
	local PlaceId = if p3 == nil and p1 <= 0 then DataModel.PlaceId else p1
	local Signal, Signal2 = SignalsModule.createSignal(if PlaceId > 0 then PlaceId else 0)
	local GameId = if p3 == nil then DataModel.GameId else p3
	local Signal1, Signal2_1 = SignalsModule.createSignal(if GameId > 0 then GameId else 0)
	local AUTOJOINTREATMENT = if p3 == nil and PlaceJoinStateEnabledEngineFeature then if QueueExperimentation.getIsAutoJoinNewServerEnabled() then ConstantsModule.AUTO_JOIN_TREATMENT elseif QueueExperimentation.getIsJoinNewServerButtonEnabled() then ConstantsModule.JOIN_NEW_SERVER_TREATMENT else nil else nil
	local Signal3 = SignalsModule.createSignal(AUTOJOINTREATMENT)
	local Signal4, Signal2_2 = SignalsModule.createSignal("")
	local Signal5, Signal2_3 = SignalsModule.createSignal(nil)
	local CreateSignalFunction = SignalsModule.createSignal
	local v1 = nil
	
	if p3 == nil then
		if GuiService1.GetUiMessage then
			local Success, Result = pcall(GuiService1.GetUiMessage, GuiService1)
			v1 = if Success and type(Result) == "string" then Result else ""
		else
			v1 = ""
		end
	else
		v1 = ""
	end
	local Signal6, Signal2_4 = CreateSignalFunction(v1)
	local Signal7, Signal2_5 = SignalsModule.createSignal(0)
	local Signal8, Signal2_6 = SignalsModule.createSignal(false)
	local Flag = false
	local Flag1 = false
	local Flag2 = false
	local Connection = nil
	local Connection1 = nil
	local PlaceJoinStateChangedConnection = nil
	local QueuePositionChangedConnection = nil
	local UiMessageChangedConnection = nil
	local DeferredThread = nil
	local DeferredThread1 = nil
	local DeferredThread2 = nil
	local Flag3 = false
	local Flag4 = false
	
	local _ = function(Thread) --[[ Line: 242 | Named "cancel" ]]
		if Thread and coroutine.status(Thread) ~= "dead" then
			task.cancel(Thread)
		end
	end
	
	local _ = function(Connection) --[[ Line: 248 | Named "disconnect" ]]
		if Connection then
			Connection:Disconnect()
		end
		return nil
	end
	
	local _ = function() --[[ Line: 255 | Named "readFollowUserId" ]]
		-- upvalues: FFlagEnableLuaAppsFollowUserId1 (upval), ExperienceService1 (copy)
		if FFlagEnableLuaAppsFollowUserId1 and ExperienceService1.GetFollowUserId then
			local Success, Result = pcall(ExperienceService1.GetFollowUserId, ExperienceService1)
			
			return if Success and type(Result) == "number" then Result else 0
		else
			return 0
		end
	end
	
	local _ = function() --[[ Line: 263 | Named "readExposureFollowUserId" ]]
		-- upvalues: ExperienceService1 (copy)
		if ExperienceService1.GetFollowUserId then
			local Success, Result = pcall(ExperienceService1.GetFollowUserId, ExperienceService1)
			
			return if Success and type(Result) == "number" then Result else 0
		else
			return 0
		end
	end
	
	local _ = function() --[[ Line: 271 | Named "readQueuePosition" ]]
		-- upvalues: QueuePositionEnabledEngineFeature (upval), ExperienceService1 (copy)
		if QueuePositionEnabledEngineFeature and ExperienceService1.GetQueuePosition then
			local Success, Result = pcall(ExperienceService1.GetQueuePosition, ExperienceService1)
			
			return if Success and type(Result) == "number" then Result else nil
		else
			return nil
		end
	end
	
	local function updateQueuePosition() --[[ Line: 279 ]]
		-- upvalues: Signal2_3 (copy), QueuePositionEnabledEngineFeature (upval), ExperienceService1 (copy)
		local v2 = nil
		if QueuePositionEnabledEngineFeature and ExperienceService1.GetQueuePosition then
			local Success, Result = pcall(ExperienceService1.GetQueuePosition, ExperienceService1)
			v2 = if Success and type(Result) == "number" then Result else nil
		else
			v2 = nil
		end
		Signal2_3(v2)
	end
	
	local _ = function(QUEUEDSTATE) --[[ Line: 283 | Named "logQueueExposureIfNeeded" ]]
		-- upvalues: Flag3 (ref), ConstantsModule (upval), Signal (copy), ExperienceService1 (copy), QueueExperimentation (upval)
		if not Flag3 and QUEUEDSTATE == ConstantsModule.QUEUED_STATE and Signal(false) > 0 then
			local v2 = nil
			if ExperienceService1.GetFollowUserId then
				local Success, Result = pcall(ExperienceService1.GetFollowUserId, ExperienceService1)
				v2 = if Success and type(Result) == "number" then Result else 0
			else
				v2 = 0
			end
			if v2 > 0 and QueueExperimentation.isInExperiment() then
				Flag3 = true
				QueueExperimentation.logExposure()
				
				return
			end
		end
	end
	
	local function updateJoinState(State) --[[ Line: 297 ]]
		-- upvalues: Signal2_2 (copy), ConstantsModule (upval), Signal2_3 (copy), Flag3 (ref), Signal (copy), ExperienceService1 (copy), QueueExperimentation (upval)
		if type(State) ~= "string" then return end
		Signal2_2(State)
		
		if State ~= ConstantsModule.QUEUED_STATE then
			Signal2_3(nil)
		end
		if not Flag3 and State == ConstantsModule.QUEUED_STATE and Signal(false) > 0 then
			local v2 = nil
			if ExperienceService1.GetFollowUserId then
				local Success, Result = pcall(ExperienceService1.GetFollowUserId, ExperienceService1)
				v2 = if Success and type(Result) == "number" then Result else 0
			else
				v2 = 0
			end
			if v2 > 0 then
				if not QueueExperimentation.isInExperiment() then return end
				Flag3 = true
				QueueExperimentation.logExposure()
			end
		end
	end
	
	local _ = function(p4: number) --[[ Line: 308 | Named "resolveUniverseId" ]]
		-- upvalues: Flag2 (ref), Signal1 (copy), Signal2_1 (copy), Connection1 (ref)
		if Flag2 or p4 <= 0 or Signal1(false) > 0 then return end
		Signal2_1(p4)
		local Connection = Connection1
		
		if Connection then
			Connection:Disconnect()
		end
		Connection1 = nil
	end
	
	local function watchUniverseId() --[[ Line: 316 ]]
		-- upvalues: Connection1 (ref), Flag2 (ref), Signal1 (copy), DataModel (copy), Signal2_1 (copy)
		local Connection = Connection1
		
		if Connection then
			Connection:Disconnect()
		end
		Connection1 = nil
		
		if Flag2 or Signal1(false) > 0 then return end
		Connection1 = DataModel:GetPropertyChangedSignal("GameId"):Connect(function() --[[ Line: 321 ]]
			-- upvalues: DataModel (upval), Flag2 (upval), Signal1 (upval), Signal2_1 (upval), Connection1 (upval)
			local GameId: number = DataModel.GameId
			
			if not Flag2 and GameId > 0 then
				if Signal1(false) > 0 then return end
				Signal2_1(GameId)
				local Connection = Connection1
				
				if Connection then
					Connection:Disconnect()
				end
				Connection1 = nil
			end
		end)
		local GameId: number = DataModel.GameId
		
		if not Flag2 and GameId > 0 then
			if Signal1(false) > 0 then return end
			Signal2_1(GameId)
			local Connection1 = Connection1
			
			if Connection1 then
				Connection1:Disconnect()
			end
			Connection1 = nil
		end
	end
	
	local _ = function(p4) --[[ Line: 327 | Named "fetchUniverseIdForPlace" ]]
		-- upvalues: Signal1 (copy), DeferredThread1 (ref), FetchUniverseId (copy), Flag2 (ref), Signal (copy), Signal2_1 (copy), Connection1 (ref)
		if Signal1(false) > 0 then return end
		local Thread = DeferredThread1
		
		if Thread and coroutine.status(Thread) ~= "dead" then
			task.cancel(Thread)
		end
		DeferredThread1 = task.defer(function() --[[ Line: 332 ]]
			-- upvalues: FetchUniverseId (upval), p4 (copy), Flag2 (upval), Signal (upval), Signal1 (upval), Signal2_1 (upval), Connection1 (upval)
			local Success, Result = pcall(FetchUniverseId, p4)
			
			if not Flag2 and p4 == Signal(false) and Success and type(Result) == "number" and not Flag2 and Result > 0 then
				if Signal1(false) > 0 then return end
				Signal2_1(Result)
				local Connection = Connection1
				
				if Connection then
					Connection:Disconnect()
				end
				Connection1 = nil
			end
		end)
	end
	
	local _ = function(p4) --[[ Line: 340 | Named "fetchGameDataForPlace" ]]
		-- upvalues: DeferredThread (ref), FetchProductInfo (copy), Flag2 (ref), Signal (copy), MarketplaceGetMarketplaceAssetStoreModuleResult (copy)
		local Thread = DeferredThread
		
		if Thread and coroutine.status(Thread) ~= "dead" then
			task.cancel(Thread)
		end
		DeferredThread = task.defer(function() --[[ Line: 342 ]]
			-- upvalues: FetchProductInfo (upval), p4 (copy), Flag2 (upval), Signal (upval), MarketplaceGetMarketplaceAssetStoreModuleResult (upval)
			local Success, Result = pcall(FetchProductInfo, p4)
			
			if not Success then
				print(string.format("LoadingScreen:GetGameProductInfo: %s", (tostring(Result))))
				
				return
			end
			if not Flag2 and p4 == Signal(false) then
				local Creator = Result.Creator
				MarketplaceGetMarketplaceAssetStoreModuleResult.updateMarketplaceAssetInfo(tostring(p4), {
					name = Result.Name or "",
					creatorName = Creator and Creator.Name or "",
					creatorHasVerifiedBadge = if Creator then Creator.HasVerifiedBadge == true else false
				})
				
				return
			end
		end)
	end
	
	local _ = function() --[[ Line: 361 | Named "resolveChinaPolicy" ]]
		-- upvalues: DeferredThread2 (ref), FetchIsSubjectToChinaPolicies (copy), Flag2 (ref), Signal2_6 (copy)
		local Thread = DeferredThread2
		
		if Thread and coroutine.status(Thread) ~= "dead" then
			task.cancel(Thread)
		end
		DeferredThread2 = task.defer(function() --[[ Line: 363 ]]
			-- upvalues: FetchIsSubjectToChinaPolicies (upval), Flag2 (upval), Signal2_6 (upval)
			local Success, Result = pcall(FetchIsSubjectToChinaPolicies)
			
			if not Flag2 and Success and type(Result) == "boolean" then
				Signal2_6(Result)
			end
		end)
	end
	
	local _ = function(p4: number) --[[ Line: 371 | Named "beginRequests" ]]
		-- upvalues: DeferredThread (ref), FetchProductInfo (copy), Flag2 (ref), Signal (copy), MarketplaceGetMarketplaceAssetStoreModuleResult (copy), Signal1 (copy), DeferredThread1 (ref), FetchUniverseId (copy), Signal2_1 (copy), Connection1 (ref)
		if p4 <= 0 then return end
		local Thread = DeferredThread
		
		if Thread and coroutine.status(Thread) ~= "dead" then
			task.cancel(Thread)
		end
		DeferredThread = task.defer(function() --[[ Line: 342 ]]
			-- upvalues: FetchProductInfo (upval), p4 (copy), Flag2 (upval), Signal (upval), MarketplaceGetMarketplaceAssetStoreModuleResult (upval)
			local Success, Result = pcall(FetchProductInfo, p4)
			
			if not Success then
				print(string.format("LoadingScreen:GetGameProductInfo: %s", (tostring(Result))))
				
				return
			end
			if not Flag2 and p4 == Signal(false) then
				local Creator = Result.Creator
				MarketplaceGetMarketplaceAssetStoreModuleResult.updateMarketplaceAssetInfo(tostring(p4), {
					name = Result.Name or "",
					creatorName = Creator and Creator.Name or "",
					creatorHasVerifiedBadge = if Creator then Creator.HasVerifiedBadge == true else false
				})
				
				return
			end
		end)
		
		if Signal1(false) > 0 then return end
		local Thread1 = DeferredThread1
		
		if Thread1 and coroutine.status(Thread1) ~= "dead" then
			task.cancel(Thread1)
		end
		DeferredThread1 = task.defer(function() --[[ Line: 332 ]]
			-- upvalues: FetchUniverseId (upval), p4 (copy), Flag2 (upval), Signal (upval), Signal1 (upval), Signal2_1 (upval), Connection1 (upval)
			local Success, Result = pcall(FetchUniverseId, p4)
			
			if not Flag2 and p4 == Signal(false) and Success and type(Result) == "number" and not Flag2 and Result > 0 then
				if Signal1(false) > 0 then return end
				Signal2_1(Result)
				local Connection = Connection1
				
				if Connection then
					Connection:Disconnect()
				end
				Connection1 = nil
			end
		end)
	end
	
	local _ = function(p4: number) --[[ Line: 379 | Named "resolvePlaceId" ]]
		-- upvalues: Flag2 (ref), Signal (copy), Signal2 (copy), Connection (ref), DeferredThread (ref), FetchProductInfo (copy), MarketplaceGetMarketplaceAssetStoreModuleResult (copy), Signal1 (copy), DeferredThread1 (ref), FetchUniverseId (copy), Signal2_1 (copy), Connection1 (ref)
		if Flag2 or p4 <= 0 or Signal(false) == p4 then return end
		Signal2(p4)
		local Connection2 = Connection
		
		if Connection2 then
			Connection2:Disconnect()
		end
		Connection = nil
		
		if p4 <= 0 then return end
		local Thread = DeferredThread
		
		if Thread and coroutine.status(Thread) ~= "dead" then
			task.cancel(Thread)
		end
		DeferredThread = task.defer(function() --[[ Line: 342 ]]
			-- upvalues: FetchProductInfo (upval), p4 (copy), Flag2 (upval), Signal (upval), MarketplaceGetMarketplaceAssetStoreModuleResult (upval)
			local Success, Result = pcall(FetchProductInfo, p4)
			
			if not Success then
				print(string.format("LoadingScreen:GetGameProductInfo: %s", (tostring(Result))))
				
				return
			end
			if not Flag2 and p4 == Signal(false) then
				local Creator = Result.Creator
				MarketplaceGetMarketplaceAssetStoreModuleResult.updateMarketplaceAssetInfo(tostring(p4), {
					name = Result.Name or "",
					creatorName = Creator and Creator.Name or "",
					creatorHasVerifiedBadge = if Creator then Creator.HasVerifiedBadge == true else false
				})
				
				return
			end
		end)
		
		if Signal1(false) > 0 then return end
		local Thread1 = DeferredThread1
		
		if Thread1 and coroutine.status(Thread1) ~= "dead" then
			task.cancel(Thread1)
		end
		DeferredThread1 = task.defer(function() --[[ Line: 332 ]]
			-- upvalues: FetchUniverseId (upval), p4 (copy), Flag2 (upval), Signal (upval), Signal1 (upval), Signal2_1 (upval), Connection1 (upval)
			local Success, Result = pcall(FetchUniverseId, p4)
			
			if not Flag2 and p4 == Signal(false) and Success and type(Result) == "number" and not Flag2 and Result > 0 then
				if Signal1(false) > 0 then return end
				Signal2_1(Result)
				local Connection = Connection1
				
				if Connection then
					Connection:Disconnect()
				end
				Connection1 = nil
			end
		end)
	end
	
	return {
		getAssetInfo = SignalsModule.createComputed(function(p4) --[[ Line: 199 ]]
			-- upvalues: Signal (copy), MarketplaceGetMarketplaceAssetStoreModuleResult (copy)
			local SignalResult: number = Signal(p4)
			
			if SignalResult <= 0 then
				return nil
			else
				local DataResult = MarketplaceGetMarketplaceAssetStoreModuleResult.getMarketplaceAssetInfo((tostring(SignalResult))).data(p4)
				
				return if DataResult then {
					name = DataResult.name,
					creatorName = DataResult.creatorName,
					creatorHasVerifiedBadge = DataResult.creatorHasVerifiedBadge
				} else nil
			end
		end),
		getFollowUserId = Signal7,
		getIsAutoTranslated = SignalsModule.createComputed(function(p4) --[[ Line: 215 ]]
			-- upvalues: Signal1 (copy), Flag (ref), LoadingScreenTelemetryModule (upval), DataResolver (copy)
			local SignalResult: number = Signal1(p4)
			
			if SignalResult > 0 then
				local DataResult = DataResolver.getAndFetchItem((tostring(SignalResult))).data(p4)
				
				return if DataResult then DataResult.IsPlayerChoiceEnabled else nil
			end
			if not Flag then
				Flag = true
				LoadingScreenTelemetryModule.countAutoTranslateZeroUniverseId()
			end
			return nil
		end),
		getIsSubjectToChinaPolicies = Signal8,
		getJoinState = Signal4,
		getQueuePosition = Signal5,
		getQueueTreatment = Signal3,
		getServerStatusText = Signal6,
		getUniverseId = Signal1,
		launchExperience = function() --[[ Line: 468 ]]
			-- upvalues: Signal (copy), ExperienceService1 (copy)
			local SignalResult: number = Signal(false)
			
			if SignalResult > 0 and ExperienceService1.LaunchExperience then
				ExperienceService1:LaunchExperience({ placeId = SignalResult })
			end
		end,
		logQueuedStateButtonClick = function(ButtonName, TimeElapsedMs) --[[ Line: 482 ]]
			-- upvalues: AUTOJOINTREATMENT (copy), LoadingScreenTelemetryModule (upval), FFlagEnableLuaAppsFollowUserId1 (upval), Signal7 (copy), Signal (copy), QueuePositionEnabledEngineFeature (upval), Signal5 (copy), Signal1 (copy)
			if AUTOJOINTREATMENT then
				LoadingScreenTelemetryModule.logQueuedStateButtonClick({
					buttonName = ButtonName,
					joinTargetUserId = if FFlagEnableLuaAppsFollowUserId1 then Signal7(false) else nil,
					placeId = Signal(false),
					positionInQueue = if QueuePositionEnabledEngineFeature then Signal5(false) else nil,
					timeElapsedMs = TimeElapsedMs,
					universeId = Signal1(false)
				})
				
				return
			end
		end,
		showConnectionHealth = function() --[[ Line: 475 ]]
			-- upvalues: GuiService1 (copy), Flag4 (ref)
			if GuiService1.ShowStatsBasedOnInputString then
				Flag4 = true
				GuiService1:ShowStatsBasedOnInputString("ConnectionHealth")
			end
		end,
		start = function() --[[ Line: 389 ]]
			-- upvalues: Flag1 (ref), Flag2 (ref), p3 (copy), DeferredThread2 (ref), FetchIsSubjectToChinaPolicies (copy), Signal2_6 (copy), Signal (copy), DeferredThread (ref), FetchProductInfo (copy), MarketplaceGetMarketplaceAssetStoreModuleResult (copy), Signal1 (copy), DeferredThread1 (ref), FetchUniverseId (copy), Signal2_1 (copy), Connection1 (ref), Connection (ref), DataModel (copy), Signal2 (copy), watchUniverseId (copy), Signal2_5 (copy), FFlagEnableLuaAppsFollowUserId1 (upval), ExperienceService1 (copy), GuiService1 (copy), UiMessageChangedConnection (ref), Signal2_4 (copy), QueueExperimentation (upval), Signal2_2 (copy), ConstantsModule (upval), Signal2_3 (copy), Flag3 (ref), PlaceJoinStateChangedConnection (ref), updateJoinState (copy), QueuePositionEnabledEngineFeature (upval), QueuePositionChangedConnection (ref), updateQueuePosition (copy)
			if Flag1 or Flag2 then return end
			Flag1 = true
			
			if p3 == nil then
				if Signal(false) <= 0 then
					Connection = DataModel:GetPropertyChangedSignal("PlaceId"):Connect(function() --[[ Line: 400 ]]
						-- upvalues: DataModel (upval), Flag2 (upval), Signal (upval), Signal2 (upval), Connection (upval), DeferredThread (upval), FetchProductInfo (upval), MarketplaceGetMarketplaceAssetStoreModuleResult (upval), Signal1 (upval), DeferredThread1 (upval), FetchUniverseId (upval), Signal2_1 (upval), Connection1 (upval)
						local PlaceId: number = DataModel.PlaceId
						
						if not Flag2 and PlaceId > 0 then
							if Signal(false) == PlaceId then return end
							Signal2(PlaceId)
							local Connection2 = Connection
							
							if Connection2 then
								Connection2:Disconnect()
							end
							Connection = nil
							
							if PlaceId <= 0 then return end
							local Thread = DeferredThread
							
							if Thread and coroutine.status(Thread) ~= "dead" then
								task.cancel(Thread)
							end
							DeferredThread = task.defer(function() --[[ Line: 342 ]]
								-- upvalues: FetchProductInfo (upval), PlaceId (copy), Flag2 (upval), Signal (upval), MarketplaceGetMarketplaceAssetStoreModuleResult (upval)
								local Success, Result = pcall(FetchProductInfo, PlaceId)
								
								if not Success then
									print(string.format("LoadingScreen:GetGameProductInfo: %s", (tostring(Result))))
									
									return
								end
								if not Flag2 and PlaceId == Signal(false) then
									local Creator = Result.Creator
									MarketplaceGetMarketplaceAssetStoreModuleResult.updateMarketplaceAssetInfo(tostring(PlaceId), {
										name = Result.Name or "",
										creatorName = Creator and Creator.Name or "",
										creatorHasVerifiedBadge = if Creator then Creator.HasVerifiedBadge == true else false
									})
									
									return
								end
							end)
							
							if Signal1(false) > 0 then return end
							local Thread1 = DeferredThread1
							
							if Thread1 and coroutine.status(Thread1) ~= "dead" then
								task.cancel(Thread1)
							end
							DeferredThread1 = task.defer(function() --[[ Line: 332 ]]
								-- upvalues: FetchUniverseId (upval), PlaceId (copy), Flag2 (upval), Signal (upval), Signal1 (upval), Signal2_1 (upval), Connection1 (upval)
								local Success, Result = pcall(FetchUniverseId, PlaceId)
								
								if not Flag2 and PlaceId == Signal(false) and Success and type(Result) == "number" and not Flag2 and Result > 0 then
									if Signal1(false) > 0 then return end
									Signal2_1(Result)
									local Connection = Connection1
									
									if Connection then
										Connection:Disconnect()
									end
									Connection1 = nil
								end
							end)
						end
					end)
				end
				watchUniverseId()
				local Thread5 = DeferredThread2
				
				if Thread5 and coroutine.status(Thread5) ~= "dead" then
					task.cancel(Thread5)
				end
				DeferredThread2 = task.defer(function() --[[ Line: 363 ]]
					-- upvalues: FetchIsSubjectToChinaPolicies (upval), Flag2 (upval), Signal2_6 (upval)
					local Success, Result = pcall(FetchIsSubjectToChinaPolicies)
					
					if not Flag2 and Success and type(Result) == "boolean" then
						Signal2_6(Result)
					end
				end)
				local v2 = nil
				
				if FFlagEnableLuaAppsFollowUserId1 and ExperienceService1.GetFollowUserId then
					local Success, Result = pcall(ExperienceService1.GetFollowUserId, ExperienceService1)
					v2 = if Success and type(Result) == "number" then Result else 0
				else
					v2 = 0
				end
				Signal2_5(v2)
				
				if GuiService1.UiMessageChanged then
					UiMessageChangedConnection = GuiService1.UiMessageChanged:Connect(function(MsgType, NewUiMessage) --[[ Line: 408 ]]
						-- upvalues: Signal2_4 (upval)
						if MsgType == Enum.UiMessageType.UiMessageInfo and type(NewUiMessage) == "string" then
							Signal2_4(NewUiMessage)
						end
					end)
				end
				local v3 = nil
				if GuiService1.GetUiMessage then
					local Success1, Result1 = pcall(GuiService1.GetUiMessage, GuiService1)
					v3 = if Success1 and type(Result1) == "string" then Result1 else ""
				else
					v3 = ""
				end
				Signal2_4(v3)
				
				if QueueExperimentation.isInExperiment() then
					if ExperienceService1.GetPlaceJoinState then
						local Success2, Result2 = pcall(ExperienceService1.GetPlaceJoinState, ExperienceService1)
						
						if Success2 and type(Result2) == "string" then
							Signal2_2(Result2)
							
							if Result2 ~= ConstantsModule.QUEUED_STATE then
								Signal2_3(nil)
							end
							if not Flag3 and Result2 == ConstantsModule.QUEUED_STATE and Signal(false) > 0 then
								local v4 = nil
								if ExperienceService1.GetFollowUserId then
									local Success3, Result3 = pcall(ExperienceService1.GetFollowUserId, ExperienceService1)
									v4 = if Success3 and type(Result3) == "number" then Result3 else 0
								else
									v4 = 0
								end
								if v4 > 0 and QueueExperimentation.isInExperiment() then
									Flag3 = true
									QueueExperimentation.logExposure()
								end
							end
						end
					end
					if ExperienceService1.PlaceJoinStateChanged then
						PlaceJoinStateChangedConnection = ExperienceService1.PlaceJoinStateChanged:Connect(updateJoinState)
					end
					if QueuePositionEnabledEngineFeature and ExperienceService1.QueuePositionChanged then
						QueuePositionChangedConnection = ExperienceService1.QueuePositionChanged:Connect(updateQueuePosition)
					end
					if QueuePositionEnabledEngineFeature then
						local v5 = nil
						if QueuePositionEnabledEngineFeature and ExperienceService1.GetQueuePosition then
							local Success4, Result4 = pcall(ExperienceService1.GetQueuePosition, ExperienceService1)
							v5 = if Success4 and type(Result4) == "number" then Result4 else nil
						else
							v5 = nil
						end
						Signal2_3(v5)
					end
				end
				if Signal(false) <= 0 then
					local PlaceId: number = DataModel.PlaceId
					
					if not Flag2 and PlaceId > 0 then
						if Signal(false) == PlaceId then return end
						Signal2(PlaceId)
						local Connection2 = Connection
						
						if Connection2 then
							Connection2:Disconnect()
						end
						Connection = nil
						
						if PlaceId <= 0 then return end
						local Thread6 = DeferredThread
						
						if Thread6 and coroutine.status(Thread6) ~= "dead" then
							task.cancel(Thread6)
						end
						DeferredThread = task.defer(function() --[[ Line: 342 ]]
							-- upvalues: FetchProductInfo (upval), PlaceId (copy), Flag2 (upval), Signal (upval), MarketplaceGetMarketplaceAssetStoreModuleResult (upval)
							local Success, Result = pcall(FetchProductInfo, PlaceId)
							
							if not Success then
								print(string.format("LoadingScreen:GetGameProductInfo: %s", (tostring(Result))))
								
								return
							end
							if not Flag2 and PlaceId == Signal(false) then
								local Creator = Result.Creator
								MarketplaceGetMarketplaceAssetStoreModuleResult.updateMarketplaceAssetInfo(tostring(PlaceId), {
									name = Result.Name or "",
									creatorName = Creator and Creator.Name or "",
									creatorHasVerifiedBadge = if Creator then Creator.HasVerifiedBadge == true else false
								})
								
								return
							end
						end)
						
						if Signal1(false) > 0 then return end
						local Thread2 = DeferredThread1
						
						if Thread2 and coroutine.status(Thread2) ~= "dead" then
							task.cancel(Thread2)
						end
						DeferredThread1 = task.defer(function() --[[ Line: 332 ]]
							-- upvalues: FetchUniverseId (upval), PlaceId (copy), Flag2 (upval), Signal (upval), Signal1 (upval), Signal2_1 (upval), Connection1 (upval)
							local Success, Result = pcall(FetchUniverseId, PlaceId)
							
							if not Flag2 and PlaceId == Signal(false) and Success and type(Result) == "number" and not Flag2 and Result > 0 then
								if Signal1(false) > 0 then return end
								Signal2_1(Result)
								local Connection = Connection1
								
								if Connection then
									Connection:Disconnect()
								end
								Connection1 = nil
							end
						end)
						
						return
					end
				else
					local SignalResult1: number = Signal(false)
					
					if SignalResult1 <= 0 then return end
					local Thread = DeferredThread
					
					if Thread and coroutine.status(Thread) ~= "dead" then
						task.cancel(Thread)
					end
					DeferredThread = task.defer(function() --[[ Line: 342 ]]
						-- upvalues: FetchProductInfo (upval), SignalResult1 (copy), Flag2 (upval), Signal (upval), MarketplaceGetMarketplaceAssetStoreModuleResult (upval)
						local Success, Result = pcall(FetchProductInfo, SignalResult1)
						
						if not Success then
							print(string.format("LoadingScreen:GetGameProductInfo: %s", (tostring(Result))))
							
							return
						end
						if not Flag2 and SignalResult1 == Signal(false) then
							local Creator = Result.Creator
							MarketplaceGetMarketplaceAssetStoreModuleResult.updateMarketplaceAssetInfo(tostring(SignalResult1), {
								name = Result.Name or "",
								creatorName = Creator and Creator.Name or "",
								creatorHasVerifiedBadge = if Creator then Creator.HasVerifiedBadge == true else false
							})
							
							return
						end
					end)
					
					if Signal1(false) > 0 then return end
					local Thread7 = DeferredThread1
					
					if Thread7 and coroutine.status(Thread7) ~= "dead" then
						task.cancel(Thread7)
					end
					DeferredThread1 = task.defer(function() --[[ Line: 332 ]]
						-- upvalues: FetchUniverseId (upval), SignalResult1 (copy), Flag2 (upval), Signal (upval), Signal1 (upval), Signal2_1 (upval), Connection1 (upval)
						local Success, Result = pcall(FetchUniverseId, SignalResult1)
						
						if not Flag2 and SignalResult1 == Signal(false) and Success and type(Result) == "number" and not Flag2 and Result > 0 then
							if Signal1(false) > 0 then return end
							Signal2_1(Result)
							local Connection = Connection1
							
							if Connection then
								Connection:Disconnect()
							end
							Connection1 = nil
						end
					end)
				end
				return
			else
				local Thread1 = DeferredThread2
				
				if Thread1 and coroutine.status(Thread1) ~= "dead" then
					task.cancel(Thread1)
				end
				DeferredThread2 = task.defer(function() --[[ Line: 363 ]]
					-- upvalues: FetchIsSubjectToChinaPolicies (upval), Flag2 (upval), Signal2_6 (upval)
					local Success, Result = pcall(FetchIsSubjectToChinaPolicies)
					
					if not Flag2 and Success and type(Result) == "boolean" then
						Signal2_6(Result)
					end
				end)
				local SignalResult: number = Signal(false)
				
				if SignalResult <= 0 then return end
				local Thread3 = DeferredThread
				
				if Thread3 and coroutine.status(Thread3) ~= "dead" then
					task.cancel(Thread3)
				end
				DeferredThread = task.defer(function() --[[ Line: 342 ]]
					-- upvalues: FetchProductInfo (upval), SignalResult (copy), Flag2 (upval), Signal (upval), MarketplaceGetMarketplaceAssetStoreModuleResult (upval)
					local Success, Result = pcall(FetchProductInfo, SignalResult)
					
					if not Success then
						print(string.format("LoadingScreen:GetGameProductInfo: %s", (tostring(Result))))
						
						return
					end
					if not Flag2 and SignalResult == Signal(false) then
						local Creator = Result.Creator
						MarketplaceGetMarketplaceAssetStoreModuleResult.updateMarketplaceAssetInfo(tostring(SignalResult), {
							name = Result.Name or "",
							creatorName = Creator and Creator.Name or "",
							creatorHasVerifiedBadge = if Creator then Creator.HasVerifiedBadge == true else false
						})
						
						return
					end
				end)
				
				if Signal1(false) > 0 then return end
				local Thread4 = DeferredThread1
				
				if Thread4 and coroutine.status(Thread4) ~= "dead" then
					task.cancel(Thread4)
				end
				DeferredThread1 = task.defer(function() --[[ Line: 332 ]]
					-- upvalues: FetchUniverseId (upval), SignalResult (copy), Flag2 (upval), Signal (upval), Signal1 (upval), Signal2_1 (upval), Connection1 (upval)
					local Success, Result = pcall(FetchUniverseId, SignalResult)
					
					if not Flag2 and SignalResult == Signal(false) and Success and type(Result) == "number" and not Flag2 and Result > 0 then
						if Signal1(false) > 0 then return end
						Signal2_1(Result)
						local Connection = Connection1
						
						if Connection then
							Connection:Disconnect()
						end
						Connection1 = nil
					end
				end)
			end
		end,
		destroy = function() --[[ Line: 440 ]]
			-- upvalues: Flag2 (ref), Connection (ref), Connection1 (ref), PlaceJoinStateChangedConnection (ref), QueuePositionChangedConnection (ref), UiMessageChangedConnection (ref), DeferredThread (ref), DeferredThread1 (ref), DeferredThread2 (ref), DataResolver (copy), DataCache (copy), Flag4 (ref), GuiService1 (copy), UserInputService (upval)
			if Flag2 then return end
			Flag2 = true
			local Connection2 = Connection
			
			if Connection2 then
				Connection2:Disconnect()
			end
			Connection = nil
			local Connection3 = Connection1
			
			if Connection3 then
				Connection3:Disconnect()
			end
			Connection1 = nil
			local Connection4 = PlaceJoinStateChangedConnection
			
			if Connection4 then
				Connection4:Disconnect()
			end
			PlaceJoinStateChangedConnection = nil
			local Connection5 = QueuePositionChangedConnection
			
			if Connection5 then
				Connection5:Disconnect()
			end
			QueuePositionChangedConnection = nil
			local Connection6 = UiMessageChangedConnection
			
			if Connection6 then
				Connection6:Disconnect()
			end
			UiMessageChangedConnection = nil
			local Thread = DeferredThread
			
			if Thread and coroutine.status(Thread) ~= "dead" then
				task.cancel(Thread)
			end
			local Thread1 = DeferredThread1
			
			if Thread1 and coroutine.status(Thread1) ~= "dead" then
				task.cancel(Thread1)
			end
			local Thread2 = DeferredThread2
			
			if Thread2 and coroutine.status(Thread2) ~= "dead" then
				task.cancel(Thread2)
			end
			DataResolver.clear()
			DataCache.clear()
			DataResolver.dispose()
			
			if Flag4 and GuiService1.CloseStatsBasedOnInputString then
				local Connection7 = nil
				Connection7 = UserInputService.InputBegan:Connect(function() --[[ Line: 458 ]]
					-- upvalues: Connection7 (ref), GuiService1 (upval)
					if Connection7 then
						Connection7:Disconnect()
						Connection7 = nil
					end
					GuiService1:CloseStatsBasedOnInputString("ConnectionHealth")
				end)
			end
		end
	}
end