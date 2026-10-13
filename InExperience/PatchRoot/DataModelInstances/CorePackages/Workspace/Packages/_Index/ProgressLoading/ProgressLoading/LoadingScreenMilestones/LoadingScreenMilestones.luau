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
		local text = (if p1.reducedMotion then "ReducedMotion_" else "") .. (if p1.holdEnabled then "HoldOn" else "HoldOff")
		local t_2 = {
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
			-- upvalues: loadingMilestoneTelemetryModule (copy), t_2 (write)
			loadingMilestoneTelemetryModule.countMilestonesOutcome(t_2, p2)
		end
		
		local _ = function(p2, p3)
			-- upvalues: var1 (copy), t (write), t_1 (ref), var2 (write), loadingMilestoneTrackerModule (copy), outcome (copy), loadingMilestoneTelemetryModule (copy), t_2 (write)
			local var4 = if p3 then p2 .. "/" .. p4 else p2
			
			if var1 ~= t or t_1[var4] then return end
			t_1[var4] = true
			
			if var2 and not loadingMilestoneTrackerModule.recordMilestone(var2, p2, p3) then
				var1 = nil
				var2 = nil
				
				if var2 then
					local _ = loadingMilestoneTrackerModule.discardMilestoneTracker(var2)
				end
				loadingMilestoneTelemetryModule.countMilestonesOutcome(t_2, outcome.InstrumentationError)
			end
		end
		
		t = {
			dismissRequested = function(p2)
				-- upvalues: var1 (copy), t (write), var3 (write), milestone (copy), t_1 (ref), var2 (write), loadingMilestoneTrackerModule (copy), outcome (copy), loadingMilestoneTelemetryModule (copy), t_2 (write)
				if var1 == t then
					var3 = var3 or p2
				end
				local dismissRequested = milestone.DismissRequested
				local var4 = if p2 then dismissRequested .. "/" .. p5 else dismissRequested
				
				if var1 == t then
					if t_1[var4] then return end
					t_1[var4] = true
					local var5 = var2
					
					if var5 and not loadingMilestoneTrackerModule.recordMilestone(var5, dismissRequested, p2) then
						var1 = nil
						var2 = nil
						
						if var2 then
							local _ = loadingMilestoneTrackerModule.discardMilestoneTracker(var2)
						end
						loadingMilestoneTelemetryModule.countMilestonesOutcome(t_2, outcome.InstrumentationError)
					end
				end
			end,
			contentVisible = function(p2)
				-- upvalues: t_1 (ref), milestone (copy), var1 (copy), t (write), var2 (write), loadingMilestoneTrackerModule (copy), outcome (copy), loadingMilestoneTelemetryModule (copy), t_2 (write)
				if not t_1[milestone.ScreenVisible] or t_1[milestone.DismissStarted] then return end
				local contentVisible = milestone.ContentVisible
				local var4 = if p2 then contentVisible .. "/" .. p6 else contentVisible
				
				if var1 == t then
					if t_1[var4] then return end
					t_1[var4] = true
					local var5 = var2
					
					if var5 and not loadingMilestoneTrackerModule.recordMilestone(var5, contentVisible, p2) then
						var1 = nil
						var2 = nil
						
						if var2 then
							local _ = loadingMilestoneTrackerModule.discardMilestoneTracker(var2)
						end
						loadingMilestoneTelemetryModule.countMilestonesOutcome(t_2, outcome.InstrumentationError)
					end
				end
			end,
			record = function(p2)
				-- upvalues: var1 (copy), t (write), t_1 (ref), var2 (write), loadingMilestoneTrackerModule (copy), outcome (copy), loadingMilestoneTelemetryModule (copy), t_2 (write)
				if var1 == t then
					if t_1[p2] then return end
					t_1[p2] = true
					local var4 = var2
					
					if var4 and not loadingMilestoneTrackerModule.recordMilestone(var4, p2, nil) then
						var1 = nil
						var2 = nil
						
						if var2 then
							local _ = loadingMilestoneTrackerModule.discardMilestoneTracker(var2)
						end
						loadingMilestoneTelemetryModule.countMilestonesOutcome(t_2, outcome.InstrumentationError)
					end
				end
			end,
			complete = function()
				-- upvalues: var1 (copy), t (write), outcome (copy), var2 (write), loadingMilestoneTrackerModule (copy), var3 (write), t_1 (ref), milestone (copy), text (ref), constantsModule (copy), loadingMilestoneTelemetryModule (copy), t_2 (write)
				if var1 ~= t then return end
				var1 = nil
				local completed = outcome.Completed
				
				if var2 then
					local completeMilestoneTracker = loadingMilestoneTrackerModule.completeMilestoneTracker
					local var4 = var3 ~= nil and t_1[milestone.DismissStarted] == true
					completeMilestoneTracker, var19, var18 = completeMilestoneTracker(var2, var4, var3, text == "HoldOn" and var3 == constantsModule.DismissSource.NormalReady)
					
					if completeMilestoneTracker and var19 ~= nil and var3 then
						completeMilestoneTracker = loadingMilestoneTelemetryModule.reportAddedWait(t_2, var19, var3)
					end
					if completeMilestoneTracker and t_1[milestone.ScreenVisible] and t_1[milestone.DismissStarted] then
						completeMilestoneTracker = loadingMilestoneTelemetryModule.reportContentVisibility(t_2, t_1[milestone.ContentVisible .. "/" .. constantsModule.ContentId.Title] == true, t_1[milestone.ContentVisible .. "/" .. constantsModule.ContentId.Creator] == true, t_1[milestone.ContentVisible .. "/" .. constantsModule.ContentId.Thumbnail] == true)
					end
					if completeMilestoneTracker and var4 ~= nil then
						completeMilestoneTracker = loadingMilestoneTelemetryModule.reportHoldGateHit(t_2, var4)
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
				loadingMilestoneTelemetryModule.countMilestonesOutcome(t_2, completed)
			end,
			abort = function(p2)
				-- upvalues: var1 (copy), t (write), var2 (write), loadingMilestoneTrackerModule (copy), outcome (copy), loadingMilestoneTelemetryModule (copy), t_2 (write)
				if var1 == t then
					var1 = nil
					var2 = nil
					loadingMilestoneTelemetryModule.countMilestonesOutcome(t_2, if if var2 then loadingMilestoneTrackerModule.discardMilestoneTracker(var2) else true then p2 else outcome.InstrumentationError)
					
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