local ProgressLoading = script:FindFirstAncestor("ProgressLoading")
local Parent = ProgressLoading.Parent
local ExperienceService = game:GetService("ExperienceService")
local GuiService = game:GetService("GuiService")
local DataHydrationModule = require(Parent.DataHydration)
local SignalsModule = require(Parent.Signals)
local CreateDataCacheFunction = DataHydrationModule.createDataCache
local CreateDataResolverFunction = DataHydrationModule.createDataResolver
local FetchPlayerLocalizationChoiceModule = require(script.Parent.fetchPlayerLocalizationChoice)
local LoadingScreenTelemetryModule = require(ProgressLoading.LoadingScreenTelemetry)
local QueueExperimentation = require(Parent.SocialExperiments).QueueExperimentation
local IsJoinNewServerButtonEnabled = game:GetEngineFeature("PlaceJoinStateEnabled") and (QueueExperimentation.getIsJoinNewServerButtonEnabled() or QueueExperimentation.getIsAutoJoinNewServerEnabled())

return function() --[[ Line: 27 | Named "createLoadingScreenStore" ]]
	-- upvalues: CreateDataCacheFunction (copy), CreateDataResolverFunction (copy), LoadingScreenTelemetryModule (copy), FetchPlayerLocalizationChoiceModule (copy), IsJoinNewServerButtonEnabled (copy), SignalsModule (copy), ExperienceService (copy), GuiService (copy)
	local DataCache = CreateDataCacheFunction()
	local DataResolver = CreateDataResolverFunction({
		supportsMultiGet = false,
		cache = DataCache,
		logError = function(p1) --[[ Line: 32 ]]
			-- upvalues: LoadingScreenTelemetryModule (upval)
			if type(p1) == "table" then
				LoadingScreenTelemetryModule.countPlayerLocalizationChoiceFailed({ responseCode = p1.responseCode, errorType = p1.errorType })
				
				return
			else
				LoadingScreenTelemetryModule.countPlayerLocalizationChoiceFailed({ errorType = "PlayerLocalizationChoiceFetchError" })
			end
		end,
		fetchFn = function(UniverseId, _) --[[ Line: 49 ]]
			-- upvalues: FetchPlayerLocalizationChoiceModule (upval)
			return FetchPlayerLocalizationChoiceModule(UniverseId):andThen(function(Result) --[[ Line: 51 ]]
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
			end):catch(function(Err) --[[ Line: 74 ]]
				error(Err)
			end)
		end
	})
	local Connection = nil
	local Connection1 = nil
	local GetJoinState = nil
	local Signal2 = nil
	local GetServerStatusText = nil
	local Signal2_1 = nil
	
	if IsJoinNewServerButtonEnabled then
		GetJoinState, Signal2 = SignalsModule.createSignal(ExperienceService:GetPlaceJoinState() or "")
		Connection1 = ExperienceService.PlaceJoinStateChanged:Connect(function(State) --[[ Line: 83 ]]
			-- upvalues: Signal2 (ref)
			Signal2(State)
		end)
		GetServerStatusText, Signal2_1 = SignalsModule.createSignal(GuiService:GetUiMessage() or "")
		Connection = GuiService.UiMessageChanged:Connect(function(MsgType, NewUiMessage) --[[ Line: 89 ]]
			-- upvalues: Signal2_1 (ref)
			if MsgType == Enum.UiMessageType.UiMessageInfo then
				Signal2_1(NewUiMessage)
			end
		end)
	end
	return {
		getJoinState = GetJoinState,
		getServerStatusText = GetServerStatusText,
		getAndFetchPlayerLocalizationChoice = DataResolver.getAndFetchItem,
		getCachedPlayerLocalizationChoice = DataResolver.getCachedItem,
		clear = function() --[[ Line: 96 ]]
			-- upvalues: DataCache (copy), DataResolver (copy)
			DataCache.clear()
			DataResolver.clear()
		end,
		dispose = function() --[[ Line: 101 ]]
			-- upvalues: DataResolver (copy), IsJoinNewServerButtonEnabled (upval), Connection1 (ref), Connection (ref)
			DataResolver.dispose()
			
			if IsJoinNewServerButtonEnabled then
				Connection1:Disconnect()
				Connection:Disconnect()
			end
		end
	}
end