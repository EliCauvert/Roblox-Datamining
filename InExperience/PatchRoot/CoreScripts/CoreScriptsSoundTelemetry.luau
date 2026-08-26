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
local var1 = aggregatedDataModule.new()
local var2 = playingSoundsModule.new(var1)

local function logSessionEvent()
	-- upvalues: var1 (ref), rbxAnalyticsService (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), default (ref), t (ref)
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	
	for i, v in pairs(var1) do
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
	-- upvalues: var2 (ref), logSessionEvent (ref)
	for i, v in pairs(var2.sounds) do
		for i_1, v_1 in pairs(v.instances) do
			var2:removeSound(i, i_1)
		end
	end
	logSessionEvent()
end

local function _(p1)
	-- upvalues: userGameSettingsService (ref)
	return userGameSettingsService.MasterVolume * (if p1.SoundGroup then p1.SoundGroup.Volume else 1) * p1.Volume * p1.RollOffGain > 0.01
end

local _ = function(p1)
	-- upvalues: getFFlagEnableSoundSessionTelemetryModule (ref), userGameSettingsService (ref), var2 (ref)
	if getFFlagEnableSoundSessionTelemetryModule() and userGameSettingsService.MasterVolume * (if p1.SoundGroup then p1.SoundGroup.Volume else 1) * p1.Volume * p1.RollOffGain > 0.01 then
		var2:addSound(p1.SoundId, p1:GetDebugId(10))
	end
end

local _ = function(p1)
	-- upvalues: getFFlagEnableSoundSessionTelemetryModule (ref), var2 (ref)
	if getFFlagEnableSoundSessionTelemetryModule() then
		var2:removeSound(p1.SoundId, p1:GetDebugId(10))
	end
end

local _ = function(p1)
	-- upvalues: getFFlagEnableSoundSessionTelemetryModule (ref), var2 (ref)
	if getFFlagEnableSoundSessionTelemetryModule() then
		var2:removeSound(p1.SoundId, p1:GetDebugId(10))
	end
end

local _ = function(p1)
	-- upvalues: getFFlagEnableSoundSessionTelemetryModule (ref), var2 (ref)
	if getFFlagEnableSoundSessionTelemetryModule() then
		var2:removeSound(p1.SoundId, p1:GetDebugId(10))
	end
end

local _ = function(p1)
	-- upvalues: getFFlagEnableSoundSessionTelemetryModule (ref), userGameSettingsService (ref), var2 (ref)
	if getFFlagEnableSoundSessionTelemetryModule() and userGameSettingsService.MasterVolume * (if p1.SoundGroup then p1.SoundGroup.Volume else 1) * p1.Volume * p1.RollOffGain > 0.01 then
		var2:addSound(p1.SoundId, p1:GetDebugId(10))
	end
end

local _ = function(p1, _)
	-- upvalues: getFFlagEnableSoundSessionTelemetryModule (ref), var2 (ref)
	if getFFlagEnableSoundSessionTelemetryModule() then
		var2:loopSound(p1.SoundId, p1:GetDebugId(10))
	end
end

local function unhookSoundEvents(p1)
	-- upvalues: t_1 (ref), getFFlagEnableSoundSessionTelemetryModule (ref), var2 (ref)
	local var3 = t_1[p1]
	
	if var3 ~= nil then
		for i, v in var3 do
			v:Disconnect()
		end
	end
	if getFFlagEnableSoundSessionTelemetryModule() then
		var2:removeSound(p1.SoundId, p1:GetDebugId(10))
	end
	t_1[p1] = nil
end

local function hookupSoundEvents(p2)
	-- upvalues: getFFlagEnableSoundSessionTelemetryModule (ref), userGameSettingsService (ref), var2 (ref), unhookSoundEvents (ref), t_1 (ref)
	if p2.Playing and getFFlagEnableSoundSessionTelemetryModule() and userGameSettingsService.MasterVolume * (if p2.SoundGroup then p2.SoundGroup.Volume else 1) * p2.Volume * p2.RollOffGain > 0.01 then
		var2:addSound(p2.SoundId, p2:GetDebugId(10))
	end
	t_1[p2] = {
		p2.Played:Connect(function()
			-- upvalues: p2 (ref), getFFlagEnableSoundSessionTelemetryModule (copy), userGameSettingsService (copy), var2 (copy)
			local var4
			if p2.TimeLength == 0 or not p2.IsLoaded then
				var4 = nil
				var4 = p2.Loaded:Connect(function()
					-- upvalues: p2 (copy), getFFlagEnableSoundSessionTelemetryModule (copy), userGameSettingsService (copy), var2 (copy), var4 (write)
					if getFFlagEnableSoundSessionTelemetryModule() and userGameSettingsService.MasterVolume * (if p2.SoundGroup then p2.SoundGroup.Volume else 1) * p2.Volume * p2.RollOffGain > 0.01 then
						var2:addSound(p2.SoundId, p2:GetDebugId(10))
					end
					var4:Disconnect()
				end)
				
				return
			end
			var4 = p2
			
			if getFFlagEnableSoundSessionTelemetryModule() and userGameSettingsService.MasterVolume * (if var4.SoundGroup then var4.SoundGroup.Volume else 1) * var4.Volume * var4.RollOffGain > 0.01 then
				var2:addSound(var4.SoundId, var4:GetDebugId(10))
			end
		end),
		p2.Paused:Connect(function()
			-- upvalues: p2 (ref), getFFlagEnableSoundSessionTelemetryModule (copy), var2 (copy)
			if getFFlagEnableSoundSessionTelemetryModule() then
				var2:removeSound(p2.SoundId, p2:GetDebugId(10))
			end
		end),
		p2.Stopped:Connect(function()
			-- upvalues: p2 (ref), getFFlagEnableSoundSessionTelemetryModule (copy), var2 (copy)
			if getFFlagEnableSoundSessionTelemetryModule() then
				var2:removeSound(p2.SoundId, p2:GetDebugId(10))
			end
		end),
		p2.Ended:Connect(function()
			-- upvalues: p2 (ref), getFFlagEnableSoundSessionTelemetryModule (copy), var2 (copy)
			if getFFlagEnableSoundSessionTelemetryModule() then
				var2:removeSound(p2.SoundId, p2:GetDebugId(10))
			end
		end),
		p2.Resumed:Connect(function()
			-- upvalues: p2 (ref), getFFlagEnableSoundSessionTelemetryModule (copy), userGameSettingsService (copy), var2 (copy)
			if getFFlagEnableSoundSessionTelemetryModule() and userGameSettingsService.MasterVolume * (if p2.SoundGroup then p2.SoundGroup.Volume else 1) * p2.Volume * p2.RollOffGain > 0.01 then
				var2:addSound(p2.SoundId, p2:GetDebugId(10))
			end
		end),
		p2.DidLoop:Connect(function(_, _)
			-- upvalues: p2 (ref), getFFlagEnableSoundSessionTelemetryModule (copy), var2 (copy)
			if getFFlagEnableSoundSessionTelemetryModule() then
				var2:loopSound(p2.SoundId, p2:GetDebugId(10))
			end
		end),
		p2.AncestryChanged:Connect(function(p3, _)
			-- upvalues: unhookSoundEvents (copy), p2 (ref)
			if p3:FindFirstAncestorOfClass("DataModel") == nil then
				unhookSoundEvents(p2)
			end
		end)
	}
end

if getFFlagEnableSoundSessionTelemetryModule() then
	if game:GetEngineFeature("AudioInstanceAddedApiEnabled") then
		soundService.AudioInstanceAdded:Connect(function(p2)
			-- upvalues: t_1 (ref), hookupSoundEvents (ref)
			if p2:IsA("Sound") and not t_1[p2] then
				hookupSoundEvents(p2)
			end
		end)
	end
	game.Close:Connect(function()
		-- upvalues: aggregateEndSessionData (ref)
		aggregateEndSessionData()
	end)
end