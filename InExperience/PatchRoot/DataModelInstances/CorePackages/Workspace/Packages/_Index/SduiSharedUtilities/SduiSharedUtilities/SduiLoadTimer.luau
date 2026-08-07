local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local parent = sduiSharedUtilities.Parent
local sduiPageAnalyticsModule = require(sduiSharedUtilities.SduiPageAnalytics)
local _ = require(sduiSharedUtilities.SduiIntegrationTypes)
local fFlagSduiGameIconSupport = require(parent.SharedFlags).FFlagSduiGameIconSupport
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
	createLoadTimer = function(p0, p1) --[[ line: 85 ]]
		-- upvalues: fFlagSduiGameIconSupport (ref), sduiPageAnalyticsModule (ref)
		local var2 = nil
		local var3 = nil
		local t = {}
		local var5 = nil
		local var6 = "NotStarted"
		local var7 = nil
		local var8 = nil
		
		local function _(p2, p3) --[[ line: 99 | named "calculateDuration" ]]
			-- upvalues: t (ref)
			local var11 = t[p2]
			local var12 = t[p3]
			
			return if var11 and var12 then (var12 - var11) * 1000 else nil
		end
		
		local function start(p4) --[[ line: 109 ]]
			-- upvalues: var2 (write), var6 (write), var8 (write)
			var2 = os.clock()
			var6 = "Running"
			var8 = p4
		end
		
		local function finish() --[[ line: 116 ]]
			-- upvalues: var6 (write), var2 (write), var3 (write), t (ref), var5 (write), var7 (write), p0 (ref), var8 (write), fFlagSduiGameIconSupport (copy), p1 (ref), sduiPageAnalyticsModule (copy)
			if var6 ~= "Running" or var2 == nil then return end
			var6 = "Finished"
			var3 = os.clock()
			local var13 = (var3 - var2) * 1000
			local uiRequestQueued = t.UiRequestQueued
			local uiResponseReceived = t.UiResponseReceived
			local var14 = if uiRequestQueued and uiResponseReceived then (uiResponseReceived - uiRequestQueued) * 1000 else nil
			local responseDecodeBegin = t.ResponseDecodeBegin
			local responseDecodeEnd = t.ResponseDecodeEnd
			uiRequestQueued = if responseDecodeBegin and responseDecodeEnd then (responseDecodeEnd - responseDecodeBegin) * 1000 else nil
			local responseDataUpdateBegin = t.ResponseDataUpdateBegin
			local responseDataUpdateEnd = t.ResponseDataUpdateEnd
			responseDecodeBegin = if responseDataUpdateBegin and responseDataUpdateEnd then (responseDataUpdateEnd - responseDataUpdateBegin) * 1000 else nil
			local sduiTreeBuildBegin = t.SduiTreeBuildBegin
			local sduiTreeBuildEnd = t.SduiTreeBuildEnd
			responseDataUpdateBegin = if sduiTreeBuildBegin and sduiTreeBuildEnd then (sduiTreeBuildEnd - sduiTreeBuildBegin) * 1000 else nil
			local t_1 = {
				totalDurationMs = var13,
				uiRequestDurationMs = var14,
				responseDecodeDurationMs = uiRequestQueued,
				sduiTreeBuildDurationMs = responseDataUpdateBegin,
				dataUpdateDurationMs = responseDecodeBegin,
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
		
		local _ = function(p5) --[[ line: 164 | named "logTimestamp" ]]
			-- upvalues: t (ref)
			t[p5] = os.clock()
		end
		
		return {
			start = start,
			logUiRequestQueued = function() --[[ line: 174 ]]
				-- upvalues: var6 (write), var2 (write), var8 (write), t (ref)
				if var6 == "NotStarted" then
					var2 = os.clock()
					var6 = "Running"
					var8 = "UiRequestQueued"
				end
				t.UiRequestQueued = os.clock()
			end,
			logUiRequestSent = function() --[[ line: 182 ]]
				-- upvalues: var6 (write), var2 (write), var8 (write), t (ref)
				if var6 == "NotStarted" then
					var2 = os.clock()
					var6 = "Running"
					var8 = "UiRequestSent"
				end
				t.UiRequestSent = os.clock()
			end,
			logUiResponseReceived = function() --[[ line: 190 ]]
				-- upvalues: t (ref)
				t.UiResponseReceived = os.clock()
			end,
			logUiStreamChunkReceived = function() --[[ line: 194 ]]
				-- upvalues: t (ref)
				t.UiStreamChunkReceived = os.clock()
			end,
			logResponseDecodeBegin = function() --[[ line: 199 ]]
				-- upvalues: t (ref)
				t.ResponseDecodeBegin = os.clock()
			end,
			logResponseDecodeEnd = function() --[[ line: 204 ]]
				-- upvalues: t (ref)
				t.ResponseDecodeEnd = os.clock()
			end,
			logResponseDataUpdateBegin = function() --[[ line: 209 ]]
				-- upvalues: t (ref)
				t.ResponseDataUpdateBegin = os.clock()
			end,
			logResponseDataUpdateEnd = function() --[[ line: 214 ]]
				-- upvalues: t (ref)
				t.ResponseDataUpdateEnd = os.clock()
			end,
			logSduiTreeBuildBegin = function() --[[ line: 219 ]]
				-- upvalues: t (ref)
				t.SduiTreeBuildBegin = os.clock()
			end,
			logSduiTreeBuildEnd = function() --[[ line: 224 ]]
				-- upvalues: t (ref)
				t.SduiTreeBuildEnd = os.clock()
			end,
			logSduiClientHintsBegin = function() --[[ line: 229 ]]
				-- upvalues: t (ref)
				t.SduiClientHintsBegin = os.clock()
			end,
			logSduiClientHintsEnd = function() --[[ line: 234 ]]
				-- upvalues: t (ref)
				t.SduiClientHintsEnd = os.clock()
			end,
			logComponentMounted = function() --[[ line: 239 ]]
				-- upvalues: t (ref)
				t.SduiComponentMounted = os.clock()
			end,
			logComponentReady = function() --[[ line: 245 ]]
				-- upvalues: t (ref), var6 (write), finish (ref)
				t.SduiComponentReady = os.clock()
				
				if var6 == "Running" then
					finish()
				end
			end,
			logRefreshComplete = function() --[[ line: 254 ]]
				-- upvalues: t (ref), var6 (write), finish (ref)
				t.RefreshComplete = os.clock()
				
				if var6 == "Running" then
					finish()
				end
			end,
			logNetRequestStats = function(p6) --[[ line: 169 ]]
				-- upvalues: var5 (write)
				var5 = p6
			end,
			updateRequestStatus = function(p7) --[[ line: 262 ]]
				-- upvalues: var7 (write)
				var7 = p7
			end,
			finish = finish
		}
	end
}