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

local function computeLossPercent(p1, p2)
	if type(p1) ~= "number" or type(p2) ~= "number" then
		return nil
	end
	local var1 = p1 + p2
	
	return if var1 <= 0 then nil else p2 / var1 * 100
end

local function deltaSince(p1, p2)
	return if type(p1) == "number" and type(p2) == "number" and p1 >= p2 then p1 - p2 else nil
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

function t:isRunning()
	return self._isRunning
end

function t:getConnectivity()
	return self._connectivityData
end

function t:_updateSeriesValue(p1, p2, p3)
	-- upvalues: circularBufferModule (ref), newDevConsoleMaxGraphCount (ref)
	if not self._series[p1] then
		local var1 = circularBufferModule.new(newDevConsoleMaxGraphCount)
		var1:push_back({ value = p2, time = p3 })
		self._series[p1] = { max = p2, min = p2, dataSet = var1 }
		
		return
	end
	local var2 = self._series[p1]
	local max = var2.max
	local min = var2.min
	local var3 = var2.dataSet:push_back({ value = p2, time = p3 })
	
	if var3 and (max == var3.value or min == var3.value) then
		local var4 = var2.dataSet:iterator()
		local var5 = var4:next()
		local value = var5 and var5.value
		local value_1 = var5 and var5.value
		while var5 do
			value = if var5.value < value then value else var5.value
			value_1 = if value_1 < var5.value then value_1 else var5.value
			var5 = var4:next()
		end
		if max == var3.value then
			max = value
		end
		if min == var3.value then
			min = value_1
		end
	end
	var2.max = if max < p2 then p2 else max
	var2.min = if min < p2 then min else p2
end

function t:start()
	-- upvalues: voiceChatService (ref), getFFlagVoiceDebugConsoleV2Module (ref), voiceDebugFieldMetaModule (ref)
	if voiceChatService and not self._statsListenerConnection then
		self._statsListenerConnection = voiceChatService.VoiceChatStatsCollected:Connect(function()
			-- upvalues: self (ref), voiceChatService (copy), getFFlagVoiceDebugConsoleV2Module (copy), voiceDebugFieldMetaModule (copy)
			local incomingBytes, prevIncomingBytes
			self._statsData = voiceChatService:lastVoiceChatStats()
			self._connectivityData = voiceChatService:lastVoiceChatConnectivity()
			local timestamp = os.time()
			
			if getFFlagVoiceDebugConsoleV2Module() then
				local var6, match, match_1
				local processTime = os.clock()
				local var7 = if self._prevBytesClock then processTime - self._prevBytesClock else nil
				local statsData = self._statsData
				incomingBytes = self._statsData.incomingBytes
				prevIncomingBytes = self._prevIncomingBytes
				statsData.incomingBitrateKbps = if type(incomingBytes) == "number" and type(prevIncomingBytes) == "number" and (type(var7) == "number" and var7 > 0) then if incomingBytes < prevIncomingBytes then nil else (incomingBytes - prevIncomingBytes) * 8 / var7 / 1000 else nil
				local statsData_1 = self._statsData
				incomingBytes = self._statsData.outgoingBytes
				prevIncomingBytes = self._prevOutgoingBytes
				statsData_1.outgoingBitrateKbps = if type(incomingBytes) == "number" and type(prevIncomingBytes) == "number" and (type(var7) == "number" and var7 > 0) then if incomingBytes < prevIncomingBytes then nil else (incomingBytes - prevIncomingBytes) * 8 / var7 / 1000 else nil
				self._prevIncomingBytes = self._statsData.incomingBytes
				self._prevOutgoingBytes = self._statsData.outgoingBytes
				self._prevBytesClock = processTime
				local statsData_2 = self._statsData
				incomingBytes = self._connectivityData.sdpPublishOffer
				
				if incomingBytes and incomingBytes ~= "" then
					prevIncomingBytes, match, match_1, match_2 = string.match(incomingBytes, "a=rtpmap:(%d+) (%a+)/(%d+)/(%d+)")
					var6 = if match and match_1 and match_2 then string.format("%s/%s/%s", match, match_1, match_2) else nil
				else
					var6 = nil
				end
				local var8
				statsData_2.outgoingCodec = var6
				local statsData_3 = self._statsData
				prevIncomingBytes = self._statsData.incomingPackets
				match = self._prevIncomingPackets
				incomingBytes = if type(prevIncomingBytes) == "number" and type(match) == "number" and prevIncomingBytes >= match then prevIncomingBytes - match else nil
				match = self._statsData.incomingPacketsLost
				match_1 = self._prevIncomingPacketsLost
				prevIncomingBytes = if type(match) == "number" and type(match_1) == "number" and match >= match_1 then match - match_1 else nil
				
				if type(incomingBytes) == "number" and type(prevIncomingBytes) == "number" then
					match = incomingBytes + prevIncomingBytes
					var8 = if match <= 0 then nil else prevIncomingBytes / match * 100
				else
					var8 = nil
				end
				statsData_3.incomingLossPercent = var8
				self._prevIncomingPackets = self._statsData.incomingPackets
				self._prevIncomingPacketsLost = self._statsData.incomingPacketsLost
			end
			for i, incomingBytes in self._statsData do
				prevIncomingBytes = voiceDebugFieldMetaModule[i]
				
				if prevIncomingBytes and prevIncomingBytes.plottable and type(incomingBytes) == "number" then
					self:_updateSeriesValue(i, incomingBytes, timestamp)
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
end

t._parseCodecFromSdp = parseCodecFromSdp
t._computeBitrateKbps = computeBitrateKbps
t._computeLossPercent = computeLossPercent
t._deltaSince = deltaSince

return t