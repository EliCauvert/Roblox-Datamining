local CircularBufferModule = require(script.Parent.Parent.Parent.CircularBuffer)
local SignalModule = require(script.Parent.Parent.Parent.Signal)
local VoiceDebugFieldMetaModule = require(script.Parent.VoiceDebugFieldMeta)
local VoiceDebugSourceModule = require(script.Parent.VoiceDebugSource)
local VoiceChatService = game:GetService("VoiceChatService")
local Number: number = tonumber(settings():GetFVariable("NewDevConsoleMaxGraphCount")) or 60
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

local function computeIntervalBitrateKbps(p1: number, p2: number)
	return if type(p1) == "number" and type(p2) == "number" and p2 > 0 then p1 * 8 / p2 / 1000 else nil
end

local function computeSubscriptionBitrates(Subscriptions, PrevPartySubscriptionBytesBySsrc, p1: number)
	local t = {}
	
	for i, subscription in Subscriptions do
		local AudioSsrc: number = subscription.audioSsrc
		
		if type(AudioSsrc) == "number" and AudioSsrc == AudioSsrc and AudioSsrc % 1 == 0 then
			t[AudioSsrc] = true
			local PrevPartySubscriptionBytesBySsrcEntry = PrevPartySubscriptionBytesBySsrc[AudioSsrc]
			local IncomingBytes = subscription.incomingBytes
			local Bytes = PrevPartySubscriptionBytesBySsrcEntry ~= nil and PrevPartySubscriptionBytesBySsrcEntry.userId == subscription.userId and PrevPartySubscriptionBytesBySsrcEntry.bytes or nil
			subscription.incomingBitrateKbps = if type(IncomingBytes) == "number" and type(Bytes) == "number" and type(p1) == "number" and p1 > 0 then if IncomingBytes < Bytes then nil else (IncomingBytes - Bytes) * 8 / p1 / 1000 else nil
			PrevPartySubscriptionBytesBySsrc[AudioSsrc] = {
				userId = subscription.userId,
				bytes = subscription.incomingBytes
			}
		end
	end
	for i in PrevPartySubscriptionBytesBySsrc do
		if not t[i] then
			PrevPartySubscriptionBytesBySsrc[i] = nil
		end
	end
end

local function countActiveIncomingStreams(Subscriptions): number
	local Count = 0
	
	for _, subscription in Subscriptions do
		if type(subscription.incomingBitrateKbps) == "number" and subscription.incomingBitrateKbps > 0 then
			Count += 1
		end
	end
	return Count
end

local function computeLossPercent(p2, p3)
	if type(p2) == "number" and type(p3) == "number" then
		local v1 = p2 + p3
		
		return if v1 <= 0 then nil else p3 / v1 * 100
	else
		return nil
	end
end

local function computeIntervalJitterBufferDelayMs(p2: number, p3: number)
	return if type(p2) == "number" and type(p3) == "number" and p3 > 0 then p2 * 1000 / p3 else nil
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
VoiceDebugDataModule.PARTY_STATS_POLL_INTERVAL_SECONDS = 30

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
	t._statsListenerConnection = nil
	t._source = InExperience
	t._partyStatsData = {}
	t._partySeries = {}
	t._partyConnectivityData = {}
	t._partySubscriptionsData = {}
	t._partyRemoteOperationsData = {}
	t._isPartyActive = false
	t._partyPollTask = nil
	t._partyPollGeneration = 0
	t._prevPartySubscriptionBytesBySsrc = {}
	t._prevBytesClock = nil
	
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

function VoiceDebugDataModule.getSubscriptions(p3)
	-- upvalues: Party (copy)
	return if p3._source == Party then p3._partySubscriptionsData.subscriptions or {} else p3._subscriptionsData.subscriptions or {}
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
	-- upvalues: VoiceChatService (copy), GetFFlagVoiceDebugConsoleV2Module (copy), decorateRemoteOperationsPayload (copy), computeSubscriptionBitrates (copy), countActiveIncomingStreams (copy), VoiceDebugFieldMetaModule (copy), InExperience (copy)
	if VoiceChatService and not self._statsListenerConnection then
		self._statsListenerConnection = VoiceChatService.VoiceChatStatsCollected:Connect(function()
			-- upvalues: self (copy), VoiceChatService (upval), GetFFlagVoiceDebugConsoleV2Module (upval), decorateRemoteOperationsPayload (upval), computeSubscriptionBitrates (upval), countActiveIncomingStreams (upval), VoiceDebugFieldMetaModule (upval), InExperience (upval)
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
				local IncomingBytes: number = self._statsData.incomingBytes
				self._statsData.incomingBitrateKbps = if type(IncomingBytes) == "number" and type(ClockTimeDelta) == "number" and ClockTimeDelta > 0 then IncomingBytes * 8 / ClockTimeDelta / 1000 else nil
				local OutgoingBytes: number = self._statsData.outgoingBytes
				self._statsData.outgoingBitrateKbps = if type(OutgoingBytes) == "number" and type(ClockTimeDelta) == "number" and ClockTimeDelta > 0 then OutgoingBytes * 8 / ClockTimeDelta / 1000 else nil
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
				local IncomingPacketsLost = self._statsData.incomingPacketsLost
				local IncomingLossPercent = nil
				
				if type(IncomingPackets) == "number" and type(IncomingPacketsLost) == "number" then
					local NewIncomingPackets = IncomingPackets + IncomingPacketsLost
					IncomingLossPercent = if NewIncomingPackets <= 0 then nil else IncomingPacketsLost / NewIncomingPackets * 100
				else
					IncomingLossPercent = nil
				end
				StatsData1.incomingLossPercent = IncomingLossPercent
				local JitterBufferDelayMs: number = self._statsData.jitterBufferDelayMs
				local JitterBufferEmittedCount: number = self._statsData.jitterBufferEmittedCount
				self._statsData.jitterBufferDelayMs = if type(JitterBufferDelayMs) == "number" and type(JitterBufferEmittedCount) == "number" and JitterBufferEmittedCount > 0 then JitterBufferDelayMs * 1000 / JitterBufferEmittedCount else nil
				computeSubscriptionBitrates(self._subscriptionsData.subscriptions or {}, self._prevSubscriptionBytesBySsrc, ClockTimeDelta)
				self._statsData.incomingStreams = countActiveIncomingStreams(self._subscriptionsData.subscriptions or {})
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
		
		if GetFFlagVoiceDebugConsoleV2Module() then
			self:_startPartyPipeline()
		end
	end
end

function VoiceDebugDataModule:_correctPartyJitterBufferDelay()
	local JitterBufferDelayMs: number = self._partyStatsData.jitterBufferDelayMs
	local JitterBufferEmittedCount: number = self._partyStatsData.jitterBufferEmittedCount
	self._partyStatsData.jitterBufferDelayMs = if type(JitterBufferDelayMs) == "number" and type(JitterBufferEmittedCount) == "number" and JitterBufferEmittedCount > 0 then JitterBufferDelayMs * 1000 / JitterBufferEmittedCount else nil
end

function VoiceDebugDataModule:_correctPartyAggregateStats(p3: number)
	-- upvalues: GetFFlagVoiceDebugConsoleV2Module (copy)
	if not GetFFlagVoiceDebugConsoleV2Module() then return end
	local IncomingBytes: number = self._partyStatsData.incomingBytes
	self._partyStatsData.incomingBitrateKbps = if type(IncomingBytes) == "number" and type(p3) == "number" and p3 > 0 then IncomingBytes * 8 / p3 / 1000 else nil
	local OutgoingBytes: number = self._partyStatsData.outgoingBytes
	self._partyStatsData.outgoingBitrateKbps = if type(OutgoingBytes) == "number" and type(p3) == "number" and p3 > 0 then OutgoingBytes * 8 / p3 / 1000 else nil
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
	local IncomingPacketsLost = self._partyStatsData.incomingPacketsLost
	local IncomingLossPercent = nil
	
	if type(IncomingPackets) == "number" and type(IncomingPacketsLost) == "number" then
		local NewIncomingPackets = IncomingPackets + IncomingPacketsLost
		IncomingLossPercent = if NewIncomingPackets <= 0 then nil else IncomingPacketsLost / NewIncomingPackets * 100
	else
		IncomingLossPercent = nil
	end
	PartyStatsData1.incomingLossPercent = IncomingLossPercent
end

function VoiceDebugDataModule:_clearPartyDataOnDisconnect()
	-- upvalues: Party (copy)
	self._partyStatsData = {}
	self._partyConnectivityData = {}
	self._partyRemoteOperationsData = {}
	self._partySubscriptionsData = {}
	self._prevPartySubscriptionBytesBySsrc = {}
	
	if self._source == Party then
		self._statsUpdated:Fire(self._partyStatsData)
	end
end

function VoiceDebugDataModule:_startPartyPipeline()
	-- upvalues: Default (copy), decorateRemoteOperationsPayload (copy), computeSubscriptionBitrates (copy), countActiveIncomingStreams (copy), VoiceDebugFieldMetaModule (copy), Party (copy)
	if not self._partyPollTask then
		self._partyPollGeneration += 1
		local PartyPollGeneration = self._partyPollGeneration
		self._partyPollTask = task.spawn(function()
			-- upvalues: self (copy), PartyPollGeneration (copy), Default (upval), decorateRemoteOperationsPayload (upval), computeSubscriptionBitrates (upval), countActiveIncomingStreams (upval), VoiceDebugFieldMetaModule (upval), Party (upval)
			local v1 = nil
			while self._isRunning and PartyPollGeneration == self._partyPollGeneration do
				local Success, Result = pcall(function(): boolean
					-- upvalues: Default (upval), self (upval), PartyPollGeneration (upval), v1 (ref), decorateRemoteOperationsPayload (upval), computeSubscriptionBitrates (upval), countActiveIncomingStreams (upval), VoiceDebugFieldMetaModule (upval), Party (upval)
					local v2 = false
					local Enabled = false
					
					if game:GetEngineFeature("CEVGetBackgroundState") then
						v2, Enabled = Default:getIsBackgroundDMActive():await()
					end
					if not self._isRunning or PartyPollGeneration ~= self._partyPollGeneration then
						return true
					end
					local IsPartyActive = self._isPartyActive
					self._isPartyActive = v2 and Enabled == true
					
					if IsPartyActive and not self._isPartyActive then
						self:_clearPartyDataOnDisconnect()
						v1 = nil
					end
					local ClockTime = os.clock()
					
					if self._isPartyActive and (not v1 or ClockTime - v1 >= 30) then
						local v3, v4 = Default:getPartyVoiceDebugStats():await()
						
						if not self._isRunning or PartyPollGeneration ~= self._partyPollGeneration then
							return true
						end
						if v3 and v4 then
							local ClockTime1 = os.clock()
							local ClockTimeDelta = v1 and ClockTime1 - v1 or nil
							v1 = ClockTime1
							self._partyStatsData = v4.stats or {}
							self._partyConnectivityData = v4.connectivity or {}
							self._partySubscriptionsData = v4.subscriptions or {}
							local RemoteOperations = v4.remoteOperations or {}
							self._partyRemoteOperationsData = RemoteOperations.nativeNowSeconds and decorateRemoteOperationsPayload(RemoteOperations) or {}
							self:_correctPartyJitterBufferDelay()
							self:_correctPartyAggregateStats(ClockTimeDelta)
							computeSubscriptionBitrates(self._partySubscriptionsData.subscriptions or {}, self._prevPartySubscriptionBytesBySsrc, ClockTimeDelta)
							self._partyStatsData.incomingStreams = countActiveIncomingStreams(self._partySubscriptionsData.subscriptions or {})
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
					return false
				end)
				
				if not Success then
					warn(string.format("VoiceDebugData: party poll tick failed, continuing next interval: %s", (tostring(Result))))
				elseif Result then break end
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
	self._prevSubscriptionBytesBySsrc = {}
	self._prevPartySubscriptionBytesBySsrc = {}
end

VoiceDebugDataModule._parseCodecFromSdp = parseCodecFromSdp
VoiceDebugDataModule._computeBitrateKbps = computeBitrateKbps
VoiceDebugDataModule._computeIntervalBitrateKbps = computeIntervalBitrateKbps
VoiceDebugDataModule._computeLossPercent = computeLossPercent
VoiceDebugDataModule._computeIntervalJitterBufferDelayMs = computeIntervalJitterBufferDelayMs
VoiceDebugDataModule._computeSubscriptionBitrates = computeSubscriptionBitrates
VoiceDebugDataModule._countActiveIncomingStreams = countActiveIncomingStreams
VoiceDebugDataModule._nativeSecondsToWallClockSeconds = nativeSecondsToWallClockSeconds
VoiceDebugDataModule._formatWallClockTime = formatWallClockTime
VoiceDebugDataModule._decorateOperationEntries = decorateOperationEntries
VoiceDebugDataModule._decorateRemoteOperationsPayload = decorateRemoteOperationsPayload

return VoiceDebugDataModule