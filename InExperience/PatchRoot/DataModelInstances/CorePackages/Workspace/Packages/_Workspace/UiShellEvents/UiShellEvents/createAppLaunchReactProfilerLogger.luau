local telemetryService = game:GetService("TelemetryService")
local parent = script.Parent.Parent
local _ = require(parent.AppCommonLib)
local loggingProtocolModule = require(parent.LoggingProtocol)
local isReactProfilingEnabled = require(parent.RoactUtils).Profiling.isReactProfilingEnabled
local supportTerminalMilestoneInReactProfilerLogger = game:DefineFastFlag("SupportTerminalMilestoneInReactProfilerLogger", false)
local appLaunchReactProfilerLoggerCollectionTimeoutSec = game:DefineFastInt("AppLaunchReactProfilerLoggerCollectionTimeoutSec", 30)
local supportedAppLaunchMilestonesForReactProfilerLogger = game:DefineFastString("SupportedAppLaunchMilestonesForReactProfilerLogger", "lua_app_starter_script_requires_end,fetch_homepage_data_begin,fetch_homepage_data_end,home_page_interactive")

local function _()
	-- upvalues: supportedAppLaunchMilestonesForReactProfilerLogger (ref)
	local t = {}
	
	for i, v in supportedAppLaunchMilestonesForReactProfilerLogger:split(",") do
		t[v] = true
	end
	return t
end

local t = {
	eventName = "AppLaunchReactProfilerUpdateCount",
	throttlingPercentage = 0,
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 2025, 2, 25 }
}
local t_1 = {
	eventName = "AppLaunchReactProfilerRenderDuration",
	throttlingPercentage = 0,
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 2025, 2, 25 }
}
local t_2 = {
	eventName = "AppLaunchReactProfilerCommitDuration",
	throttlingPercentage = 0,
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 2025, 2, 25 }
}
local t_3 = {
	eventName = "AppLaunchReactProfilerExclusiveRenderDuration",
	throttlingPercentage = 0,
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 2025, 2, 25 }
}
local t_4 = {
	eventName = "AppLaunchReactProfilerExclusiveCommitDuration",
	throttlingPercentage = 0,
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 2025, 2, 25 }
}

local function logProfilerData(p1)
	-- upvalues: telemetryService (ref), t (ref), t_1 (ref), t_2 (ref), t_3 (ref), t_4 (ref)
	if next(p1) == nil then return end
	for i, v in p1 do
		telemetryService:LogStat(t, {
			customFields = {
				profilerId = v.profilerId,
				milestoneName = v.milestoneName
			}
		}, v.updateCount)
		telemetryService:LogStat(t_1, {
			customFields = {
				profilerId = v.profilerId,
				milestoneName = v.milestoneName
			}
		}, v.renderDuration)
		telemetryService:LogStat(t_2, {
			customFields = {
				profilerId = v.profilerId,
				milestoneName = v.milestoneName
			}
		}, v.commitDuration)
		telemetryService:LogStat(t_3, {
			customFields = {
				profilerId = v.profilerId,
				milestoneName = v.milestoneName
			}
		}, v.exclusiveRenderDuration)
		telemetryService:LogStat(t_4, {
			customFields = {
				profilerId = v.profilerId,
				milestoneName = v.milestoneName
			}
		}, v.exclusiveCommitDuration)
	end
end

local _ = function(p2, p3)
	return {
		updateCount = 0,
		renderDuration = 0,
		commitDuration = 0,
		exclusiveRenderDuration = 0,
		exclusiveCommitDuration = 0,
		profilerId = p2,
		milestoneName = p3
	}
end

local _ = function(p2, p3)
	p2.updateCount += 1
	p2.renderDuration += p3.render.duration
	p2.commitDuration += p3.commit.duration
	p2.exclusiveRenderDuration += p3.render.exclusiveDuration
	p2.exclusiveCommitDuration += p3.commit.exclusiveDuration
end

return function(p2, p3)
	-- upvalues: isReactProfilingEnabled (ref), supportTerminalMilestoneInReactProfilerLogger (ref), supportedAppLaunchMilestonesForReactProfilerLogger (ref), loggingProtocolModule (ref), appLaunchReactProfilerLoggerCollectionTimeoutSec (ref), logProfilerData (ref)
	if not isReactProfilingEnabled then return end
	local t = {}
	local t_1 = {}
	
	local function correlateProfilerData()
		-- upvalues: t (write), t_1 (write)
		local t_2 = {}
		
		for i, v in t do
			local vCount = #v
			local t_1Count = #t_1
			local var1 = 1
			local var2 = 1
			local t_3 = nil
			local t_4 = {
				milestoneName = "aggregate",
				updateCount = 0,
				renderDuration = 0,
				commitDuration = 0,
				exclusiveRenderDuration = 0,
				exclusiveCommitDuration = 0,
				profilerId = i
			}
		end
		t = {}
		t_1 = {}
		
		return t_2
	end
	
	local function _(p4)
		-- upvalues: t (write)
		local var3 = t[p4]
		
		if var3 == nil then
			var3 = {}
			t[p4] = var3
		end
		return var3
	end
	
	local onRenderConnection = p2.onRender:connect(function(p4)
		-- upvalues: t (write)
		local profilerId = p4.profilerId
		local var3 = t[profilerId]
		
		if var3 == nil then
			var3 = {}
			t[profilerId] = var3
		end
		table.insert(var3, {
			render = p4,
			commit = {
				duration = 0,
				exclusiveDuration = 0,
				profilerId = p4.profilerId,
				commitTime = p4.commitTime
			}
		})
	end)
	local onCommitConnection = p2.onCommit:connect(function(p4)
		-- upvalues: t (write)
		local profilerId = p4.profilerId
		local var3 = t[profilerId]
		
		if var3 == nil then
			var3 = {}
			t[profilerId] = var3
		end
		local var4 = var3[#var3]
		
		if var4 == nil or var4.render.commitTime ~= p4.commitTime then
			warn("Profiler invariants are broken")
			
			return
		end
		var4.commit = p4
	end)
	local var3 = nil
	
	if supportTerminalMilestoneInReactProfilerLogger then
		local t_2 = {}
		
		for i, v in supportedAppLaunchMilestonesForReactProfilerLogger:split(",") do
			t_2[v] = true
		end
		local var4 = t_2
		var3 = loggingProtocolModule.default:setDurationLoggerListener(function(p4)
			-- upvalues: var4 (ref), t_1 (write), p3 (ref), var3 (write)
			if var4[p4] then
				table.insert(t_1, { eventName = p4, eventTime = os.clock() * 1000 })
			end
			if p3 ~= nil and p4 == p3 and var3 ~= nil then
				var3:disconnect()
				var3 = nil
			end
		end)
	else
		var3 = loggingProtocolModule.default:setDurationLoggerListener(function(p4)
			-- upvalues: t_1 (write)
			table.insert(t_1, { eventName = p4, eventTime = os.clock() * 1000 })
		end)
	end
	local _ = function()
		-- upvalues: onRenderConnection (write), onCommitConnection (write), var3 (write)
		if onRenderConnection ~= nil then
			onRenderConnection:disconnect()
			onRenderConnection = nil
		end
		if onCommitConnection ~= nil then
			onCommitConnection:disconnect()
			onCommitConnection = nil
		end
		if var3 ~= nil then
			var3:disconnect()
			var3 = nil
		end
	end
	
	task.delay(appLaunchReactProfilerLoggerCollectionTimeoutSec, function()
		-- upvalues: onRenderConnection (write), onCommitConnection (write), var3 (write), correlateProfilerData (ref), logProfilerData (copy)
		if onRenderConnection ~= nil then
			onRenderConnection:disconnect()
			onRenderConnection = nil
		end
		if onCommitConnection ~= nil then
			onCommitConnection:disconnect()
			onCommitConnection = nil
		end
		if var3 ~= nil then
			var3:disconnect()
			var3 = nil
		end
		logProfilerData(correlateProfilerData())
	end)
end