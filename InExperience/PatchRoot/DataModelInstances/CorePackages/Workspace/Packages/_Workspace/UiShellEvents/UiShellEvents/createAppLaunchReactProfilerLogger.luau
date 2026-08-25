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

local function logProfilerData(p0)
	-- upvalues: telemetryService (ref), t (ref), t_1 (ref), t_2 (ref), t_3 (ref), t_4 (ref)
	if next(p0) == nil then return end
	for i, v in p0 do
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

local _ = function(p1, p2)
	return {
		updateCount = 0,
		renderDuration = 0,
		commitDuration = 0,
		exclusiveRenderDuration = 0,
		exclusiveCommitDuration = 0,
		profilerId = p1,
		milestoneName = p2
	}
end

local _ = function(p3, p4)
	p3.updateCount += 1
	p3.renderDuration += p4.render.duration
	p3.commitDuration += p4.commit.duration
	p3.exclusiveRenderDuration += p4.render.exclusiveDuration
	p3.exclusiveCommitDuration += p4.commit.exclusiveDuration
end

return function(p5, p6)
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
			local var23 = 1
			local var24 = 1
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
	
	local function _(p7)
		-- upvalues: t (write)
		local var29 = t[p7]
		
		if var29 == nil then
			var29 = {}
			t[p7] = var29
		end
		return var29
	end
	
	local onRenderConnection = p5.onRender:connect(function(p8)
		-- upvalues: t (write)
		local profilerId = p8.profilerId
		local var30 = t[profilerId]
		
		if var30 == nil then
			var30 = {}
			t[profilerId] = var30
		end
		table.insert(var30, {
			render = p8,
			commit = {
				duration = 0,
				exclusiveDuration = 0,
				profilerId = p8.profilerId,
				commitTime = p8.commitTime
			}
		})
	end)
	local onCommitConnection = p5.onCommit:connect(function(p9)
		-- upvalues: t (write)
		local profilerId = p9.profilerId
		local var31 = t[profilerId]
		
		if var31 == nil then
			var31 = {}
			t[profilerId] = var31
		end
		local var32 = var31[#var31]
		
		if var32 == nil or var32.render.commitTime ~= p9.commitTime then
			warn("Profiler invariants are broken")
			
			return
		end
		var32.commit = p9
	end)
	local var17 = nil
	
	if supportTerminalMilestoneInReactProfilerLogger then
		local t_2 = {}
		
		for i, v in supportedAppLaunchMilestonesForReactProfilerLogger:split(",") do
			t_2[v] = true
		end
		local var19 = t_2
		var17 = loggingProtocolModule.default:setDurationLoggerListener(function(p10)
			-- upvalues: var19 (ref), t_1 (write), p6 (ref), var17 (write)
			if var19[p10] then
				table.insert(t_1, { eventName = p10, eventTime = os.clock() * 1000 })
			end
			if p6 ~= nil and p10 == p6 and var17 ~= nil then
				var17:disconnect()
				var17 = nil
			end
		end)
	else
		var17 = loggingProtocolModule.default:setDurationLoggerListener(function(p11)
			-- upvalues: t_1 (write)
			table.insert(t_1, { eventName = p11, eventTime = os.clock() * 1000 })
		end)
	end
	local _ = function()
		-- upvalues: onRenderConnection (write), onCommitConnection (write), var17 (write)
		if onRenderConnection ~= nil then
			onRenderConnection:disconnect()
			onRenderConnection = nil
		end
		if onCommitConnection ~= nil then
			onCommitConnection:disconnect()
			onCommitConnection = nil
		end
		if var17 ~= nil then
			var17:disconnect()
			var17 = nil
		end
	end
	
	task.delay(appLaunchReactProfilerLoggerCollectionTimeoutSec, function()
		-- upvalues: onRenderConnection (write), onCommitConnection (write), var17 (write), correlateProfilerData (ref), logProfilerData (copy)
		if onRenderConnection ~= nil then
			onRenderConnection:disconnect()
			onRenderConnection = nil
		end
		if onCommitConnection ~= nil then
			onCommitConnection:disconnect()
			onCommitConnection = nil
		end
		if var17 ~= nil then
			var17:disconnect()
			var17 = nil
		end
		logProfilerData(correlateProfilerData())
	end)
end