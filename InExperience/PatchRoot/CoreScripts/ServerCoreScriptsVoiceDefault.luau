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

local function _(p0, p1)
	if p0 == nil then
		return { [p1] = true }
	end
	p0[p1] = true
	
	return p0
end

local function addEmitterToHead(p2)
	-- upvalues: log (ref), voiceChatService (ref), t (ref)
	local audioEmitter = Instance.new("AudioEmitter")
	audioEmitter.Parent = p2
	audioEmitter:AddTag("RbxDefaultVoiceEmitter")
	log("Adding emitter", audioEmitter, " to ", p2)
	
	if voiceChatService.DefaultDistanceAttenuation == Enum.VoiceChatDistanceAttenuationType.Legacy then
		audioEmitter:SetDistanceAttenuation(t)
	end
	return audioEmitter
end

local _ = function(p3, p4)
	-- upvalues: addEmitterToHead (ref), log (ref)
	local var18 = addEmitterToHead(p3)
	log("Hooking input device to emitter", p3, p4, var18)
	local wire = Instance.new("Wire")
	wire.Parent = var18
	wire.SourceInstance = p4
	wire.TargetInstance = var18
end

local _ = function(p5, p6)
	-- upvalues: t_1 (ref), status (ref), log (ref)
	if p6 then
		local var20 = t_1[p6]
		
		if var20 then
			var20[p5] = nil
		end
	end
	local var21 = status[p5]
	
	if var21 then
		var21.onPlayerChanged:Disconnect()
		status[p5] = nil
		
		return
	end
	log("Attempting to remove connections from untracked AudioDeviceInput")
end

local _ = function(value)
	-- upvalues: coreGuiService (ref)
	return value:IsDescendantOf(coreGuiService)
end

local function trackDevice(p7)
	-- upvalues: fFlagExpChatDictation (ref), coreGuiService (ref), t_1 (ref), status (ref), log (ref), trackDevice (ref)
	if fFlagExpChatDictation and p7:IsDescendantOf(coreGuiService) then return end
	local player = p7.Player
	
	if player then
		local t
		local var22 = t_1
		local var23 = t_1[player]
		
		if var23 == nil then
			t = { [p7] = true }
		else
			var23[p7] = true
			t = var23
		end
		var22[player] = t
	end
	local t_2 = {}
	local var26 = player
	t_2.onPlayerChanged = p7:GetPropertyChangedSignal("Player"):Connect(function()
		-- upvalues: p7 (ref), var26 (write), t_1 (copy), status (copy), log (copy), trackDevice (copy)
		if var26 then
			local var27 = t_1[var26]
			
			if var27 then
				var27[p7] = nil
			end
		end
		local var28 = status[p7]
		
		if var28 then
			var28.onPlayerChanged:Disconnect()
			status[p7] = nil
		else
			log("Attempting to remove connections from untracked AudioDeviceInput")
		end
		var26 = p7.Player
		trackDevice(p7)
	end)
	status[p7] = t_2
	p7.Destroying:Connect(function()
		-- upvalues: p7 (ref), t_1 (copy), status (copy), log (copy)
		local player = p7.Player
		
		if player then
			local var29 = t_1[player]
			
			if var29 then
				var29[p7] = nil
			end
		end
		local var30 = status[p7]
		
		if var30 then
			var30.onPlayerChanged:Disconnect()
			status[p7] = nil
			
			return
		end
		log("Attempting to remove connections from untracked AudioDeviceInput")
	end)
end

local function createAudioDevice(p8)
	-- upvalues: voiceChatService (ref), log (ref), trackDevice (ref), addEmitterToHead (ref), t_2 (ref)
	local ok, status = pcall(function()
		-- upvalues: voiceChatService (copy), p8 (ref)
		return voiceChatService:IsVoiceEnabledForUserIdAsync(p8.UserId)
	end)
	
	if not ok then
		log("Error getting voice enabled status: \"", status, "\"")
	end
	if not ok or not status then return end
	local audioDeviceInput = Instance.new("AudioDeviceInput")
	audioDeviceInput.Player = p8
	audioDeviceInput.Parent = p8
	audioDeviceInput.Active = false
	trackDevice(audioDeviceInput)
	
	if p8.Character then
		local character = p8.Character
		local var32 = addEmitterToHead(character)
		log("Hooking input device to emitter", character, audioDeviceInput, var32)
		local wire = Instance.new("Wire")
		wire.Parent = var32
		wire.SourceInstance = audioDeviceInput
		wire.TargetInstance = var32
	end
	t_2[p8] = p8.CharacterAdded:Connect(function(p9)
		-- upvalues: audioDeviceInput (ref), addEmitterToHead (copy), log (copy)
		local var34 = addEmitterToHead(p9)
		log("Hooking input device to emitter", p9, audioDeviceInput, var34)
		local wire = Instance.new("Wire")
		wire.Parent = var34
		wire.SourceInstance = audioDeviceInput
		wire.TargetInstance = var34
	end)
	log("Creating device for ", p8.Name)
end

if voiceChatService.UseNewAudioApi then
	log("Using new Audio API, EnableDefaultVoice: ", voiceChatService.EnableDefaultVoice)
	
	if voiceChatService.EnableDefaultVoice then
		local playersService = game:GetService("Players")
		playersService.PlayerAdded:Connect(createAudioDevice)
		playersService.PlayerRemoving:Connect(function(p10)
			-- upvalues: t_1 (ref), t_2 (ref), log (ref)
			local var36 = t_1[p10]
			local var37 = t_2[p10]
			log(p10.Name, "removed. Deleting instance", var36)
			
			if var36 then
				t_1[p10] = nil
			end
			if var37 then
				var37:Disconnect()
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
		soundService.AudioInstanceAdded:Connect(function(p11)
			-- upvalues: fFlagExpChatDictation (ref), coreGuiService (ref), trackDevice (ref)
			if p11:IsA("AudioDeviceInput") then
				if fFlagExpChatDictation and p11:IsDescendantOf(coreGuiService) then return end
				p11.Active = false
				trackDevice(p11)
			end
		end)
	else
		game.DescendantAdded:Connect(function(p12)
			-- upvalues: fFlagExpChatDictation (ref), coreGuiService (ref), trackDevice (ref)
			if p12:IsA("AudioDeviceInput") then
				if fFlagExpChatDictation and p12:IsDescendantOf(coreGuiService) then return end
				p12.Active = false
				trackDevice(p12)
			end
		end)
	end
	for i_1, v in soundService:GetAudioInstances() do
		if v:IsA("AudioDeviceInput") and (not fFlagExpChatDictation or not v:IsDescendantOf(coreGuiService)) then
			v.Active = false
			trackDevice(v)
		end
	end
	setUserActive.OnServerEvent:Connect(function(p13, p14)
		-- upvalues: t_1 (ref), log (ref)
		local var38 = t_1[p13]
		
		if not var38 then
			log("Attempting to set Active property for user", p13, "without saved AudioDeviceInput")
			
			return
		end
		log("Setting", p13, "to", p14)
		
		for i, v in var38 do
			i.Active = p14
		end
	end)
end