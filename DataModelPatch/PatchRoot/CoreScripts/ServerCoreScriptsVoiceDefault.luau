local _ = game:GetService("Players")
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local VoiceChatService = game:GetService("VoiceChatService")
local SoundService = game:GetService("SoundService")
local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local AvatarChatService = game:GetService("AvatarChatService")
local GetFFlagAvatarChatServiceEnabledFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagAvatarChatServiceEnabled
local DebugLogVoiceDefault = game:DefineFastFlag("DebugLogVoiceDefault", false)
local AudioInstanceAddedApiEnabledEngineFeature = game:GetEngineFeature("AudioInstanceAddedApiEnabled")
local FFlagExpChatDictation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagExpChatDictation

local function log(...)
	-- upvalues: DebugLogVoiceDefault (copy)
	if DebugLogVoiceDefault then
		print("[VoiceDefault]", ...)
	end
end

local Curve = {}

for i = 7, 80, 2 do
	Curve[i] = (i - 7 - 73) ^ 2 / 5329
end
Curve[80] = 0

if GetFFlagAvatarChatServiceEnabledFunction() then
	local Success, Result = pcall(AvatarChatService.GetServerFeaturesAsync, AvatarChatService)
	
	if not Success then
		log("Failed to get GetServerFeaturesAsync, returning early")
		
		return
	end
	local IsEnabled = AvatarChatService:IsEnabled(Result, Enum.AvatarChatServiceFeature.PlaceAudio)
	
	if not AvatarChatService:IsEnabled(Result, Enum.AvatarChatServiceFeature.UniverseAudio) or not IsEnabled then
		log("Universe or place not voice enabled, returning early")
		
		return
	end
end
local t = {}
local t1 = {}
local CharacterAddedConnections = {}

local function _(p1, Key)
	if p1 == nil then
		return { [Key] = true }
	else
		p1[Key] = true
		
		return p1
	end
end

local function addEmitterToHead(Parent)
	-- upvalues: log (copy), VoiceChatService (copy), Curve (copy)
	local AudioEmitter = Instance.new("AudioEmitter")
	AudioEmitter.Parent = Parent
	AudioEmitter:AddTag("RbxDefaultVoiceEmitter")
	log("Adding emitter", AudioEmitter, " to ", Parent)
	
	if VoiceChatService.DefaultDistanceAttenuation == Enum.VoiceChatDistanceAttenuationType.Legacy then
		AudioEmitter:SetDistanceAttenuation(Curve)
	end
	return AudioEmitter
end

local _ = function(Parent, SourceInstance)
	-- upvalues: addEmitterToHead (copy), log (copy)
	local AddEmitterToHeadResult = addEmitterToHead(Parent)
	log("Hooking input device to emitter", Parent, SourceInstance, AddEmitterToHeadResult)
	local Wire = Instance.new("Wire")
	Wire.Parent = AddEmitterToHeadResult
	Wire.SourceInstance = SourceInstance
	Wire.TargetInstance = AddEmitterToHeadResult
end

local _ = function(Key, p1)
	-- upvalues: t (copy), t1 (copy), log (copy)
	if p1 then
		local Entry = t[p1]
		
		if Entry then
			Entry[Key] = nil
		end
	end
	local Entry1 = t1[Key]
	
	if Entry1 then
		Entry1.onPlayerChanged:Disconnect()
		t1[Key] = nil
		
		return
	else
		log("Attempting to remove connections from untracked AudioDeviceInput")
	end
end

local _ = function(Object)
	-- upvalues: CoreGui (copy)
	return Object:IsDescendantOf(CoreGui)
end

local function trackDevice(AudioDeviceInput)
	-- upvalues: FFlagExpChatDictation (copy), CoreGui (copy), t (copy), t1 (copy), log (copy), trackDevice (copy)
	if FFlagExpChatDictation and AudioDeviceInput:IsDescendantOf(CoreGui) then return end
	local Player = AudioDeviceInput.Player
	
	if Player then
		local Entry = t[Player]
		local config = nil
		
		if Entry == nil then
			config = { [AudioDeviceInput] = true }
		else
			Entry[AudioDeviceInput] = true
			config = Entry
		end
		t[Player] = config
	end
	local Player1 = Player
	t1[AudioDeviceInput] = {
		onPlayerChanged = AudioDeviceInput:GetPropertyChangedSignal("Player"):Connect(function()
			-- upvalues: AudioDeviceInput (copy), Player1 (ref), t (upval), t1 (upval), log (upval), trackDevice (upval)
			local Player = Player1
			
			if Player then
				local Entry = t[Player]
				
				if Entry then
					Entry[AudioDeviceInput] = nil
				end
			end
			local Entry1 = t1[AudioDeviceInput]
			
			if Entry1 then
				Entry1.onPlayerChanged:Disconnect()
				t1[AudioDeviceInput] = nil
			else
				log("Attempting to remove connections from untracked AudioDeviceInput")
			end
			Player1 = AudioDeviceInput.Player
			trackDevice(AudioDeviceInput)
		end)
	}
	AudioDeviceInput.Destroying:Connect(function()
		-- upvalues: AudioDeviceInput (copy), t (upval), t1 (upval), log (upval)
		local Player = AudioDeviceInput.Player
		
		if Player then
			local Entry = t[Player]
			
			if Entry then
				Entry[AudioDeviceInput] = nil
			end
		end
		local Entry1 = t1[AudioDeviceInput]
		
		if Entry1 then
			Entry1.onPlayerChanged:Disconnect()
			t1[AudioDeviceInput] = nil
			
			return
		else
			log("Attempting to remove connections from untracked AudioDeviceInput")
		end
	end)
end

local function createAudioDevice(Player: Player)
	-- upvalues: VoiceChatService (copy), log (copy), trackDevice (copy), addEmitterToHead (copy), CharacterAddedConnections (copy)
	local Success, Result = pcall(function()
		-- upvalues: VoiceChatService (upval), Player (copy)
		return VoiceChatService:IsVoiceEnabledForUserIdAsync(Player.UserId)
	end)
	
	if not Success then
		log("Error getting voice enabled status: \"", Result, "\"")
	end
	if not Success or not Result then return end
	local AudioDeviceInput = Instance.new("AudioDeviceInput")
	AudioDeviceInput.Player = Player
	AudioDeviceInput.Parent = Player
	AudioDeviceInput.Active = false
	trackDevice(AudioDeviceInput)
	
	if Player.Character then
		local Character = Player.Character
		local AddEmitterToHeadResult = addEmitterToHead(Character)
		log("Hooking input device to emitter", Character, AudioDeviceInput, AddEmitterToHeadResult)
		local Wire = Instance.new("Wire")
		Wire.Parent = AddEmitterToHeadResult
		Wire.SourceInstance = AudioDeviceInput
		Wire.TargetInstance = AddEmitterToHeadResult
	end
	CharacterAddedConnections[Player] = Player.CharacterAdded:Connect(function(Character)
		-- upvalues: AudioDeviceInput (copy), addEmitterToHead (upval), log (upval)
		local AddEmitterToHeadResult = addEmitterToHead(Character)
		log("Hooking input device to emitter", Character, AudioDeviceInput, AddEmitterToHeadResult)
		local Wire = Instance.new("Wire")
		Wire.Parent = AddEmitterToHeadResult
		Wire.SourceInstance = AudioDeviceInput
		Wire.TargetInstance = AddEmitterToHeadResult
	end)
	log("Creating device for ", Player.Name)
end

if VoiceChatService.UseNewAudioApi then
	log("Using new Audio API, EnableDefaultVoice: ", VoiceChatService.EnableDefaultVoice)
	
	if VoiceChatService.EnableDefaultVoice then
		local Players = game:GetService("Players")
		Players.PlayerAdded:Connect(createAudioDevice)
		Players.PlayerRemoving:Connect(function(Player)
			-- upvalues: t (copy), CharacterAddedConnections (copy), log (copy)
			local Entry = t[Player]
			local CharacterAddedConnection = CharacterAddedConnections[Player]
			log(Player.Name, "removed. Deleting instance", Entry)
			
			if Entry then
				t[Player] = nil
			end
			if CharacterAddedConnection then
				CharacterAddedConnection:Disconnect()
			end
		end)
		
		for _, player in Players:GetPlayers() do
			createAudioDevice(player)
		end
	end
	local SetUserActive = Instance.new("RemoteEvent")
	SetUserActive.Name = "SetUserActive"
	SetUserActive.Parent = RobloxReplicatedStorage
	
	if AudioInstanceAddedApiEnabledEngineFeature then
		SoundService.AudioInstanceAdded:Connect(function(AudioDeviceInput)
			-- upvalues: FFlagExpChatDictation (copy), CoreGui (copy), trackDevice (copy)
			if AudioDeviceInput:IsA("AudioDeviceInput") then
				if FFlagExpChatDictation and AudioDeviceInput:IsDescendantOf(CoreGui) then return end
				AudioDeviceInput.Active = false
				trackDevice(AudioDeviceInput)
			end
		end)
	else
		game.DescendantAdded:Connect(function(Descendant)
			-- upvalues: FFlagExpChatDictation (copy), CoreGui (copy), trackDevice (copy)
			if Descendant:IsA("AudioDeviceInput") then
				if FFlagExpChatDictation and Descendant:IsDescendantOf(CoreGui) then return end
				Descendant.Active = false
				trackDevice(Descendant)
			end
		end)
	end
	for _, audioInstance in SoundService:GetAudioInstances() do
		if audioInstance:IsA("AudioDeviceInput") and (not FFlagExpChatDictation or not audioInstance:IsDescendantOf(CoreGui)) then
			audioInstance.Active = false
			trackDevice(audioInstance)
		end
	end
	SetUserActive.OnServerEvent:Connect(function(Player, Active)
		-- upvalues: t (copy), log (copy)
		local Entry = t[Player]
		
		if not Entry then
			log("Attempting to set Active property for user", Player, "without saved AudioDeviceInput")
			
			return
		end
		log("Setting", Player, "to", Active)
		
		for i, _ in Entry do
			i.Active = Active
		end
	end)
end