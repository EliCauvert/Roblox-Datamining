local circularBufferModule = require(script.Parent.Parent.Parent.CircularBuffer)
local signalModule = require(script.Parent.Parent.Parent.Signal)
local voiceDebugFieldMetaModule = require(script.Parent.VoiceDebugFieldMeta)
local voiceChatService = game:GetService("VoiceChatService")
local newDevConsoleMaxGraphCount = tonumber(settings():GetFVariable("NewDevConsoleMaxGraphCount")) or 60
local getFFlagVoiceDebugConsoleV2Module = require(script.Parent.GetFFlagVoiceDebugConsoleV2)

local function parseCodecFromSdp(p1)
	if not p1 or p1 == "" then
		return nil
	end
	local _, match, match_1, match_2 = string.match(p1, "a=rtpmap:(%d+) (%a+)/(%d+)/(%d+)")
	
	return if match and match_1 and match_2 then string.format("%s/%s/%s", match, match_1, match_2) else nil
end

local function computeBitrateKbps(p1, p2, p3)
	return if not (type(p1) ~= "number" or type(p2) ~= "number" or (type(p3) ~= "number" or p3 <= 0)) then if p1 < p2 then nil else (p1 - p2) * 8 / p3 / 1000 else nil
end

local function computeSubscriptionBitrates(p1, p2, p3)
	local t = {}
	
	for i, v in p1 do
		local audioSsrc = v.audioSsrc
		
		if type(audioSsrc) == "number" and audioSsrc == audioSsrc and audioSsrc % 1 == 0 then
			t[audioSsrc] = true
			local var1 = p2[audioSsrc]
			local incomingBytes = v.incomingBytes
			local var2 = if var1 ~= nil and var1.userId == v.userId then var1.bytes else nil
			v.incomingBitrateKbps = if type(incomingBytes) == "number" and type(var2) == "number" and (type(p3) == "number" and p3 > 0) then if incomingBytes < var2 then nil else (incomingBytes - var2) * 8 / p3 / 1000 else nil
			p2[audioSsrc] = { userId = v.userId, bytes = v.incomingBytes }
		end
	end
	for i_1 in p2 do
		if not t[i_1] then
			p2[i_1] = nil
		end
	end
end

local function computeLossPercent(p4, p5)
	if type(p4) ~= "number" or type(p5) ~= "number" then
		return nil
	end
	local var3 = p4 + p5
	
	return if var3 <= 0 then nil else p5 / var3 * 100
end

local function deltaSince(p4, p5)
	return if type(p4) == "number" and type(p5) == "number" and p4 >= p5 then p4 - p5 else nil
end

local function nativeSecondsToWallClockSeconds(p4, p5, p6)
	return p6 + (p4 - p5)
end

local function formatWallClockTime(p4)
	return os.date("%H:%M:%S", p4)
end

local function decorateOperationEntries(p4, p5, p6)
	local list = table.create(#p4)
	
	for i, v in p4 do
		list[i] = {
			name = v.name,
			operationType = v.operationType,
			timestampSeconds = v.timestampSeconds,
			timestampText = if v.timestampSeconds then os.date("%H:%M:%S", p6 + (v.timestampSeconds - p5)) else nil
		}
	end
	return list
end

local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref), signalModule (ref)
	local t_1 = {}
	setmetatable(t_1, t)
	t_1._statsUpdated = signalModule.new()
	t_1._statsData = {}
	t_1._series = {}
	t_1._connectivityData = {}
	t_1._subscriptionsData = {}
	t_1._remoteOperationsData = {}
	t_1._prevSubscriptionBytesBySsrc = {}
	t_1._isRunning = false
	
	return t_1
end

function t:Signal()
	return self._statsUpdated
end

function t:getCurrentData()
	return self._statsData
end

function t:getSeries()
	return self._series
end

function t:getSeriesSnapshot()
	local t = {}
	
	for i, v in self._series do
		t[i] = { max = v.max, min = v.min, dataSet = v.dataSet:clone() }
	end
	return t
end

function t:isRunning()
	return self._isRunning
end

function t:getConnectivity()
	return self._connectivityData
end

function t:getSubscriptions()
	return self._subscriptionsData.subscriptions or {}
end

function t:getRemoteOperations()
	return self._remoteOperationsData
end

function t:_updateSeriesValue(p7, p8, p9)
	-- upvalues: circularBufferModule (ref), newDevConsoleMaxGraphCount (ref)
	if not self._series[p7] then
		local var3 = circularBufferModule.new(newDevConsoleMaxGraphCount)
		var3:push_back({ value = p8, time = p9 })
		self._series[p7] = { max = p8, min = p8, dataSet = var3 }
		
		return
	end
	local var4 = self._series[p7]
	local max = var4.max
	local min = var4.min
	local var5 = var4.dataSet:push_back({ value = p8, time = p9 })
	
	if var5 and (max == var5.value or min == var5.value) then
		local var6 = var4.dataSet:iterator()
		local var7 = var6:next()
		local value = var7 and var7.value
		local value_1 = var7 and var7.value
		while var7 do
			value = if var7.value < value then value else var7.value
			value_1 = if value_1 < var7.value then value_1 else var7.value
			var7 = var6:next()
		end
		if max == var5.value then
			max = value
		end
		if min == var5.value then
			min = value_1
		end
	end
	var4.max = if max < p8 then p8 else max
	var4.min = if min < p8 then min else p8
end

function t:start()
	-- upvalues: voiceChatService (ref), getFFlagVoiceDebugConsoleV2Module (ref), decorateOperationEntries (ref), computeSubscriptionBitrates (ref), voiceDebugFieldMetaModule (ref)
	if voiceChatService and not self._statsListenerConnection then
		self._statsListenerConnection = voiceChatService.VoiceChatStatsCollected:Connect(function()
			-- upvalues: self (ref), voiceChatService (copy), getFFlagVoiceDebugConsoleV2Module (copy), decorateOperationEntries (copy), computeSubscriptionBitrates (copy), voiceDebugFieldMetaModule (copy)
			local incomingBytes
			self._statsData = voiceChatService:lastVoiceChatStats()
			self._connectivityData = voiceChatService:lastVoiceChatConnectivity()
			self._subscriptionsData = voiceChatService:lastVoiceChatSubscriptions() or {}
			local var8 = voiceChatService:lastVoiceChatRemoteOperations() or {}
			local timestamp = os.time()
			
			if getFFlagVoiceDebugConsoleV2Module() then
				local nativeNowSeconds = var8.nativeNowSeconds
				
				if nativeNowSeconds then
					local timestamp_1 = os.time()
					self._remoteOperationsData = {
						sent = decorateOperationEntries(var8.sent or {}, nativeNowSeconds, timestamp_1),
						received = decorateOperationEntries(var8.received or {}, nativeNowSeconds, timestamp_1),
						operations = decorateOperationEntries(var8.operations or {}, nativeNowSeconds, timestamp_1),
						sentCaptureEnabled = var8.sentCaptureEnabled == true,
						receivedCaptureEnabled = var8.receivedCaptureEnabled == true,
						opQueueCaptureEnabled = var8.opQueueCaptureEnabled == true
					}
				else
					self._remoteOperationsData = {}
				end
				local var9, match, match_1
				local processTime = os.clock()
				local var10 = if self._prevBytesClock then processTime - self._prevBytesClock else nil
				local statsData = self._statsData
				incomingBytes = self._statsData.incomingBytes
				local prevIncomingBytes = self._prevIncomingBytes
				statsData.incomingBitrateKbps = if type(incomingBytes) == "number" and type(prevIncomingBytes) == "number" and (type(var10) == "number" and var10 > 0) then if incomingBytes < prevIncomingBytes then nil else (incomingBytes - prevIncomingBytes) * 8 / var10 / 1000 else nil
				local statsData_1 = self._statsData
				incomingBytes = self._statsData.outgoingBytes
				prevIncomingBytes = self._prevOutgoingBytes
				statsData_1.outgoingBitrateKbps = if type(incomingBytes) == "number" and type(prevIncomingBytes) == "number" and (type(var10) == "number" and var10 > 0) then if incomingBytes < prevIncomingBytes then nil else (incomingBytes - prevIncomingBytes) * 8 / var10 / 1000 else nil
				self._prevIncomingBytes = self._statsData.incomingBytes
				self._prevOutgoingBytes = self._statsData.outgoingBytes
				self._prevBytesClock = processTime
				local statsData_2 = self._statsData
				incomingBytes = self._connectivityData.sdpPublishOffer
				
				if incomingBytes and incomingBytes ~= "" then
					prevIncomingBytes, match, match_1, match_2 = string.match(incomingBytes, "a=rtpmap:(%d+) (%a+)/(%d+)/(%d+)")
					var9 = if match and match_1 and match_2 then string.format("%s/%s/%s", match, match_1, match_2) else nil
				else
					var9 = nil
				end
				local var11
				statsData_2.outgoingCodec = var9
				local statsData_3 = self._statsData
				prevIncomingBytes = self._statsData.incomingPackets
				match = self._prevIncomingPackets
				incomingBytes = if type(prevIncomingBytes) == "number" and type(match) == "number" and prevIncomingBytes >= match then prevIncomingBytes - match else nil
				match = self._statsData.incomingPacketsLost
				match_1 = self._prevIncomingPacketsLost
				prevIncomingBytes = if type(match) == "number" and type(match_1) == "number" and match >= match_1 then match - match_1 else nil
				
				if type(incomingBytes) == "number" and type(prevIncomingBytes) == "number" then
					match = incomingBytes + prevIncomingBytes
					var11 = if match <= 0 then nil else prevIncomingBytes / match * 100
				else
					var11 = nil
				end
				statsData_3.incomingLossPercent = var11
				self._prevIncomingPackets = self._statsData.incomingPackets
				self._prevIncomingPacketsLost = self._statsData.incomingPacketsLost
				computeSubscriptionBitrates(self._subscriptionsData.subscriptions or {}, self._prevSubscriptionBytesBySsrc, var10)
			end
			for i, v in self._statsData do
				incomingBytes = voiceDebugFieldMetaModule[i]
				
				if incomingBytes and incomingBytes.plottable and type(v) == "number" then
					self:_updateSeriesValue(i, v, timestamp)
				end
			end
			self._statsUpdated:Fire(self._statsData)
		end)
		self._isRunning = true
	end
end

function t:stop()
	self._isRunning = false
	
	if self._statsListenerConnection then
		self._statsListenerConnection:Disconnect()
		self._statsListenerConnection = nil
	end
	self._prevBytesClock = nil
	self._prevIncomingBytes = nil
	self._prevOutgoingBytes = nil
	self._prevIncomingPackets = nil
	self._prevIncomingPacketsLost = nil
	self._prevSubscriptionBytesBySsrc = {}
end

t._parseCodecFromSdp = parseCodecFromSdp
t._computeBitrateKbps = computeBitrateKbps
t._computeLossPercent = computeLossPercent
t._deltaSince = deltaSince
t._computeSubscriptionBitrates = computeSubscriptionBitrates
t._nativeSecondsToWallClockSeconds = nativeSecondsToWallClockSeconds
t._formatWallClockTime = formatWallClockTime
t._decorateOperationEntries = decorateOperationEntries

return t