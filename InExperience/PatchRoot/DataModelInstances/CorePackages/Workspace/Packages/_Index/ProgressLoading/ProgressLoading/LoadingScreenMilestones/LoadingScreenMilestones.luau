local parent = script:FindFirstAncestor("ProgressLoading").Parent
local constantsModule = require(script.Parent.Constants)
local _ = require(script.Parent.Types)
local loadingMilestoneTelemetryModule = require(script.Parent.LoadingMilestoneTelemetry)
local reportMilestoneError = loadingMilestoneTelemetryModule.reportMilestoneError
local abortReason = constantsModule.AbortReason
local outcome = constantsModule.Outcome
local TILT_EVENT_NAME = constantsModule.TILT_EVENT_NAME
local var1 = nil

local function _(p1)
	return (if p1.reducedMotion then "ReducedMotion_" else "") .. (if p1.holdEnabled then "HoldOn" else "HoldOff")
end

return {
	start = function(p1)
		-- upvalues: var1 (write), abortReason (ref), constantsModule (ref), loadingMilestoneTelemetryModule (ref), outcome (ref), parent (ref), TILT_EVENT_NAME (ref), reportMilestoneError (ref)
		if var1 then
			var1.abort(abortReason.Replaced)
		end
		local var2 = nil
		local t = nil
		local text = (if p1.reducedMotion then "ReducedMotion_" else "") .. (if p1.holdEnabled then "HoldOn" else "HoldOff")
		local t_1 = {
			category = constantsModule.CATEGORY,
			page = constantsModule.PAGE,
			subcategory = text
		}
		
		local function _()
			-- upvalues: var2 (write), loadingMilestoneTelemetryModule (copy)
			var2 = nil
			
			return if var2 then loadingMilestoneTelemetryModule.discardMilestoneTracker(var2) else true
		end
		
		local _ = function(p2)
			-- upvalues: loadingMilestoneTelemetryModule (copy), t_1 (write)
			loadingMilestoneTelemetryModule.countMilestonesOutcome(t_1, p2)
		end
		
		t = {
			complete = function()
				-- upvalues: var1 (copy), t (write), outcome (copy), var2 (write), loadingMilestoneTelemetryModule (copy), t_1 (write)
				if var1 ~= t then return end
				var1 = nil
				local completed = outcome.Completed
				
				if var2 and not loadingMilestoneTelemetryModule.completeMilestoneTracker(var2) then
					var2 = nil
					
					if var2 then
						local _ = loadingMilestoneTelemetryModule.discardMilestoneTracker(var2)
					end
					completed = outcome.InstrumentationError
				end
				var2 = nil
				loadingMilestoneTelemetryModule.countMilestonesOutcome(t_1, completed)
			end,
			abort = function(p2)
				-- upvalues: var1 (copy), t (write), var2 (write), loadingMilestoneTelemetryModule (copy), outcome (copy), t_1 (write)
				if var1 == t then
					var1 = nil
					var2 = nil
					loadingMilestoneTelemetryModule.countMilestonesOutcome(t_1, if if var2 then loadingMilestoneTelemetryModule.discardMilestoneTracker(var2) else true then p2 else outcome.InstrumentationError)
					
					return
				end
			end
		}
		var1 = t
		local ok, status = xpcall(function()
			-- upvalues: t_1 (write), loadingMilestoneTelemetryModule (copy), text (ref), parent (copy), var2 (write), TILT_EVENT_NAME (copy)
			t_1 = loadingMilestoneTelemetryModule.getMilestoneSessionMetadata(text)
			
			if loadingMilestoneTelemetryModule.countMilestonesStarted(t_1) then
				local timeToInteractiveTracker = require(parent.TimeToInteractiveTracker).TimeToInteractiveTracker
				var2 = timeToInteractiveTracker
				timeToInteractiveTracker.trackStart(TILT_EVENT_NAME)
				timeToInteractiveTracker.updateMetadata(TILT_EVENT_NAME, {
					category = t_1.category,
					page = t_1.page,
					subcategory = t_1.subcategory
				})
				
				return true
			end
			return false
		end, reportMilestoneError)
		
		if ok and status then
			return t
		end
		t.abort(abortReason.InitializationFailed)
		
		return nil
	end,
	AbortReason = abortReason
}