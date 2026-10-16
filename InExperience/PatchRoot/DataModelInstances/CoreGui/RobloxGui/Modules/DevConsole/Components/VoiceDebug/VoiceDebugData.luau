local CircularBufferModule = require(script.Parent.Parent.Parent.CircularBuffer)
local SignalModule = require(script.Parent.Parent.Parent.Signal)
local VoiceDebugFieldMetaModule = require(script.Parent.VoiceDebugFieldMeta)
local VoiceChatService = game:GetService("VoiceChatService")
local Number: number = tonumber(settings():GetFVariable("NewDevConsoleMaxGraphCount")) or 60
local GetFFlagVoiceDebugConsoleV2Module = require(script.Parent.GetFFlagVoiceDebugConsoleV2)

local function parseCodecFromSdp(Text: string) --[[ Line: 107 ]]
	if Text and Text ~= "" then
		local _, Match2, Match3, Match4 = string.match(Text, "a=rtpmap:(%d+) (%a+)/(%d+)/(%d+)")
		
		return if Match2 and Match3 and Match4 then string.format("%s/%s/%s", Match2, Match3, Match4) else nil
	else
		return nil
	end
end

local function computeBitrateKbps(p1, p2, p3: number) --[[ Line: 118 ]]
	return if type(p1) == "number" and type(p2) == "number" and type(p3) == "number" and p3 > 0 then if p1 < p2 then nil else (p1 - p2) * 8 / p3 / 1000 else nil
end

local function computeSubscriptionBitrates(Subscriptions, PrevSubscriptionBytesBySsrc, p1: number) --[[ Line: 138 ]]
	local t = {}
	
	for i, subscription in Subscriptions do
		local AudioSsrc: number = subscription.audioSsrc
		
		if type(AudioSsrc) == "number" and AudioSsrc == AudioSsrc and AudioSsrc % 1 == 0 then
			t[AudioSsrc] = true
			local PrevSubscriptionBytesBySsrcEntry = PrevSubscriptionBytesBySsrc[AudioSsrc]
			local IncomingBytes = subscription.incomingBytes
			local Bytes = PrevSubscriptionBytesBySsrcEntry ~= nil and PrevSubscriptionBytesBySsrcEntry.userId == subscription.userId and PrevSubscriptionBytesBySsrcEntry.bytes or nil
			subscription.incomingBitrateKbps = if type(IncomingBytes) == "number" and type(Bytes) == "number" and type(p1) == "number" and p1 > 0 then if IncomingBytes < Bytes then nil else (IncomingBytes - Bytes) * 8 / p1 / 1000 else nil
			PrevSubscriptionBytesBySsrc[AudioSsrc] = {
				userId = subscription.userId,
				bytes = subscription.incomingBytes
			}
		end
	end
	for i in PrevSubscriptionBytesBySsrc do
		if not t[i] then
			PrevSubscriptionBytesBySsrc[i] = nil
		end
	end
end

local function computeLossPercent(p2, p3) --[[ Line: 162 ]]
	if type(p2) == "number" and type(p3) == "number" then
		local v1 = p2 + p3
		
		return if v1 <= 0 then nil else p3 / v1 * 100
	else
		return nil
	end
end

local function deltaSince(p2, p3) --[[ Line: 177 ]]
	return if type(p2) == "number" and type(p3) == "number" and p2 >= p3 then p2 - p3 else nil
end

local function nativeSecondsToWallClockSeconds(p2, p3, p4) --[[ Line: 184 ]]
	return p4 + (p2 - p3)
end

local function formatWallClockTime(p2): string --[[ Line: 188 ]]
	return (os.date("%H:%M:%S", p2))
end

local function decorateOperationEntries(Operations, NativeNowSeconds, Timestamp) --[[ Line: 192 ]]
	local Buffer = table.create(#Operations)
	
	for i, operation in Operations do
		Buffer[i] = {
			name = operation.name,
			operationType = operation.operationType,
			timestampSeconds = operation.timestampSeconds,
			timestampText = if operation.timestampSeconds then os.date("%H:%M:%S", Timestamp + (operation.timestampSeconds - NativeNowSeconds)) else nil
		}
	end
	return Buffer
end

local VoiceDebugDataModule = {}
VoiceDebugDataModule.__index = VoiceDebugDataModule

function VoiceDebugDataModule.new() --[[ Line: 211 ]]
	-- upvalues: VoiceDebugDataModule (copy), SignalModule (copy)
	local t = {}
	setmetatable(t, VoiceDebugDataModule)
	t._statsUpdated = SignalModule.new()
	t._statsData = {}
	t._series = {}
	t._connectivityData = {}
	t._subscriptionsData = {}
	t._remoteOperationsData = {}
	t._prevSubscriptionBytesBySsrc = {}
	t._isRunning = false
	
	return t
end

function VoiceDebugDataModule:Signal() --[[ Line: 226 ]]
	return self._statsUpdated
end

function VoiceDebugDataModule:getCurrentData() --[[ Line: 230 ]]
	return self._statsData
end

function VoiceDebugDataModule:getSeries() --[[ Line: 234 ]]
	return self._series
end

function VoiceDebugDataModule.getSeriesSnapshot(p2) --[[ Line: 241 ]]
	local t = {}
	
	for i, sery in p2._series do
		t[i] = {
			max = sery.max,
			min = sery.min,
			dataSet = sery.dataSet:clone()
		}
	end
	return t
end

function VoiceDebugDataModule:isRunning() --[[ Line: 253 ]]
	return self._isRunning
end

function VoiceDebugDataModule:getConnectivity() --[[ Line: 257 ]]
	return self._connectivityData
end

function VoiceDebugDataModule:getSubscriptions() --[[ Line: 261 ]]
	return self._subscriptionsData.subscriptions or {}
end

function VoiceDebugDataModule:getRemoteOperations() --[[ Line: 265 ]]
	return self._remoteOperationsData
end

function VoiceDebugDataModule:_updateSeriesValue(p3, Value, Time) --[[ Line: 269 ]]
	-- upvalues: CircularBufferModule (copy), Number (copy)
	if not self._series[p3] then
		local NewCircularBuffer = CircularBufferModule.new(Number)
		NewCircularBuffer:push_back({ value = Value, time = Time })
		self._series[p3] = { max = Value, min = Value, dataSet = NewCircularBuffer }
		
		return
	end
	local Sery = self._series[p3]
	local Max = Sery.max
	local Min = Sery.min
	local Push_backResult = Sery.dataSet:push_back({ value = Value, time = Time })
	
	if Push_backResult and (Max == Push_backResult.value or Min == Push_backResult.value) then
		local IteratorResult = Sery.dataSet:iterator()
		local Key = IteratorResult:next()
		local Value1 = Key and Key.value
		local Value2 = Key and Key.value
		while Key do
			Value1 = Key.value < Value1 and Value1 or Key.value
			Value2 = Value2 < Key.value and Value2 or Key.value
			Key = IteratorResult:next()
		end
		if Max == Push_backResult.value then
			Max = Value1
		end
		if Min == Push_backResult.value then
			Min = Value2
		end
	end
	Sery.max = Max < Value and Value or Max
	Sery.min = Min < Value and Min or Value
end

function VoiceDebugDataModule:start() --[[ Line: 321 ]]
	-- upvalues: VoiceChatService (copy), GetFFlagVoiceDebugConsoleV2Module (copy), decorateOperationEntries (copy), computeSubscriptionBitrates (copy), VoiceDebugFieldMetaModule (copy)
	if VoiceChatService and not self._statsListenerConnection then
		self._statsListenerConnection = VoiceChatService.VoiceChatStatsCollected:Connect(function() --[[ Line: 323 ]]
			-- upvalues: self (copy), VoiceChatService (upval), GetFFlagVoiceDebugConsoleV2Module (upval), decorateOperationEntries (upval), computeSubscriptionBitrates (upval), VoiceDebugFieldMetaModule (upval)
			self._statsData = VoiceChatService:lastVoiceChatStats()
			self._connectivityData = VoiceChatService:lastVoiceChatConnectivity()
			self._subscriptionsData = VoiceChatService:lastVoiceChatSubscriptions() or {}
			local LastVoiceChatRemoteOperationsResult = VoiceChatService:lastVoiceChatRemoteOperations() or {}
			local Timestamp = os.time()
			
			if GetFFlagVoiceDebugConsoleV2Module() then
				local NativeNowSeconds = LastVoiceChatRemoteOperationsResult.nativeNowSeconds
				
				if NativeNowSeconds then
					local Timestamp1 = os.time()
					self._remoteOperationsData = {
						sent = decorateOperationEntries(LastVoiceChatRemoteOperationsResult.sent or {}, NativeNowSeconds, Timestamp1),
						received = decorateOperationEntries(LastVoiceChatRemoteOperationsResult.received or {}, NativeNowSeconds, Timestamp1),
						operations = decorateOperationEntries(LastVoiceChatRemoteOperationsResult.operations or {}, NativeNowSeconds, Timestamp1),
						sentCaptureEnabled = LastVoiceChatRemoteOperationsResult.sentCaptureEnabled == true,
						receivedCaptureEnabled = LastVoiceChatRemoteOperationsResult.receivedCaptureEnabled == true,
						opQueueCaptureEnabled = LastVoiceChatRemoteOperationsResult.opQueueCaptureEnabled == true
					}
				else
					self._remoteOperationsData = {}
				end
				local ClockTime = os.clock()
				local ClockTimeDelta = self._prevBytesClock and ClockTime - self._prevBytesClock or nil
				local IncomingBytes = self._statsData.incomingBytes
				local PrevIncomingBytes = self._prevIncomingBytes
				self._statsData.incomingBitrateKbps = if type(IncomingBytes) == "number" and type(PrevIncomingBytes) == "number" and type(ClockTimeDelta) == "number" and ClockTimeDelta > 0 then if IncomingBytes < PrevIncomingBytes then nil else (IncomingBytes - PrevIncomingBytes) * 8 / ClockTimeDelta / 1000 else nil
				local OutgoingBytes = self._statsData.outgoingBytes
				local PrevOutgoingBytes = self._prevOutgoingBytes
				self._statsData.outgoingBitrateKbps = if type(OutgoingBytes) == "number" and type(PrevOutgoingBytes) == "number" and type(ClockTimeDelta) == "number" and ClockTimeDelta > 0 then if OutgoingBytes < PrevOutgoingBytes then nil else (OutgoingBytes - PrevOutgoingBytes) * 8 / ClockTimeDelta / 1000 else nil
				self._prevIncomingBytes = self._statsData.incomingBytes
				self._prevOutgoingBytes = self._statsData.outgoingBytes
				self._prevBytesClock = ClockTime
				local StatsData = self._statsData
				local SdpPublishOffer: string = self._connectivityData.sdpPublishOffer
				local Formatted = nil
				
				if SdpPublishOffer and SdpPublishOffer ~= "" then
					local _, Match2, Match3, Match4 = string.match(SdpPublishOffer, "a=rtpmap:(%d+) (%a+)/(%d+)/(%d+)")
					Formatted = if Match2 and Match3 and Match4 then string.format("%s/%s/%s", Match2, Match3, Match4) else nil
				else
					Formatted = nil
				end
				StatsData.outgoingCodec = Formatted
				local StatsData1 = self._statsData
				local IncomingPackets = self._statsData.incomingPackets
				local PrevIncomingPackets = self._prevIncomingPackets
				local IncomingPacketsDelta = if type(IncomingPackets) == "number" and type(PrevIncomingPackets) == "number" and IncomingPackets >= PrevIncomingPackets then IncomingPackets - PrevIncomingPackets else nil
				local IncomingPacketsLost = self._statsData.incomingPacketsLost
				local PrevIncomingPacketsLost = self._prevIncomingPacketsLost
				local IncomingPacketsLostDelta = if type(IncomingPacketsLost) == "number" and (type(PrevIncomingPacketsLost) == "number" and IncomingPacketsLost >= PrevIncomingPacketsLost) then IncomingPacketsLost - PrevIncomingPacketsLost else nil
				local IncomingLossPercent = nil
				
				if type(IncomingPacketsDelta) == "number" and type(IncomingPacketsLostDelta) == "number" then
					local v1 = IncomingPacketsDelta + IncomingPacketsLostDelta
					IncomingLossPercent = if v1 <= 0 then nil else IncomingPacketsLostDelta / v1 * 100
				else
					IncomingLossPercent = nil
				end
				StatsData1.incomingLossPercent = IncomingLossPercent
				self._prevIncomingPackets = self._statsData.incomingPackets
				self._prevIncomingPacketsLost = self._statsData.incomingPacketsLost
				computeSubscriptionBitrates(self._subscriptionsData.subscriptions or {}, self._prevSubscriptionBytesBySsrc, ClockTimeDelta)
			end
			for i, value in self._statsData do
				local VoiceDebugFieldMetaModuleEntry = VoiceDebugFieldMetaModule[i]
				
				if VoiceDebugFieldMetaModuleEntry and VoiceDebugFieldMetaModuleEntry.plottable and type(value) == "number" then
					self:_updateSeriesValue(i, value, Timestamp)
				end
			end
			self._statsUpdated:Fire(self._statsData)
		end)
		self._isRunning = true
	end
end

function VoiceDebugDataModule:stop() --[[ Line: 383 ]]
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

VoiceDebugDataModule._parseCodecFromSdp = parseCodecFromSdp
VoiceDebugDataModule._computeBitrateKbps = computeBitrateKbps
VoiceDebugDataModule._computeLossPercent = computeLossPercent
VoiceDebugDataModule._deltaSince = deltaSince
VoiceDebugDataModule._computeSubscriptionBitrates = computeSubscriptionBitrates
VoiceDebugDataModule._nativeSecondsToWallClockSeconds = nativeSecondsToWallClockSeconds
VoiceDebugDataModule._formatWallClockTime = formatWallClockTime
VoiceDebugDataModule._decorateOperationEntries = decorateOperationEntries

return VoiceDebugDataModule