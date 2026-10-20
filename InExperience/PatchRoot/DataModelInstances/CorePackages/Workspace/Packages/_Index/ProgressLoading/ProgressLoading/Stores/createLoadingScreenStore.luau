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

return function()
	-- upvalues: CreateDataCacheFunction (copy), CreateDataResolverFunction (copy), LoadingScreenTelemetryModule (copy), FetchPlayerLocalizationChoiceModule (copy), IsJoinNewServerButtonEnabled (copy), SignalsModule (copy), ExperienceService (copy), GuiService (copy)
	local DataCache = CreateDataCacheFunction()
	local DataResolver = CreateDataResolverFunction({
		supportsMultiGet = false,
		cache = DataCache,
		logError = function(p1)
			-- upvalues: LoadingScreenTelemetryModule (upval)
			if type(p1) == "table" then
				LoadingScreenTelemetryModule.countPlayerLocalizationChoiceFailed({ responseCode = p1.responseCode, errorType = p1.errorType })
				
				return
			else
				LoadingScreenTelemetryModule.countPlayerLocalizationChoiceFailed({ errorType = "PlayerLocalizationChoiceFetchError" })
			end
		end,
		fetchFn = function(UniverseId, _)
			-- upvalues: FetchPlayerLocalizationChoiceModule (upval)
			return FetchPlayerLocalizationChoiceModule(UniverseId):andThen(function(Result)
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
			end):catch(function(Err)
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
		Connection1 = ExperienceService.PlaceJoinStateChanged:Connect(function(State)
			-- upvalues: Signal2 (ref)
			Signal2(State)
		end)
		GetServerStatusText, Signal2_1 = SignalsModule.createSignal(GuiService:GetUiMessage() or "")
		Connection = GuiService.UiMessageChanged:Connect(function(MsgType, NewUiMessage)
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
		clear = function()
			-- upvalues: DataCache (copy), DataResolver (copy)
			DataCache.clear()
			DataResolver.clear()
		end,
		dispose = function()
			-- upvalues: DataResolver (copy), IsJoinNewServerButtonEnabled (upval), Connection1 (ref), Connection (ref)
			DataResolver.dispose()
			
			if IsJoinNewServerButtonEnabled then
				Connection1:Disconnect()
				Connection:Disconnect()
			end
		end
	}
end