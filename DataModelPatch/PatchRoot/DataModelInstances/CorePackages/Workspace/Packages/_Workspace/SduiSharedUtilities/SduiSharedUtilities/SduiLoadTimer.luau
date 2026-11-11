local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local SduiPageAnalyticsModule = require(SduiSharedUtilities.SduiPageAnalytics)
local _ = require(SduiSharedUtilities.SduiIntegrationTypes)

return {
	createLoadTimer = function(PageKey, Callback)
		-- upvalues: SduiPageAnalyticsModule (copy)
		local ClockTime = nil
		local ClockTime1 = nil
		local ClockTimes = {}
		local v1 = nil
		local v2 = "NotStarted"
		local RequestStatus = nil
		local v3 = nil
		
		local function _(p1, p2)
			-- upvalues: ClockTimes (copy)
			local ClockTime = ClockTimes[p1]
			local ClockTime1 = ClockTimes[p2]
			
			return if ClockTime and ClockTime1 then (ClockTime1 - ClockTime) * 1000 else nil
		end
		
		local function finish()
			-- upvalues: v2 (ref), ClockTime (ref), ClockTime1 (ref), ClockTimes (copy), v1 (ref), RequestStatus (ref), PageKey (copy), v3 (ref), Callback (copy), SduiPageAnalyticsModule (upval)
			if v2 ~= "Running" or ClockTime == nil then return end
			v2 = "Finished"
			ClockTime1 = os.clock()
			local UiRequestQueued = ClockTimes.UiRequestQueued
			local UiResponseReceived = ClockTimes.UiResponseReceived
			local ScaledUiResponseReceived = if UiRequestQueued and UiResponseReceived then (UiResponseReceived - UiRequestQueued) * 1000 else nil
			local ResponseDecodeBegin = ClockTimes.ResponseDecodeBegin
			local ResponseDecodeEnd = ClockTimes.ResponseDecodeEnd
			local ScaledResponseDecodeEnd = if ResponseDecodeBegin and ResponseDecodeEnd then (ResponseDecodeEnd - ResponseDecodeBegin) * 1000 else nil
			local ResponseDataUpdateBegin = ClockTimes.ResponseDataUpdateBegin
			local ResponseDataUpdateEnd = ClockTimes.ResponseDataUpdateEnd
			local ScaledResponseDataUpdateEnd = if ResponseDataUpdateBegin and ResponseDataUpdateEnd then (ResponseDataUpdateEnd - ResponseDataUpdateBegin) * 1000 else nil
			local SduiTreeBuildBegin = ClockTimes.SduiTreeBuildBegin
			local SduiTreeBuildEnd = ClockTimes.SduiTreeBuildEnd
			local config = {
				totalDurationMs = (ClockTime1 - ClockTime) * 1000,
				uiRequestDurationMs = ScaledUiResponseReceived,
				responseDecodeDurationMs = ScaledResponseDecodeEnd,
				sduiTreeBuildDurationMs = if SduiTreeBuildBegin and SduiTreeBuildEnd then (SduiTreeBuildEnd - SduiTreeBuildBegin) * 1000 else nil,
				dataUpdateDurationMs = ScaledResponseDataUpdateEnd,
				netRoundTripTimeMs = v1 and (v1.RoundTripTime and v1.RoundTripTime * 1000),
				netDurationReceiveResponseMs = v1 and (v1.DurationReceiveResponse and v1.DurationReceiveResponse * 1000),
				requestStatus = RequestStatus,
				pageKey = PageKey,
				startSource = v3 or "unknown"
			}
			
			if Callback then
				Callback(config)
				
				return
			else
				SduiPageAnalyticsModule.sendLoadTimerEvent(config)
			end
		end
		
		local _ = function(Key)
			-- upvalues: ClockTimes (copy)
			ClockTimes[Key] = os.clock()
		end
		
		return {
			start = function(p1)
				-- upvalues: ClockTime (ref), v2 (ref), v3 (ref)
				ClockTime = os.clock()
				v2 = "Running"
				v3 = p1
			end,
			logUiRequestQueued = function()
				-- upvalues: v2 (ref), ClockTime (ref), v3 (ref), ClockTimes (copy)
				if v2 == "NotStarted" then
					ClockTime = os.clock()
					v2 = "Running"
					v3 = "UiRequestQueued"
				end
				ClockTimes.UiRequestQueued = os.clock()
			end,
			logUiRequestSent = function()
				-- upvalues: v2 (ref), ClockTime (ref), v3 (ref), ClockTimes (copy)
				if v2 == "NotStarted" then
					ClockTime = os.clock()
					v2 = "Running"
					v3 = "UiRequestSent"
				end
				ClockTimes.UiRequestSent = os.clock()
			end,
			logUiResponseReceived = function()
				-- upvalues: ClockTimes (copy)
				ClockTimes.UiResponseReceived = os.clock()
			end,
			logUiStreamChunkReceived = function()
				-- upvalues: ClockTimes (copy)
				ClockTimes.UiStreamChunkReceived = os.clock()
			end,
			logResponseDecodeBegin = function()
				-- upvalues: ClockTimes (copy)
				ClockTimes.ResponseDecodeBegin = os.clock()
			end,
			logResponseDecodeEnd = function()
				-- upvalues: ClockTimes (copy)
				ClockTimes.ResponseDecodeEnd = os.clock()
			end,
			logResponseDataUpdateBegin = function()
				-- upvalues: ClockTimes (copy)
				ClockTimes.ResponseDataUpdateBegin = os.clock()
			end,
			logResponseDataUpdateEnd = function()
				-- upvalues: ClockTimes (copy)
				ClockTimes.ResponseDataUpdateEnd = os.clock()
			end,
			logSduiTreeBuildBegin = function()
				-- upvalues: ClockTimes (copy)
				ClockTimes.SduiTreeBuildBegin = os.clock()
			end,
			logSduiTreeBuildEnd = function()
				-- upvalues: ClockTimes (copy)
				ClockTimes.SduiTreeBuildEnd = os.clock()
			end,
			logComponentMounted = function()
				-- upvalues: ClockTimes (copy)
				ClockTimes.SduiComponentMounted = os.clock()
			end,
			logComponentReady = function()
				-- upvalues: ClockTimes (copy), v2 (ref), finish (copy)
				ClockTimes.SduiComponentReady = os.clock()
				
				if v2 == "Running" then
					finish()
				end
			end,
			logRefreshComplete = function()
				-- upvalues: ClockTimes (copy), v2 (ref), finish (copy)
				ClockTimes.RefreshComplete = os.clock()
				
				if v2 == "Running" then
					finish()
				end
			end,
			logNetRequestStats = function(p1)
				-- upvalues: v1 (ref)
				v1 = p1
			end,
			updateRequestStatus = function(p1)
				-- upvalues: RequestStatus (ref)
				RequestStatus = p1
			end,
			finish = finish
		}
	end
}