local Parent = script.Parent
local TextUtilityModule = require(Parent.TextUtility)
local PropertiesModule = require(Parent.Properties)
local TTSHandlerStateModule = require(Parent.TTSHandlerState)
local SystemReadoutTextModule = require(Parent.SystemReadoutText)
local AudioTTSTapeModule = require(Parent.AudioTTSTape)
local CreateLoggerModule = require(Parent.CreateLogger)
local v1 = require(Parent.getFFlagReadAloudDebugPrintouts)()
local LoggerModule = if v1 then CreateLoggerModule(script.Name) else nil
local TTSHandler = {}
TTSHandler.__index = TTSHandler

function TTSHandler:SetVolume(Value: number)
	local ClampedValue = math.clamp(Value, 0, 3)
	self.TTSTape:SetVolume(ClampedValue)
	self.systemAudioTTS.Volume = ClampedValue
end

function TTSHandler:SetVoiceId(Value: number)
	local Text = tostring((math.clamp(math.round(Value), 1, 8)))
	self.TTSTape:SetVoiceId(Text)
	self.systemAudioTTS.VoiceId = Text
end

function TTSHandler:SetPitch(Value: number)
	local ClampedValue = math.clamp(Value, -12, 12)
	self.TTSTape:SetPitch(ClampedValue)
	self.systemAudioTTS.Pitch = ClampedValue
end

function TTSHandler:SetSpeed(Value: number)
	local ClampedValue = math.clamp(Value, 0.5, 2)
	self.TTSTape:SetSpeed(ClampedValue)
	self.systemAudioTTS.Speed = ClampedValue
end

function TTSHandler:SetText(OriginalText)
	-- upvalues: TextUtilityModule (copy)
	self.originalText = OriginalText
	self.cleanedText = TextUtilityModule.cleanText(OriginalText)
	self.splitText = TextUtilityModule.splitTextToReadableChunks(self.cleanedText)
	self.TTSTape:SetTextChunks(self.splitText)
end

function TTSHandler:UpdateSettings(p1, p2, p3, p4)
	-- upvalues: PropertiesModule (copy)
	self:SetVolume(p1 or PropertiesModule.DefaultVolume)
	self:SetVoiceId(p2 or PropertiesModule.DefaultVoiceId)
	self:SetPitch(p3 or PropertiesModule.DefaultPitch)
	self:SetSpeed(p4 or PropertiesModule.DefaultSpeed)
end

function TTSHandler:SetState(Idle)
	self.State = Idle
	self.StateChanged:Fire()
end

function TTSHandler:Play()
	-- upvalues: TTSHandlerStateModule (copy), LoggerModule (copy), v1 (copy)
	if not self.TTSTape:IsLoaded() then
		self:SetState(TTSHandlerStateModule.Loading)
		local LoadResult = self.TTSTape:Load()
		local Status = LoadResult.status
		local Time = LoadResult.time
		
		if Status ~= Enum.AssetFetchStatus.Success then
			LoggerModule:error("TTSHandler failed to load audio, with status", Status)
			self.State = "Idle"
			self:ReadSystemTextFromKey("FailedToRead")
			
			return
		end
		if v1 then
			LoggerModule:info(`Loaded audio in {Time} seconds`)
		end
	end
	self:SetState(TTSHandlerStateModule.Playing)
	self.TTSTape:Play()
end

function TTSHandler:Pause()
	-- upvalues: TTSHandlerStateModule (copy)
	self:SetState(TTSHandlerStateModule.Paused)
	self.TTSTape:Pause()
end

function TTSHandler:ReadSystemTextFromKey(p1)
	-- upvalues: SystemReadoutTextModule (copy), v1 (copy), LoggerModule (copy)
	local SystemReadoutTextModuleEntry = SystemReadoutTextModule[p1]
	
	if v1 then
		LoggerModule:info("TTSHandler system is reading", SystemReadoutTextModule[p1])
	end
	self.systemAudioTTS.Text = SystemReadoutTextModuleEntry
	self.systemAudioTTS:LoadAsync()
	self.systemAudioTTS:Play()
end

function TTSHandler:CleanUp()
	local InstanceFolder = self.instanceFolder
	
	if InstanceFolder then
		self.instanceFolder = nil
		InstanceFolder:Destroy()
	end
end

function TTSHandler:__gc()
	self:CleanUp()
end

function TTSHandler.new(p1, p2, Folder, AudioDeviceOutput, p3, p4)
	-- upvalues: TTSHandler (copy), TTSHandlerStateModule (copy), AudioTTSTapeModule (copy), PropertiesModule (copy), v1 (copy), LoggerModule (copy)
	local Humanoid = {}
	setmetatable(Humanoid, TTSHandler)
	Humanoid.StateChanged = Instance.new("BindableEvent")
	Humanoid:SetState(TTSHandlerStateModule.Idle)
	Humanoid.originalText = ""
	Humanoid.cleanedText = ""
	Humanoid.splitText = {}
	local Folder1 = Instance.new("Folder")
	Folder1.Name = "Read Aloud"
	Folder1.Parent = workspace
	Humanoid.instanceFolder = Folder1
	local AudioDeviceOutput1 = Instance.new("AudioDeviceOutput")
	AudioDeviceOutput1.Parent = Folder1
	local AudioTextToSpeech = Instance.new("AudioTextToSpeech")
	AudioTextToSpeech.Name = "System Readout"
	AudioTextToSpeech.Parent = Folder1
	Humanoid.systemAudioTTS = AudioTextToSpeech
	local Wire = Instance.new("Wire")
	Wire.Parent = AudioTextToSpeech
	Wire.SourceInstance = AudioTextToSpeech
	Wire.TargetInstance = AudioDeviceOutput1
	Humanoid.TTSTape = AudioTTSTapeModule.new(p3 or 1 + PropertiesModule.NumPreloadedAudioChunks, p4 or PropertiesModule.PreloadNextDelay, Folder1, AudioDeviceOutput1)
	Humanoid.TTSTape.AudioEnded.Event:Connect(function()
		-- upvalues: Humanoid (copy), TTSHandlerStateModule (upval)
		Humanoid:SetState(TTSHandlerStateModule.Idle)
	end)
	Humanoid:UpdateSettings(p1, p2, Folder, AudioDeviceOutput)
	
	if v1 then
		Humanoid.StateChanged.Event:Connect(function()
			-- upvalues: LoggerModule (upval), Humanoid (copy)
			LoggerModule:info(`TTSHandler updated state to {Humanoid.State}`)
		end)
	end
	return Humanoid
end

return TTSHandler