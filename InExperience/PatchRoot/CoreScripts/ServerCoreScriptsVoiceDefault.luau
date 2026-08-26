local _ = game:GetService("Players")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local voiceChatService = game:GetService("VoiceChatService")
local soundService = game:GetService("SoundService")
local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local avatarChatService = game:GetService("AvatarChatService")
local getFFlagAvatarChatServiceEnabled = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagAvatarChatServiceEnabled
local debugLogVoiceDefault = game:DefineFastFlag("DebugLogVoiceDefault", false)
local audioInstanceAddedApiEnabledEngineFeature = game:GetEngineFeature("AudioInstanceAddedApiEnabled")
local fFlagExpChatDictation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagExpChatDictation

local function log(...)
	-- upvalues: debugLogVoiceDefault (ref)
	if debugLogVoiceDefault then
		print("[VoiceDefault]", ...)
	end
end

local t = {}

for i = 7, 80, 2 do
	t[i] = (i - 7 - 73) ^ 2 / 5329
end
local status
t[80] = 0

if getFFlagAvatarChatServiceEnabled() then
	ok, status = pcall(avatarChatService.GetServerFeaturesAsync, avatarChatService)
	
	if not ok then
		log("Failed to get GetServerFeaturesAsync, returning early")
		
		return
	elseif not avatarChatService:IsEnabled(status, Enum.AvatarChatServiceFeature.UniverseAudio) or not avatarChatService:IsEnabled(status, Enum.AvatarChatServiceFeature.PlaceAudio) then
		log("Universe or place not voice enabled, returning early")
		
		return
	end
end
local t_1 = {}
status = {}
local t_2 = {}

local function _(p1, p2)
	if p1 == nil then
		return { [p2] = true }
	end
	p1[p2] = true
	
	return p1
end

local function addEmitterToHead(p1)
	-- upvalues: log (ref), voiceChatService (ref), t (ref)
	local audioEmitter = Instance.new("AudioEmitter")
	audioEmitter.Parent = p1
	audioEmitter:AddTag("RbxDefaultVoiceEmitter")
	log("Adding emitter", audioEmitter, " to ", p1)
	
	if voiceChatService.DefaultDistanceAttenuation == Enum.VoiceChatDistanceAttenuationType.Legacy then
		audioEmitter:SetDistanceAttenuation(t)
	end
	return audioEmitter
end

local _ = function(p1, p2)
	-- upvalues: addEmitterToHead (ref), log (ref)
	local var1 = addEmitterToHead(p1)
	log("Hooking input device to emitter", p1, p2, var1)
	local wire = Instance.new("Wire")
	wire.Parent = var1
	wire.SourceInstance = p2
	wire.TargetInstance = var1
end

local _ = function(p1, p2)
	-- upvalues: t_1 (ref), status (ref), log (ref)
	if p2 then
		local var1 = t_1[p2]
		
		if var1 then
			var1[p1] = nil
		end
	end
	local var2 = status[p1]
	
	if var2 then
		var2.onPlayerChanged:Disconnect()
		status[p1] = nil
		
		return
	end
	log("Attempting to remove connections from untracked AudioDeviceInput")
end

local _ = function(value)
	-- upvalues: coreGuiService (ref)
	return value:IsDescendantOf(coreGuiService)
end

local function trackDevice(p1)
	-- upvalues: fFlagExpChatDictation (ref), coreGuiService (ref), t_1 (ref), status (ref), log (ref), trackDevice (ref)
	if fFlagExpChatDictation and p1:IsDescendantOf(coreGuiService) then return end
	local player = p1.Player
	
	if player then
		local t
		local var1 = t_1
		local var2 = t_1[player]
		
		if var2 == nil then
			t = { [p1] = true }
		else
			var2[p1] = true
			t = var2
		end
		var1[player] = t
	end
	local t_2 = {}
	local var3 = player
	t_2.onPlayerChanged = p1:GetPropertyChangedSignal("Player"):Connect(function()
		-- upvalues: p1 (ref), var3 (write), t_1 (copy), status (copy), log (copy), trackDevice (copy)
		if var3 then
			local var4 = t_1[var3]
			
			if var4 then
				var4[p1] = nil
			end
		end
		local var5 = status[p1]
		
		if var5 then
			var5.onPlayerChanged:Disconnect()
			status[p1] = nil
		else
			log("Attempting to remove connections from untracked AudioDeviceInput")
		end
		var3 = p1.Player
		trackDevice(p1)
	end)
	status[p1] = t_2
	p1.Destroying:Connect(function()
		-- upvalues: p1 (ref), t_1 (copy), status (copy), log (copy)
		local player = p1.Player
		
		if player then
			local var4 = t_1[player]
			
			if var4 then
				var4[p1] = nil
			end
		end
		local var5 = status[p1]
		
		if var5 then
			var5.onPlayerChanged:Disconnect()
			status[p1] = nil
			
			return
		end
		log("Attempting to remove connections from untracked AudioDeviceInput")
	end)
end

local function createAudioDevice(p1)
	-- upvalues: voiceChatService (ref), log (ref), trackDevice (ref), addEmitterToHead (ref), t_2 (ref)
	local ok, status = pcall(function()
		-- upvalues: voiceChatService (copy), p1 (ref)
		return voiceChatService:IsVoiceEnabledForUserIdAsync(p1.UserId)
	end)
	
	if not ok then
		log("Error getting voice enabled status: \"", status, "\"")
	end
	if not ok or not status then return end
	local audioDeviceInput = Instance.new("AudioDeviceInput")
	audioDeviceInput.Player = p1
	audioDeviceInput.Parent = p1
	audioDeviceInput.Active = false
	trackDevice(audioDeviceInput)
	
	if p1.Character then
		local character = p1.Character
		local var1 = addEmitterToHead(character)
		log("Hooking input device to emitter", character, audioDeviceInput, var1)
		local wire = Instance.new("Wire")
		wire.Parent = var1
		wire.SourceInstance = audioDeviceInput
		wire.TargetInstance = var1
	end
	t_2[p1] = p1.CharacterAdded:Connect(function(p2)
		-- upvalues: audioDeviceInput (ref), addEmitterToHead (copy), log (copy)
		local var2 = addEmitterToHead(p2)
		log("Hooking input device to emitter", p2, audioDeviceInput, var2)
		local wire = Instance.new("Wire")
		wire.Parent = var2
		wire.SourceInstance = audioDeviceInput
		wire.TargetInstance = var2
	end)
	log("Creating device for ", p1.Name)
end

if voiceChatService.UseNewAudioApi then
	log("Using new Audio API, EnableDefaultVoice: ", voiceChatService.EnableDefaultVoice)
	
	if voiceChatService.EnableDefaultVoice then
		local playersService = game:GetService("Players")
		playersService.PlayerAdded:Connect(createAudioDevice)
		playersService.PlayerRemoving:Connect(function(p1)
			-- upvalues: t_1 (ref), t_2 (ref), log (ref)
			local var1 = t_1[p1]
			local var2 = t_2[p1]
			log(p1.Name, "removed. Deleting instance", var1)
			
			if var1 then
				t_1[p1] = nil
			end
			if var2 then
				var2:Disconnect()
			end
		end)
		
		for i_1, v in playersService:GetPlayers() do
			createAudioDevice(v)
		end
	end
	local setUserActive = Instance.new("RemoteEvent")
	setUserActive.Name = "SetUserActive"
	setUserActive.Parent = robloxReplicatedStorageService
	
	if audioInstanceAddedApiEnabledEngineFeature then
		soundService.AudioInstanceAdded:Connect(function(p1)
			-- upvalues: fFlagExpChatDictation (ref), coreGuiService (ref), trackDevice (ref)
			if p1:IsA("AudioDeviceInput") then
				if fFlagExpChatDictation and p1:IsDescendantOf(coreGuiService) then return end
				p1.Active = false
				trackDevice(p1)
			end
		end)
	else
		game.DescendantAdded:Connect(function(p1)
			-- upvalues: fFlagExpChatDictation (ref), coreGuiService (ref), trackDevice (ref)
			if p1:IsA("AudioDeviceInput") then
				if fFlagExpChatDictation and p1:IsDescendantOf(coreGuiService) then return end
				p1.Active = false
				trackDevice(p1)
			end
		end)
	end
	for i_1, v in soundService:GetAudioInstances() do
		if v:IsA("AudioDeviceInput") and (not fFlagExpChatDictation or not v:IsDescendantOf(coreGuiService)) then
			v.Active = false
			trackDevice(v)
		end
	end
	setUserActive.OnServerEvent:Connect(function(p1, p2)
		-- upvalues: t_1 (ref), log (ref)
		local var1 = t_1[p1]
		
		if not var1 then
			log("Attempting to set Active property for user", p1, "without saved AudioDeviceInput")
			
			return
		end
		log("Setting", p1, "to", p2)
		
		for i, v in var1 do
			i.Active = p2
		end
	end)
end