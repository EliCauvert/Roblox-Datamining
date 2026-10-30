local CircularBufferModule = require(script.Parent.Parent.Parent.CircularBuffer)
local SignalModule = require(script.Parent.Parent.Parent.Signal)
local VoiceDebugFieldMetaModule = require(script.Parent.VoiceDebugFieldMeta)
local VoiceDebugSourceModule = require(script.Parent.VoiceDebugSource)
local VoiceChatService = game:GetService("VoiceChatService")
local Number: number = tonumber(settings():GetFVariable("NewDevConsoleMaxGraphCount")) or 60
local GetFFlagVoiceDebugPartyVoiceToggleEnabledModule = require(script.Parent.GetFFlagVoiceDebugPartyVoiceToggleEnabled)
local Default = require(game:GetService("CorePackages").Workspace.Packages.CrossExperienceVoice).CrossExperienceVoiceManager.default
local InExperience = VoiceDebugSourceModule.InExperience
local Party = VoiceDebugSourceModule.Party
local GetFFlagVoiceDebugConsoleV2Module = require(script.Parent.GetFFlagVoiceDebugConsoleV2)

local function parseCodecFromSdp(Text: string)
	if Text and Text ~= "" then
		local _, Match2, Match3, Match4 = string.match(Text, "a=rtpmap:(%d+) (%a+)/(%d+)/(%d+)")
		
		return if Match2 and Match3 and Match4 then string.format("%s/%s/%s", Match2, Match3, Match4) else nil
	else
		return nil
	end
end

local function computeBitrateKbps(p1, p2, p3: number)
	return if type(p1) == "number" and type(p2) == "number" and type(p3) == "number" and p3 > 0 then if p1 < p2 then nil else (p1 - p2) * 8 / p3 / 1000 else nil
end

local function computeSubscriptionBitrates(Subscriptions, PrevSubscriptionBytesBySsrc, p1: number)
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

local function computeLossPercent(p2, p3)
	if type(p2) == "number" and type(p3) == "number" then
		local v1 = p2 + p3
		
		return if v1 <= 0 then nil else p3 / v1 * 100
	else
		return nil
	end
end

local function deltaSince(p2, p3)
	return if type(p2) == "number" and type(p3) == "number" and p2 >= p3 then p2 - p3 else nil
end

local function computeJitterBufferDelayMs(p2, p3, p4, p5)
	if type(p2) == "number" and type(p3) == "number" and type(p4) == "number" and type(p5) == "number" then
		local v1 = p4 - p5
		local v2 = p2 - p3
		
		return if v1 <= 0 or v2 < 0 then nil else v2 * 1000 / v1
	else
		return nil
	end
end

local function nativeSecondsToWallClockSeconds(p2, p3, p4)
	return p4 + (p2 - p3)
end

local function formatWallClockTime(p2): string
	return (os.date("%H:%M:%S", p2))
end

local function decorateOperationEntries(Operations, NativeNowSeconds, Timestamp)
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

local function decorateRemoteOperationsPayload(LastVoiceChatRemoteOperationsResult)
	-- upvalues: decorateOperationEntries (copy)
	local Timestamp = os.time()
	local NativeNowSeconds = LastVoiceChatRemoteOperationsResult.nativeNowSeconds or 0
	
	return {
		sent = decorateOperationEntries(LastVoiceChatRemoteOperationsResult.sent or {}, NativeNowSeconds, Timestamp),
		received = decorateOperationEntries(LastVoiceChatRemoteOperationsResult.received or {}, NativeNowSeconds, Timestamp),
		operations = decorateOperationEntries(LastVoiceChatRemoteOperationsResult.operations or {}, NativeNowSeconds, Timestamp),
		sentCaptureEnabled = LastVoiceChatRemoteOperationsResult.sentCaptureEnabled == true,
		receivedCaptureEnabled = LastVoiceChatRemoteOperationsResult.receivedCaptureEnabled == true,
		opQueueCaptureEnabled = LastVoiceChatRemoteOperationsResult.opQueueCaptureEnabled == true
	}
end

local VoiceDebugDataModule = {}
VoiceDebugDataModule.__index = VoiceDebugDataModule

function VoiceDebugDataModule.new()
	-- upvalues: VoiceDebugDataModule (copy), SignalModule (copy), InExperience (copy)
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
	t._source = InExperience
	t._partyStatsData = {}
	t._partySeries = {}
	t._partyConnectivityData = {}
	t._partyRemoteOperationsData = {}
	t._isPartyActive = false
	t._partyPollTask = nil
	t._partyPollGeneration = 0
	t._prevPartyJitterBufferDelaySeconds = nil
	t._prevPartyJitterBufferEmittedCount = nil
	t._prevPartyIncomingBytes = nil
	t._prevPartyOutgoingBytes = nil
	t._prevBytesClock = nil
	t._prevIncomingBytes = nil
	t._prevOutgoingBytes = nil
	t._prevIncomingPackets = nil
	t._prevIncomingPacketsLost = nil
	t._prevJitterBufferDelaySeconds = nil
	t._prevJitterBufferEmittedCount = nil
	
	return t
end

function VoiceDebugDataModule:Signal()
	return self._statsUpdated
end

function VoiceDebugDataModule.getCurrentData(p2)
	-- upvalues: Party (copy)
	return if p2._source == Party then p2._partyStatsData else p2._statsData
end

function VoiceDebugDataModule.getSeries(p2)
	-- upvalues: Party (copy)
	return if p2._source == Party then p2._partySeries else p2._series
end

function VoiceDebugDataModule.getSeriesSnapshot(p2)
	local t = {}
	
	for i, sery in p2:getSeries() do
		t[i] = {
			max = sery.max,
			min = sery.min,
			dataSet = sery.dataSet:clone()
		}
	end
	return t
end

function VoiceDebugDataModule:isRunning()
	return self._isRunning
end

function VoiceDebugDataModule.getConnectivity(p3)
	-- upvalues: Party (copy)
	return if p3._source == Party then p3._partyConnectivityData else p3._connectivityData
end

function VoiceDebugDataModule:getSource()
	return self._source
end

function VoiceDebugDataModule:isPartyVoiceActive()
	return self._isPartyActive
end

function VoiceDebugDataModule:setSource(_source)
	if self._source ~= _source then
		self._source = _source
		self._statsUpdated:Fire(self:getCurrentData())
		
		return
	end
end

function VoiceDebugDataModule:getSubscriptions()
	return self._subscriptionsData.subscriptions or {}
end

function VoiceDebugDataModule.getRemoteOperations(p3)
	-- upvalues: Party (copy)
	return if p3._source == Party then p3._partyRemoteOperationsData else p3._remoteOperationsData
end

function VoiceDebugDataModule:_updateSeriesValueInto(PartySeries, Key, Value, Time)
	-- upvalues: CircularBufferModule (copy), Number (copy)
	if not PartySeries[Key] then
		local NewCircularBuffer = CircularBufferModule.new(Number)
		NewCircularBuffer:push_back({ value = Value, time = Time })
		PartySeries[Key] = { max = Value, min = Value, dataSet = NewCircularBuffer }
		
		return
	end
	local PartySery = PartySeries[Key]
	local Max = PartySery.max
	local Min = PartySery.min
	local Push_backResult = PartySery.dataSet:push_back({ value = Value, time = Time })
	
	if Push_backResult and (Max == Push_backResult.value or Min == Push_backResult.value) then
		local IteratorResult = PartySery.dataSet:iterator()
		local Key1 = IteratorResult:next()
		local Value1 = Key1 and Key1.value
		local Value2 = Key1 and Key1.value
		while Key1 do
			Value1 = Key1.value < Value1 and Value1 or Key1.value
			Value2 = Value2 < Key1.value and Value2 or Key1.value
			Key1 = IteratorResult:next()
		end
		if Max == Push_backResult.value then
			Max = Value1
		end
		if Min == Push_backResult.value then
			Min = Value2
		end
	end
	PartySery.max = Max < Value and Value or Max
	PartySery.min = Min < Value and Min or Value
end

function VoiceDebugDataModule:_updateSeriesValue(p3, p4, Time)
	self:_updateSeriesValueInto(self._series, p3, p4, Time)
end

function VoiceDebugDataModule:start()
	-- upvalues: VoiceChatService (copy), GetFFlagVoiceDebugConsoleV2Module (copy), decorateRemoteOperationsPayload (copy), computeSubscriptionBitrates (copy), VoiceDebugFieldMetaModule (copy), InExperience (copy), GetFFlagVoiceDebugPartyVoiceToggleEnabledModule (copy)
	if VoiceChatService and not self._statsListenerConnection then
		self._statsListenerConnection = VoiceChatService.VoiceChatStatsCollected:Connect(function()
			-- upvalues: self (copy), VoiceChatService (upval), GetFFlagVoiceDebugConsoleV2Module (upval), decorateRemoteOperationsPayload (upval), computeSubscriptionBitrates (upval), VoiceDebugFieldMetaModule (upval), InExperience (upval)
			self._statsData = VoiceChatService:lastVoiceChatStats()
			self._connectivityData = VoiceChatService:lastVoiceChatConnectivity()
			self._subscriptionsData = VoiceChatService:lastVoiceChatSubscriptions() or {}
			local LastVoiceChatRemoteOperationsResult = VoiceChatService:lastVoiceChatRemoteOperations() or {}
			local Timestamp = os.time()
			
			if GetFFlagVoiceDebugConsoleV2Module() then
				if LastVoiceChatRemoteOperationsResult.nativeNowSeconds then
					self._remoteOperationsData = decorateRemoteOperationsPayload(LastVoiceChatRemoteOperationsResult)
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
				local IncomingPacketsLostDelta = if type(IncomingPacketsLost) == "number" and type(PrevIncomingPacketsLost) == "number" and IncomingPacketsLost >= PrevIncomingPacketsLost then IncomingPacketsLost - PrevIncomingPacketsLost else nil
				local IncomingLossPercent = nil
				
				if type(IncomingPacketsDelta) == "number" and type(IncomingPacketsLostDelta) == "number" then
					local NewIncomingPacketsDelta = IncomingPacketsDelta + IncomingPacketsLostDelta
					IncomingLossPercent = if NewIncomingPacketsDelta <= 0 then nil else IncomingPacketsLostDelta / NewIncomingPacketsDelta * 100
				else
					IncomingLossPercent = nil
				end
				StatsData1.incomingLossPercent = IncomingLossPercent
				self._prevIncomingPackets = self._statsData.incomingPackets
				self._prevIncomingPacketsLost = self._statsData.incomingPacketsLost
				local JitterBufferDelayMs1 = self._statsData.jitterBufferDelayMs
				local JitterBufferEmittedCount = self._statsData.jitterBufferEmittedCount
				local StatsData2 = self._statsData
				local PrevJitterBufferDelaySeconds = self._prevJitterBufferDelaySeconds
				local PrevJitterBufferEmittedCount = self._prevJitterBufferEmittedCount
				local JitterBufferDelayMs = nil
				
				if type(JitterBufferDelayMs1) == "number" and type(PrevJitterBufferDelaySeconds) == "number" and type(JitterBufferEmittedCount) == "number" and type(PrevJitterBufferEmittedCount) == "number" then
					local JitterBufferEmittedCountDelta = JitterBufferEmittedCount - PrevJitterBufferEmittedCount
					local JitterBufferDelayMsDelta = JitterBufferDelayMs1 - PrevJitterBufferDelaySeconds
					JitterBufferDelayMs = if JitterBufferEmittedCountDelta <= 0 or JitterBufferDelayMsDelta < 0 then nil else JitterBufferDelayMsDelta * 1000 / JitterBufferEmittedCountDelta
				else
					JitterBufferDelayMs = nil
				end
				StatsData2.jitterBufferDelayMs = JitterBufferDelayMs
				self._prevJitterBufferDelaySeconds = JitterBufferDelayMs1
				self._prevJitterBufferEmittedCount = JitterBufferEmittedCount
				computeSubscriptionBitrates(self._subscriptionsData.subscriptions or {}, self._prevSubscriptionBytesBySsrc, ClockTimeDelta)
			end
			for i, value in self._statsData do
				local VoiceDebugFieldMetaModuleEntry = VoiceDebugFieldMetaModule[i]
				
				if VoiceDebugFieldMetaModuleEntry and VoiceDebugFieldMetaModuleEntry.plottable and type(value) == "number" then
					self:_updateSeriesValue(i, value, Timestamp)
				end
			end
			if self._source == InExperience then
				self._statsUpdated:Fire(self._statsData)
			end
		end)
		self._isRunning = true
		
		if GetFFlagVoiceDebugPartyVoiceToggleEnabledModule() then
			self:_startPartyPipeline()
		end
	end
end

function VoiceDebugDataModule:_correctPartyJitterBufferDelay()
	local JitterBufferDelayMs = self._partyStatsData.jitterBufferDelayMs
	local JitterBufferEmittedCount = self._partyStatsData.jitterBufferEmittedCount
	local PartyStatsData = self._partyStatsData
	local PrevPartyJitterBufferDelaySeconds = self._prevPartyJitterBufferDelaySeconds
	local PrevPartyJitterBufferEmittedCount = self._prevPartyJitterBufferEmittedCount
	local JitterBufferDelayMs1 = nil
	
	if type(JitterBufferDelayMs) == "number" and type(PrevPartyJitterBufferDelaySeconds) == "number" and type(JitterBufferEmittedCount) == "number" and type(PrevPartyJitterBufferEmittedCount) == "number" then
		local JitterBufferEmittedCountDelta = JitterBufferEmittedCount - PrevPartyJitterBufferEmittedCount
		local JitterBufferDelayMsDelta = JitterBufferDelayMs - PrevPartyJitterBufferDelaySeconds
		JitterBufferDelayMs1 = if JitterBufferEmittedCountDelta <= 0 or JitterBufferDelayMsDelta < 0 then nil else JitterBufferDelayMsDelta * 1000 / JitterBufferEmittedCountDelta
	else
		JitterBufferDelayMs1 = nil
	end
	PartyStatsData.jitterBufferDelayMs = JitterBufferDelayMs1
	self._prevPartyJitterBufferDelaySeconds = JitterBufferDelayMs
	self._prevPartyJitterBufferEmittedCount = JitterBufferEmittedCount
end

function VoiceDebugDataModule:_correctPartyAggregateStats(p3: number)
	-- upvalues: GetFFlagVoiceDebugConsoleV2Module (copy)
	if not GetFFlagVoiceDebugConsoleV2Module() then return end
	local IncomingBytes = self._partyStatsData.incomingBytes
	local PrevPartyIncomingBytes = self._prevPartyIncomingBytes
	self._partyStatsData.incomingBitrateKbps = if type(IncomingBytes) == "number" and type(PrevPartyIncomingBytes) == "number" and type(p3) == "number" and p3 > 0 then if IncomingBytes < PrevPartyIncomingBytes then nil else (IncomingBytes - PrevPartyIncomingBytes) * 8 / p3 / 1000 else nil
	local OutgoingBytes = self._partyStatsData.outgoingBytes
	local PrevPartyOutgoingBytes = self._prevPartyOutgoingBytes
	self._partyStatsData.outgoingBitrateKbps = if type(OutgoingBytes) == "number" and type(PrevPartyOutgoingBytes) == "number" and type(p3) == "number" and p3 > 0 then if OutgoingBytes < PrevPartyOutgoingBytes then nil else (OutgoingBytes - PrevPartyOutgoingBytes) * 8 / p3 / 1000 else nil
	self._prevPartyIncomingBytes = self._partyStatsData.incomingBytes
	self._prevPartyOutgoingBytes = self._partyStatsData.outgoingBytes
	local PartyStatsData = self._partyStatsData
	local SdpPublishOffer: string = self._partyConnectivityData.sdpPublishOffer
	local Formatted = nil
	
	if SdpPublishOffer and SdpPublishOffer ~= "" then
		local _, Match2, Match3, Match4 = string.match(SdpPublishOffer, "a=rtpmap:(%d+) (%a+)/(%d+)/(%d+)")
		Formatted = if Match2 and Match3 and Match4 then string.format("%s/%s/%s", Match2, Match3, Match4) else nil
	else
		Formatted = nil
	end
	PartyStatsData.outgoingCodec = Formatted
	local PartyStatsData1 = self._partyStatsData
	local IncomingPackets = self._partyStatsData.incomingPackets
	local PrevPartyIncomingPackets = self._prevPartyIncomingPackets
	local IncomingPacketsDelta = if type(IncomingPackets) == "number" and type(PrevPartyIncomingPackets) == "number" and IncomingPackets >= PrevPartyIncomingPackets then IncomingPackets - PrevPartyIncomingPackets else nil
	local IncomingPacketsLost = self._partyStatsData.incomingPacketsLost
	local PrevPartyIncomingPacketsLost = self._prevPartyIncomingPacketsLost
	local IncomingPacketsLostDelta = if type(IncomingPacketsLost) == "number" and type(PrevPartyIncomingPacketsLost) == "number" and IncomingPacketsLost >= PrevPartyIncomingPacketsLost then IncomingPacketsLost - PrevPartyIncomingPacketsLost else nil
	local IncomingLossPercent = nil
	
	if type(IncomingPacketsDelta) == "number" and type(IncomingPacketsLostDelta) == "number" then
		local NewIncomingPacketsDelta = IncomingPacketsDelta + IncomingPacketsLostDelta
		IncomingLossPercent = if NewIncomingPacketsDelta <= 0 then nil else IncomingPacketsLostDelta / NewIncomingPacketsDelta * 100
	else
		IncomingLossPercent = nil
	end
	PartyStatsData1.incomingLossPercent = IncomingLossPercent
	self._prevPartyIncomingPackets = self._partyStatsData.incomingPackets
	self._prevPartyIncomingPacketsLost = self._partyStatsData.incomingPacketsLost
end

function VoiceDebugDataModule:_startPartyPipeline()
	-- upvalues: Default (copy), decorateRemoteOperationsPayload (copy), VoiceDebugFieldMetaModule (copy), Party (copy)
	if not self._partyPollTask then
		self._partyPollGeneration += 1
		local PartyPollGeneration = self._partyPollGeneration
		self._partyPollTask = task.spawn(function()
			-- upvalues: self (copy), PartyPollGeneration (copy), Default (upval), decorateRemoteOperationsPayload (upval), VoiceDebugFieldMetaModule (upval), Party (upval)
			local v1: number? = nil
			while self._isRunning and PartyPollGeneration == self._partyPollGeneration do
				local v2 = false
				local Enabled = false
				
				if game:GetEngineFeature("CEVGetBackgroundState") then
					v2, Enabled = Default:getIsBackgroundDMActive():await()
				end
				if not self._isRunning or PartyPollGeneration ~= self._partyPollGeneration then break end
				self._isPartyActive = v2 and Enabled == true
				local ClockTime = os.clock()
				
				if self._isPartyActive and (not v1 or ClockTime - v1 >= 30) then
					local v3, v4 = Default:getPartyVoiceDebugStats():await()
					
					if not self._isRunning or PartyPollGeneration ~= self._partyPollGeneration then break end
					if v3 and v4 then
						local ClockTime1 = os.clock()
						local ClockTimeDelta = v1 and ClockTime1 - v1 or nil
						v1 = ClockTime1
						self._partyStatsData = v4.stats or {}
						self._partyConnectivityData = v4.connectivity or {}
						local RemoteOperations = v4.remoteOperations or {}
						self._partyRemoteOperationsData = RemoteOperations.nativeNowSeconds and decorateRemoteOperationsPayload(RemoteOperations) or {}
						self:_correctPartyJitterBufferDelay()
						self:_correctPartyAggregateStats(ClockTimeDelta)
						local Timestamp = os.time()
						
						for i, value in self._partyStatsData do
							local VoiceDebugFieldMetaModuleEntry = VoiceDebugFieldMetaModule[i]
							
							if VoiceDebugFieldMetaModuleEntry and VoiceDebugFieldMetaModuleEntry.plottable and type(value) == "number" then
								self:_updateSeriesValueInto(self._partySeries, i, value, Timestamp)
							end
						end
						if self._source == Party then
							self._statsUpdated:Fire(self._partyStatsData)
						end
					end
				end
				task.wait(1)
			end
		end)
		
		return
	end
end

function VoiceDebugDataModule:stop()
	self._isRunning = false
	
	if self._statsListenerConnection then
		self._statsListenerConnection:Disconnect()
		self._statsListenerConnection = nil
	end
	self._partyPollTask = nil
	self._partyPollGeneration += 1
	self._prevBytesClock = nil
	self._prevIncomingBytes = nil
	self._prevOutgoingBytes = nil
	self._prevIncomingPackets = nil
	self._prevIncomingPacketsLost = nil
	self._prevJitterBufferDelaySeconds = nil
	self._prevJitterBufferEmittedCount = nil
	self._prevSubscriptionBytesBySsrc = {}
	self._prevPartyIncomingBytes = nil
	self._prevPartyOutgoingBytes = nil
	self._prevPartyIncomingPackets = nil
	self._prevPartyIncomingPacketsLost = nil
	self._prevPartyJitterBufferDelaySeconds = nil
	self._prevPartyJitterBufferEmittedCount = nil
end

VoiceDebugDataModule._parseCodecFromSdp = parseCodecFromSdp
VoiceDebugDataModule._computeBitrateKbps = computeBitrateKbps
VoiceDebugDataModule._computeLossPercent = computeLossPercent
VoiceDebugDataModule._deltaSince = deltaSince
VoiceDebugDataModule._computeJitterBufferDelayMs = computeJitterBufferDelayMs
VoiceDebugDataModule._computeSubscriptionBitrates = computeSubscriptionBitrates
VoiceDebugDataModule._nativeSecondsToWallClockSeconds = nativeSecondsToWallClockSeconds
VoiceDebugDataModule._formatWallClockTime = formatWallClockTime
VoiceDebugDataModule._decorateOperationEntries = decorateOperationEntries
VoiceDebugDataModule._decorateRemoteOperationsPayload = decorateRemoteOperationsPayload

return VoiceDebugDataModule