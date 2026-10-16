local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local SduiPageAnalyticsModule = require(SduiSharedUtilities.SduiPageAnalytics)
local _ = require(SduiSharedUtilities.SduiIntegrationTypes)
local FFlagLuaAppSduiStreamingFirstDataTiming = require(SduiSharedUtilities.Parent.SharedFlags).FFlagLuaAppSduiStreamingFirstDataTiming

return {
	createLoadTimer = function(PageKey, Callback) --[[ Line: 86 ]]
		-- upvalues: FFlagLuaAppSduiStreamingFirstDataTiming (copy), SduiPageAnalyticsModule (copy)
		local ClockTime = nil
		local ClockTime1 = nil
		local ClockTimes = {}
		local v1 = nil
		local v2 = "NotStarted"
		local RequestStatus = nil
		local v3 = nil
		
		local function _(p1, p2) --[[ Line: 100 | Named "calculateDuration" ]]
			-- upvalues: ClockTimes (copy)
			local ClockTime = ClockTimes[p1]
			local ClockTime1 = ClockTimes[p2]
			
			return if ClockTime and ClockTime1 then (ClockTime1 - ClockTime) * 1000 else nil
		end
		
		local function finish() --[[ Line: 117 ]]
			-- upvalues: v2 (ref), ClockTime (ref), ClockTime1 (ref), FFlagLuaAppSduiStreamingFirstDataTiming (upval), ClockTimes (copy), v1 (ref), RequestStatus (ref), PageKey (copy), v3 (ref), Callback (copy), SduiPageAnalyticsModule (upval)
			if v2 ~= "Running" or ClockTime == nil then return end
			v2 = "Finished"
			ClockTime1 = os.clock()
			local ScaledClockTime = (ClockTime1 - ClockTime) * 1000
			local Smallest = nil
			
			if FFlagLuaAppSduiStreamingFirstDataTiming then
				local UiRequestQueued = ClockTimes.UiRequestQueued
				local UiStreamChunkReceived = ClockTimes.UiStreamChunkReceived
				local ScaledUiStreamChunkReceived = if UiRequestQueued and UiStreamChunkReceived then (UiStreamChunkReceived - UiRequestQueued) * 1000 else nil
				local UiRequestQueued1 = ClockTimes.UiRequestQueued
				local UiResponseReceived = ClockTimes.UiResponseReceived
				local ScaledUiResponseReceived = if UiRequestQueued1 and UiResponseReceived then (UiResponseReceived - UiRequestQueued1) * 1000 else nil
				Smallest = if ScaledUiStreamChunkReceived and ScaledUiResponseReceived then math.min(ScaledUiStreamChunkReceived, ScaledUiResponseReceived) else ScaledUiStreamChunkReceived or ScaledUiResponseReceived
			else
				local UiRequestQueued = ClockTimes.UiRequestQueued
				local UiResponseReceived = ClockTimes.UiResponseReceived
				Smallest = if UiRequestQueued and UiResponseReceived then (UiResponseReceived - UiRequestQueued) * 1000 else nil
			end
			local ResponseDecodeBegin = ClockTimes.ResponseDecodeBegin
			local ResponseDecodeEnd = ClockTimes.ResponseDecodeEnd
			local ScaledResponseDecodeEnd = if ResponseDecodeBegin and ResponseDecodeEnd then (ResponseDecodeEnd - ResponseDecodeBegin) * 1000 else nil
			local ResponseDataUpdateBegin = ClockTimes.ResponseDataUpdateBegin
			local ResponseDataUpdateEnd = ClockTimes.ResponseDataUpdateEnd
			local ScaledResponseDataUpdateEnd = if ResponseDataUpdateBegin and ResponseDataUpdateEnd then (ResponseDataUpdateEnd - ResponseDataUpdateBegin) * 1000 else nil
			local SduiTreeBuildBegin = ClockTimes.SduiTreeBuildBegin
			local SduiTreeBuildEnd = ClockTimes.SduiTreeBuildEnd
			local SduiClientHintsBegin = ClockTimes.SduiClientHintsBegin
			local SduiClientHintsEnd = ClockTimes.SduiClientHintsEnd
			local config = {
				totalDurationMs = ScaledClockTime,
				uiRequestDurationMs = Smallest,
				responseDecodeDurationMs = ScaledResponseDecodeEnd,
				sduiTreeBuildDurationMs = if SduiTreeBuildBegin and SduiTreeBuildEnd then (SduiTreeBuildEnd - SduiTreeBuildBegin) * 1000 else nil,
				dataUpdateDurationMs = ScaledResponseDataUpdateEnd,
				netRoundTripTimeMs = v1 and (v1.RoundTripTime and v1.RoundTripTime * 1000),
				netDurationReceiveResponseMs = v1 and (v1.DurationReceiveResponse and v1.DurationReceiveResponse * 1000),
				requestStatus = RequestStatus,
				pageKey = PageKey,
				startSource = v3 or "unknown",
				clientHintsDurationMs = if SduiClientHintsBegin and SduiClientHintsEnd then (SduiClientHintsEnd - SduiClientHintsBegin) * 1000 else nil
			}
			
			if Callback then
				Callback(config)
				
				return
			else
				SduiPageAnalyticsModule.sendLoadTimerEvent(config)
			end
		end
		
		local _ = function(Key) --[[ Line: 174 | Named "logTimestamp" ]]
			-- upvalues: ClockTimes (copy)
			ClockTimes[Key] = os.clock()
		end
		
		return {
			start = function(p1) --[[ Line: 110 ]]
				-- upvalues: ClockTime (ref), v2 (ref), v3 (ref)
				ClockTime = os.clock()
				v2 = "Running"
				v3 = p1
			end,
			logUiRequestQueued = function() --[[ Line: 184 ]]
				-- upvalues: v2 (ref), ClockTime (ref), v3 (ref), ClockTimes (copy)
				if v2 == "NotStarted" then
					ClockTime = os.clock()
					v2 = "Running"
					v3 = "UiRequestQueued"
				end
				ClockTimes.UiRequestQueued = os.clock()
			end,
			logUiRequestSent = function() --[[ Line: 192 ]]
				-- upvalues: v2 (ref), ClockTime (ref), v3 (ref), ClockTimes (copy)
				if v2 == "NotStarted" then
					ClockTime = os.clock()
					v2 = "Running"
					v3 = "UiRequestSent"
				end
				ClockTimes.UiRequestSent = os.clock()
			end,
			logUiResponseReceived = function() --[[ Line: 200 ]]
				-- upvalues: ClockTimes (copy)
				ClockTimes.UiResponseReceived = os.clock()
			end,
			logUiStreamChunkReceived = function() --[[ Line: 204 ]]
				-- upvalues: FFlagLuaAppSduiStreamingFirstDataTiming (upval), ClockTimes (copy)
				if not FFlagLuaAppSduiStreamingFirstDataTiming or ClockTimes.UiStreamChunkReceived == nil then
					ClockTimes.UiStreamChunkReceived = os.clock()
					
					return
				end
			end,
			logResponseDecodeBegin = function() --[[ Line: 213 ]]
				-- upvalues: ClockTimes (copy)
				ClockTimes.ResponseDecodeBegin = os.clock()
			end,
			logResponseDecodeEnd = function() --[[ Line: 218 ]]
				-- upvalues: ClockTimes (copy)
				ClockTimes.ResponseDecodeEnd = os.clock()
			end,
			logResponseDataUpdateBegin = function() --[[ Line: 223 ]]
				-- upvalues: ClockTimes (copy)
				ClockTimes.ResponseDataUpdateBegin = os.clock()
			end,
			logResponseDataUpdateEnd = function() --[[ Line: 228 ]]
				-- upvalues: ClockTimes (copy)
				ClockTimes.ResponseDataUpdateEnd = os.clock()
			end,
			logSduiTreeBuildBegin = function() --[[ Line: 233 ]]
				-- upvalues: ClockTimes (copy)
				ClockTimes.SduiTreeBuildBegin = os.clock()
			end,
			logSduiTreeBuildEnd = function() --[[ Line: 238 ]]
				-- upvalues: ClockTimes (copy)
				ClockTimes.SduiTreeBuildEnd = os.clock()
			end,
			logSduiClientHintsBegin = function() --[[ Line: 243 ]]
				-- upvalues: ClockTimes (copy)
				ClockTimes.SduiClientHintsBegin = os.clock()
			end,
			logSduiClientHintsEnd = function() --[[ Line: 248 ]]
				-- upvalues: ClockTimes (copy)
				ClockTimes.SduiClientHintsEnd = os.clock()
			end,
			logComponentMounted = function() --[[ Line: 253 ]]
				-- upvalues: ClockTimes (copy)
				ClockTimes.SduiComponentMounted = os.clock()
			end,
			logComponentReady = function() --[[ Line: 259 ]]
				-- upvalues: ClockTimes (copy), v2 (ref), finish (copy)
				ClockTimes.SduiComponentReady = os.clock()
				
				if v2 == "Running" then
					finish()
				end
			end,
			logRefreshComplete = function() --[[ Line: 268 ]]
				-- upvalues: ClockTimes (copy), v2 (ref), finish (copy)
				ClockTimes.RefreshComplete = os.clock()
				
				if v2 == "Running" then
					finish()
				end
			end,
			logNetRequestStats = function(p1) --[[ Line: 179 ]]
				-- upvalues: v1 (ref)
				v1 = p1
			end,
			updateRequestStatus = function(p1) --[[ Line: 276 ]]
				-- upvalues: RequestStatus (ref)
				RequestStatus = p1
			end,
			finish = finish
		}
	end
}