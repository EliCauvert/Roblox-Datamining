local ReactPerfTrackerKibana = game:DefineFastInt("ReactPerfTrackerKibana", 0)

function applicationId() --[[ Line: 47 ]]
	local AppStorageService = game:GetService("AppStorageService")
	
	if AppStorageService then
		local AppInstallationIdItem: string = AppStorageService:GetItem("AppInstallationId")
		local ValueType = typeof(AppInstallationIdItem)
		
		return if ValueType == "number" then tonumber(AppInstallationIdItem) or nil elseif ValueType == "string" then if string.len(AppInstallationIdItem) <= 0 then nil else tonumber((string.sub(AppInstallationIdItem, -string.len((tostring(1000)))))) else nil
	else
		return nil
	end
end

local ReactPerfTrackerKibana1: number = ReactPerfTrackerKibana

if ReactPerfTrackerKibana1 <= 0 then
	return nil
end
local RandomValue = math.random(0, 1000)
local ApplicationIdResult: number = applicationId()

if ApplicationIdResult ~= nil then
	RandomValue = (ApplicationIdResult + 327) % 1000
end
if RandomValue >= ReactPerfTrackerKibana1 then
	ReactPerfTrackerKibana1 = 0
end
if ReactPerfTrackerKibana1 > 0 then
	local CorePackages = game:GetService("CorePackages")
	local LoggingProtocolModule = require(CorePackages.Workspace.Packages.LoggingProtocol)
	local ReactRobloxModule = require(CorePackages.Packages.ReactRoblox)
	local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
	local config = {
		eventName = "ReactCoreScriptPerformance",
		throttlingPercentage = 10000,
		description = "Reporting the time utilization of React in CoreScripts",
		links = "",
		backends = { LoggingProtocolModule.TelemetryBackends.Points },
		lastUpdated = { 24, 10, 4 }
	}
	local ReactPerfTrackerModule = {}
	ReactPerfTrackerModule.__index = ReactPerfTrackerModule
	
	function ReactPerfTrackerModule.new() --[[ Line: 117 ]]
		-- upvalues: LoggingProtocolModule (copy), ReactPerfTrackerModule (copy)
		return (setmetatable({
			totalTime = 0,
			componentTotalTime = {},
			componentMaxTime = {},
			componentCount = {},
			sampleCount = 0,
			loggingProtocol = LoggingProtocolModule.default,
			outgoingEvents = {},
			nextSendTime = 0,
			previousSendTime = 0
		}, ReactPerfTrackerModule))
	end
	
	function ReactPerfTrackerModule:start() --[[ Line: 132 ]]
		-- upvalues: config (copy), ReactRobloxModule (copy)
		self.eventSender = coroutine.create(function() --[[ Line: 134 ]]
			-- upvalues: self (copy), config (upval)
			while true do
				local Removed = table.remove(self.outgoingEvents, 1)
				if Removed then
					wait()
					self.loggingProtocol:logRobloxTelemetryEvent(config, {}, Removed)
				else
					coroutine.yield()
				end
			end
		end)
		ReactRobloxModule.robloxReactProfiling.startTimerSampling(function(p1) --[[ Line: 147 ]]
			-- upvalues: self (copy)
			local Id = p1.id
			local ScaledEndTime = (p1.endTime - p1.startTime) * 1000
			
			if not self.componentTotalTime[Id] then
				self.componentTotalTime[Id] = 0
				self.componentMaxTime[Id] = 0
				self.componentCount[Id] = 0
			end
			local ComponentTotalTime = self.componentTotalTime
			ComponentTotalTime[Id] += ScaledEndTime
			local ComponentCount = self.componentCount
			ComponentCount[Id] += 1
			self.sampleCount += 1
			self.totalTime += ScaledEndTime
			self.componentMaxTime[Id] = math.max(self.componentMaxTime[Id], ScaledEndTime)
			
			if self.nextSendTime <= p1.startTime then
				if self.nextSendTime > 0 then
					self:sendEvents()
				end
				self.previousSendTime = self.nextSendTime
				
				if self.previousSendTime == 0 then
					self.previousSendTime = p1.startTime
				end
				self.nextSendTime = p1.startTime + 30
			end
		end)
	end
	
	function ReactPerfTrackerModule:genEvents() --[[ Line: 180 ]]
		-- upvalues: RbxAnalyticsService (copy)
		local Summary_num_components = 0
		
		for Component, _ in self.componentCount do
			Summary_num_components += 1
			table.insert(self.outgoingEvents, {
				sessionid = if RbxAnalyticsService then RbxAnalyticsService:GetSessionId() else "",
				component = Component,
				time_ms_max = self.componentMaxTime[Component],
				time_ms_avg = self.componentTotalTime[Component] / self.componentCount[Component],
				total_time_ms = self.componentTotalTime[Component],
				total_time_pct = self.componentTotalTime[Component] / self.totalTime,
				count = self.componentCount[Component],
				count_pct = self.componentCount[Component] / self.sampleCount
			})
		end
		table.insert(self.outgoingEvents, 1, {
			summary_sessionid = if RbxAnalyticsService then RbxAnalyticsService:GetSessionId() else "",
			summary_total_time_ms = self.totalTime,
			summary_sample_time_s = self.nextSendTime - self.previousSendTime,
			summary_num_components = Summary_num_components,
			summary_sample_count = self.sampleCount
		})
	end
	
	function ReactPerfTrackerModule:sendEvents() --[[ Line: 206 ]]
		if self.sampleCount ~= 0 then
			self:genEvents()
			self:resetCounts()
			coroutine.resume(self.eventSender)
			
			return
		end
	end
	
	function ReactPerfTrackerModule:resetCounts() --[[ Line: 218 ]]
		self.componentTotalTime = {}
		self.componentMaxTime = {}
		self.componentCount = {}
		self.sampleCount = 0
		self.totalTime = 0
	end
	
	return ReactPerfTrackerModule
else
	return nil
end