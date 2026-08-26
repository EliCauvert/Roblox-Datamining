local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local parent = sduiSharedUtilities.Parent
local sduiLoadTimerModule = require(sduiSharedUtilities.SduiLoadTimer)
local timeToInteractiveTracker = require(parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local _ = require(sduiSharedUtilities.SduiPageAnalytics)
local getSduiClientPageScope = require(parent.SduiCoreSystem).getSduiClientPageScope
local milestone = timeToInteractiveTracker.Milestone

return {
	SURFACE_LOAD_TIME_PAGE_SCOPE_KEY = "__sduiSurfaceLoadTimeTracker",
	createLoadTimerWithSurfaceLoadTime = function(p1, p2, p3)
		-- upvalues: sduiLoadTimerModule (ref), timeToInteractiveTracker (ref), milestone (ref), getSduiClientPageScope (ref)
		local eventName = p2.eventName
		local var1 = p2.manualSurfaceReady == true
		local var2 = sduiLoadTimerModule.createLoadTimer(p1, p3)
		local var3 = false
		local t = {}
		
		local function trackOnce(p4)
			-- upvalues: t (ref), timeToInteractiveTracker (copy), eventName (ref)
			if not t[p4] then
				t[p4] = true
				timeToInteractiveTracker.trackMilestone(eventName, p4)
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
			-- upvalues: var3 (write), timeToInteractiveTracker (copy), eventName (ref), p2 (ref)
			if not var3 then
				var3 = true
				timeToInteractiveTracker.trackStart(eventName, true)
				
				if p2.metadata then
					timeToInteractiveTracker.updateMetadata(eventName, p2.metadata)
				end
			end
		end
		
		local logUiRequestSent = var2.logUiRequestSent
		
		function var3.logUiRequestSent()
			-- upvalues: logUiRequestSent (ref), var3 (write), timeToInteractiveTracker (copy), eventName (ref), p2 (ref), milestone (copy), t (ref)
			logUiRequestSent()
			
			if not var3 then
				var3 = true
				timeToInteractiveTracker.trackStart(eventName, true)
				
				if p2.metadata then
					timeToInteractiveTracker.updateMetadata(eventName, p2.metadata)
				end
			end
			local name = milestone.PrimaryDataStarted.Name
			
			if not t[name] then
				t[name] = true
				timeToInteractiveTracker.trackMilestone(eventName, name)
			end
		end
		
		local logUiRequestQueued = var2.logUiRequestQueued
		
		function var3.logUiRequestQueued()
			-- upvalues: logUiRequestQueued (ref), var3 (write), timeToInteractiveTracker (copy), eventName (ref), p2 (ref)
			logUiRequestQueued()
			
			if not var3 then
				var3 = true
				timeToInteractiveTracker.trackStart(eventName, true)
				
				if p2.metadata then
					timeToInteractiveTracker.updateMetadata(eventName, p2.metadata)
				end
			end
		end
		
		local logResponseDecodeBegin = var2.logResponseDecodeBegin
		
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
		
		local logComponentMounted = var2.logComponentMounted
		
		function var3.logComponentMounted()
			-- upvalues: logComponentMounted (ref), milestone (copy), t (ref), timeToInteractiveTracker (copy), eventName (ref)
			logComponentMounted()
			local surfaceMounted = milestone.SurfaceMounted
			
			if not t[surfaceMounted] then
				t[surfaceMounted] = true
				timeToInteractiveTracker.trackMilestone(eventName, surfaceMounted)
			end
		end
		
		local logComponentReady = var2.logComponentReady
		
		function var3.logComponentReady()
			-- upvalues: milestone (copy), t (ref), timeToInteractiveTracker (copy), eventName (ref), logComponentReady (ref), var1 (ref)
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
			if not var1 then
				if t[milestone.SurfaceReady] then return end
				local surfaceReady = milestone.SurfaceReady
				
				if not t[surfaceReady] then
					t[surfaceReady] = true
					timeToInteractiveTracker.trackMilestone(eventName, surfaceReady)
				end
				timeToInteractiveTracker.trackEnd(eventName)
			end
		end
		
		var2.trackOnce = trackOnce
		var2.trackSurfaceReady = trackSurfaceReady
		var2.surfaceLoadTimeEventName = eventName
		getSduiClientPageScope(p1).set("__sduiSurfaceLoadTimeTracker", var2)
		
		return var2
	end
}