local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local SoundService = game:GetService("SoundService")
local Modules = game:GetService("CoreGui"):WaitForChild("RobloxGui"):WaitForChild("Modules")
local GetFFlagEnableSoundSessionTelemetryModule = require(Modules.Flags.GetFFlagEnableSoundSessionTelemetry)
local RbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local LoggingProtocolModule = require(game:GetService("CorePackages").Workspace.Packages.LoggingProtocol)
local Default = LoggingProtocolModule.default
local config = {
	eventName = "SoundSessionPlayback",
	description = " Aggregated session-end event of all music playback data ",
	links = "https://roblox.atlassian.net/wiki/spaces/MUS/pages/2065826132/Scaled+Analytics+Tech+Spec",
	backends = { LoggingProtocolModule.TelemetryBackends.EventIngest },
	throttlingPercentage = require(Modules.Flags.GetFIntSoundSessionTelemetryThrottle)(),
	lastUpdated = { 23, 13, 6 }
}
local t = {}
local NewResult = require(Modules.AggregatedData).new()
local NewResult1 = require(Modules.PlayingSounds).new(NewResult)

local function logSessionEvent()
	-- upvalues: NewResult (copy), RbxAnalyticsService (copy), RbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), Default (copy), config (copy)
	local List = {}
	local List1 = {}
	local List2 = {}
	
	for i, value in pairs(NewResult) do
		table.insert(List, i)
		table.insert(List1, value.loopcount)
		table.insert(List2, value.playtime)
	end
	local config1 = {
		asset_ids = table.concat(List, ","),
		loop_counts = table.concat(List1, ","),
		playback_seconds = table.concat(List2, ","),
		placeid = tostring(game.PlaceId),
		sessionid = RbxAnalyticsService:GetSessionId(),
		universeid = tostring(game.GameId)
	}
	
	if RbxAnalyticsServiceExposePlaySessionIdEngineFeature then
		config1.playsessionid = RbxAnalyticsService:GetPlaySessionId()
	end
	Default:logRobloxTelemetryEvent(config, nil, config1)
end

local function aggregateEndSessionData()
	-- upvalues: NewResult1 (copy), logSessionEvent (copy)
	for i, sound in pairs(NewResult1.sounds) do
		for i1, _ in pairs(sound.instances) do
			NewResult1:removeSound(i, i1)
		end
	end
	logSessionEvent()
end

local function _(Sound): boolean
	-- upvalues: UserGameSettings (copy)
	return UserGameSettings.MasterVolume * (if Sound.SoundGroup then Sound.SoundGroup.Volume else 1) * Sound.Volume * Sound.RollOffGain > 0.01
end

local _ = function(Sound: Sound)
	-- upvalues: GetFFlagEnableSoundSessionTelemetryModule (copy), UserGameSettings (copy), NewResult1 (copy)
	if GetFFlagEnableSoundSessionTelemetryModule() and UserGameSettings.MasterVolume * (if Sound.SoundGroup then Sound.SoundGroup.Volume else 1) * Sound.Volume * Sound.RollOffGain > 0.01 then
		NewResult1:addSound(Sound.SoundId, Sound:GetDebugId(10))
	end
end

local _ = function(Sound)
	-- upvalues: GetFFlagEnableSoundSessionTelemetryModule (copy), NewResult1 (copy)
	if GetFFlagEnableSoundSessionTelemetryModule() then
		NewResult1:removeSound(Sound.SoundId, Sound:GetDebugId(10))
	end
end

local _ = function(Sound)
	-- upvalues: GetFFlagEnableSoundSessionTelemetryModule (copy), NewResult1 (copy)
	if GetFFlagEnableSoundSessionTelemetryModule() then
		NewResult1:removeSound(Sound.SoundId, Sound:GetDebugId(10))
	end
end

local _ = function(Sound)
	-- upvalues: GetFFlagEnableSoundSessionTelemetryModule (copy), NewResult1 (copy)
	if GetFFlagEnableSoundSessionTelemetryModule() then
		NewResult1:removeSound(Sound.SoundId, Sound:GetDebugId(10))
	end
end

local _ = function(Sound: Sound)
	-- upvalues: GetFFlagEnableSoundSessionTelemetryModule (copy), UserGameSettings (copy), NewResult1 (copy)
	if GetFFlagEnableSoundSessionTelemetryModule() and UserGameSettings.MasterVolume * (if Sound.SoundGroup then Sound.SoundGroup.Volume else 1) * Sound.Volume * Sound.RollOffGain > 0.01 then
		NewResult1:addSound(Sound.SoundId, Sound:GetDebugId(10))
	end
end

local _ = function(Sound, _)
	-- upvalues: GetFFlagEnableSoundSessionTelemetryModule (copy), NewResult1 (copy)
	if GetFFlagEnableSoundSessionTelemetryModule() then
		NewResult1:loopSound(Sound.SoundId, Sound:GetDebugId(10))
	end
end

local function unhookSoundEvents(Sound)
	-- upvalues: t (copy), GetFFlagEnableSoundSessionTelemetryModule (copy), NewResult1 (copy)
	local Entry = t[Sound]
	
	if Entry ~= nil then
		for _, Connection in Entry do
			Connection:Disconnect()
		end
	end
	if GetFFlagEnableSoundSessionTelemetryModule() then
		NewResult1:removeSound(Sound.SoundId, Sound:GetDebugId(10))
	end
	t[Sound] = nil
end

local function hookupSoundEvents(Sound: Sound)
	-- upvalues: GetFFlagEnableSoundSessionTelemetryModule (copy), UserGameSettings (copy), NewResult1 (copy), unhookSoundEvents (copy), t (copy)
	if Sound.Playing and GetFFlagEnableSoundSessionTelemetryModule() and UserGameSettings.MasterVolume * (if Sound.SoundGroup then Sound.SoundGroup.Volume else 1) * Sound.Volume * Sound.RollOffGain > 0.01 then
		NewResult1:addSound(Sound.SoundId, Sound:GetDebugId(10))
	end
	t[Sound] = {
		Sound.Played:Connect(function()
			-- upvalues: Sound (copy), GetFFlagEnableSoundSessionTelemetryModule (upval), UserGameSettings (upval), NewResult1 (upval)
			if Sound.TimeLength == 0 or not Sound.IsLoaded then
				local Sound1 = nil
				Sound1 = Sound.Loaded:Connect(function()
					-- upvalues: Sound (upval), GetFFlagEnableSoundSessionTelemetryModule (upval), UserGameSettings (upval), NewResult1 (upval), Sound1 (ref)
					if GetFFlagEnableSoundSessionTelemetryModule() and UserGameSettings.MasterVolume * (if Sound.SoundGroup then Sound.SoundGroup.Volume else 1) * Sound.Volume * Sound.RollOffGain > 0.01 then
						NewResult1:addSound(Sound.SoundId, Sound:GetDebugId(10))
					end
					Sound1:Disconnect()
				end)
				
				return
			end
			local Sound1 = Sound
			
			if GetFFlagEnableSoundSessionTelemetryModule() and UserGameSettings.MasterVolume * (if Sound1.SoundGroup then Sound1.SoundGroup.Volume else 1) * Sound1.Volume * Sound1.RollOffGain > 0.01 then
				NewResult1:addSound(Sound1.SoundId, Sound1:GetDebugId(10))
			end
		end),
		Sound.Paused:Connect(function()
			-- upvalues: Sound (copy), GetFFlagEnableSoundSessionTelemetryModule (upval), NewResult1 (upval)
			if GetFFlagEnableSoundSessionTelemetryModule() then
				NewResult1:removeSound(Sound.SoundId, Sound:GetDebugId(10))
			end
		end),
		Sound.Stopped:Connect(function()
			-- upvalues: Sound (copy), GetFFlagEnableSoundSessionTelemetryModule (upval), NewResult1 (upval)
			if GetFFlagEnableSoundSessionTelemetryModule() then
				NewResult1:removeSound(Sound.SoundId, Sound:GetDebugId(10))
			end
		end),
		Sound.Ended:Connect(function()
			-- upvalues: Sound (copy), GetFFlagEnableSoundSessionTelemetryModule (upval), NewResult1 (upval)
			if GetFFlagEnableSoundSessionTelemetryModule() then
				NewResult1:removeSound(Sound.SoundId, Sound:GetDebugId(10))
			end
		end),
		Sound.Resumed:Connect(function()
			-- upvalues: Sound (copy), GetFFlagEnableSoundSessionTelemetryModule (upval), UserGameSettings (upval), NewResult1 (upval)
			if GetFFlagEnableSoundSessionTelemetryModule() and UserGameSettings.MasterVolume * (if Sound.SoundGroup then Sound.SoundGroup.Volume else 1) * Sound.Volume * Sound.RollOffGain > 0.01 then
				NewResult1:addSound(Sound.SoundId, Sound:GetDebugId(10))
			end
		end),
		Sound.DidLoop:Connect(function(_, _)
			-- upvalues: Sound (copy), GetFFlagEnableSoundSessionTelemetryModule (upval), NewResult1 (upval)
			if GetFFlagEnableSoundSessionTelemetryModule() then
				NewResult1:loopSound(Sound.SoundId, Sound:GetDebugId(10))
			end
		end),
		(Sound.AncestryChanged:Connect(function(Child, _)
			-- upvalues: unhookSoundEvents (upval), Sound (copy)
			if Child:FindFirstAncestorOfClass("DataModel") == nil then
				unhookSoundEvents(Sound)
			end
		end))
	}
end

if GetFFlagEnableSoundSessionTelemetryModule() then
	if game:GetEngineFeature("AudioInstanceAddedApiEnabled") then
		SoundService.AudioInstanceAdded:Connect(function(Sound: Sound)
			-- upvalues: t (copy), hookupSoundEvents (copy)
			if Sound:IsA("Sound") and not t[Sound] then
				hookupSoundEvents(Sound)
			end
		end)
	end
	game.Close:Connect(function()
		-- upvalues: aggregateEndSessionData (copy)
		aggregateEndSessionData()
	end)
end