local ScrollingPerfTrackerEventStream = game:DefineFastInt("ScrollingPerfTrackerEventStream", 0)
local ScrollingPerfTrackerKibana = game:DefineFastInt("ScrollingPerfTrackerKibana", 0)
local ScrollingPerfTrackerSampleCountThreshold = game:DefineFastInt("ScrollingPerfTrackerSampleCountThreshold", 50)
local ScrollingPerfTrackerTargetFPS: number = game:DefineFastInt("ScrollingPerfTrackerTargetFPS", 60)

function applicationId()
	local AppStorageService = game:GetService("AppStorageService")
	
	if AppStorageService then
		local AppInstallationIdItem: string = AppStorageService:GetItem("AppInstallationId")
		local ValueType = typeof(AppInstallationIdItem)
		
		return if ValueType == "number" then tonumber(AppInstallationIdItem) or nil elseif ValueType == "string" then if string.len(AppInstallationIdItem) <= 0 then nil else tonumber((string.sub(AppInstallationIdItem, -string.len((tostring(1000)))))) else nil
	else
		return nil
	end
end

local ScrollingPerfTrackerEventStream1: number = ScrollingPerfTrackerEventStream
local ScrollingPerfTrackerKibana1: number = ScrollingPerfTrackerKibana

if ScrollingPerfTrackerEventStream1 <= 0 and ScrollingPerfTrackerKibana1 <= 0 then
	return nil
end
local RandomValue = math.random(0, 1000)
local ApplicationIdResult: number = applicationId()

if ApplicationIdResult == nil then
	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer
	while not LocalPlayer do
		Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
		LocalPlayer = Players.LocalPlayer
	end
	if LocalPlayer and LocalPlayer.UserId > 0 then
		RandomValue = (LocalPlayer.UserId + 647) % 1000
	end
else
	RandomValue = (ApplicationIdResult + 647) % 1000
end
if RandomValue >= ScrollingPerfTrackerEventStream1 then
	ScrollingPerfTrackerEventStream1 = 0
end
if RandomValue >= ScrollingPerfTrackerKibana1 then
	ScrollingPerfTrackerKibana1 = 0
end
if ScrollingPerfTrackerEventStream1 > 0 or ScrollingPerfTrackerKibana1 > 0 then
	local RunService = game:GetService("RunService")
	local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
	local ScrollingPerformanceModule = require(script.Parent.RobloxTelemetryConfigs.ScrollingPerformance)
	local v1 = nil
	v1 = if ScrollingPerfTrackerTargetFPS > 0 then 1 / ScrollingPerfTrackerTargetFPS else 0.016666666666666666
	local ScrollingPerfTrackerModule = {}
	ScrollingPerfTrackerModule.__index = ScrollingPerfTrackerModule
	
	function ScrollingPerfTrackerModule.new(Id, p1)
		-- upvalues: ScrollingPerfTrackerModule (copy)
		local config = {
			id = Id,
			lastScrollPosition = 0,
			histogram = {},
			sampleCount = 0,
			renderStepConn = nil,
			canvasPositionConn = nil,
			scrollingFrame = nil,
			totalScrollDistance = 0
		}
		
		if p1 then
			if p1.analyticsService then
				config.analyticsService = p1.analyticsService.EventStream
			end
			config.loggingProtocol = p1.loggingProtocol
		end
		return (setmetatable(config, ScrollingPerfTrackerModule))
	end
	
	function ScrollingPerfTrackerModule:eventData()
		-- upvalues: RbxAnalyticsService (copy)
		if self.sampleCount == 0 then
			return {}
		end
		local Smooth_ratio = (self.histogram[1] or 0) / self.sampleCount
		local X = 0
		local Y = 0
		
		if self.scrollingFrame then
			local AbsoluteSize = self.scrollingFrame.AbsoluteSize
			X = AbsoluteSize.X
			Y = AbsoluteSize.Y
		end
		return {
			component_id = self.id,
			sessionid = if RbxAnalyticsService then RbxAnalyticsService:GetSessionId() else "",
			smooth_ratio = Smooth_ratio,
			drop_count_0 = self.histogram[1] or 0,
			drop_count_1 = self.histogram[2] or 0,
			drop_count_2 = self.histogram[3] or 0,
			drop_count_3 = self.histogram[4] or 0,
			distance_pixels = math.ceil(self.totalScrollDistance),
			frame_width = X,
			frame_height = Y
		}
	end
	
	function ScrollingPerfTrackerModule:sendEvent()
		-- upvalues: ScrollingPerfTrackerSampleCountThreshold (copy), ScrollingPerfTrackerEventStream1 (ref), ScrollingPerfTrackerKibana1 (ref), ScrollingPerformanceModule (copy)
		if self.sampleCount < ScrollingPerfTrackerSampleCountThreshold or self.sampleCount == 0 then return end
		local EventDataResult = self:eventData()
		self:resetCounts()
		
		if ScrollingPerfTrackerEventStream1 > 0 and self.analyticsService then
			self.analyticsService:sendEventDeferred(self.id, "scrolling_performance", EventDataResult)
		end
		if ScrollingPerfTrackerKibana1 > 0 and self.loggingProtocol then
			self.loggingProtocol:logRobloxTelemetryEvent(ScrollingPerformanceModule, {}, EventDataResult)
		end
	end
	
	function ScrollingPerfTrackerModule:resetCounts()
		self.histogram = {}
		self.sampleCount = 0
		self.totalScrollDistance = 0
	end
	
	function ScrollingPerfTrackerModule:canvasPositionChanged()
		-- upvalues: RunService (copy)
		if not self.renderStepConn then
			self.renderStepConn = RunService.Heartbeat:Connect(function(DeltaTime)
				-- upvalues: self (copy)
				self:captureFrameUpdate(DeltaTime)
			end)
		end
	end
	
	function ScrollingPerfTrackerModule:captureFrameUpdate(p1: number)
		-- upvalues: v1 (ref)
		local Y = self.scrollingFrame and self.scrollingFrame.CanvasPosition.Y or 0
		
		if Y ~= self.lastScrollPosition then
			self.totalScrollDistance += math.abs(Y - self.lastScrollPosition)
			local Smallest = math.min(4, math.floor(math.max(0, p1 - 0.002) / v1) + 1)
			self.histogram[Smallest] = (self.histogram[Smallest] or 0) + 1
			self.lastScrollPosition = Y
			self.sampleCount += 1
			
			return
		end
		local RenderStepConn = self.renderStepConn
		
		if RenderStepConn then
			RenderStepConn:Disconnect()
		end
		self.renderStepConn = nil
		self:sendEvent()
	end
	
	function ScrollingPerfTrackerModule:setScrollingFrame(ScrollingFrame)
		if self.scrollingFrame ~= ScrollingFrame then
			self.scrollingFrame = ScrollingFrame
			local CanvasPositionConn = self.canvasPositionConn
			
			if ScrollingFrame then
				self.lastScrollPosition = ScrollingFrame.CanvasPosition.Y
				self.canvasPositionConn = ScrollingFrame:GetPropertyChangedSignal("CanvasPosition"):Connect(function(_, _, _)
					-- upvalues: self (copy)
					self:canvasPositionChanged()
				end)
			else
				self.canvasPositionConn = nil
			end
			if CanvasPositionConn then
				CanvasPositionConn:Disconnect()
			end
		end
	end
	
	function ScrollingPerfTrackerModule:clean()
		self:setScrollingFrame(nil)
		local RenderStepConn = self.renderStepConn
		
		if RenderStepConn then
			RenderStepConn:Disconnect()
		end
		self.renderStepConn = nil
		self:resetCounts()
	end
	
	return ScrollingPerfTrackerModule
else
	return nil
end