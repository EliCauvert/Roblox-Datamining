local TelemetryService = game:GetService("TelemetryService")
local Parent = script.Parent.Parent
local _ = require(Parent.AppCommonLib)
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local IsReactProfilingEnabled = require(Parent.RoactUtils).Profiling.isReactProfilingEnabled
local SupportTerminalMilestoneInReactProfilerLogger = game:DefineFastFlag("SupportTerminalMilestoneInReactProfilerLogger", false)
local AppLaunchReactProfilerLoggerCollectionTimeoutSec = game:DefineFastInt("AppLaunchReactProfilerLoggerCollectionTimeoutSec", 30)
local SupportedAppLaunchMilestonesForReactProfilerLogger = game:DefineFastString("SupportedAppLaunchMilestonesForReactProfilerLogger", "lua_app_starter_script_requires_end,fetch_homepage_data_begin,fetch_homepage_data_end,home_page_interactive")

local function _()
	-- upvalues: SupportedAppLaunchMilestonesForReactProfilerLogger (copy)
	local t = {}
	
	for _, value in SupportedAppLaunchMilestonesForReactProfilerLogger:split(",") do
		t[value] = true
	end
	return t
end

local config = {
	eventName = "AppLaunchReactProfilerUpdateCount",
	throttlingPercentage = 0,
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 2025, 2, 25 }
}
local config1 = {
	eventName = "AppLaunchReactProfilerRenderDuration",
	throttlingPercentage = 0,
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 2025, 2, 25 }
}
local config2 = {
	eventName = "AppLaunchReactProfilerCommitDuration",
	throttlingPercentage = 0,
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 2025, 2, 25 }
}
local config3 = {
	eventName = "AppLaunchReactProfilerExclusiveRenderDuration",
	throttlingPercentage = 0,
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 2025, 2, 25 }
}
local config4 = {
	eventName = "AppLaunchReactProfilerExclusiveCommitDuration",
	throttlingPercentage = 0,
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 2025, 2, 25 }
}

local function logProfilerData(List)
	-- upvalues: TelemetryService (copy), config (copy), config1 (copy), config2 (copy), config3 (copy), config4 (copy)
	if next(List) == nil then return end
	for _, ProfilerData in List do
		TelemetryService:LogStat(config, {
			customFields = {
				profilerId = ProfilerData.profilerId,
				milestoneName = ProfilerData.milestoneName
			}
		}, ProfilerData.updateCount)
		TelemetryService:LogStat(config1, {
			customFields = {
				profilerId = ProfilerData.profilerId,
				milestoneName = ProfilerData.milestoneName
			}
		}, ProfilerData.renderDuration)
		TelemetryService:LogStat(config2, {
			customFields = {
				profilerId = ProfilerData.profilerId,
				milestoneName = ProfilerData.milestoneName
			}
		}, ProfilerData.commitDuration)
		TelemetryService:LogStat(config3, {
			customFields = {
				profilerId = ProfilerData.profilerId,
				milestoneName = ProfilerData.milestoneName
			}
		}, ProfilerData.exclusiveRenderDuration)
		TelemetryService:LogStat(config4, {
			customFields = {
				profilerId = ProfilerData.profilerId,
				milestoneName = ProfilerData.milestoneName
			}
		}, ProfilerData.exclusiveCommitDuration)
	end
end

local _ = function(ProfilerId, MilestoneName)
	return {
		updateCount = 0,
		renderDuration = 0,
		commitDuration = 0,
		exclusiveRenderDuration = 0,
		exclusiveCommitDuration = 0,
		profilerId = ProfilerId,
		milestoneName = MilestoneName
	}
end

local _ = function(ProfilerData, p1)
	ProfilerData.updateCount += 1
	ProfilerData.renderDuration += p1.render.duration
	ProfilerData.commitDuration += p1.commit.duration
	ProfilerData.exclusiveRenderDuration += p1.render.exclusiveDuration
	ProfilerData.exclusiveCommitDuration += p1.commit.exclusiveDuration
end

return function(p1, EventName)
	-- upvalues: IsReactProfilingEnabled (copy), SupportTerminalMilestoneInReactProfilerLogger (copy), SupportedAppLaunchMilestonesForReactProfilerLogger (copy), LoggingProtocolModule (copy), AppLaunchReactProfilerLoggerCollectionTimeoutSec (copy), logProfilerData (copy)
	if not IsReactProfilingEnabled then return end
	local t = {}
	local List = {}
	
	local function correlateProfilerData()
		-- upvalues: t (ref), List (ref)
		local List1 = {}
		
		for ProfilerId, value in t do
			local Count = #value
			local CountList = #List
			local Count1 = 1
			local Count2 = 1
			local ProfilerData = nil
			local config = {
				milestoneName = "aggregate",
				updateCount = 0,
				renderDuration = 0,
				commitDuration = 0,
				exclusiveRenderDuration = 0,
				exclusiveCommitDuration = 0,
				profilerId = ProfilerId
			}
			while Count1 <= Count and Count2 <= CountList do
				local Entry = value[Count1]
				local Entry1 = List[Count2]
				
				if ProfilerData == nil then
					ProfilerData = {
						updateCount = 0,
						renderDuration = 0,
						commitDuration = 0,
						exclusiveRenderDuration = 0,
						exclusiveCommitDuration = 0,
						profilerId = ProfilerId,
						milestoneName = Entry1.eventName
					}
				end
				if Entry.render.startTime < Entry1.eventTime then
					ProfilerData.updateCount += 1
					ProfilerData.renderDuration += Entry.render.duration
					ProfilerData.commitDuration += Entry.commit.duration
					ProfilerData.exclusiveRenderDuration += Entry.render.exclusiveDuration
					ProfilerData.exclusiveCommitDuration += Entry.commit.exclusiveDuration
					config.updateCount += 1
					config.renderDuration += Entry.render.duration
					config.commitDuration += Entry.commit.duration
					config.exclusiveRenderDuration += Entry.render.exclusiveDuration
					config.exclusiveCommitDuration += Entry.commit.exclusiveDuration
					Count1 += 1
				else
					if ProfilerData.updateCount > 0 then
						table.insert(List1, ProfilerData)
					end
					Count2 += 1
					ProfilerData = nil
				end
			end
			if ProfilerData and ProfilerData.updateCount > 0 then
				table.insert(List1, ProfilerData)
			end
			if config.updateCount > 0 then
				table.insert(List1, config)
			end
		end
		t = {}
		List = {}
		
		return List1
	end
	
	local function _(Key)
		-- upvalues: t (ref)
		local Entry = t[Key]
		
		if Entry == nil then
			Entry = {}
			t[Key] = Entry
		end
		return Entry
	end
	
	local OnRenderConnection = p1.onRender:connect(function(Render)
		-- upvalues: t (ref)
		local ProfilerId = Render.profilerId
		local Entry = t[ProfilerId]
		
		if Entry == nil then
			Entry = {}
			t[ProfilerId] = Entry
		end
		table.insert(Entry, {
			render = Render,
			commit = {
				duration = 0,
				exclusiveDuration = 0,
				profilerId = Render.profilerId,
				commitTime = Render.commitTime
			}
		})
	end)
	local OnCommitConnection = p1.onCommit:connect(function(Commit)
		-- upvalues: t (ref)
		local ProfilerId = Commit.profilerId
		local Entry = t[ProfilerId]
		
		if Entry == nil then
			Entry = {}
			t[ProfilerId] = Entry
		end
		local Entry1 = Entry[#Entry]
		
		if Entry1 == nil or Entry1.render.commitTime ~= Commit.commitTime then
			warn("Profiler invariants are broken")
			
			return
		else
			Entry1.commit = Commit
		end
	end)
	local SetDurationLoggerListenerResult = nil
	
	if SupportTerminalMilestoneInReactProfilerLogger then
		local t1 = {}
		
		for _, value in SupportedAppLaunchMilestonesForReactProfilerLogger:split(",") do
			t1[value] = true
		end
		SetDurationLoggerListenerResult = LoggingProtocolModule.default:setDurationLoggerListener(function(EventName1)
			-- upvalues: t1 (copy), List (ref), EventName (copy), SetDurationLoggerListenerResult (ref)
			if t1[EventName1] then
				table.insert(List, { eventName = EventName1, eventTime = os.clock() * 1000 })
			end
			if EventName ~= nil and EventName1 == EventName and SetDurationLoggerListenerResult ~= nil then
				SetDurationLoggerListenerResult:disconnect()
				SetDurationLoggerListenerResult = nil
			end
		end)
	else
		SetDurationLoggerListenerResult = LoggingProtocolModule.default:setDurationLoggerListener(function(EventName)
			-- upvalues: List (ref)
			table.insert(List, { eventName = EventName, eventTime = os.clock() * 1000 })
		end)
	end
	local _ = function()
		-- upvalues: OnRenderConnection (ref), OnCommitConnection (ref), SetDurationLoggerListenerResult (ref)
		if OnRenderConnection ~= nil then
			OnRenderConnection:disconnect()
			OnRenderConnection = nil
		end
		if OnCommitConnection ~= nil then
			OnCommitConnection:disconnect()
			OnCommitConnection = nil
		end
		if SetDurationLoggerListenerResult ~= nil then
			SetDurationLoggerListenerResult:disconnect()
			SetDurationLoggerListenerResult = nil
		end
	end
	
	task.delay(AppLaunchReactProfilerLoggerCollectionTimeoutSec, function()
		-- upvalues: OnRenderConnection (ref), OnCommitConnection (ref), SetDurationLoggerListenerResult (ref), correlateProfilerData (copy), logProfilerData (upval)
		if OnRenderConnection ~= nil then
			OnRenderConnection:disconnect()
			OnRenderConnection = nil
		end
		if OnCommitConnection ~= nil then
			OnCommitConnection:disconnect()
			OnCommitConnection = nil
		end
		if SetDurationLoggerListenerResult ~= nil then
			SetDurationLoggerListenerResult:disconnect()
			SetDurationLoggerListenerResult = nil
		end
		logProfilerData((correlateProfilerData()))
	end)
end