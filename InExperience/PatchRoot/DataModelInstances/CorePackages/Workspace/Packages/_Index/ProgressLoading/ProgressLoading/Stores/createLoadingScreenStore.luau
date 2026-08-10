local progressLoading = script:FindFirstAncestor("ProgressLoading")
local parent = progressLoading.Parent
local experienceService = game:GetService("ExperienceService")
local guiService = game:GetService("GuiService")
local dataHydrationModule = require(parent.DataHydration)
local signalsModule = require(parent.Signals)
local createDataCache = dataHydrationModule.createDataCache
local createDataResolver = dataHydrationModule.createDataResolver
local fetchPlayerLocalizationChoiceModule = require(script.Parent.fetchPlayerLocalizationChoice)
local loadingScreenTelemetryModule = require(progressLoading.LoadingScreenTelemetry)
local queueExperimentation = require(parent.SocialExperiments).QueueExperimentation
local var7 = game:GetEngineFeature("PlaceJoinStateEnabled") and (queueExperimentation.getIsJoinNewServerButtonEnabled() or queueExperimentation.getIsAutoJoinNewServerEnabled())

return function() --[[ line: 27 | named "createLoadingScreenStore" ]]
	-- upvalues: createDataCache (ref), createDataResolver (ref), loadingScreenTelemetryModule (ref), fetchPlayerLocalizationChoiceModule (ref), var7 (ref), signalsModule (ref), experienceService (ref), guiService (ref)
	local var8 = createDataCache()
	local var9 = createDataResolver({
		supportsMultiGet = false,
		cache = var8,
		logError = function(p0) --[[ line: 32 ]]
			-- upvalues: loadingScreenTelemetryModule (copy)
			if type(p0) == "table" then
				loadingScreenTelemetryModule.countPlayerLocalizationChoiceFailed({ responseCode = p0.responseCode, errorType = p0.errorType })
				
				return
			end
			loadingScreenTelemetryModule.countPlayerLocalizationChoiceFailed({ errorType = "PlayerLocalizationChoiceFetchError" })
		end,
		fetchFn = function(p1, _) --[[ line: 49 ]]
			-- upvalues: fetchPlayerLocalizationChoiceModule (copy)
			return fetchPlayerLocalizationChoiceModule(p1):andThen(function(p3) --[[ line: 51 ]]
				-- upvalues: p1 (ref)
				if not p3 or not p3.responseBody then
					error({
						errorType = "PlayerLocalizationChoiceResponseError",
						responseCode = p3 and p3.responseCode,
						errorMessage = if p3 then "Missing response body" else "No response",
						customFields = { universeId = p1 }
					})
				end
				local responseBody = p3.responseBody
				
				if responseBody.IsPlayerChoiceEnabled == nil then
					error({
						errorType = "PlayerLocalizationChoiceMissingKey",
						errorMessage = "Missing IsPlayerChoiceEnabled in response body",
						responseCode = p3.responseCode,
						customFields = { universeId = p1, responseBody = responseBody }
					})
				end
				return responseBody
			end):catch(function(p2) --[[ line: 74 ]]
				error(p2)
			end)
		end
	})
	local uiMessageChangedConnection = nil
	local placeJoinStateChangedConnection = nil
	local var12 = nil
	local _ = nil
	local var13 = nil
	local _ = nil
	
	if var7 then
		local var14, var15 = signalsModule.createSignal(experienceService:GetPlaceJoinState() or "")
		var12 = var14
		local var16 = var15
		placeJoinStateChangedConnection = experienceService.PlaceJoinStateChanged:Connect(function(p4) --[[ line: 83 ]]
			-- upvalues: var16 (write)
			var16(p4)
		end)
		local var17, var18 = signalsModule.createSignal(guiService:GetUiMessage() or "")
		var13 = var17
		local var19 = var18
		uiMessageChangedConnection = guiService.UiMessageChanged:Connect(function(p5, p6) --[[ line: 89 ]]
			-- upvalues: var19 (write)
			if p5 == Enum.UiMessageType.UiMessageInfo then
				var19(p6)
			end
		end)
	end
	return {
		getJoinState = var12,
		getServerStatusText = var13,
		getAndFetchPlayerLocalizationChoice = var9.getAndFetchItem,
		getCachedPlayerLocalizationChoice = var9.getCachedItem,
		clear = function() --[[ line: 96 ]]
			-- upvalues: var8 (ref), var9 (ref)
			var8.clear()
			var9.clear()
		end,
		dispose = function() --[[ line: 101 ]]
			-- upvalues: var9 (ref), var7 (copy), placeJoinStateChangedConnection (write), uiMessageChangedConnection (write)
			var9.dispose()
			
			if var7 then
				placeJoinStateChangedConnection:Disconnect()
				uiMessageChangedConnection:Disconnect()
			end
		end
	}
end