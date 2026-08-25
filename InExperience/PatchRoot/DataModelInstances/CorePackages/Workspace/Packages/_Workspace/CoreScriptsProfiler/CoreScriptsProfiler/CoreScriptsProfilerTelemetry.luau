local coreScriptsProfilerModule = require(script.Parent.CoreScriptsProfiler)
local profilerDataParserModule = require(script.Parent.ProfilerDataParser)
local telemetryService = game:GetService("TelemetryService")
local deviceTier = require(script:FindFirstAncestor("CoreScriptsProfiler").Parent.Devices).DeviceTier
game:DefineFastInt("CoreScriptsProfilerSamplingHundredthsPercentv1", 0)
local coreScriptsProfilerDelaySeconds = game:DefineFastInt("CoreScriptsProfilerDelaySeconds", 5)
local coreScriptsProfilerDurationSeconds = game:DefineFastInt("CoreScriptsProfilerDurationSeconds", 10)
local coreScriptsProfilerTelemetryLimit = game:DefineFastInt("CoreScriptsProfilerTelemetryLimit", 20)

if math.random(0, 10000) <= game:GetFastInt("CoreScriptsProfilerSamplingHundredthsPercentv1") then
	local t = {
		eventName = "CorescriptPackageStats",
		description = "Task stats for each corescript package, all in milliseconds",
		links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/4084400405/Lua+time+break-down+CoreScriptsProfiler",
		backends = { "RobloxTelemetryStat" },
		lastUpdated = { 2025, 11, 25 }
	}
	local t_1 = {}
	t_1.__index = t_1
	
	function t_1.new(p0)
		-- upvalues: t_1 (ref)
		return setmetatable({ profiler = nil, profilingActive = false, context = p0 }, t_1)
	end
	
	function t_1:start()
		-- upvalues: coreScriptsProfilerModule (ref), coreScriptsProfilerDelaySeconds (ref)
		self.profiler = coreScriptsProfilerModule.new(function(_, p1)
			-- upvalues: self (ref)
			self:reportResults(p1)
			self:cleanup()
		end)
		task.delay(coreScriptsProfilerDelaySeconds, function()
			-- upvalues: self (ref)
			self:startProfilingSession()
		end)
	end
	
	function t_1:startProfilingSession()
		-- upvalues: coreScriptsProfilerDurationSeconds (ref)
		if self.profilingActive then return end
		if self.profiler then
			self.profilingActive = true
			self.profiler:ClientStart()
			task.delay(coreScriptsProfilerDurationSeconds, function()
				-- upvalues: self (ref)
				self:stopProfilingSession()
			end)
			
			return
		end
	end
	
	function t_1:stopProfilingSession()
		if not self.profilingActive then return end
		if self.profiler then
			self.profiler:ClientStop()
			self.profilingActive = false
			
			return
		end
	end
	
	local function sortPackageStatsByDuration(p2)
		local t = {}
		
		for i, v in p2 do
			table.insert(t, {
				packageName = i,
				count = v.count,
				totalDuration = v.totalDuration
			})
		end
		table.sort(t, function(p3, p4)
			return p4.totalDuration < p3.totalDuration
		end)
		
		return t
	end
	
	function t_1:reportResults(p5)
		-- upvalues: profilerDataParserModule (ref), sortPackageStatsByDuration (ref), coreScriptsProfilerTelemetryLimit (ref), deviceTier (ref), telemetryService (ref), t (ref)
		local var11 = sortPackageStatsByDuration(profilerDataParserModule.new(p5):getPackageStatistics())
		local deviceMemoryTier = deviceTier.GetDeviceMemoryTier()
		
		for i = 1, math.min(#var11, coreScriptsProfilerTelemetryLimit) do
			local var13 = var11[i]
			telemetryService:LogStat(t, {
				customFields = {
					packageName = var13.packageName,
					context = self.context,
					deviceTier = deviceMemoryTier
				}
			}, var13.totalDuration * 1000)
		end
	end
	
	function t_1:cleanup()
		if self.profiler then
			self.profiler:Disconnect()
			self.profiler = nil
			self.profilingActive = false
		end
	end
	
	local var9 = nil
	
	return function(p6)
		-- upvalues: var9 (write), t_1 (ref)
		if not var9 then
			var9 = t_1.new(p6)
		end
		return var9
	end
end
return nil