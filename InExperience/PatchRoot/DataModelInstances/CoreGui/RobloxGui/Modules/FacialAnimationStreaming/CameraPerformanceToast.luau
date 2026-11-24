return {
	LOCAL_STORAGE_KEY = "CameraPerformanceUXUnixTimestamp",
	new = function(p1)
		local Now = p1.now or os.time
		local Delay = p1.delay or task.delay
		local AppStorageService = p1.AppStorageService
		
		local function attemptToShow(p2)
			-- upvalues: p1 (copy), Now (copy), Delay (copy), attemptToShow (copy), AppStorageService (copy)
			if p1.ixpEnabled() then
				local Success, Result = pcall(function()
					-- upvalues: p1 (upval)
					return p1.IXPServiceWrapper:GetLayerData(p1.ixpLayerName())
				end)
				
				if not Success then return end
				if not Result then return end
				if not Result.UXForCameraPerformanceEnabled then return end
			end
			local NowResultDelta = Now() - p1.sessionStartUnixTime
			
			if not p2 and NowResultDelta < p1.sessionDelaySec then
				Delay(p1.sessionDelaySec - NowResultDelta, function()
					-- upvalues: attemptToShow (upval)
					attemptToShow(true)
				end)
				
				return
			end
			local Number: number? = 0
			local Success1, Result1 = pcall(function()
				-- upvalues: AppStorageService (upval)
				return AppStorageService:GetItem("CameraPerformanceUXUnixTimestamp")
			end)
			
			if not Success1 then return end
			Number = tonumber(Result1)
			if Now() - Number >= p1.deviceDelaySec then
				pcall(function()
					-- upvalues: AppStorageService (upval), Number (ref), p1 (upval)
					AppStorageService:SetItem("CameraPerformanceUXUnixTimestamp", (tostring(Number)))
					AppStorageService:Flush()
					p1.TrackerMenu:showPrompt(p1.TrackerPromptType.LODCameraRecommendDisable)
					p1.AnalyticsService:SendEventDeferred("client", "avatarChat", "UXForCameraPerformanceShown", {
						userId = p1.getLocalUserId(),
						pid = tostring(p1.getPlaceId())
					})
				end)
				
				return
			end
		end
		
		return {
			attemptToShow = function()
				-- upvalues: attemptToShow (copy)
				attemptToShow(false)
			end
		}
	end
}