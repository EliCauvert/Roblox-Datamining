local ProgressLoading = script:FindFirstAncestor("ProgressLoading")
local _ = ProgressLoading.Parent
local _ = require(script.Parent.Types)
local ConstantsModule = require(script.Parent.Constants)
local TryMilestoneOperationModule = require(script.Parent.tryMilestoneOperation)
local FIntLoadingScreenMilestonesSampleRateModule = require(ProgressLoading.Flags.FIntLoadingScreenMilestonesSampleRate)

local function getAddedWait(p1) --[[ Line: 31 ]]
	-- upvalues: ConstantsModule (copy)
	local Event = p1.getEvents(false)[ConstantsModule.EVENT_NAME]
	local DeltaMs = nil
	local DeltaMs1 = nil
	
	if Event and Event.milestones then
		for _, milestone in Event.milestones do
			local Name = milestone.name
			
			if Name == ConstantsModule.Milestone.DismissRequested and DeltaMs == nil then
				DeltaMs = milestone.deltaMs
			elseif Name == ConstantsModule.Milestone.DismissStarted then
				DeltaMs1 = milestone.deltaMs
			end
		end
	end
	return if DeltaMs and DeltaMs1 and DeltaMs <= DeltaMs1 then DeltaMs1 - DeltaMs else nil
end

local function getHoldGateHit(p2) --[[ Line: 48 ]]
	-- upvalues: ConstantsModule (copy)
	local Event = p2.getEvents(false)[ConstantsModule.EVENT_NAME]
	local DeltaMs = nil
	local DeltaMs1 = nil
	
	if Event and Event.milestones then
		for _, milestone in Event.milestones do
			local Name = milestone.name
			
			if Name == ConstantsModule.Milestone.DismissRequested and milestone.id == ConstantsModule.DismissSource.NormalReady and DeltaMs == nil then
				DeltaMs = milestone.deltaMs
			elseif Name == ConstantsModule.Milestone.DismissGateReleased and DeltaMs1 == nil then
				DeltaMs1 = milestone.deltaMs
			end
		end
	end
	return if DeltaMs == nil or DeltaMs1 == nil then nil else DeltaMs < DeltaMs1
end

return {
	startMilestoneTracker = function(p3, p4) --[[ Line: 12 ]]
		-- upvalues: TryMilestoneOperationModule (copy), ConstantsModule (copy)
		return TryMilestoneOperationModule(function() --[[ Line: 13 ]]
			-- upvalues: p3 (copy), ConstantsModule (upval), p4 (copy)
			p3.trackStart(ConstantsModule.EVENT_NAME)
			p3.updateMetadata(ConstantsModule.EVENT_NAME, {
				category = p4.category,
				page = p4.page,
				subcategory = p4.subcategory
			})
		end)
	end,
	recordMilestone = function(p3, p4, Id) --[[ Line: 23 ]]
		-- upvalues: TryMilestoneOperationModule (copy), ConstantsModule (copy)
		return TryMilestoneOperationModule(function() --[[ Line: 24 ]]
			-- upvalues: p3 (copy), ConstantsModule (upval), p4 (copy), Id (copy)
			p3.trackMilestone(ConstantsModule.EVENT_NAME, p4, if Id then { id = Id } else nil)
		end)
	end,
	completeMilestoneTracker = function(p3, p4, DismissSource, p5) --[[ Line: 69 ]]
		-- upvalues: TryMilestoneOperationModule (copy), getAddedWait (copy), getHoldGateHit (copy), ConstantsModule (copy), FIntLoadingScreenMilestonesSampleRateModule (copy)
		local v1 = nil
		local v2 = nil
		
		return TryMilestoneOperationModule(function() --[[ Line: 77 ]]
			-- upvalues: v1 (ref), p4 (copy), getAddedWait (upval), p3 (copy), v2 (ref), p5 (copy), getHoldGateHit (upval), DismissSource (copy), ConstantsModule (upval), FIntLoadingScreenMilestonesSampleRateModule (upval)
			v1 = if p4 then getAddedWait(p3) else nil
			v2 = if p5 then getHoldGateHit(p3) else nil
			
			if DismissSource then
				p3.updateMetadata(ConstantsModule.EVENT_NAME, { dismissSource = DismissSource })
			end
			p3.trackEnd(ConstantsModule.EVENT_NAME, {
				samplingRateOverride = FIntLoadingScreenMilestonesSampleRateModule
			})
		end), v1, v2
	end,
	discardMilestoneTracker = function(p3) --[[ Line: 91 ]]
		-- upvalues: TryMilestoneOperationModule (copy), ConstantsModule (copy)
		return TryMilestoneOperationModule(function() --[[ Line: 92 ]]
			-- upvalues: p3 (copy), ConstantsModule (upval)
			p3.destroyEvent(ConstantsModule.EVENT_NAME)
		end)
	end
}