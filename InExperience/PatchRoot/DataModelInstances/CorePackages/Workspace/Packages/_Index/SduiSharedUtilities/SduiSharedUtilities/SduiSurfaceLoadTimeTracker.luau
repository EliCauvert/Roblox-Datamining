local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local parent = sduiSharedUtilities.Parent
local sduiLoadTimerModule = require(sduiSharedUtilities.SduiLoadTimer)
local timeToInteractiveTracker = require(parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local _ = require(sduiSharedUtilities.SduiPageAnalytics)
local getSduiClientPageScope = require(parent.SduiCoreSystem).getSduiClientPageScope
local milestone = timeToInteractiveTracker.Milestone

return {
	SURFACE_LOAD_TIME_PAGE_SCOPE_KEY = "__sduiSurfaceLoadTimeTracker",
	createLoadTimerWithSurfaceLoadTime = function(p0, p1, p2)
		-- upvalues: sduiLoadTimerModule (ref), timeToInteractiveTracker (ref), milestone (ref), getSduiClientPageScope (ref)
		local eventName = p1.eventName
		local var2 = p1.manualSurfaceReady == true
		local var3 = sduiLoadTimerModule.createLoadTimer(p0, p2)
		local var4 = false
		local t = {}
		
		local function trackOnce(p3)
			-- upvalues: t (ref), timeToInteractiveTracker (copy), eventName (ref)
			if not t[p3] then
				t[p3] = true
				timeToInteractiveTracker.trackMilestone(eventName, p3)
			end
		end
		
		local function trackSurfaceReady(p4)
			-- upvalues: t (ref), milestone (copy), timeToInteractiveTracker (copy), eventName (ref)
			if t[milestone.SurfaceReady] then return end
			if p4 then
				timeToInteractiveTracker.updateMetadata(eventName, p4)
			end
			local surfaceReady = milestone.SurfaceReady
			
			if not t[surfaceReady] then
				t[surfaceReady] = true
				timeToInteractiveTracker.trackMilestone(eventName, surfaceReady)
			end
			timeToInteractiveTracker.trackEnd(eventName)
		end
		
		local function _()
			-- upvalues: var4 (write), timeToInteractiveTracker (copy), eventName (ref), p1 (ref)
			if not var4 then
				var4 = true
				timeToInteractiveTracker.trackStart(eventName, true)
				
				if p1.metadata then
					timeToInteractiveTracker.updateMetadata(eventName, p1.metadata)
				end
			end
		end
		
		local logUiRequestSent = var3.logUiRequestSent
		
		function var3.logUiRequestSent()
			-- upvalues: logUiRequestSent (ref), var4 (write), timeToInteractiveTracker (copy), eventName (ref), p1 (ref), milestone (copy), t (ref)
			logUiRequestSent()
			
			if not var4 then
				var4 = true
				timeToInteractiveTracker.trackStart(eventName, true)
				
				if p1.metadata then
					timeToInteractiveTracker.updateMetadata(eventName, p1.metadata)
				end
			end
			local name = milestone.PrimaryDataStarted.Name
			
			if not t[name] then
				t[name] = true
				timeToInteractiveTracker.trackMilestone(eventName, name)
			end
		end
		
		local logUiRequestQueued = var3.logUiRequestQueued
		
		function var3.logUiRequestQueued()
			-- upvalues: logUiRequestQueued (ref), var4 (write), timeToInteractiveTracker (copy), eventName (ref), p1 (ref)
			logUiRequestQueued()
			
			if not var4 then
				var4 = true
				timeToInteractiveTracker.trackStart(eventName, true)
				
				if p1.metadata then
					timeToInteractiveTracker.updateMetadata(eventName, p1.metadata)
				end
			end
		end
		
		local logResponseDecodeBegin = var3.logResponseDecodeBegin
		
		function var3.logResponseDecodeBegin()
			-- upvalues: logResponseDecodeBegin (ref), milestone (copy), t (ref), timeToInteractiveTracker (copy), eventName (ref)
			logResponseDecodeBegin()
			local name = milestone.PrimaryDataReady.Name
			
			if not t[name] then
				t[name] = true
				timeToInteractiveTracker.trackMilestone(eventName, name)
			end
			local name_1 = milestone.DataProcessingStarted.Name
			
			if not t[name_1] then
				t[name_1] = true
				timeToInteractiveTracker.trackMilestone(eventName, name_1)
			end
		end
		
		local logComponentMounted = var3.logComponentMounted
		
		function var3.logComponentMounted()
			-- upvalues: logComponentMounted (ref), milestone (copy), t (ref), timeToInteractiveTracker (copy), eventName (ref)
			logComponentMounted()
			local surfaceMounted = milestone.SurfaceMounted
			
			if not t[surfaceMounted] then
				t[surfaceMounted] = true
				timeToInteractiveTracker.trackMilestone(eventName, surfaceMounted)
			end
		end
		
		local logComponentReady = var3.logComponentReady
		
		function var3.logComponentReady()
			-- upvalues: milestone (copy), t (ref), timeToInteractiveTracker (copy), eventName (ref), logComponentReady (ref), var2 (ref)
			local name = milestone.DataProcessingCompleted.Name
			
			if not t[name] then
				t[name] = true
				timeToInteractiveTracker.trackMilestone(eventName, name)
			end
			logComponentReady()
			local functionallyReady = milestone.FunctionallyReady
			
			if not t[functionallyReady] then
				t[functionallyReady] = true
				timeToInteractiveTracker.trackMilestone(eventName, functionallyReady)
			end
			if not var2 then
				if t[milestone.SurfaceReady] then return end
				local surfaceReady = milestone.SurfaceReady
				
				if not t[surfaceReady] then
					t[surfaceReady] = true
					timeToInteractiveTracker.trackMilestone(eventName, surfaceReady)
				end
				timeToInteractiveTracker.trackEnd(eventName)
			end
		end
		
		var3.trackOnce = trackOnce
		var3.trackSurfaceReady = trackSurfaceReady
		var3.surfaceLoadTimeEventName = eventName
		getSduiClientPageScope(p0).set("__sduiSurfaceLoadTimeTracker", var3)
		
		return var3
	end
}