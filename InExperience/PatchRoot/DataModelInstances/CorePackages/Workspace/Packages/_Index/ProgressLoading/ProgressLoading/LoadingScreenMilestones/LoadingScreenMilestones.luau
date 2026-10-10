local parent = script:FindFirstAncestor("ProgressLoading").Parent
local constantsModule = require(script.Parent.Constants)
local _ = require(script.Parent.Types)
local loadingMilestoneTelemetryModule = require(script.Parent.LoadingMilestoneTelemetry)
local loadingMilestoneTrackerModule = require(script.Parent.LoadingMilestoneTracker)
local tryMilestoneOperationModule = require(script.Parent.tryMilestoneOperation)
local abortReason = constantsModule.AbortReason
local outcome = constantsModule.Outcome
local milestone = constantsModule.Milestone
local var1 = nil

local function _(p1)
	return (if p1.reducedMotion then "ReducedMotion_" else "") .. (if p1.holdEnabled then "HoldOn" else "HoldOff")
end

return {
	start = function(p1)
		-- upvalues: var1 (write), abortReason (ref), constantsModule (ref), loadingMilestoneTrackerModule (ref), loadingMilestoneTelemetryModule (ref), outcome (ref), milestone (ref), tryMilestoneOperationModule (ref), parent (ref)
		if var1 then
			var1.abort(abortReason.Replaced)
		end
		local var2 = nil
		local t = nil
		local var3 = nil
		local t_1 = {}
		local t_2 = {}
		local text = (if p1.reducedMotion then "ReducedMotion_" else "") .. (if p1.holdEnabled then "HoldOn" else "HoldOff")
		local t_3 = {
			category = constantsModule.CATEGORY,
			page = constantsModule.PAGE,
			subcategory = text
		}
		
		local function _()
			-- upvalues: var2 (write), loadingMilestoneTrackerModule (copy)
			var2 = nil
			
			return if var2 then loadingMilestoneTrackerModule.discardMilestoneTracker(var2) else true
		end
		
		local _ = function(p2)
			-- upvalues: loadingMilestoneTelemetryModule (copy), t_3 (write)
			loadingMilestoneTelemetryModule.countMilestonesOutcome(t_3, p2)
		end
		
		local function record(p2, p3)
			-- upvalues: t_1 (ref), t_2 (ref), var1 (copy), t (write), var3 (write), var2 (write), loadingMilestoneTrackerModule (copy), outcome (copy), loadingMilestoneTelemetryModule (copy), t_3 (write)
			if var1 ~= t or (if p3 then t_1[p3] else t_2[p2]) then return end
			if p3 then
				var3 = var3 or p3
				t_1[p3] = true
			else
				t_2[p2] = true
			end
			if var2 and not loadingMilestoneTrackerModule.recordMilestone(var2, p2, p3) then
				var1 = nil
				var2 = nil
				
				if var2 then
					local _ = loadingMilestoneTrackerModule.discardMilestoneTracker(var2)
				end
				loadingMilestoneTelemetryModule.countMilestonesOutcome(t_3, outcome.InstrumentationError)
			end
		end
		
		t = {
			dismissRequested = function(p2)
				-- upvalues: record (ref), milestone (copy)
				record(milestone.DismissRequested, p2)
			end,
			record = function(p2)
				-- upvalues: t_2 (ref), var1 (copy), t (write), var2 (write), loadingMilestoneTrackerModule (copy), outcome (copy), loadingMilestoneTelemetryModule (copy), t_3 (write)
				local var4 = t_2[p2]
				
				if var1 == t then
					if var4 then return end
					t_2[p2] = true
					local var5 = var2
					
					if var5 and not loadingMilestoneTrackerModule.recordMilestone(var5, p2, nil) then
						var1 = nil
						var2 = nil
						
						if var2 then
							local _ = loadingMilestoneTrackerModule.discardMilestoneTracker(var2)
						end
						loadingMilestoneTelemetryModule.countMilestonesOutcome(t_3, outcome.InstrumentationError)
					end
				end
			end,
			complete = function()
				-- upvalues: var1 (copy), t (write), outcome (copy), var2 (write), loadingMilestoneTrackerModule (copy), var3 (write), t_2 (ref), milestone (copy), loadingMilestoneTelemetryModule (copy), t_3 (write)
				if var1 ~= t then return end
				var1 = nil
				local completed = outcome.Completed
				
				if var2 then
					local completeMilestoneTracker = loadingMilestoneTrackerModule.completeMilestoneTracker
					completeMilestoneTracker, var16 = completeMilestoneTracker(var2, var3 ~= nil and t_2[milestone.DismissStarted] == true)
					
					if completeMilestoneTracker and var16 ~= nil and var3 then
						completeMilestoneTracker = loadingMilestoneTelemetryModule.reportAddedWait(t_3, var16, var3)
					end
					if not completeMilestoneTracker then
						var2 = nil
						
						if var2 then
							local _ = loadingMilestoneTrackerModule.discardMilestoneTracker(var2)
						end
						completed = outcome.InstrumentationError
					end
				end
				var2 = nil
				loadingMilestoneTelemetryModule.countMilestonesOutcome(t_3, completed)
			end,
			abort = function(p2)
				-- upvalues: var1 (copy), t (write), var2 (write), loadingMilestoneTrackerModule (copy), outcome (copy), loadingMilestoneTelemetryModule (copy), t_3 (write)
				if var1 == t then
					var1 = nil
					var2 = nil
					loadingMilestoneTelemetryModule.countMilestonesOutcome(t_3, if if var2 then loadingMilestoneTrackerModule.discardMilestoneTracker(var2) else true then p2 else outcome.InstrumentationError)
					
					return
				end
			end
		}
		var1 = t
		local var4 = false
		t.abort(abortReason.InitializationFailed)
		
		return nil
	end,
	AbortReason = abortReason
}