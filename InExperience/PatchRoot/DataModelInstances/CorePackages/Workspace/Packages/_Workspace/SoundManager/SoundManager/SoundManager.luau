local RunService = game:GetService("RunService")
local RobloxGui = game:GetService("CoreGui").RobloxGui
local Parent = script.Parent.Parent
local CryoModule = require(Parent.Cryo)
local SoundManager1 = require(Parent.Lumberyak).Logger.new(nil, "SoundManager")
local SoundsModule = require(script.Parent.Sounds)
local SoundEffectsModule = require(script.Parent.SoundEffects)
local SoundGroupsModule = require(script.Parent.SoundGroups)
local SoundManager = {}
SoundManager.__index = SoundManager
local config = {
	Looped = false,
	PlaybackSpeed = 1,
	Volume = 1,
	FadeInTime = nil,
	FadeOutTime = nil,
	SoundEffects = nil
}
local HeartbeatConnections = {}

local function fadeVolume(Sound: Sound, FadeInTime: number, Volume, Text) --[[ Line: 36 ]]
	-- upvalues: HeartbeatConnections (copy), RunService (copy)
	if FadeInTime < 0 then
		error(Text .. " cannot have a negative fadeIn/fadeOut time.")
	end
	local VolumeRatio = (Volume - Sound.Volume) / FadeInTime
	
	local function onHeartBeat(DeltaTime) --[[ Line: 45 ]]
		-- upvalues: VolumeRatio (copy), Sound (copy), HeartbeatConnections (upval), Volume (copy)
		local NewVolume = Sound.Volume + VolumeRatio * DeltaTime
		
		if NewVolume <= 0 then
			Sound.Volume = 0
			Sound:Stop()
			HeartbeatConnections[Sound.SoundId]:Disconnect()
			
			return
		end
		if Volume <= NewVolume then
			Sound.Volume = Volume
			HeartbeatConnections[Sound.SoundId]:Disconnect()
			
			return
		else
			Sound.Volume = NewVolume
		end
	end
	
	if HeartbeatConnections[Sound.SoundId] and HeartbeatConnections[Sound.SoundId].Connected then
		HeartbeatConnections[Sound.SoundId]:Disconnect()
	end
	HeartbeatConnections[Sound.SoundId] = RunService.Heartbeat:Connect(onHeartBeat)
end

function SoundManager:_createSoundEffect(Type, Name, Properties, Parent) --[[ Line: 76 ]]
	-- upvalues: SoundEffectsModule (copy)
	if not SoundEffectsModule[Type] then
		error(Type .. " does not exist in list of SoundEffects")
	end
	local NewInstance = Instance.new(Type)
	
	for i, property in pairs(Properties) do
		NewInstance[i] = property
	end
	NewInstance.Parent = Parent
	NewInstance.Name = Name
end

function SoundManager.PlaySound(p1, Text, p2, p3) --[[ Line: 107 ]]
	-- upvalues: RobloxGui (copy), SoundsModule (copy), CryoModule (copy), config (copy), fadeVolume (copy)
	local SoundManagerSounds = RobloxGui:FindFirstChild("SoundManager_Sounds")
	
	if not SoundManagerSounds then
		error("SoundManager's Sounds folder is missing. SoundManager has not been initialized.")
	end
	local SoundsModuleEntry = SoundsModule[Text]
	
	if not SoundsModuleEntry then
		error(Text .. " does not exist in library of Sounds")
		
		return
	end
	local JoinResult = CryoModule.Dictionary.join(config, SoundsModuleEntry.DefaultPlaybackProperties or {}, p2 or {})
	local Name = SoundManagerSounds:FindFirstChild(SoundsModuleEntry.Name)
	
	if not Name then
		Name = Instance.new("Sound")
		Name.Parent = SoundManagerSounds
		Name.SoundId = SoundsModuleEntry.SoundId
		Name.Name = SoundsModuleEntry.Name
	end
	for i, child in pairs(Name:GetChildren()) do
		child:Destroy()
	end
	if p3 then
		Name.SoundGroup = RobloxGui:FindFirstChild("SoundManager_SoundGroups"):FindFirstChild(p3.Name)
	end
	for i, value in pairs(JoinResult) do
		if i ~= "FadeInTime" and i ~= "FadeOutTime" and i ~= "Effects" then
			Name[i] = value
		end
	end
	local Iterator = ipairs
	local SoundEffects = JoinResult.SoundEffects or {}
	for _, value1 in Iterator(SoundEffects) do
		p1:_createSoundEffect(value1.Type, value1.Name, value1.Properties, Name)
	end
	if JoinResult.FadeInTime then
		Name.Volume = 0
		fadeVolume(Name, JoinResult.FadeInTime, JoinResult.Volume, Text)
	end
	Name:Play()
end

function SoundManager:StopSound(Text) --[[ Line: 168 ]]
	-- upvalues: RobloxGui (copy), SoundsModule (copy), fadeVolume (copy)
	local SoundManagerSounds = RobloxGui:FindFirstChild("SoundManager_Sounds")
	
	if not SoundManagerSounds then
		error("SoundManager's Sounds folder is missing. SoundManager has not been initialized.")
	end
	local SoundsModuleEntry = SoundsModule[Text]
	
	if not SoundsModuleEntry then
		error(Text .. " does not exist in list of Sounds")
		
		return
	end
	local Name = SoundManagerSounds:FindFirstChild(SoundsModuleEntry.Name)
	
	if not Name then
		error(Text .. " does not exist")
		
		return
	end
	local DefaultPlaybackProperties = SoundsModuleEntry.DefaultPlaybackProperties
	local FadeOutTime = if DefaultPlaybackProperties then DefaultPlaybackProperties.FadeOutTime else nil
	
	if FadeOutTime then
		fadeVolume(Name, FadeOutTime, 0, Text)
		
		return
	else
		Name:Stop()
	end
end

function SoundManager.CreateSoundGroup(p4, ChildName) --[[ Line: 202 ]]
	-- upvalues: SoundGroupsModule (copy), RobloxGui (copy)
	local SoundGroupsModuleEntry = SoundGroupsModule[ChildName]
	
	if not SoundGroupsModuleEntry then
		error("SoundGroup does not exist in list of SoundGroups")
		
		return
	end
	local SoundManagerSoundGroups = RobloxGui:FindFirstChild("SoundManager_SoundGroups")
	
	if not SoundManagerSoundGroups then
		error("SoundManager's SoundGroups folder is missing. SoundManager has not been initialized.")
		
		return
	end
	if SoundManagerSoundGroups:FindFirstChild(ChildName) then
		warn("SoundGroup already exists")
		
		return
	end
	local SoundGroup = Instance.new("SoundGroup")
	SoundGroup.Name = SoundGroupsModuleEntry.Name
	SoundGroup.Parent = SoundManagerSoundGroups
	SoundGroup.Volume = SoundGroupsModuleEntry.Volume
	
	for _, soundEffect in ipairs(SoundGroupsModuleEntry.SoundEffects) do
		p4:_createSoundEffect(soundEffect.Type, soundEffect.Name, soundEffect.Properties, SoundGroup)
	end
end

function SoundManager.SoundGroupAddSoundEffect(p5, ChildName, p6) --[[ Line: 236 ]]
	-- upvalues: SoundGroupsModule (copy), RobloxGui (copy)
	if not SoundGroupsModule[ChildName] then
		error("SoundGroup does not exist in list of SoundGroups")
		
		return
	end
	local SoundManagerSoundGroups = RobloxGui:FindFirstChild("SoundManager_SoundGroups")
	
	if not SoundManagerSoundGroups then
		error("SoundManager's SoundGroups folder is missing. SoundManager has not been initialized.")
		
		return
	end
	local ChildName1 = SoundManagerSoundGroups:FindFirstChild(ChildName)
	
	if not ChildName1 then
		error("SoundGroup Instance not created")
		
		return
	end
	if ChildName1:FindFirstChild(p6.Name) then
		error("SoundEffect with name " .. p6.Name .. " already exists for sound group " .. ChildName)
		
		return
	else
		p5:_createSoundEffect(p6.Type, p6.Name, p6.Properties, ChildName1)
	end
end

function SoundManager:SoundGroupRemoveSoundEffect(ChildName, ChildName1) --[[ Line: 269 ]]
	-- upvalues: SoundGroupsModule (copy), RobloxGui (copy)
	local SoundGroupsModuleEntry = SoundGroupsModule[ChildName]
	
	if not SoundGroupsModuleEntry then
		error("SoundGroup does not exist in list of SoundGroups")
		
		return
	end
	local SoundManagerSoundGroups = RobloxGui:FindFirstChild("SoundManager_SoundGroups")
	
	if not SoundManagerSoundGroups then
		error("SoundManager's SoundGroups folder is missing. SoundManager has not been initialized.")
		
		return
	end
	local ChildName2 = SoundManagerSoundGroups:FindFirstChild(ChildName)
	
	if not ChildName2 then
		error("SoundGroup Instance not created")
		
		return
	end
	local ChildName3 = ChildName2:FindFirstChild(ChildName1)
	
	if not ChildName3 then
		error(ChildName1 .. " not found in " .. SoundGroupsModuleEntry.Name)
	end
	ChildName3:Destroy()
end

function SoundManager.init() --[[ Line: 300 ]]
	-- upvalues: SoundManager (copy), RobloxGui (copy), SoundManager1 (copy)
	local self = setmetatable({}, SoundManager)
	
	if RobloxGui:FindFirstChild("SoundManager_Sounds") then
		SoundManager1:warning("SoundManager already initialized")
		
		return self
	else
		local SoundManager_Sounds = Instance.new("Folder")
		SoundManager_Sounds.Name = "SoundManager_Sounds"
		SoundManager_Sounds.Parent = RobloxGui
		local SoundManager_SoundGroups = Instance.new("Folder")
		SoundManager_SoundGroups.Name = "SoundManager_SoundGroups"
		SoundManager_SoundGroups.Parent = RobloxGui
		
		return self
	end
end

return SoundManager