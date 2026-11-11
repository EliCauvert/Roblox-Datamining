local UserGameSettings = UserSettings():GetService("UserGameSettings")
local PartyVoiceVolumeEngineFeature = game:GetEngineFeature("PartyVoiceVolume")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local _ = require(script:FindFirstAncestor("CrossExperience").Types)
local PartyVoiceAudioFaderVolumePerc = game:DefineFastInt("PartyVoiceAudioFaderVolumePerc", 100)
local AudioPlayerUpdateAssetAPIEngineFeature = game:GetEngineFeature("AudioPlayerUpdateAssetAPI")
local PartyAudioPlayerModule = {}
PartyAudioPlayerModule.__index = PartyAudioPlayerModule

function PartyAudioPlayerModule.new()
	-- upvalues: PartyAudioPlayerModule (copy)
	local config = {
		isInitialized = false,
		sfxAudioFader = nil,
		onPartyVoiceVolumeChangedSignal = nil,
		audioPlayers = {}
	}
	setmetatable(config, PartyAudioPlayerModule)
	
	return config
end

function PartyAudioPlayerModule:addSound(p1, Asset)
	-- upvalues: AudioPlayerUpdateAssetAPIEngineFeature (copy)
	local AudioPlayer = Instance.new("AudioPlayer")
	AudioPlayer.Parent = workspace
	
	if AudioPlayerUpdateAssetAPIEngineFeature then
		AudioPlayer.Asset = Asset
	else
		AudioPlayer.AssetId = Asset
	end
	local Wire = Instance.new("Wire")
	Wire.Parent = workspace
	Wire.SourceInstance = AudioPlayer
	Wire.TargetInstance = self.sfxAudioFader
	self.audioPlayers[p1] = AudioPlayer
end

function PartyAudioPlayerModule:initialize()
	-- upvalues: PartyVoiceAudioFaderVolumePerc (copy), ReplicatedStorage (copy), PartyVoiceVolumeEngineFeature (copy), UserGameSettings (copy)
	if PartyVoiceAudioFaderVolumePerc ~= 100 then
		ReplicatedStorage:WaitForChild("AudioFader").Volume = PartyVoiceAudioFaderVolumePerc / 100
	end
	local AudioDeviceOutput = Instance.new("AudioDeviceOutput")
	AudioDeviceOutput.Parent = workspace
	local AudioFader = Instance.new("AudioFader")
	AudioFader.Parent = workspace
	
	if PartyVoiceAudioFaderVolumePerc ~= 100 then
		AudioFader.Volume = PartyVoiceAudioFaderVolumePerc / 100
	end
	local Wire = Instance.new("Wire")
	Wire.Parent = workspace
	Wire.SourceInstance = AudioFader
	Wire.TargetInstance = AudioDeviceOutput
	self.sfxAudioFader = AudioFader
	self:addSound("join", "rbxassetid://87296803139875")
	self:addSound("leave", "rbxassetid://108128059974752")
	self.isInitialized = true
	
	if PartyVoiceVolumeEngineFeature then
		self.onPartyVoiceVolumeChangedSignal = UserGameSettings:GetPropertyChangedSignal("PartyVoiceVolume"):Connect(function()
			-- upvalues: self (copy)
			self:playSound("join")
		end)
	end
end

function PartyAudioPlayerModule:playSound(p1)
	if not self.isInitialized then
		self:initialize()
	end
	if self.isInitialized and self.audioPlayers[p1] then
		self.audioPlayers[p1].TimePosition = 0
		self.audioPlayers[p1]:Play()
		
		return
	end
end

function PartyAudioPlayerModule:disconnect()
	if self.onPartyVoiceVolumeChangedSignal then
		self.onPartyVoiceVolumeChangedSignal:Disconnect()
	end
end

PartyAudioPlayerModule.default = PartyAudioPlayerModule.new()

return PartyAudioPlayerModule