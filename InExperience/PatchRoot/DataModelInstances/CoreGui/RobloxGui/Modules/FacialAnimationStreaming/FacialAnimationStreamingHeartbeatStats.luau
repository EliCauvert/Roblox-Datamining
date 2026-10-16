local Players = game:GetService("Players")
local Default = require(game:GetService("CorePackages").Workspace.Packages.LoggingProtocol).default
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local FaceAnimatorService = game:GetService("FaceAnimatorService")
local GetFIntFacialAnimationStreamingHeartbeatStatsIntervalSecModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Flags.GetFIntFacialAnimationStreamingHeartbeatStatsIntervalSec)
local RbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local AvatarChatHeartbeatStatsModule = require(script.Parent.RobloxTelemetryConfigs.AvatarChatHeartbeatStats)
local Flag = false
local config = { None = 0, AudioOnly = 1, VideoOnly = 2, AudioVideo = 3 }
local None = config.None
local t = {}
local v1 = nil
local Tbl = {}

local function _() --[[ Line: 41 | Named "updateTrackingTimes" ]]
	-- upvalues: v1 (ref), t (copy), None (ref)
	local ClockTime = os.clock()
	
	if v1 then
		local None1 = None
		t[None1] += ClockTime - v1
	end
	v1 = ClockTime
end

local function reportHeartbeat() --[[ Line: 52 ]]
	-- upvalues: RbxAnalyticsService (copy), Players (copy), RbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), None (ref), v1 (ref), t (copy), Default (copy), AvatarChatHeartbeatStatsModule (copy)
	local config = {
		pid = tostring(game.PlaceId),
		sessionid = RbxAnalyticsService:GetSessionId(),
		userid = tostring(Players.LocalPlayer.UserId),
		universeid = tostring(game.GameId)
	}
	
	if RbxAnalyticsServiceExposePlaySessionIdEngineFeature then
		config.playSessionId = RbxAnalyticsService:GetPlaySessionId()
	end
	config.trackingMode = None
	local ClockTime = os.clock()
	
	if v1 then
		local None1 = None
		t[None1] += ClockTime - v1
	end
	v1 = ClockTime
	
	for i, value in t do
		config[tostring(i)] = value
		t[i] = 0
	end
	Default:logRobloxTelemetryEvent(AvatarChatHeartbeatStatsModule, nil, config)
end

local _ = function() --[[ Line: 76 | Named "startHeartbeat" ]]
	-- upvalues: GetFIntFacialAnimationStreamingHeartbeatStatsIntervalSecModule (copy), Flag (ref), reportHeartbeat (copy)
	local FIntFacialAnimationStreamingHeartbeatStatsIntervalSecModule: number = GetFIntFacialAnimationStreamingHeartbeatStatsIntervalSecModule()
	
	if FIntFacialAnimationStreamingHeartbeatStatsIntervalSecModule > 0 and not Flag then
		Flag = true
		task.spawn(function() --[[ Line: 80 ]]
			-- upvalues: Flag (upval), reportHeartbeat (upval), FIntFacialAnimationStreamingHeartbeatStatsIntervalSecModule (copy)
			while Flag do
				reportHeartbeat()
				task.wait(FIntFacialAnimationStreamingHeartbeatStatsIntervalSecModule)
			end
			Flag = false
		end)
	end
end

local _ = function() --[[ Line: 90 | Named "updateTrackingMode" ]]
	-- upvalues: v1 (ref), t (copy), None (ref), FaceAnimatorService (copy), config (copy)
	local ClockTime = os.clock()
	
	if v1 then
		local None1 = None
		t[None1] += ClockTime - v1
	end
	v1 = ClockTime
	
	if FaceAnimatorService.VideoAnimationEnabled and FaceAnimatorService.AudioAnimationEnabled then
		None = config.AudioVideo
		
		return
	end
	if FaceAnimatorService.VideoAnimationEnabled then
		None = config.VideoOnly
		
		return
	end
	if FaceAnimatorService.AudioAnimationEnabled then
		None = config.AudioOnly
		
		return
	else
		None = config.None
	end
end

return {
	Initialize = function() --[[ Line: 104 ]]
		-- upvalues: GetFIntFacialAnimationStreamingHeartbeatStatsIntervalSecModule (copy), config (copy), t (copy), Tbl (copy), FaceAnimatorService (copy), v1 (ref), None (ref), Flag (ref), reportHeartbeat (copy)
		if GetFIntFacialAnimationStreamingHeartbeatStatsIntervalSecModule() <= 0 then return end
		for _, value in config do
			t[value] = 0
		end
		Tbl.videoAnimationEnabled = FaceAnimatorService:GetPropertyChangedSignal("VideoAnimationEnabled"):Connect(function() --[[ Line: 113 ]]
			-- upvalues: v1 (upval), t (upval), None (upval), FaceAnimatorService (upval), config (upval)
			local ClockTime = os.clock()
			
			if v1 then
				local None1 = None
				t[None1] += ClockTime - v1
			end
			v1 = ClockTime
			
			if FaceAnimatorService.VideoAnimationEnabled and FaceAnimatorService.AudioAnimationEnabled then
				None = config.AudioVideo
				
				return
			end
			if FaceAnimatorService.VideoAnimationEnabled then
				None = config.VideoOnly
				
				return
			end
			if FaceAnimatorService.AudioAnimationEnabled then
				None = config.AudioOnly
				
				return
			else
				None = config.None
			end
		end)
		Tbl.audioAnimationEnabled = FaceAnimatorService:GetPropertyChangedSignal("AudioAnimationEnabled"):Connect(function() --[[ Line: 117 ]]
			-- upvalues: v1 (upval), t (upval), None (upval), FaceAnimatorService (upval), config (upval)
			local ClockTime = os.clock()
			
			if v1 then
				local None1 = None
				t[None1] += ClockTime - v1
			end
			v1 = ClockTime
			
			if FaceAnimatorService.VideoAnimationEnabled and FaceAnimatorService.AudioAnimationEnabled then
				None = config.AudioVideo
				
				return
			end
			if FaceAnimatorService.VideoAnimationEnabled then
				None = config.VideoOnly
				
				return
			end
			if FaceAnimatorService.AudioAnimationEnabled then
				None = config.AudioOnly
				
				return
			else
				None = config.None
			end
		end)
		local ClockTime = os.clock()
		
		if v1 then
			local None1 = None
			t[None1] += ClockTime - v1
		end
		v1 = ClockTime
		None = if FaceAnimatorService.VideoAnimationEnabled and FaceAnimatorService.AudioAnimationEnabled then config.AudioVideo elseif FaceAnimatorService.VideoAnimationEnabled then config.VideoOnly elseif FaceAnimatorService.AudioAnimationEnabled then config.AudioOnly else config.None
		local FIntFacialAnimationStreamingHeartbeatStatsIntervalSecModule: number = GetFIntFacialAnimationStreamingHeartbeatStatsIntervalSecModule()
		
		if FIntFacialAnimationStreamingHeartbeatStatsIntervalSecModule > 0 and not Flag then
			Flag = true
			task.spawn(function() --[[ Line: 80 ]]
				-- upvalues: Flag (upval), reportHeartbeat (upval), FIntFacialAnimationStreamingHeartbeatStatsIntervalSecModule (copy)
				while Flag do
					reportHeartbeat()
					task.wait(FIntFacialAnimationStreamingHeartbeatStatsIntervalSecModule)
				end
				Flag = false
			end)
		end
	end,
	Cleanup = function() --[[ Line: 125 ]]
		-- upvalues: GetFIntFacialAnimationStreamingHeartbeatStatsIntervalSecModule (copy), Tbl (copy), Flag (ref)
		if GetFIntFacialAnimationStreamingHeartbeatStatsIntervalSecModule() <= 0 then return end
		for _, Connection in pairs(Tbl) do
			if Connection then
				Connection:Disconnect()
			end
		end
		table.clear(Tbl)
		Flag = false
	end
}