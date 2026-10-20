local Parent = script:FindFirstAncestor("ProgressLoading").Parent
local ConstantsModule = require(script.Parent.Constants)
local _ = require(script.Parent.Types)
local LoadingMilestoneTelemetryModule = require(script.Parent.LoadingMilestoneTelemetry)
local LoadingMilestoneTrackerModule = require(script.Parent.LoadingMilestoneTracker)
local TryMilestoneOperationModule = require(script.Parent.tryMilestoneOperation)
local AbortReason = ConstantsModule.AbortReason
local Outcome = ConstantsModule.Outcome
local Milestone = ConstantsModule.Milestone
local v1 = nil

local function _(p1): string
	-- upvalues: ConstantsModule (copy)
	return (if p1.host == ConstantsModule.Host.DeferredJoin then "DeferredJoin_" else "") .. (if p1.reducedMotion then "ReducedMotion_" else "") .. (if p1.holdEnabled then "HoldOn" else "HoldOff")
end

return {
	start = function(p1)
		-- upvalues: v1 (ref), AbortReason (copy), ConstantsModule (copy), LoadingMilestoneTrackerModule (copy), LoadingMilestoneTelemetryModule (copy), Outcome (copy), Milestone (copy), TryMilestoneOperationModule (copy), Parent (copy)
		if v1 then
			v1.abort(AbortReason.Replaced)
		end
		local v2 = nil
		local v3 = nil
		local NormalReady = nil
		local t = {}
		local Text = (if p1.host == ConstantsModule.Host.DeferredJoin then "DeferredJoin_" else "") .. (if p1.reducedMotion then "ReducedMotion_" else "") .. (if p1.holdEnabled then "HoldOn" else "HoldOff")
		local MilestoneSessionMetadata = {
			category = ConstantsModule.CATEGORY,
			page = ConstantsModule.PAGE,
			subcategory = Text
		}
		
		local function _()
			-- upvalues: v2 (ref), LoadingMilestoneTrackerModule (upval)
			local v4 = v2
			v2 = nil
			
			return not v4 or LoadingMilestoneTrackerModule.discardMilestoneTracker(v4)
		end
		
		local _ = function(p2)
			-- upvalues: LoadingMilestoneTelemetryModule (upval), MilestoneSessionMetadata (ref)
			LoadingMilestoneTelemetryModule.countMilestonesOutcome(MilestoneSessionMetadata, p2)
		end
		
		local _ = function(Text, Text1)
			-- upvalues: v1 (upval), v3 (ref), t (copy), v2 (ref), LoadingMilestoneTrackerModule (upval), Outcome (upval), LoadingMilestoneTelemetryModule (upval), MilestoneSessionMetadata (ref)
			local Text2 = if Text1 then Text .. "/" .. Text1 else Text
			
			if v1 ~= v3 or t[Text2] then return end
			t[Text2] = true
			local v4 = v2
			
			if v4 and not LoadingMilestoneTrackerModule.recordMilestone(v4, Text, Text1) then
				v1 = nil
				local v5 = v2
				v2 = nil
				
				if v5 then
					local _ = LoadingMilestoneTrackerModule.discardMilestoneTracker(v5)
				end
				LoadingMilestoneTelemetryModule.countMilestonesOutcome(MilestoneSessionMetadata, Outcome.InstrumentationError)
			end
		end
		
		v3 = {
			dismissRequested = function(Text)
				-- upvalues: v1 (upval), v3 (ref), NormalReady (ref), Milestone (upval), t (copy), v2 (ref), LoadingMilestoneTrackerModule (upval), Outcome (upval), LoadingMilestoneTelemetryModule (upval), MilestoneSessionMetadata (ref)
				if v1 == v3 then
					NormalReady = NormalReady or Text
				end
				local DismissRequested = Milestone.DismissRequested
				local Text1 = if Text then DismissRequested .. "/" .. Text else DismissRequested
				
				if v1 == v3 then
					if t[Text1] then return end
					t[Text1] = true
					local v4 = v2
					
					if v4 and not LoadingMilestoneTrackerModule.recordMilestone(v4, DismissRequested, Text) then
						v1 = nil
						local v5 = v2
						v2 = nil
						
						if v5 then
							local _ = LoadingMilestoneTrackerModule.discardMilestoneTracker(v5)
						end
						LoadingMilestoneTelemetryModule.countMilestonesOutcome(MilestoneSessionMetadata, Outcome.InstrumentationError)
					end
				end
			end,
			contentVisible = function(Text)
				-- upvalues: t (copy), Milestone (upval), v1 (upval), v3 (ref), v2 (ref), LoadingMilestoneTrackerModule (upval), Outcome (upval), LoadingMilestoneTelemetryModule (upval), MilestoneSessionMetadata (ref)
				if not t[Milestone.ScreenVisible] or t[Milestone.DismissStarted] then return end
				local ContentVisible = Milestone.ContentVisible
				local Text1 = if Text then ContentVisible .. "/" .. Text else ContentVisible
				
				if v1 == v3 then
					if t[Text1] then return end
					t[Text1] = true
					local v4 = v2
					
					if v4 and not LoadingMilestoneTrackerModule.recordMilestone(v4, ContentVisible, Text) then
						v1 = nil
						local v5 = v2
						v2 = nil
						
						if v5 then
							local _ = LoadingMilestoneTrackerModule.discardMilestoneTracker(v5)
						end
						LoadingMilestoneTelemetryModule.countMilestonesOutcome(MilestoneSessionMetadata, Outcome.InstrumentationError)
					end
				end
			end,
			record = function(Key)
				-- upvalues: v1 (upval), v3 (ref), t (copy), v2 (ref), LoadingMilestoneTrackerModule (upval), Outcome (upval), LoadingMilestoneTelemetryModule (upval), MilestoneSessionMetadata (ref)
				if v1 == v3 then
					if t[Key] then return end
					t[Key] = true
					local v4 = v2
					
					if v4 and not LoadingMilestoneTrackerModule.recordMilestone(v4, Key, nil) then
						v1 = nil
						local v5 = v2
						v2 = nil
						
						if v5 then
							local _ = LoadingMilestoneTrackerModule.discardMilestoneTracker(v5)
						end
						LoadingMilestoneTelemetryModule.countMilestonesOutcome(MilestoneSessionMetadata, Outcome.InstrumentationError)
					end
				end
			end,
			complete = function()
				-- upvalues: v1 (upval), v3 (ref), Outcome (upval), v2 (ref), LoadingMilestoneTrackerModule (upval), NormalReady (ref), t (copy), Milestone (upval), Text (copy), ConstantsModule (upval), LoadingMilestoneTelemetryModule (upval), MilestoneSessionMetadata (ref)
				if v1 ~= v3 then return end
				v1 = nil
				local Completed = Outcome.Completed
				local v4 = v2
				
				if v4 then
					local CompleteMilestoneTrackerResult, CompleteMilestoneTrackerResult2, CompleteMilestoneTrackerResult3 = LoadingMilestoneTrackerModule.completeMilestoneTracker(v4, NormalReady ~= nil and t[Milestone.DismissStarted] == true, NormalReady, Text == "HoldOn" and NormalReady == ConstantsModule.DismissSource.NormalReady)
					
					if CompleteMilestoneTrackerResult and CompleteMilestoneTrackerResult2 ~= nil and NormalReady then
						CompleteMilestoneTrackerResult = LoadingMilestoneTelemetryModule.reportAddedWait(MilestoneSessionMetadata, CompleteMilestoneTrackerResult2, NormalReady)
					end
					if CompleteMilestoneTrackerResult and t[Milestone.ScreenVisible] and t[Milestone.DismissStarted] then
						CompleteMilestoneTrackerResult = LoadingMilestoneTelemetryModule.reportContentVisibility(MilestoneSessionMetadata, t[Milestone.ContentVisible .. "/" .. ConstantsModule.ContentId.Title] == true, t[Milestone.ContentVisible .. "/" .. ConstantsModule.ContentId.Creator] == true, t[Milestone.ContentVisible .. "/" .. ConstantsModule.ContentId.Thumbnail] == true)
					end
					if CompleteMilestoneTrackerResult and CompleteMilestoneTrackerResult3 ~= nil then
						CompleteMilestoneTrackerResult = LoadingMilestoneTelemetryModule.reportHoldGateHit(MilestoneSessionMetadata, CompleteMilestoneTrackerResult3)
					end
					if not CompleteMilestoneTrackerResult then
						local v5 = v2
						v2 = nil
						
						if v5 then
							local _ = LoadingMilestoneTrackerModule.discardMilestoneTracker(v5)
						end
						Completed = Outcome.InstrumentationError
					end
				end
				v2 = nil
				LoadingMilestoneTelemetryModule.countMilestonesOutcome(MilestoneSessionMetadata, Completed)
			end,
			abort = function(InitializationFailed)
				-- upvalues: v1 (upval), v3 (ref), v2 (ref), LoadingMilestoneTrackerModule (upval), Outcome (upval), LoadingMilestoneTelemetryModule (upval), MilestoneSessionMetadata (ref)
				if v1 == v3 then
					v1 = nil
					local v4 = v2
					v2 = nil
					local NoV46 = not v4 or LoadingMilestoneTrackerModule.discardMilestoneTracker(v4)
					LoadingMilestoneTelemetryModule.countMilestonesOutcome(MilestoneSessionMetadata, if NoV46 then InitializationFailed else Outcome.InstrumentationError)
					
					return
				end
			end
		}
		v1 = v3
		local StartMilestoneTrackerResult = false
		
		if TryMilestoneOperationModule(function()
			-- upvalues: MilestoneSessionMetadata (ref), LoadingMilestoneTelemetryModule (upval), Text (copy), Parent (upval), v2 (ref), StartMilestoneTrackerResult (ref), LoadingMilestoneTrackerModule (upval)
			MilestoneSessionMetadata = LoadingMilestoneTelemetryModule.getMilestoneSessionMetadata(Text)
			
			if LoadingMilestoneTelemetryModule.countMilestonesStarted(MilestoneSessionMetadata) then
				local TimeToInteractiveTracker = require(Parent.TimeToInteractiveTracker).TimeToInteractiveTracker
				v2 = TimeToInteractiveTracker
				StartMilestoneTrackerResult = LoadingMilestoneTrackerModule.startMilestoneTracker(TimeToInteractiveTracker, MilestoneSessionMetadata)
				
				return
			end
		end) and StartMilestoneTrackerResult then
			return v3
		else
			v3.abort(AbortReason.InitializationFailed)
			
			return nil
		end
	end,
	AbortReason = AbortReason
}