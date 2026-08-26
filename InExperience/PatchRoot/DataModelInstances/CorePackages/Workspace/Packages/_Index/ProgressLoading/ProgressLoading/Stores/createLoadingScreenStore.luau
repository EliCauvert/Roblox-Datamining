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
local var1 = game:GetEngineFeature("PlaceJoinStateEnabled") and (queueExperimentation.getIsJoinNewServerButtonEnabled() or queueExperimentation.getIsAutoJoinNewServerEnabled())

return function()
	-- upvalues: createDataCache (ref), createDataResolver (ref), loadingScreenTelemetryModule (ref), fetchPlayerLocalizationChoiceModule (ref), var1 (ref), signalsModule (ref), experienceService (ref), guiService (ref)
	local var2 = createDataCache()
	local var3 = createDataResolver({
		supportsMultiGet = false,
		cache = var2,
		logError = function(p1)
			-- upvalues: loadingScreenTelemetryModule (copy)
			if type(p1) == "table" then
				loadingScreenTelemetryModule.countPlayerLocalizationChoiceFailed({ responseCode = p1.responseCode, errorType = p1.errorType })
				
				return
			end
			loadingScreenTelemetryModule.countPlayerLocalizationChoiceFailed({ errorType = "PlayerLocalizationChoiceFetchError" })
		end,
		fetchFn = function(p1, _)
			-- upvalues: fetchPlayerLocalizationChoiceModule (copy)
			return fetchPlayerLocalizationChoiceModule(p1):andThen(function(p2)
				-- upvalues: p1 (ref)
				if not p2 or not p2.responseBody then
					error({
						errorType = "PlayerLocalizationChoiceResponseError",
						responseCode = p2 and p2.responseCode,
						errorMessage = if p2 then "Missing response body" else "No response",
						customFields = { universeId = p1 }
					})
				end
				local responseBody = p2.responseBody
				
				if responseBody.IsPlayerChoiceEnabled == nil then
					error({
						errorType = "PlayerLocalizationChoiceMissingKey",
						errorMessage = "Missing IsPlayerChoiceEnabled in response body",
						responseCode = p2.responseCode,
						customFields = { universeId = p1, responseBody = responseBody }
					})
				end
				return responseBody
			end):catch(function(p2)
				error(p2)
			end)
		end
	})
	local uiMessageChangedConnection = nil
	local placeJoinStateChangedConnection = nil
	local var4 = nil
	local _ = nil
	local var5 = nil
	local _ = nil
	
	if var1 then
		local var6, var7 = signalsModule.createSignal(experienceService:GetPlaceJoinState() or "")
		var4 = var6
		local var8 = var7
		placeJoinStateChangedConnection = experienceService.PlaceJoinStateChanged:Connect(function(p1)
			-- upvalues: var8 (write)
			var8(p1)
		end)
		local var9, var10 = signalsModule.createSignal(guiService:GetUiMessage() or "")
		var5 = var9
		local var11 = var10
		uiMessageChangedConnection = guiService.UiMessageChanged:Connect(function(p1, p2)
			-- upvalues: var11 (write)
			if p1 == Enum.UiMessageType.UiMessageInfo then
				var11(p2)
			end
		end)
	end
	return {
		getJoinState = var4,
		getServerStatusText = var5,
		getAndFetchPlayerLocalizationChoice = var3.getAndFetchItem,
		getCachedPlayerLocalizationChoice = var3.getCachedItem,
		clear = function()
			-- upvalues: var2 (ref), var3 (ref)
			var2.clear()
			var3.clear()
		end,
		dispose = function()
			-- upvalues: var3 (ref), var1 (copy), placeJoinStateChangedConnection (write), uiMessageChangedConnection (write)
			var3.dispose()
			
			if var1 then
				placeJoinStateChangedConnection:Disconnect()
				uiMessageChangedConnection:Disconnect()
			end
		end
	}
end