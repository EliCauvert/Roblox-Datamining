local runService = game:GetService("RunService")
local robloxGui = game:GetService("CoreGui").RobloxGui
local parent = script.Parent.Parent
local cryoModule = require(parent.Cryo)
local soundManager = require(parent.Lumberyak).Logger.new(nil, "SoundManager")
local soundsModule = require(script.Parent.Sounds)
local soundEffectsModule = require(script.Parent.SoundEffects)
local soundGroupsModule = require(script.Parent.SoundGroups)
local t = {}
t.__index = t
local t_1 = {
	Looped = false,
	PlaybackSpeed = 1,
	Volume = 1,
	FadeInTime = nil,
	FadeOutTime = nil,
	SoundEffects = nil
}
local t_2 = {}

local function fadeVolume(p1, p2, p3, p4)
	-- upvalues: t_2 (ref), runService (ref)
	if p2 < 0 then
		error(p4 .. " cannot have a negative fadeIn/fadeOut time.")
	end
	local var1 = (p3 - p1.Volume) / p2
	
	local function onHeartBeat(p5)
		-- upvalues: var1 (ref), p1 (ref), t_2 (copy), p3 (ref)
		local var2 = p1.Volume + var1 * p5
		
		if var2 <= 0 then
			p1.Volume = 0
			p1:Stop()
			t_2[p1.SoundId]:Disconnect()
			
			return
		elseif p3 <= var2 then
			p1.Volume = p3
			t_2[p1.SoundId]:Disconnect()
			
			return
		end
		p1.Volume = var2
	end
	
	if t_2[p1.SoundId] and t_2[p1.SoundId].Connected then
		t_2[p1.SoundId]:Disconnect()
	end
	t_2[p1.SoundId] = runService.Heartbeat:Connect(onHeartBeat)
end

function t._createSoundEffect(_, p1, p2, p3, p4)
	-- upvalues: soundEffectsModule (ref)
	if not soundEffectsModule[p1] then
		error(p1 .. " does not exist in list of SoundEffects")
	end
	local var1 = Instance.new(p1)
	
	for i, v in pairs(p3) do
		var1[i] = v
	end
	var1.Parent = p4
	var1.Name = p2
end

function t.PlaySound(p5, p6, p7, p8)
	-- upvalues: robloxGui (ref), soundsModule (ref), cryoModule (ref), t_1 (ref), fadeVolume (ref)
	local soundManagerSounds = robloxGui:FindFirstChild("SoundManager_Sounds")
	
	if not soundManagerSounds then
		error("SoundManager's Sounds folder is missing. SoundManager has not been initialized.")
	end
	local var2 = soundsModule[p6]
	
	if not var2 then
		error(p6 .. " does not exist in library of Sounds")
		
		return
	end
	local var3 = cryoModule.Dictionary.join(t_1, var2.DefaultPlaybackProperties or {}, p7 or {})
	local name = soundManagerSounds:FindFirstChild(var2.Name)
	
	if not name then
		name = Instance.new("Sound")
		name.Parent = soundManagerSounds
		name.SoundId = var2.SoundId
		name.Name = var2.Name
	end
	for i, v in pairs(name:GetChildren()) do
		v:Destroy()
	end
	if p8 then
		name.SoundGroup = robloxGui:FindFirstChild("SoundManager_SoundGroups"):FindFirstChild(p8.Name)
	end
	for i_1, v_1 in pairs(var3) do
		if i_1 ~= "FadeInTime" and i_1 ~= "FadeOutTime" and i_1 ~= "Effects" then
			name[i_1] = v_1
		end
	end
	for i_2, v_2 in ipairs(var3.SoundEffects or {}) do
		p5:_createSoundEffect(v_2.Type, v_2.Name, v_2.Properties, name)
	end
	if var3.FadeInTime then
		name.Volume = 0
		fadeVolume(name, var3.FadeInTime, var3.Volume, p6)
	end
	name:Play()
end

function t.StopSound(_, p9)
	-- upvalues: robloxGui (ref), soundsModule (ref), fadeVolume (ref)
	local soundManagerSounds = robloxGui:FindFirstChild("SoundManager_Sounds")
	
	if not soundManagerSounds then
		error("SoundManager's Sounds folder is missing. SoundManager has not been initialized.")
	end
	local var4 = soundsModule[p9]
	
	if not var4 then
		error(p9 .. " does not exist in list of Sounds")
		
		return
	end
	local name = soundManagerSounds:FindFirstChild(var4.Name)
	
	if not name then
		error(p9 .. " does not exist")
		
		return
	end
	local defaultPlaybackProperties = var4.DefaultPlaybackProperties
	local var5 = if defaultPlaybackProperties then defaultPlaybackProperties.FadeOutTime else nil
	
	if var5 then
		fadeVolume(name, var5, 0, p9)
		
		return
	end
	name:Stop()
end

function t.CreateSoundGroup(p9, p10)
	-- upvalues: soundGroupsModule (ref), robloxGui (ref)
	local var4 = soundGroupsModule[p10]
	
	if not var4 then
		error("SoundGroup does not exist in list of SoundGroups")
		
		return
	end
	local soundManagerSoundGroups = robloxGui:FindFirstChild("SoundManager_SoundGroups")
	
	if not soundManagerSoundGroups then
		error("SoundManager's SoundGroups folder is missing. SoundManager has not been initialized.")
		
		return
	elseif soundManagerSoundGroups:FindFirstChild(p10) then
		warn("SoundGroup already exists")
		
		return
	end
	local soundGroup = Instance.new("SoundGroup")
	soundGroup.Name = var4.Name
	soundGroup.Parent = soundManagerSoundGroups
	soundGroup.Volume = var4.Volume
	
	for i, v in ipairs(var4.SoundEffects) do
		p9:_createSoundEffect(v.Type, v.Name, v.Properties, soundGroup)
	end
end

function t.SoundGroupAddSoundEffect(p11, p12, p13)
	-- upvalues: soundGroupsModule (ref), robloxGui (ref)
	if not soundGroupsModule[p12] then
		error("SoundGroup does not exist in list of SoundGroups")
		
		return
	end
	local soundManagerSoundGroups = robloxGui:FindFirstChild("SoundManager_SoundGroups")
	
	if not soundManagerSoundGroups then
		error("SoundManager's SoundGroups folder is missing. SoundManager has not been initialized.")
		
		return
	end
	local var5 = soundManagerSoundGroups:FindFirstChild(p12)
	
	if not var5 then
		error("SoundGroup Instance not created")
		
		return
	elseif var5:FindFirstChild(p13.Name) then
		error("SoundEffect with name " .. p18.Name .. " already exists for sound group " .. p17)
		
		return
	end
	p11:_createSoundEffect(p13.Type, p13.Name, p13.Properties, var5)
end

function t.SoundGroupRemoveSoundEffect(_, p11, p12)
	-- upvalues: soundGroupsModule (ref), robloxGui (ref)
	local var5 = soundGroupsModule[p11]
	
	if not var5 then
		error("SoundGroup does not exist in list of SoundGroups")
		
		return
	end
	local soundManagerSoundGroups = robloxGui:FindFirstChild("SoundManager_SoundGroups")
	
	if not soundManagerSoundGroups then
		error("SoundManager's SoundGroups folder is missing. SoundManager has not been initialized.")
		
		return
	end
	local var6 = soundManagerSoundGroups:FindFirstChild(p11)
	
	if not var6 then
		error("SoundGroup Instance not created")
		
		return
	end
	local var7 = var6:FindFirstChild(p12)
	
	if not var7 then
		error(p12 .. " not found in " .. var27.Name)
	end
	var7:Destroy()
end

function t.init()
	-- upvalues: t (ref), robloxGui (ref), soundManager (ref)
	local tbl = setmetatable({}, t)
	
	if robloxGui:FindFirstChild("SoundManager_Sounds") then
		soundManager:warning("SoundManager already initialized")
		
		return tbl
	end
	local soundManagerSounds = Instance.new("Folder")
	soundManagerSounds.Name = "SoundManager_Sounds"
	soundManagerSounds.Parent = robloxGui
	local soundManagerSoundGroups = Instance.new("Folder")
	soundManagerSoundGroups.Name = "SoundManager_SoundGroups"
	soundManagerSoundGroups.Parent = robloxGui
	
	return tbl
end

return t