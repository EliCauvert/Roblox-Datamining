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
	createLoadTimer = function(p0, p1)
		-- upvalues: fFlagLuaAppSduiStreamingFirstDataTiming (ref), fFlagSduiGameIconSupport (ref), sduiPageAnalyticsModule (ref)
		local var2 = nil
		local var3 = nil
		local t = {}
		local var5 = nil
		local var6 = "NotStarted"
		local var7 = nil
		local var8 = nil
		
		local function _(p2, p3)
			-- upvalues: t (ref)
			local var11 = t[p2]
			local var12 = t[p3]
			
			return if var11 and var12 then (var12 - var11) * 1000 else nil
		end
		
		local function start(p4)
			-- upvalues: var2 (write), var6 (write), var8 (write)
			var2 = os.clock()
			var6 = "Running"
			var8 = p4
		end
		
		local function finish()
			-- upvalues: var6 (write), var2 (write), var3 (write), fFlagLuaAppSduiStreamingFirstDataTiming (copy), t (ref), var5 (write), var7 (write), p0 (ref), var8 (write), fFlagSduiGameIconSupport (copy), p1 (ref), sduiPageAnalyticsModule (copy)
			if var6 ~= "Running" or var2 == nil then return end
			local uiRequestQueued, var14, uiRequestQueued_1, var15
			var6 = "Finished"
			var3 = os.clock()
			local var13 = (var3 - var2) * 1000
			local _ = nil
			
			if fFlagLuaAppSduiStreamingFirstDataTiming then
				uiRequestQueued = t.UiRequestQueued
				local uiStreamChunkReceived = t.UiStreamChunkReceived
				var14 = if uiRequestQueued and uiStreamChunkReceived then (uiStreamChunkReceived - uiRequestQueued) * 1000 else nil
				uiRequestQueued_1 = t.UiRequestQueued
				local uiResponseReceived = t.UiResponseReceived
				uiRequestQueued = if uiRequestQueued_1 and uiResponseReceived then (uiResponseReceived - uiRequestQueued_1) * 1000 else nil
				var15 = if var14 and uiRequestQueued then math.min(var14, uiRequestQueued) else var14 or uiRequestQueued
			else
				var14 = t.UiRequestQueued
				local uiResponseReceived = t.UiResponseReceived
				var15 = if var14 and uiResponseReceived then (uiResponseReceived - var14) * 1000 else nil
			end
			uiRequestQueued = t.ResponseDecodeBegin
			uiRequestQueued_1 = t.ResponseDecodeEnd
			var14 = if uiRequestQueued and uiRequestQueued_1 then (uiRequestQueued_1 - uiRequestQueued) * 1000 else nil
			uiRequestQueued_1 = t.ResponseDataUpdateBegin
			local responseDataUpdateEnd = t.ResponseDataUpdateEnd
			uiRequestQueued = if uiRequestQueued_1 and responseDataUpdateEnd then (responseDataUpdateEnd - uiRequestQueued_1) * 1000 else nil
			local sduiTreeBuildBegin = t.SduiTreeBuildBegin
			local sduiTreeBuildEnd = t.SduiTreeBuildEnd
			uiRequestQueued_1 = if sduiTreeBuildBegin and sduiTreeBuildEnd then (sduiTreeBuildEnd - sduiTreeBuildBegin) * 1000 else nil
			local t_1 = {
				totalDurationMs = var13,
				uiRequestDurationMs = var15,
				responseDecodeDurationMs = var14,
				sduiTreeBuildDurationMs = uiRequestQueued_1,
				dataUpdateDurationMs = uiRequestQueued,
				netRoundTripTimeMs = var5 and (var5.RoundTripTime and var5.RoundTripTime * 1000),
				netDurationReceiveResponseMs = var5 and (var5.DurationReceiveResponse and var5.DurationReceiveResponse * 1000),
				requestStatus = var7,
				pageKey = p0,
				startSource = var8 or "unknown"
			}
			
			if fFlagSduiGameIconSupport then
				local sduiClientHintsBegin = t.SduiClientHintsBegin
				local sduiClientHintsEnd = t.SduiClientHintsEnd
				t_1.clientHintsDurationMs = if sduiClientHintsBegin and sduiClientHintsEnd then (sduiClientHintsEnd - sduiClientHintsBegin) * 1000 else nil
			end
			if p1 then
				p1(t_1)
				
				return
			end
			sduiPageAnalyticsModule.sendLoadTimerEvent(t_1)
		end
		
		local _ = function(p5)
			-- upvalues: t (ref)
			t[p5] = os.clock()
		end
		
		return {
			start = start,
			logUiRequestQueued = function()
				-- upvalues: var6 (write), var2 (write), var8 (write), t (ref)
				if var6 == "NotStarted" then
					var2 = os.clock()
					var6 = "Running"
					var8 = "UiRequestQueued"
				end
				t.UiRequestQueued = os.clock()
			end,
			logUiRequestSent = function()
				-- upvalues: var6 (write), var2 (write), var8 (write), t (ref)
				if var6 == "NotStarted" then
					var2 = os.clock()
					var6 = "Running"
					var8 = "UiRequestSent"
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
				-- upvalues: t (ref), var6 (write), finish (ref)
				t.SduiComponentReady = os.clock()
				
				if var6 == "Running" then
					finish()
				end
			end,
			logRefreshComplete = function()
				-- upvalues: t (ref), var6 (write), finish (ref)
				t.RefreshComplete = os.clock()
				
				if var6 == "Running" then
					finish()
				end
			end,
			logNetRequestStats = function(p6)
				-- upvalues: var5 (write)
				var5 = p6
			end,
			updateRequestStatus = function(p7)
				-- upvalues: var7 (write)
				var7 = p7
			end,
			finish = finish
		}
	end
}