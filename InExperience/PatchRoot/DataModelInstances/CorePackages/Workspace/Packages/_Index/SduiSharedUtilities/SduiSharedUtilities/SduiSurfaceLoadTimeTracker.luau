local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local Parent = SduiSharedUtilities.Parent
local SduiLoadTimerModule = require(SduiSharedUtilities.SduiLoadTimer)
local TimeToInteractiveTracker = require(Parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local _ = require(SduiSharedUtilities.SduiPageAnalytics)
local GetSduiClientPageScopeFunction = require(Parent.SduiCoreSystem).getSduiClientPageScope
local FFlagEDPTTIParityDefinitions = require(Parent.SharedFlags).FFlagEDPTTIParityDefinitions
local Milestone = TimeToInteractiveTracker.Milestone

return {
	SURFACE_LOAD_TIME_PAGE_SCOPE_KEY = "__sduiSurfaceLoadTimeTracker",
	createLoadTimerWithSurfaceLoadTime = function(p1, p2, p3)
		-- upvalues: FFlagEDPTTIParityDefinitions (copy), SduiLoadTimerModule (copy), TimeToInteractiveTracker (copy), Milestone (copy), GetSduiClientPageScopeFunction (copy)
		local EventName = p2.eventName
		local IsManualSurfaceReady = p2.manualSurfaceReady == true
		local IsManualFunctionallyReady: boolean = FFlagEDPTTIParityDefinitions and p2.manualFunctionallyReady == true
		local LoadTimer = SduiLoadTimerModule.createLoadTimer(p1, p3)
		local Flag = false
		local t = {}
		
		local function trackOnce(Key)
			-- upvalues: t (copy), TimeToInteractiveTracker (upval), EventName (copy)
			if not t[Key] then
				t[Key] = true
				TimeToInteractiveTracker.trackMilestone(EventName, Key)
			end
		end
		
		local function trackSurfaceReady(p4)
			-- upvalues: t (copy), Milestone (upval), TimeToInteractiveTracker (upval), EventName (copy)
			if t[Milestone.SurfaceReady] then return end
			if p4 then
				TimeToInteractiveTracker.updateMetadata(EventName, p4)
			end
			local SurfaceReady = Milestone.SurfaceReady
			
			if not t[SurfaceReady] then
				t[SurfaceReady] = true
				TimeToInteractiveTracker.trackMilestone(EventName, SurfaceReady)
			end
			TimeToInteractiveTracker.trackEnd(EventName)
		end
		
		local function _()
			-- upvalues: Flag (ref), TimeToInteractiveTracker (upval), EventName (copy), p2 (copy)
			if not Flag then
				Flag = true
				TimeToInteractiveTracker.trackStart(EventName, true)
				
				if p2.metadata then
					TimeToInteractiveTracker.updateMetadata(EventName, p2.metadata)
				end
			end
		end
		
		local LogUiRequestSentFunction = LoadTimer.logUiRequestSent
		
		function LoadTimer.logUiRequestSent()
			-- upvalues: LogUiRequestSentFunction (copy), Flag (ref), TimeToInteractiveTracker (upval), EventName (copy), p2 (copy), Milestone (upval), t (copy)
			LogUiRequestSentFunction()
			
			if not Flag then
				Flag = true
				TimeToInteractiveTracker.trackStart(EventName, true)
				
				if p2.metadata then
					TimeToInteractiveTracker.updateMetadata(EventName, p2.metadata)
				end
			end
			local Name = Milestone.PrimaryDataStarted.Name
			
			if not t[Name] then
				t[Name] = true
				TimeToInteractiveTracker.trackMilestone(EventName, Name)
			end
		end
		
		local LogUiRequestQueuedFunction = LoadTimer.logUiRequestQueued
		
		function LoadTimer.logUiRequestQueued()
			-- upvalues: LogUiRequestQueuedFunction (copy), Flag (ref), TimeToInteractiveTracker (upval), EventName (copy), p2 (copy)
			LogUiRequestQueuedFunction()
			
			if not Flag then
				Flag = true
				TimeToInteractiveTracker.trackStart(EventName, true)
				
				if p2.metadata then
					TimeToInteractiveTracker.updateMetadata(EventName, p2.metadata)
				end
			end
		end
		
		local LogResponseDecodeBeginFunction = LoadTimer.logResponseDecodeBegin
		
		function LoadTimer.logResponseDecodeBegin()
			-- upvalues: LogResponseDecodeBeginFunction (copy), Milestone (upval), t (copy), TimeToInteractiveTracker (upval), EventName (copy)
			LogResponseDecodeBeginFunction()
			local Name = Milestone.PrimaryDataReady.Name
			
			if not t[Name] then
				t[Name] = true
				TimeToInteractiveTracker.trackMilestone(EventName, Name)
			end
			local Name1 = Milestone.DataProcessingStarted.Name
			
			if not t[Name1] then
				t[Name1] = true
				TimeToInteractiveTracker.trackMilestone(EventName, Name1)
			end
		end
		
		local LogComponentMountedFunction = LoadTimer.logComponentMounted
		
		function LoadTimer.logComponentMounted()
			-- upvalues: LogComponentMountedFunction (copy), Milestone (upval), t (copy), TimeToInteractiveTracker (upval), EventName (copy)
			LogComponentMountedFunction()
			local SurfaceMounted = Milestone.SurfaceMounted
			
			if not t[SurfaceMounted] then
				t[SurfaceMounted] = true
				TimeToInteractiveTracker.trackMilestone(EventName, SurfaceMounted)
			end
		end
		
		local LogComponentReadyFunction = LoadTimer.logComponentReady
		
		function LoadTimer.logComponentReady()
			-- upvalues: Milestone (upval), t (copy), TimeToInteractiveTracker (upval), EventName (copy), LogComponentReadyFunction (copy), IsManualFunctionallyReady (copy), IsManualSurfaceReady (copy)
			local Name = Milestone.DataProcessingCompleted.Name
			
			if not t[Name] then
				t[Name] = true
				TimeToInteractiveTracker.trackMilestone(EventName, Name)
			end
			LogComponentReadyFunction()
			
			if not IsManualFunctionallyReady then
				local FunctionallyReady = Milestone.FunctionallyReady
				
				if not t[FunctionallyReady] then
					t[FunctionallyReady] = true
					TimeToInteractiveTracker.trackMilestone(EventName, FunctionallyReady)
				end
			end
			if not IsManualSurfaceReady then
				if t[Milestone.SurfaceReady] then return end
				local SurfaceReady = Milestone.SurfaceReady
				
				if not t[SurfaceReady] then
					t[SurfaceReady] = true
					TimeToInteractiveTracker.trackMilestone(EventName, SurfaceReady)
				end
				TimeToInteractiveTracker.trackEnd(EventName)
			end
		end
		
		LoadTimer.trackOnce = trackOnce
		LoadTimer.trackSurfaceReady = trackSurfaceReady
		LoadTimer.surfaceLoadTimeEventName = EventName
		GetSduiClientPageScopeFunction(p1).set("__sduiSurfaceLoadTimeTracker", LoadTimer)
		
		if FFlagEDPTTIParityDefinitions and p2.startImmediately == true and not Flag then
			Flag = true
			TimeToInteractiveTracker.trackStart(EventName, true)
			
			if p2.metadata then
				TimeToInteractiveTracker.updateMetadata(EventName, p2.metadata)
			end
		end
		return LoadTimer
	end
}