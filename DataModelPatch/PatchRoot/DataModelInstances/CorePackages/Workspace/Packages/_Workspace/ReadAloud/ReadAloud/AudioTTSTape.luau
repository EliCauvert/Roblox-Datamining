local Parent = script.Parent
local v1 = require(Parent.getFFlagReadAloudDebugPrintouts)()
local PropertiesModule = require(Parent.Properties)
local CreateLoggerModule = require(Parent.CreateLogger)
local LoggerModule = if v1 then CreateLoggerModule(script.Name) else nil
local AudioTTSTapeModule = {}
AudioTTSTapeModule.__index = AudioTTSTapeModule

function AudioTTSTapeModule:SetVolume(Volume)
	local Current = self.Current
	repeat
		Current.audioTextToSpeech.Volume = Volume
		Current = Current.nextNode
	until Current == self.Current
end

function AudioTTSTapeModule:SetVoiceId(VoiceId)
	local Current = self.Current
	repeat
		Current.audioTextToSpeech.VoiceId = VoiceId
		Current = Current.nextNode
	until Current == self.Current
end

function AudioTTSTapeModule:SetPitch(Pitch)
	local Current = self.Current
	repeat
		Current.audioTextToSpeech.Pitch = Pitch
		Current = Current.nextNode
	until Current == self.Current
end

function AudioTTSTapeModule:SetSpeed(Speed)
	local Current = self.Current
	repeat
		Current.audioTextToSpeech.Speed = Speed
		Current = Current.nextNode
	until Current == self.Current
end

local function CreateTextTapeAndFillAudioTTSTape(p1, Entry)
	local NextNode = { nextNode = nil, text = Entry[1] }
	p1.Current.audioTextToSpeech.Text = NextNode.text
	p1.Current.audioTextToSpeech.TimePosition = 0
	local NextNode1 = NextNode
	local NextNode2 = p1.Current.nextNode
	local NextNode3 = NextNode
	
	for i = 2, #Entry do
		local NextNode4 = { nextNode = nil, text = Entry[i] }
		
		if NextNode2.id ~= p1.Current.id then
			NextNode2.audioTextToSpeech.Text = NextNode4.text
			NextNode2 = NextNode2.nextNode
			NextNode1 = NextNode4
		end
		NextNode3.nextNode = NextNode4
		NextNode3 = NextNode4
	end
	NextNode3.nextNode = NextNode
	p1._nextAvailableTextNode = NextNode1.nextNode
	while NextNode2.id ~= p1.Current.id do
		NextNode2.audioTextToSpeech.Text = ""
		NextNode2 = NextNode2.nextNode
	end
end

function AudioTTSTapeModule:SetTextChunks(p2)
	-- upvalues: CreateTextTapeAndFillAudioTTSTape (copy)
	if #p2 < 1 then
		self._nextAvailableTextNode = nil
		
		return
	else
		self:_DisconnectCycle()
		CreateTextTapeAndFillAudioTTSTape(self, p2)
		self:_ConnectCycle()
	end
end

function AudioTTSTapeModule:IsPlaying()
	return self.Current.audioTextToSpeech.IsPlaying
end

function AudioTTSTapeModule:IsLoaded()
	return self.Current.audioTextToSpeech.IsLoaded
end

function AudioTTSTapeModule:_CycleNodes()
	-- upvalues: LoggerModule (copy), v1 (copy)
	if self._nextAvailableTextNode == nil then
		LoggerModule:warning("AudioTTSTape tried to cycle, but there is no text being read")
		
		return
	end
	if self._nextAvailableTextNode.nextNode == self._nextAvailableTextNode then return end
	local Current = self.Current
	local NextNode = self.Current.nextNode
	while NextNode.audioTextToSpeech.Text == "" do
		NextNode = NextNode.nextNode
	end
	Current.audioTextToSpeech.Text = self._nextAvailableTextNode.text
	self._nextAvailableTextNode = self._nextAvailableTextNode.nextNode
	
	if self._preloading then
		Current.audioTextToSpeech:Unload()
	else
		task.spawn((coroutine.create(function()
			-- upvalues: v1 (upval), LoggerModule (upval), Current (copy)
			if v1 then
				LoggerModule:debug("Cycle forcing preload on completed node")
			end
			local Async = Current.audioTextToSpeech:LoadAsync()
			local Elapsed = os.clock() - os.clock()
			
			if Async == Enum.AssetFetchStatus.Success then
				if v1 then
					LoggerModule:debug("Preloaded node")
				end
			else
				LoggerModule:error("Failed to preload a node")
			end
			if v1 then
				LoggerModule:info(`Preload results: {Async}, {Elapsed}`)
			end
		end)))
	end
	self:_DisconnectCycle()
	self.Current = NextNode
	self:_ConnectCycle()
end

function AudioTTSTapeModule:_ConnectCycle()
	self._currAudioEndedConnection = self.Current.audioTextToSpeech.Ended:Connect(function()
		-- upvalues: self (copy)
		self.AudioEnded:Fire()
		self:_CycleNodes()
	end)
end

function AudioTTSTapeModule:_DisconnectCycle()
	local CurrAudioEndedConnection = self._currAudioEndedConnection
	
	if CurrAudioEndedConnection then
		CurrAudioEndedConnection:Disconnect()
	end
	self._currAudioEndedConnection = nil
end

local function iteratePreloadCoroutine(p2, Current, PreloadCoroutineID)
	-- upvalues: v1 (copy), LoggerModule (copy)
	if v1 then
		LoggerModule:debug(`Preload coroutine ID {PreloadCoroutineID} started`)
	end
	p2._preloading = true
	local NextNode = Current.nextNode
	while NextNode.id ~= p2.Current.id and PreloadCoroutineID == p2._preloadCoroutineID do
		if NextNode.audioTextToSpeech.Text ~= "" and not NextNode.audioTextToSpeech.IsLoaded then
			local Async = NextNode.audioTextToSpeech:LoadAsync()
			local Elapsed = os.clock() - os.clock()
			
			if Async == Enum.AssetFetchStatus.Success then
				if v1 then
					LoggerModule:debug("Preloaded node")
				end
			else
				LoggerModule:error("Failed to preload a node")
			end
			if v1 then
				LoggerModule:info(`Preload results: {Async}, {Elapsed}`)
			end
			task.wait(p2.PreloadDelay)
		end
		NextNode = NextNode.nextNode
	end
	p2._preloading = false
	
	if v1 then
		LoggerModule:debug(`Preload coroutine ID {PreloadCoroutineID} stopped`)
	end
end

function AudioTTSTapeModule:InitiatePreload()
	-- upvalues: LoggerModule (copy), PropertiesModule (copy), iteratePreloadCoroutine (copy)
	if self._nextAvailableTextNode == nil then
		LoggerModule:warning("AudioTTSTape tried to preload audio, but there is no text being read.")
		
		return
	end
	if self.Current.nextNode.id ~= self.Current.id then
		self._preloadCoroutineID = (self._preloadCoroutineID + 1) % PropertiesModule.MAX_PRELOAD_COROUTINES
		task.spawn((coroutine.create(function()
			-- upvalues: iteratePreloadCoroutine (upval), self (copy)
			iteratePreloadCoroutine(self, self.Current, self._preloadCoroutineID)
		end)))
		
		return
	end
end

function AudioTTSTapeModule:Load()
	-- upvalues: LoggerModule (copy)
	if self._nextAvailableTextNode then
		local ClockTime = os.clock()
		local Async = self.Current.audioTextToSpeech:LoadAsync()
		self:InitiatePreload()
		
		return { status = Async, time = os.clock() - ClockTime }
	else
		LoggerModule:warning("AudioTTSTape tried to load audio, but there is no text being read.")
		
		return { time = -1, status = Enum.AssetFetchStatus.Failure }
	end
end

function AudioTTSTapeModule:Play()
	-- upvalues: LoggerModule (copy)
	if not self._nextAvailableTextNode then
		LoggerModule:warning("AudioTTSTape tried to play audio, but no text is being read.")
		
		return
	end
	if not self:IsLoaded() then
		self:Load()
	end
	self.Current.audioTextToSpeech:Play()
end

function AudioTTSTapeModule:Pause()
	self.Current.audioTextToSpeech:Pause()
end

function AudioTTSTapeModule.new(Value: number, PreloadDelay, Parent, TargetInstance)
	-- upvalues: AudioTTSTapeModule (copy)
	local self = setmetatable({}, AudioTTSTapeModule)
	local Largest = math.max(math.floor(Value), 1)
	self.Length = Largest
	self.PreloadDelay = PreloadDelay
	self.CurrentAudioLoaded = Instance.new("BindableEvent")
	self.CurrentAudioLoaded.Name = "Current Audio Loaded Event"
	self.CurrentAudioLoaded.Parent = Parent
	self._preloadCoroutineID = 0
	self._preloading = false
	local Current = nil
	local NextNode = nil
	local Id = 0
	
	for i = 1, Largest do
		local AudioTextToSpeech = Instance.new("AudioTextToSpeech")
		AudioTextToSpeech.Parent = Parent
		local Wire = Instance.new("Wire")
		Wire.Parent = AudioTextToSpeech
		Wire.SourceInstance = AudioTextToSpeech
		Wire.TargetInstance = TargetInstance
		local NextNode1 = {
			nextNode = nil,
			audioTextToSpeech = AudioTextToSpeech,
			id = Id
		}
		
		if i == 1 then
			NextNode = NextNode1
		end
		if Current then
			Current.nextNode = NextNode1
		end
		Current = NextNode1
		Id += 1
	end
	Current.nextNode = NextNode
	self.Current = Current
	self.AudioEnded = Instance.new("BindableEvent")
	self.AudioEnded.Name = "Audio Ended Event"
	self.AudioEnded.Parent = Parent
	self:_ConnectCycle()
	
	return self
end

return AudioTTSTapeModule