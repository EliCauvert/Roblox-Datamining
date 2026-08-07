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

local function fadeVolume(p0, p1, p2, p3) --[[ line: 36 ]]
	-- upvalues: t_2 (ref), runService (ref)
	if p1 < 0 then
		error(p3 .. " cannot have a negative fadeIn/fadeOut time.")
	end
	local var10 = (p2 - p0.Volume) / p1
	
	local function onHeartBeat(p4) --[[ line: 45 ]]
		-- upvalues: var10 (ref), p0 (ref), t_2 (copy), p2 (ref)
		local var12 = p0.Volume + var10 * p4
		
		if var12 <= 0 then
			p0.Volume = 0
			p0:Stop()
			t_2[p0.SoundId]:Disconnect()
			
			return
		elseif p2 <= var12 then
			p0.Volume = p2
			t_2[p0.SoundId]:Disconnect()
			
			return
		end
		p0.Volume = var12
	end
	
	if t_2[p0.SoundId] and t_2[p0.SoundId].Connected then
		t_2[p0.SoundId]:Disconnect()
	end
	t_2[p0.SoundId] = runService.Heartbeat:Connect(onHeartBeat)
end

function t._createSoundEffect(_, p5, p6, p7, p8) --[[ line: 76 ]]
	-- upvalues: soundEffectsModule (ref)
	if not soundEffectsModule[p5] then
		error(p5 .. " does not exist in list of SoundEffects")
	end
	local var13 = Instance.new(p5)
	
	for i, v in pairs(p7) do
		var13[i] = v
	end
	var13.Parent = p8
	var13.Name = p6
end

function t.PlaySound(p9, p10, p11, p12) --[[ line: 107 ]]
	-- upvalues: robloxGui (ref), soundsModule (ref), cryoModule (ref), t_1 (ref), fadeVolume (ref)
	local soundManagerSounds = robloxGui:FindFirstChild("SoundManager_Sounds")
	
	if not soundManagerSounds then
		error("SoundManager's Sounds folder is missing. SoundManager has not been initialized.")
	end
	local var15 = soundsModule[p10]
	
	if not var15 then
		error(p10 .. " does not exist in library of Sounds")
		
		return
	end
	local var16 = cryoModule.Dictionary.join(t_1, var15.DefaultPlaybackProperties or {}, p11 or {})
	local name = soundManagerSounds:FindFirstChild(var15.Name)
	
	if not name then
		name = Instance.new("Sound")
		name.Parent = soundManagerSounds
		name.SoundId = var15.SoundId
		name.Name = var15.Name
	end
	for i, v in pairs(name:GetChildren()) do
		v:Destroy()
	end
	if p12 then
		name.SoundGroup = robloxGui:FindFirstChild("SoundManager_SoundGroups"):FindFirstChild(p12.Name)
	end
	for i_1, v_1 in pairs(var16) do
		if i_1 ~= "FadeInTime" and i_1 ~= "FadeOutTime" and i_1 ~= "Effects" then
			name[i_1] = v_1
		end
	end
	for i_2, v_2 in ipairs(var16.SoundEffects or {}) do
		p9:_createSoundEffect(v_2.Type, v_2.Name, v_2.Properties, name)
	end
	if var16.FadeInTime then
		name.Volume = 0
		fadeVolume(name, var16.FadeInTime, var16.Volume, p10)
	end
	name:Play()
end

function t.StopSound(_, p13) --[[ line: 168 ]]
	-- upvalues: robloxGui (ref), soundsModule (ref), fadeVolume (ref)
	local soundManagerSounds = robloxGui:FindFirstChild("SoundManager_Sounds")
	
	if not soundManagerSounds then
		error("SoundManager's Sounds folder is missing. SoundManager has not been initialized.")
	end
	local var19 = soundsModule[p13]
	
	if not var19 then
		error(p13 .. " does not exist in list of Sounds")
		
		return
	end
	local name = soundManagerSounds:FindFirstChild(var19.Name)
	
	if not name then
		error(p13 .. " does not exist")
		
		return
	end
	local defaultPlaybackProperties = var19.DefaultPlaybackProperties
	local var21 = if defaultPlaybackProperties then defaultPlaybackProperties.FadeOutTime else nil
	
	if var21 then
		fadeVolume(name, var21, 0, p13)
		
		return
	end
	name:Stop()
end

function t.CreateSoundGroup(p14, p15) --[[ line: 202 ]]
	-- upvalues: soundGroupsModule (ref), robloxGui (ref)
	local var22 = soundGroupsModule[p15]
	
	if not var22 then
		error("SoundGroup does not exist in list of SoundGroups")
		
		return
	end
	local soundManagerSoundGroups = robloxGui:FindFirstChild("SoundManager_SoundGroups")
	
	if not soundManagerSoundGroups then
		error("SoundManager's SoundGroups folder is missing. SoundManager has not been initialized.")
		
		return
	elseif soundManagerSoundGroups:FindFirstChild(p15) then
		warn("SoundGroup already exists")
		
		return
	end
	local soundGroup = Instance.new("SoundGroup")
	soundGroup.Name = var22.Name
	soundGroup.Parent = soundManagerSoundGroups
	soundGroup.Volume = var22.Volume
	
	for i, v in ipairs(var22.SoundEffects) do
		p14:_createSoundEffect(v.Type, v.Name, v.Properties, soundGroup)
	end
end

function t.SoundGroupAddSoundEffect(p16, p17, p18) --[[ line: 236 ]]
	-- upvalues: soundGroupsModule (ref), robloxGui (ref)
	if not soundGroupsModule[p17] then
		error("SoundGroup does not exist in list of SoundGroups")
		
		return
	end
	local soundManagerSoundGroups = robloxGui:FindFirstChild("SoundManager_SoundGroups")
	
	if not soundManagerSoundGroups then
		error("SoundManager's SoundGroups folder is missing. SoundManager has not been initialized.")
		
		return
	end
	local var26 = soundManagerSoundGroups:FindFirstChild(p17)
	
	if not var26 then
		error("SoundGroup Instance not created")
		
		return
	elseif var26:FindFirstChild(p18.Name) then
		error("SoundEffect with name " .. p18.Name .. " already exists for sound group " .. p17)
		
		return
	end
	p16:_createSoundEffect(p18.Type, p18.Name, p18.Properties, var26)
end

function t.SoundGroupRemoveSoundEffect(_, p19, p20) --[[ line: 269 ]]
	-- upvalues: soundGroupsModule (ref), robloxGui (ref)
	local var27 = soundGroupsModule[p19]
	
	if not var27 then
		error("SoundGroup does not exist in list of SoundGroups")
		
		return
	end
	local soundManagerSoundGroups = robloxGui:FindFirstChild("SoundManager_SoundGroups")
	
	if not soundManagerSoundGroups then
		error("SoundManager's SoundGroups folder is missing. SoundManager has not been initialized.")
		
		return
	end
	local var29 = soundManagerSoundGroups:FindFirstChild(p19)
	
	if not var29 then
		error("SoundGroup Instance not created")
		
		return
	end
	local var30 = var29:FindFirstChild(p20)
	
	if not var30 then
		error(p20 .. " not found in " .. var27.Name)
	end
	var30:Destroy()
end

function t.init() --[[ line: 300 ]]
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