local progressLoading = script:FindFirstAncestor("ProgressLoading")
local _ = progressLoading.Parent
local _ = require(script.Parent.Types)
local constantsModule = require(script.Parent.Constants)
local tryMilestoneOperationModule = require(script.Parent.tryMilestoneOperation)
local fIntLoadingScreenMilestonesSampleRateModule = require(progressLoading.Flags.FIntLoadingScreenMilestonesSampleRate)

local function startMilestoneTracker(p1, p2)
	-- upvalues: tryMilestoneOperationModule (ref), constantsModule (ref)
	return tryMilestoneOperationModule(function()
		-- upvalues: p1 (ref), constantsModule (copy), p2 (ref)
		p1.trackStart(constantsModule.EVENT_NAME)
		p1.updateMetadata(constantsModule.EVENT_NAME, {
			category = p2.category,
			page = p2.page,
			subcategory = p2.subcategory
		})
	end)
end

local function recordMilestone(p1, p2, p3)
	-- upvalues: tryMilestoneOperationModule (ref), constantsModule (ref)
	return tryMilestoneOperationModule(function()
		-- upvalues: p1 (ref), constantsModule (copy), p2 (ref), p3 (ref)
		p1.trackMilestone(constantsModule.EVENT_NAME, p2, if p3 then { id = p3 } else nil)
	end)
end

local function getAddedWait(p1)
	-- upvalues: constantsModule (ref)
	local EVENT_NAME = p1.getEvents(false)[constantsModule.EVENT_NAME]
	local deltaMs = nil
	local deltaMs_1 = nil
	
	if EVENT_NAME and EVENT_NAME.milestones then
		for i, v in EVENT_NAME.milestones do
			local name = v.name
			
			if name == constantsModule.Milestone.DismissRequested and deltaMs == nil then
				deltaMs = v.deltaMs
			elseif name == constantsModule.Milestone.DismissStarted then
				deltaMs_1 = v.deltaMs
			end
		end
	end
	return if deltaMs and deltaMs_1 and deltaMs <= deltaMs_1 then deltaMs_1 - deltaMs else nil
end

local function getHoldGateHit(p2)
	-- upvalues: constantsModule (ref)
	local EVENT_NAME = p2.getEvents(false)[constantsModule.EVENT_NAME]
	local deltaMs = nil
	local deltaMs_1 = nil
	
	if EVENT_NAME and EVENT_NAME.milestones then
		for i, v in EVENT_NAME.milestones do
			local name = v.name
			
			if name == constantsModule.Milestone.DismissRequested and v.id == constantsModule.DismissSource.NormalReady and deltaMs == nil then
				deltaMs = v.deltaMs
			elseif name == constantsModule.Milestone.DismissGateReleased and deltaMs_1 == nil then
				deltaMs_1 = v.deltaMs
			end
		end
	end
	return if deltaMs == nil or deltaMs_1 == nil then nil else deltaMs < deltaMs_1
end

return {
	startMilestoneTracker = startMilestoneTracker,
	recordMilestone = recordMilestone,
	completeMilestoneTracker = function(p3, p4, p5, p6)
		-- upvalues: tryMilestoneOperationModule (ref), getAddedWait (ref), getHoldGateHit (ref), constantsModule (ref), fIntLoadingScreenMilestonesSampleRateModule (ref)
		local var1 = nil
		local var2 = nil
		
		return tryMilestoneOperationModule(function()
			-- upvalues: var1 (write), p4 (ref), getAddedWait (copy), p3 (ref), var2 (write), p6 (ref), getHoldGateHit (copy), p5 (ref), constantsModule (copy), fIntLoadingScreenMilestonesSampleRateModule (copy)
			var1 = if p4 then getAddedWait(p3) else nil
			var2 = if p6 then getHoldGateHit(p3) else nil
			
			if p5 then
				p3.updateMetadata(constantsModule.EVENT_NAME, { dismissSource = p5 })
			end
			p3.trackEnd(constantsModule.EVENT_NAME, {
				samplingRateOverride = fIntLoadingScreenMilestonesSampleRateModule
			})
		end), var1, var2
	end,
	discardMilestoneTracker = function(p3)
		-- upvalues: tryMilestoneOperationModule (ref), constantsModule (ref)
		return tryMilestoneOperationModule(function()
			-- upvalues: p3 (ref), constantsModule (copy)
			p3.destroyEvent(constantsModule.EVENT_NAME)
		end)
	end
}