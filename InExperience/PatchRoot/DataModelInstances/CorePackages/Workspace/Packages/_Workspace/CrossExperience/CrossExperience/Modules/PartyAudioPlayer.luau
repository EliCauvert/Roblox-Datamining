local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local partyVoiceVolumeEngineFeature = game:GetEngineFeature("PartyVoiceVolume")
local replicatedStorageService = game:GetService("ReplicatedStorage")
local _ = require(script:FindFirstAncestor("CrossExperience").Types)
local partyVoiceAudioFaderVolumePerc = game:DefineFastInt("PartyVoiceAudioFaderVolumePerc", 100)
local audioPlayerUpdateAssetAPIEngineFeature = game:GetEngineFeature("AudioPlayerUpdateAssetAPI")
local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref)
	local t_1 = {
		isInitialized = false,
		sfxAudioFader = nil,
		onPartyVoiceVolumeChangedSignal = nil,
		audioPlayers = {}
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t:addSound(p0, p1)
	-- upvalues: audioPlayerUpdateAssetAPIEngineFeature (ref)
	local audioPlayer = Instance.new("AudioPlayer")
	audioPlayer.Parent = workspace
	
	if audioPlayerUpdateAssetAPIEngineFeature then
		audioPlayer.Asset = p1
	else
		audioPlayer.AssetId = p1
	end
	local wire = Instance.new("Wire")
	wire.Parent = workspace
	wire.SourceInstance = audioPlayer
	wire.TargetInstance = self.sfxAudioFader
	self.audioPlayers[p0] = audioPlayer
end

function t:initialize()
	-- upvalues: partyVoiceAudioFaderVolumePerc (ref), replicatedStorageService (ref), partyVoiceVolumeEngineFeature (ref), userGameSettingsService (ref)
	if partyVoiceAudioFaderVolumePerc ~= 100 then
		replicatedStorageService:WaitForChild("AudioFader").Volume = partyVoiceAudioFaderVolumePerc / 100
	end
	local audioDeviceOutput = Instance.new("AudioDeviceOutput")
	audioDeviceOutput.Parent = workspace
	local audioFader = Instance.new("AudioFader")
	audioFader.Parent = workspace
	
	if partyVoiceAudioFaderVolumePerc ~= 100 then
		audioFader.Volume = partyVoiceAudioFaderVolumePerc / 100
	end
	local wire = Instance.new("Wire")
	wire.Parent = workspace
	wire.SourceInstance = audioFader
	wire.TargetInstance = audioDeviceOutput
	self.sfxAudioFader = audioFader
	self:addSound("join", "rbxassetid://87296803139875")
	self:addSound("leave", "rbxassetid://108128059974752")
	self.isInitialized = true
	
	if partyVoiceVolumeEngineFeature then
		self.onPartyVoiceVolumeChangedSignal = userGameSettingsService:GetPropertyChangedSignal("PartyVoiceVolume"):Connect(function()
			-- upvalues: self (ref)
			self:playSound("join")
		end)
	end
end

function t:playSound(p2)
	if not self.isInitialized then
		self:initialize()
	end
	if self.isInitialized and self.audioPlayers[p2] then
		self.audioPlayers[p2].TimePosition = 0
		self.audioPlayers[p2]:Play()
		
		return
	end
end

function t:disconnect()
	if self.onPartyVoiceVolumeChangedSignal then
		self.onPartyVoiceVolumeChangedSignal:Disconnect()
	end
end

t.default = t.new()

return t