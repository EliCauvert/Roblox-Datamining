local reactPerfTrackerKibana = game:DefineFastInt("ReactPerfTrackerKibana", 0)

function applicationId()
	local appStorageService = game:GetService("AppStorageService")
	
	if not appStorageService then
		return nil
	end
	local appInstallationIdItem = appStorageService:GetItem("AppInstallationId")
	local var12 = typeof(appInstallationIdItem)
	
	return if var12 == "number" then tonumber(appInstallationIdItem) or nil elseif var12 == "string" then if string.len(appInstallationIdItem) <= 0 then nil else tonumber(string.sub(appInstallationIdItem, -string.len(tostring(1000)))) else nil
end

local var1 = reactPerfTrackerKibana

if var1 <= 0 then
	return nil
end
local randomValue = math.random(0, 1000)
local var3 = applicationId()

if var3 ~= nil then
	randomValue = (var3 + 327) % 1000
end
if randomValue >= var1 then
	var1 = 0
end
if var1 > 0 then
	local corePackagesService = game:GetService("CorePackages")
	local loggingProtocolModule = require(corePackagesService.Workspace.Packages.LoggingProtocol)
	local reactRobloxModule = require(corePackagesService.Packages.ReactRoblox)
	local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
	local t = {
		eventName = "ReactCoreScriptPerformance",
		throttlingPercentage = 10000,
		description = "Reporting the time utilization of React in CoreScripts",
		links = "",
		backends = { loggingProtocolModule.TelemetryBackends.Points },
		lastUpdated = { 24, 10, 4 }
	}
	local t_1 = {}
	t_1.__index = t_1
	
	function t_1.new()
		-- upvalues: loggingProtocolModule (ref), t_1 (ref)
		return setmetatable({
			totalTime = 0,
			componentTotalTime = {},
			componentMaxTime = {},
			componentCount = {},
			sampleCount = 0,
			loggingProtocol = loggingProtocolModule.default,
			outgoingEvents = {},
			nextSendTime = 0,
			previousSendTime = 0
		}, t_1)
	end
	
	function t_1:start()
		-- upvalues: t (ref), reactRobloxModule (ref)
		self.eventSender = coroutine.create(function()
			-- upvalues: self (ref), t (copy)
			while true do
				local removed = table.remove(self.outgoingEvents, 1)
				if removed then
					wait()
					self.loggingProtocol:logRobloxTelemetryEvent(t, {}, removed)
				else
					coroutine.yield()
				end
			end
		end)
		reactRobloxModule.robloxReactProfiling.startTimerSampling(function(p0)
			-- upvalues: self (ref)
			local id = p0.id
			local var14 = (p0.endTime - p0.startTime) * 1000
			
			if not self.componentTotalTime[id] then
				self.componentTotalTime[id] = 0
				self.componentMaxTime[id] = 0
				self.componentCount[id] = 0
			end
			self.componentTotalTime[id] += var14
			self.componentCount[id] += 1
			self.sampleCount += 1
			self.totalTime += var14
			self.componentMaxTime[id] = math.max(self.componentMaxTime[id], var14)
			
			if self.nextSendTime <= p0.startTime then
				if self.nextSendTime > 0 then
					self:sendEvents()
				end
				self.previousSendTime = self.nextSendTime
				
				if self.previousSendTime == 0 then
					self.previousSendTime = p0.startTime
				end
				self.nextSendTime = p0.startTime + 30
			end
		end)
	end
	
	function t_1:genEvents()
		-- upvalues: rbxAnalyticsService (ref)
		local var15 = 0
		
		for i, v in self.componentCount do
			var15 += 1
			table.insert(self.outgoingEvents, {
				sessionid = if rbxAnalyticsService then rbxAnalyticsService:GetSessionId() else "",
				component = i,
				time_ms_max = self.componentMaxTime[i],
				time_ms_avg = self.componentTotalTime[i] / self.componentCount[i],
				total_time_ms = self.componentTotalTime[i],
				total_time_pct = self.componentTotalTime[i] / self.totalTime,
				count = self.componentCount[i],
				count_pct = self.componentCount[i] / self.sampleCount
			})
		end
		table.insert(self.outgoingEvents, 1, {
			summary_sessionid = if rbxAnalyticsService then rbxAnalyticsService:GetSessionId() else "",
			summary_total_time_ms = self.totalTime,
			summary_sample_time_s = self.nextSendTime - self.previousSendTime,
			summary_num_components = var15,
			summary_sample_count = self.sampleCount
		})
	end
	
	function t_1:sendEvents()
		if self.sampleCount == 0 then
			return
		end
		self:genEvents()
		self:resetCounts()
		coroutine.resume(self.eventSender)
	end
	
	function t_1:resetCounts()
		self.componentTotalTime = {}
		self.componentMaxTime = {}
		self.componentCount = {}
		self.sampleCount = 0
		self.totalTime = 0
	end
	
	return t_1
end
return nil