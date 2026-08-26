local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local parent = sduiSharedUtilities.Parent
local sduiPageAnalyticsModule = require(sduiSharedUtilities.SduiPageAnalytics)
local _ = require(sduiSharedUtilities.SduiIntegrationTypes)
local fFlagSduiGameIconSupport = require(parent.SharedFlags).FFlagSduiGameIconSupport
local fFlagLuaAppSduiStreamingFirstDataTiming = require(parent.SharedFlags).FFlagLuaAppSduiStreamingFirstDataTiming
local _ = {
	UiRequestSent = "UiRequestSent",
	UiRequestQueued = "UiRequestQueued",
	UiResponseReceived = "UiResponseReceived",
	UiStreamChunkReceived = "UiStreamChunkReceived",
	ResponseDecodeBegin = "ResponseDecodeBegin",
	ResponseDecodeEnd = "ResponseDecodeEnd",
	ResponseDataUpdateBegin = "ResponseDataUpdateBegin",
	ResponseDataUpdateEnd = "ResponseDataUpdateEnd",
	SduiTreeBuildBegin = "SduiTreeBuildBegin",
	SduiTreeBuildEnd = "SduiTreeBuildEnd",
	SduiClientHintsBegin = "SduiClientHintsBegin",
	SduiClientHintsEnd = "SduiClientHintsEnd",
	SduiComponentMounted = "SduiComponentMounted",
	SduiComponentReady = "SduiComponentReady",
	RefreshComplete = "RefreshComplete"
}

return {
	createLoadTimer = function(p1, p2)
		-- upvalues: fFlagLuaAppSduiStreamingFirstDataTiming (ref), fFlagSduiGameIconSupport (ref), sduiPageAnalyticsModule (ref)
		local var1 = nil
		local var2 = nil
		local t = {}
		local var3 = nil
		local var4 = "NotStarted"
		local var5 = nil
		local var6 = nil
		
		local function _(p3, p4)
			-- upvalues: t (ref)
			local var7 = t[p3]
			local var8 = t[p4]
			
			return if var7 and var8 then (var8 - var7) * 1000 else nil
		end
		
		local function start(p3)
			-- upvalues: var1 (write), var4 (write), var6 (write)
			var1 = os.clock()
			var4 = "Running"
			var6 = p3
		end
		
		local function finish()
			-- upvalues: var4 (write), var1 (write), var2 (write), fFlagLuaAppSduiStreamingFirstDataTiming (copy), t (ref), var3 (write), var5 (write), p1 (ref), var6 (write), fFlagSduiGameIconSupport (copy), p2 (ref), sduiPageAnalyticsModule (copy)
			if var4 ~= "Running" or var1 == nil then return end
			local uiRequestQueued, var7, uiRequestQueued_1, var8
			var4 = "Finished"
			var2 = os.clock()
			local var9 = (var2 - var1) * 1000
			local _ = nil
			
			if fFlagLuaAppSduiStreamingFirstDataTiming then
				uiRequestQueued = t.UiRequestQueued
				local uiStreamChunkReceived = t.UiStreamChunkReceived
				var7 = if uiRequestQueued and uiStreamChunkReceived then (uiStreamChunkReceived - uiRequestQueued) * 1000 else nil
				uiRequestQueued_1 = t.UiRequestQueued
				local uiResponseReceived = t.UiResponseReceived
				uiRequestQueued = if uiRequestQueued_1 and uiResponseReceived then (uiResponseReceived - uiRequestQueued_1) * 1000 else nil
				var8 = if var7 and uiRequestQueued then math.min(var7, uiRequestQueued) else var7 or uiRequestQueued
			else
				var7 = t.UiRequestQueued
				local uiResponseReceived = t.UiResponseReceived
				var8 = if var7 and uiResponseReceived then (uiResponseReceived - var7) * 1000 else nil
			end
			uiRequestQueued = t.ResponseDecodeBegin
			uiRequestQueued_1 = t.ResponseDecodeEnd
			var7 = if uiRequestQueued and uiRequestQueued_1 then (uiRequestQueued_1 - uiRequestQueued) * 1000 else nil
			uiRequestQueued_1 = t.ResponseDataUpdateBegin
			local responseDataUpdateEnd = t.ResponseDataUpdateEnd
			uiRequestQueued = if uiRequestQueued_1 and responseDataUpdateEnd then (responseDataUpdateEnd - uiRequestQueued_1) * 1000 else nil
			local sduiTreeBuildBegin = t.SduiTreeBuildBegin
			local sduiTreeBuildEnd = t.SduiTreeBuildEnd
			uiRequestQueued_1 = if sduiTreeBuildBegin and sduiTreeBuildEnd then (sduiTreeBuildEnd - sduiTreeBuildBegin) * 1000 else nil
			local t_1 = {
				totalDurationMs = var9,
				uiRequestDurationMs = var8,
				responseDecodeDurationMs = var7,
				sduiTreeBuildDurationMs = uiRequestQueued_1,
				dataUpdateDurationMs = uiRequestQueued,
				netRoundTripTimeMs = var3 and (var3.RoundTripTime and var3.RoundTripTime * 1000),
				netDurationReceiveResponseMs = var3 and (var3.DurationReceiveResponse and var3.DurationReceiveResponse * 1000),
				requestStatus = var5,
				pageKey = p1,
				startSource = var6 or "unknown"
			}
			
			if fFlagSduiGameIconSupport then
				local sduiClientHintsBegin = t.SduiClientHintsBegin
				local sduiClientHintsEnd = t.SduiClientHintsEnd
				t_1.clientHintsDurationMs = if sduiClientHintsBegin and sduiClientHintsEnd then (sduiClientHintsEnd - sduiClientHintsBegin) * 1000 else nil
			end
			if p2 then
				p2(t_1)
				
				return
			end
			sduiPageAnalyticsModule.sendLoadTimerEvent(t_1)
		end
		
		local _ = function(p3)
			-- upvalues: t (ref)
			t[p3] = os.clock()
		end
		
		return {
			start = start,
			logUiRequestQueued = function()
				-- upvalues: var4 (write), var1 (write), var6 (write), t (ref)
				if var4 == "NotStarted" then
					var1 = os.clock()
					var4 = "Running"
					var6 = "UiRequestQueued"
				end
				t.UiRequestQueued = os.clock()
			end,
			logUiRequestSent = function()
				-- upvalues: var4 (write), var1 (write), var6 (write), t (ref)
				if var4 == "NotStarted" then
					var1 = os.clock()
					var4 = "Running"
					var6 = "UiRequestSent"
				end
				t.UiRequestSent = os.clock()
			end,
			logUiResponseReceived = function()
				-- upvalues: t (ref)
				t.UiResponseReceived = os.clock()
			end,
			logUiStreamChunkReceived = function()
				-- upvalues: fFlagLuaAppSduiStreamingFirstDataTiming (copy), t (ref)
				if fFlagLuaAppSduiStreamingFirstDataTiming and t.UiStreamChunkReceived ~= nil then
					return
				end
				t.UiStreamChunkReceived = os.clock()
			end,
			logResponseDecodeBegin = function()
				-- upvalues: t (ref)
				t.ResponseDecodeBegin = os.clock()
			end,
			logResponseDecodeEnd = function()
				-- upvalues: t (ref)
				t.ResponseDecodeEnd = os.clock()
			end,
			logResponseDataUpdateBegin = function()
				-- upvalues: t (ref)
				t.ResponseDataUpdateBegin = os.clock()
			end,
			logResponseDataUpdateEnd = function()
				-- upvalues: t (ref)
				t.ResponseDataUpdateEnd = os.clock()
			end,
			logSduiTreeBuildBegin = function()
				-- upvalues: t (ref)
				t.SduiTreeBuildBegin = os.clock()
			end,
			logSduiTreeBuildEnd = function()
				-- upvalues: t (ref)
				t.SduiTreeBuildEnd = os.clock()
			end,
			logSduiClientHintsBegin = function()
				-- upvalues: t (ref)
				t.SduiClientHintsBegin = os.clock()
			end,
			logSduiClientHintsEnd = function()
				-- upvalues: t (ref)
				t.SduiClientHintsEnd = os.clock()
			end,
			logComponentMounted = function()
				-- upvalues: t (ref)
				t.SduiComponentMounted = os.clock()
			end,
			logComponentReady = function()
				-- upvalues: t (ref), var4 (write), finish (ref)
				t.SduiComponentReady = os.clock()
				
				if var4 == "Running" then
					finish()
				end
			end,
			logRefreshComplete = function()
				-- upvalues: t (ref), var4 (write), finish (ref)
				t.RefreshComplete = os.clock()
				
				if var4 == "Running" then
					finish()
				end
			end,
			logNetRequestStats = function(p3)
				-- upvalues: var3 (write)
				var3 = p3
			end,
			updateRequestStatus = function(p3)
				-- upvalues: var5 (write)
				var5 = p3
			end,
			finish = finish
		}
	end
}