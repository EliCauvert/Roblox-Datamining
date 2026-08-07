local playersService = game:GetService("Players")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local default = require(game:GetService("CorePackages").Workspace.Packages.LoggingProtocol).default
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local faceAnimatorService = game:GetService("FaceAnimatorService")
local getFIntFacialAnimationStreamingHeartbeatStatsIntervalSecModule = require(robloxGui.Modules.Flags.GetFIntFacialAnimationStreamingHeartbeatStatsIntervalSec)
local rbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local avatarChatHeartbeatStatsModule = require(script.Parent.RobloxTelemetryConfigs.AvatarChatHeartbeatStats)
local t = {}
local var8 = false
local t_1 = { None = 0, AudioOnly = 1, VideoOnly = 2, AudioVideo = 3 }
local none = t_1.None
local t_2 = {}
local var11 = nil
local t_3 = {}
local _ = {
	VideoAnimationEnabled = "videoAnimationEnabled",
	AudioAnimationEnabled = "audioAnimationEnabled"
}

local function _() --[[ line: 41 | named "updateTrackingTimes" ]]
	-- upvalues: var11 (write), t_2 (ref), none (write)
	local processTime = os.clock()
	local _ = 0
	
	if var11 then
		t_2[none] += processTime - var11
	end
	var11 = processTime
end

local function reportHeartbeat() --[[ line: 52 ]]
	-- upvalues: rbxAnalyticsService (ref), playersService (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), none (write), var11 (write), t_2 (ref), default (ref), avatarChatHeartbeatStatsModule (ref)
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
	
	if var11 then
		t_2[none] += processTime - var11
	end
	var11 = processTime
	
	for i, v in t_2 do
		t[tostring(i)] = v
		t_2[i] = 0
	end
	default:logRobloxTelemetryEvent(avatarChatHeartbeatStatsModule, nil, t)
end

local _ = function() --[[ line: 76 | named "startHeartbeat" ]]
	-- upvalues: getFIntFacialAnimationStreamingHeartbeatStatsIntervalSecModule (ref), var8 (write), reportHeartbeat (ref)
	local var17 = getFIntFacialAnimationStreamingHeartbeatStatsIntervalSecModule()
	
	if var17 > 0 and not var8 then
		var8 = true
		task.spawn(function() --[[ line: 80 ]]
			-- upvalues: var8 (copy), reportHeartbeat (copy), var17 (ref)
			while var8 do
				reportHeartbeat()
				task.wait(var17)
			end
			var8 = false
		end)
	end
end

local _ = function() --[[ line: 90 | named "updateTrackingMode" ]]
	-- upvalues: var11 (write), t_2 (ref), none (write), faceAnimatorService (ref), t_1 (ref)
	local processTime = os.clock()
	local _ = 0
	
	if var11 then
		t_2[none] += processTime - var11
	end
	var11 = processTime
	
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

function t.Initialize() --[[ line: 104 ]]
	-- upvalues: getFIntFacialAnimationStreamingHeartbeatStatsIntervalSecModule (ref), t_1 (ref), t_2 (ref), t_3 (ref), faceAnimatorService (ref), var11 (write), none (write), var8 (write), reportHeartbeat (ref)
	if getFIntFacialAnimationStreamingHeartbeatStatsIntervalSecModule() <= 0 then return end
	for i, v in t_1 do
		t_2[v] = 0
	end
	t_3.videoAnimationEnabled = faceAnimatorService:GetPropertyChangedSignal("VideoAnimationEnabled"):Connect(function() --[[ line: 113 ]]
		-- upvalues: var11 (copy), t_2 (copy), none (copy), faceAnimatorService (copy), t_1 (copy)
		local processTime = os.clock()
		local _ = 0
		
		if var11 then
			t_2[none] += processTime - var11
		end
		var11 = processTime
		
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
	t_3.audioAnimationEnabled = faceAnimatorService:GetPropertyChangedSignal("AudioAnimationEnabled"):Connect(function() --[[ line: 117 ]]
		-- upvalues: var11 (copy), t_2 (copy), none (copy), faceAnimatorService (copy), t_1 (copy)
		local processTime = os.clock()
		local _ = 0
		
		if var11 then
			t_2[none] += processTime - var11
		end
		var11 = processTime
		
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
	
	if var11 then
		t_2[none] += processTime - var11
	end
	var11 = processTime
	none = if faceAnimatorService.VideoAnimationEnabled and faceAnimatorService.AudioAnimationEnabled then t_1.AudioVideo elseif faceAnimatorService.VideoAnimationEnabled then t_1.VideoOnly elseif faceAnimatorService.AudioAnimationEnabled then t_1.AudioOnly else t_1.None
	local var20 = getFIntFacialAnimationStreamingHeartbeatStatsIntervalSecModule()
	
	if var20 > 0 and not var8 then
		var8 = true
		task.spawn(function() --[[ line: 80 ]]
			-- upvalues: var8 (copy), reportHeartbeat (copy), var20 (ref)
			while true do
				while var8 do
					reportHeartbeat()
					task.wait(var20)
				end
				var8 = false
			end
		end)
	end
end

function t.Cleanup() --[[ line: 125 ]]
	-- upvalues: getFIntFacialAnimationStreamingHeartbeatStatsIntervalSecModule (ref), t_3 (ref), var8 (write)
	if getFIntFacialAnimationStreamingHeartbeatStatsIntervalSecModule() <= 0 then return end
	for i, v in pairs(t_3) do
		if v then
			v:Disconnect()
		end
	end
	table.clear(t_3)
	var8 = false
end

return t