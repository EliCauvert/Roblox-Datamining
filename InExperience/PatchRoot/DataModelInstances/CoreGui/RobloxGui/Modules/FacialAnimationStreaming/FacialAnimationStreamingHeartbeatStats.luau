local playersService = game:GetService("Players")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local default = require(game:GetService("CorePackages").Workspace.Packages.LoggingProtocol).default
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local faceAnimatorService = game:GetService("FaceAnimatorService")
local getFIntFacialAnimationStreamingHeartbeatStatsIntervalSecModule = require(robloxGui.Modules.Flags.GetFIntFacialAnimationStreamingHeartbeatStatsIntervalSec)
local rbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local avatarChatHeartbeatStatsModule = require(script.Parent.RobloxTelemetryConfigs.AvatarChatHeartbeatStats)
local t = {}
local var1 = false
local t_1 = { None = 0, AudioOnly = 1, VideoOnly = 2, AudioVideo = 3 }
local none = t_1.None
local t_2 = {}
local var2 = nil
local t_3 = {}
local _ = {
	VideoAnimationEnabled = "videoAnimationEnabled",
	AudioAnimationEnabled = "audioAnimationEnabled"
}

local function _()
	-- upvalues: var2 (write), t_2 (ref), none (write)
	local processTime = os.clock()
	local _ = 0
	
	if var2 then
		t_2[none] += processTime - var2
	end
	var2 = processTime
end

local function reportHeartbeat()
	-- upvalues: rbxAnalyticsService (ref), playersService (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), none (write), var2 (write), t_2 (ref), default (ref), avatarChatHeartbeatStatsModule (ref)
	local t = {
		pid = tostring(game.PlaceId),
		sessionid = rbxAnalyticsService:GetSessionId(),
		userid = tostring(playersService.LocalPlayer.UserId),
		universeid = tostring(game.GameId)
	}
	
	if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then
		t.playSessionId = rbxAnalyticsService:GetPlaySessionId()
	end
	t.trackingMode = none
	local processTime = os.clock()
	local _ = 0
	
	if var2 then
		t_2[none] += processTime - var2
	end
	var2 = processTime
	
	for i, v in t_2 do
		t[tostring(i)] = v
		t_2[i] = 0
	end
	default:logRobloxTelemetryEvent(avatarChatHeartbeatStatsModule, nil, t)
end

local _ = function()
	-- upvalues: getFIntFacialAnimationStreamingHeartbeatStatsIntervalSecModule (ref), var1 (write), reportHeartbeat (ref)
	local var3 = getFIntFacialAnimationStreamingHeartbeatStatsIntervalSecModule()
	
	if var3 > 0 and not var1 then
		var1 = true
		task.spawn(function()
			-- upvalues: var1 (copy), reportHeartbeat (copy), var3 (ref)
			while var1 do
				reportHeartbeat()
				task.wait(var3)
			end
			var1 = false
		end)
	end
end

local _ = function()
	-- upvalues: var2 (write), t_2 (ref), none (write), faceAnimatorService (ref), t_1 (ref)
	local processTime = os.clock()
	local _ = 0
	
	if var2 then
		t_2[none] += processTime - var2
	end
	var2 = processTime
	
	if faceAnimatorService.VideoAnimationEnabled and faceAnimatorService.AudioAnimationEnabled then
		none = t_1.AudioVideo
		
		return
	elseif faceAnimatorService.VideoAnimationEnabled then
		none = t_1.VideoOnly
		
		return
	elseif faceAnimatorService.AudioAnimationEnabled then
		none = t_1.AudioOnly
		
		return
	end
	none = t_1.None
end

function t.Initialize()
	-- upvalues: getFIntFacialAnimationStreamingHeartbeatStatsIntervalSecModule (ref), t_1 (ref), t_2 (ref), t_3 (ref), faceAnimatorService (ref), var2 (write), none (write), var1 (write), reportHeartbeat (ref)
	if getFIntFacialAnimationStreamingHeartbeatStatsIntervalSecModule() <= 0 then return end
	for i, v in t_1 do
		t_2[v] = 0
	end
	t_3.videoAnimationEnabled = faceAnimatorService:GetPropertyChangedSignal("VideoAnimationEnabled"):Connect(function()
		-- upvalues: var2 (copy), t_2 (copy), none (copy), faceAnimatorService (copy), t_1 (copy)
		local processTime = os.clock()
		local _ = 0
		
		if var2 then
			t_2[none] += processTime - var2
		end
		var2 = processTime
		
		if faceAnimatorService.VideoAnimationEnabled and faceAnimatorService.AudioAnimationEnabled then
			none = t_1.AudioVideo
			
			return
		elseif faceAnimatorService.VideoAnimationEnabled then
			none = t_1.VideoOnly
			
			return
		elseif faceAnimatorService.AudioAnimationEnabled then
			none = t_1.AudioOnly
			
			return
		end
		none = t_1.None
	end)
	t_3.audioAnimationEnabled = faceAnimatorService:GetPropertyChangedSignal("AudioAnimationEnabled"):Connect(function()
		-- upvalues: var2 (copy), t_2 (copy), none (copy), faceAnimatorService (copy), t_1 (copy)
		local processTime = os.clock()
		local _ = 0
		
		if var2 then
			t_2[none] += processTime - var2
		end
		var2 = processTime
		
		if faceAnimatorService.VideoAnimationEnabled and faceAnimatorService.AudioAnimationEnabled then
			none = t_1.AudioVideo
			
			return
		elseif faceAnimatorService.VideoAnimationEnabled then
			none = t_1.VideoOnly
			
			return
		elseif faceAnimatorService.AudioAnimationEnabled then
			none = t_1.AudioOnly
			
			return
		end
		none = t_1.None
	end)
	local processTime = os.clock()
	local _ = 0
	
	if var2 then
		t_2[none] += processTime - var2
	end
	var2 = processTime
	none = if faceAnimatorService.VideoAnimationEnabled and faceAnimatorService.AudioAnimationEnabled then t_1.AudioVideo elseif faceAnimatorService.VideoAnimationEnabled then t_1.VideoOnly elseif faceAnimatorService.AudioAnimationEnabled then t_1.AudioOnly else t_1.None
	local var4 = getFIntFacialAnimationStreamingHeartbeatStatsIntervalSecModule()
	
	if var4 > 0 and not var1 then
		var1 = true
		task.spawn(function()
			-- upvalues: var1 (copy), reportHeartbeat (copy), var4 (ref)
			while true do
				while var1 do
					reportHeartbeat()
					task.wait(var4)
				end
				var1 = false
			end
		end)
	end
end

function t.Cleanup()
	-- upvalues: getFIntFacialAnimationStreamingHeartbeatStatsIntervalSecModule (ref), t_3 (ref), var1 (write)
	if getFIntFacialAnimationStreamingHeartbeatStatsIntervalSecModule() <= 0 then return end
	for i, v in pairs(t_3) do
		if v then
			v:Disconnect()
		end
	end
	table.clear(t_3)
	var1 = false
end

return t