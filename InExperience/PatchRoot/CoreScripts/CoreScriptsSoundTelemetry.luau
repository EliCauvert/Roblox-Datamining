local corePackagesService = game:GetService("CorePackages")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local soundService = game:GetService("SoundService")
local modules = game:GetService("CoreGui"):WaitForChild("RobloxGui"):WaitForChild("Modules")
local getFFlagEnableSoundSessionTelemetryModule = require(modules.Flags.GetFFlagEnableSoundSessionTelemetry)
local getFIntSoundSessionTelemetryThrottleModule = require(modules.Flags.GetFIntSoundSessionTelemetryThrottle)
local rbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local loggingProtocolModule = require(corePackagesService.Workspace.Packages.LoggingProtocol)
local default = loggingProtocolModule.default
local aggregatedDataModule = require(modules.AggregatedData)
local playingSoundsModule = require(modules.PlayingSounds)
local t = {
	eventName = "SoundSessionPlayback",
	description = " Aggregated session-end event of all music playback data ",
	links = "https://roblox.atlassian.net/wiki/spaces/MUS/pages/2065826132/Scaled+Analytics+Tech+Spec",
	backends = { loggingProtocolModule.TelemetryBackends.EventIngest },
	throttlingPercentage = getFIntSoundSessionTelemetryThrottleModule(),
	lastUpdated = { 23, 13, 6 }
}
local t_1 = {}
local var13 = aggregatedDataModule.new()
local var14 = playingSoundsModule.new(var13)

local function logSessionEvent()
	-- upvalues: var13 (ref), rbxAnalyticsService (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), default (ref), t (ref)
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	
	for i, v in pairs(var13) do
		table.insert(t_1, i)
		table.insert(t_2, v.loopcount)
		table.insert(t_3, v.playtime)
	end
	local t_4 = {
		asset_ids = table.concat(t_1, ","),
		loop_counts = table.concat(t_2, ","),
		playback_seconds = table.concat(t_3, ","),
		placeid = tostring(game.PlaceId),
		sessionid = rbxAnalyticsService:GetSessionId(),
		universeid = tostring(game.GameId)
	}
	
	if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then
		t_4.playsessionid = rbxAnalyticsService:GetPlaySessionId()
	end
	default:logRobloxTelemetryEvent(t, nil, t_4)
end

local function aggregateEndSessionData()
	-- upvalues: var14 (ref), logSessionEvent (ref)
	for i, v in pairs(var14.sounds) do
		for i_1, v_1 in pairs(v.instances) do
			var14:removeSound(i, i_1)
		end
	end
	logSessionEvent()
end

local function _(p0)
	-- upvalues: userGameSettingsService (ref)
	return userGameSettingsService.MasterVolume * (if p0.SoundGroup then p0.SoundGroup.Volume else 1) * p0.Volume * p0.RollOffGain > 0.01
end

local _ = function(p1)
	-- upvalues: getFFlagEnableSoundSessionTelemetryModule (ref), userGameSettingsService (ref), var14 (ref)
	if getFFlagEnableSoundSessionTelemetryModule() and userGameSettingsService.MasterVolume * (if p1.SoundGroup then p1.SoundGroup.Volume else 1) * p1.Volume * p1.RollOffGain > 0.01 then
		var14:addSound(p1.SoundId, p1:GetDebugId(10))
	end
end

local _ = function(p2)
	-- upvalues: getFFlagEnableSoundSessionTelemetryModule (ref), var14 (ref)
	if getFFlagEnableSoundSessionTelemetryModule() then
		var14:removeSound(p2.SoundId, p2:GetDebugId(10))
	end
end

local _ = function(p3)
	-- upvalues: getFFlagEnableSoundSessionTelemetryModule (ref), var14 (ref)
	if getFFlagEnableSoundSessionTelemetryModule() then
		var14:removeSound(p3.SoundId, p3:GetDebugId(10))
	end
end

local _ = function(p4)
	-- upvalues: getFFlagEnableSoundSessionTelemetryModule (ref), var14 (ref)
	if getFFlagEnableSoundSessionTelemetryModule() then
		var14:removeSound(p4.SoundId, p4:GetDebugId(10))
	end
end

local _ = function(p5)
	-- upvalues: getFFlagEnableSoundSessionTelemetryModule (ref), userGameSettingsService (ref), var14 (ref)
	if getFFlagEnableSoundSessionTelemetryModule() and userGameSettingsService.MasterVolume * (if p5.SoundGroup then p5.SoundGroup.Volume else 1) * p5.Volume * p5.RollOffGain > 0.01 then
		var14:addSound(p5.SoundId, p5:GetDebugId(10))
	end
end

local _ = function(p6, _)
	-- upvalues: getFFlagEnableSoundSessionTelemetryModule (ref), var14 (ref)
	if getFFlagEnableSoundSessionTelemetryModule() then
		var14:loopSound(p6.SoundId, p6:GetDebugId(10))
	end
end

local function unhookSoundEvents(p7)
	-- upvalues: t_1 (ref), getFFlagEnableSoundSessionTelemetryModule (ref), var14 (ref)
	local var23 = t_1[p7]
	
	if var23 ~= nil then
		for i, v in var23 do
			v:Disconnect()
		end
	end
	if getFFlagEnableSoundSessionTelemetryModule() then
		var14:removeSound(p7.SoundId, p7:GetDebugId(10))
	end
	t_1[p7] = nil
end

local function hookupSoundEvents(p8)
	-- upvalues: getFFlagEnableSoundSessionTelemetryModule (ref), userGameSettingsService (ref), var14 (ref), unhookSoundEvents (ref), t_1 (ref)
	if p8.Playing and getFFlagEnableSoundSessionTelemetryModule() and userGameSettingsService.MasterVolume * (if p8.SoundGroup then p8.SoundGroup.Volume else 1) * p8.Volume * p8.RollOffGain > 0.01 then
		var14:addSound(p8.SoundId, p8:GetDebugId(10))
	end
	t_1[p8] = {
		p8.Played:Connect(function()
			-- upvalues: p8 (ref), getFFlagEnableSoundSessionTelemetryModule (copy), userGameSettingsService (copy), var14 (copy)
			local var24
			if p8.TimeLength == 0 or not p8.IsLoaded then
				var24 = nil
				var24 = p8.Loaded:Connect(function()
					-- upvalues: p8 (copy), getFFlagEnableSoundSessionTelemetryModule (copy), userGameSettingsService (copy), var14 (copy), var24 (write)
					if getFFlagEnableSoundSessionTelemetryModule() and userGameSettingsService.MasterVolume * (if p8.SoundGroup then p8.SoundGroup.Volume else 1) * p8.Volume * p8.RollOffGain > 0.01 then
						var14:addSound(p8.SoundId, p8:GetDebugId(10))
					end
					var24:Disconnect()
				end)
				
				return
			end
			var24 = p8
			
			if getFFlagEnableSoundSessionTelemetryModule() and userGameSettingsService.MasterVolume * (if var24.SoundGroup then var24.SoundGroup.Volume else 1) * var24.Volume * var24.RollOffGain > 0.01 then
				var14:addSound(var24.SoundId, var24:GetDebugId(10))
			end
		end),
		p8.Paused:Connect(function()
			-- upvalues: p8 (ref), getFFlagEnableSoundSessionTelemetryModule (copy), var14 (copy)
			if getFFlagEnableSoundSessionTelemetryModule() then
				var14:removeSound(p8.SoundId, p8:GetDebugId(10))
			end
		end),
		p8.Stopped:Connect(function()
			-- upvalues: p8 (ref), getFFlagEnableSoundSessionTelemetryModule (copy), var14 (copy)
			if getFFlagEnableSoundSessionTelemetryModule() then
				var14:removeSound(p8.SoundId, p8:GetDebugId(10))
			end
		end),
		p8.Ended:Connect(function()
			-- upvalues: p8 (ref), getFFlagEnableSoundSessionTelemetryModule (copy), var14 (copy)
			if getFFlagEnableSoundSessionTelemetryModule() then
				var14:removeSound(p8.SoundId, p8:GetDebugId(10))
			end
		end),
		p8.Resumed:Connect(function()
			-- upvalues: p8 (ref), getFFlagEnableSoundSessionTelemetryModule (copy), userGameSettingsService (copy), var14 (copy)
			if getFFlagEnableSoundSessionTelemetryModule() and userGameSettingsService.MasterVolume * (if p8.SoundGroup then p8.SoundGroup.Volume else 1) * p8.Volume * p8.RollOffGain > 0.01 then
				var14:addSound(p8.SoundId, p8:GetDebugId(10))
			end
		end),
		p8.DidLoop:Connect(function(_, _)
			-- upvalues: p8 (ref), getFFlagEnableSoundSessionTelemetryModule (copy), var14 (copy)
			if getFFlagEnableSoundSessionTelemetryModule() then
				var14:loopSound(p8.SoundId, p8:GetDebugId(10))
			end
		end),
		p8.AncestryChanged:Connect(function(p9, _)
			-- upvalues: unhookSoundEvents (copy), p8 (ref)
			if p9:FindFirstAncestorOfClass("DataModel") == nil then
				unhookSoundEvents(p8)
			end
		end)
	}
end

if getFFlagEnableSoundSessionTelemetryModule() then
	if game:GetEngineFeature("AudioInstanceAddedApiEnabled") then
		soundService.AudioInstanceAdded:Connect(function(p10)
			-- upvalues: t_1 (ref), hookupSoundEvents (ref)
			if p10:IsA("Sound") and not t_1[p10] then
				hookupSoundEvents(p10)
			end
		end)
	end
	game.Close:Connect(function()
		-- upvalues: aggregateEndSessionData (ref)
		aggregateEndSessionData()
	end)
end