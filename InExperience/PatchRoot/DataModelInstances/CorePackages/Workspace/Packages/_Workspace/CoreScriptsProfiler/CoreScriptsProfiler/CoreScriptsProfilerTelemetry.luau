local CoreScriptsProfilerModule = require(script.Parent.CoreScriptsProfiler)
local ProfilerDataParserModule = require(script.Parent.ProfilerDataParser)
local TelemetryService = game:GetService("TelemetryService")
local DeviceTier = require(script:FindFirstAncestor("CoreScriptsProfiler").Parent.Devices).DeviceTier
game:DefineFastInt("CoreScriptsProfilerSamplingHundredthsPercentv1", 0)
local CoreScriptsProfilerDelaySeconds = game:DefineFastInt("CoreScriptsProfilerDelaySeconds", 5)
local CoreScriptsProfilerDurationSeconds = game:DefineFastInt("CoreScriptsProfilerDurationSeconds", 10)
local CoreScriptsProfilerTelemetryLimit = game:DefineFastInt("CoreScriptsProfilerTelemetryLimit", 20)

if math.random(0, 10000) <= game:GetFastInt("CoreScriptsProfilerSamplingHundredthsPercentv1") then
	local config = {
		eventName = "CorescriptPackageStats",
		description = "Task stats for each corescript package, all in milliseconds",
		links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/4084400405/Lua+time+break-down+CoreScriptsProfiler",
		backends = { "RobloxTelemetryStat" },
		lastUpdated = { 2025, 11, 25 }
	}
	local Module = {}
	Module.__index = Module
	
	function Module.new(Context)
		-- upvalues: Module (copy)
		return (setmetatable({
			profiler = nil,
			profilingActive = false,
			context = Context
		}, Module))
	end
	
	function Module:start()
		-- upvalues: CoreScriptsProfilerModule (copy), CoreScriptsProfilerDelaySeconds (copy)
		self.profiler = CoreScriptsProfilerModule.new(function(_, p1)
			-- upvalues: self (copy)
			self:reportResults(p1)
			self:cleanup()
		end)
		task.delay(CoreScriptsProfilerDelaySeconds, function()
			-- upvalues: self (copy)
			self:startProfilingSession()
		end)
	end
	
	function Module:startProfilingSession()
		-- upvalues: CoreScriptsProfilerDurationSeconds (copy)
		if self.profilingActive then return end
		if self.profiler then
			self.profilingActive = true
			self.profiler:ClientStart()
			task.delay(CoreScriptsProfilerDurationSeconds, function()
				-- upvalues: self (copy)
				self:stopProfilingSession()
			end)
			
			return
		end
	end
	
	function Module:stopProfilingSession()
		if not self.profilingActive then return end
		if self.profiler then
			self.profiler:ClientStop()
			self.profilingActive = false
			
			return
		end
	end
	
	local function sortPackageStatsByDuration(PackageStatistics)
		local List = {}
		
		for PackageName, packageStatistic in PackageStatistics do
			table.insert(List, {
				packageName = PackageName,
				count = packageStatistic.count,
				totalDuration = packageStatistic.totalDuration
			})
		end
		table.sort(List, function(A, B): boolean
			return B.totalDuration < A.totalDuration
		end)
		
		return List
	end
	
	function Module:reportResults(Context)
		-- upvalues: ProfilerDataParserModule (copy), sortPackageStatsByDuration (copy), CoreScriptsProfilerTelemetryLimit (copy), DeviceTier (copy), TelemetryService (copy), config (copy)
		local SortPackageStatsByDurationResult = sortPackageStatsByDuration((ProfilerDataParserModule.new(Context):getPackageStatistics()))
		local DeviceMemoryTier = DeviceTier.GetDeviceMemoryTier()
		
		for i = 1, math.min(#SortPackageStatsByDurationResult, CoreScriptsProfilerTelemetryLimit) do
			local SortPackageStatsByDurationResultEntry = SortPackageStatsByDurationResult[i]
			TelemetryService:LogStat(config, {
				customFields = {
					packageName = SortPackageStatsByDurationResultEntry.packageName,
					context = self.context,
					deviceTier = DeviceMemoryTier
				}
			}, SortPackageStatsByDurationResultEntry.totalDuration * 1000)
		end
	end
	
	function Module:cleanup()
		if self.profiler then
			self.profiler:Disconnect()
			self.profiler = nil
			self.profilingActive = false
		end
	end
	
	local NewResult = nil
	
	return function(Context)
		-- upvalues: NewResult (ref), Module (copy)
		if not NewResult then
			NewResult = Module.new(Context)
		end
		return NewResult
	end
else
	return nil
end