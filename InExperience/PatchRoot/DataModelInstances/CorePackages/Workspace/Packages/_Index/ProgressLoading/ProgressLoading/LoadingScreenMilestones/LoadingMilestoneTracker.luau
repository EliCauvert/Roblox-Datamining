local progressLoading = script:FindFirstAncestor("ProgressLoading")
local _ = progressLoading.Parent
local _ = require(script.Parent.Types)
local constantsModule = require(script.Parent.Constants)
local tryMilestoneOperationModule = require(script.Parent.tryMilestoneOperation)
local fIntLoadingScreenMilestonesSampleRateModule = require(progressLoading.Flags.FIntLoadingScreenMilestonesSampleRate)

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

return {
	startMilestoneTracker = function(p2, p3)
		-- upvalues: tryMilestoneOperationModule (ref), constantsModule (ref)
		return tryMilestoneOperationModule(function()
			-- upvalues: p2 (ref), constantsModule (copy), p3 (ref)
			p2.trackStart(constantsModule.EVENT_NAME)
			p2.updateMetadata(constantsModule.EVENT_NAME, {
				category = p3.category,
				page = p3.page,
				subcategory = p3.subcategory
			})
		end)
	end,
	recordMilestone = function(p2, p3, p4)
		-- upvalues: tryMilestoneOperationModule (ref), constantsModule (ref)
		return tryMilestoneOperationModule(function()
			-- upvalues: p2 (ref), constantsModule (copy), p3 (ref), p4 (ref)
			p2.trackMilestone(constantsModule.EVENT_NAME, p3, if p4 then { id = p4 } else nil)
		end)
	end,
	completeMilestoneTracker = function(p2, p3)
		-- upvalues: tryMilestoneOperationModule (ref), getAddedWait (ref), constantsModule (ref), fIntLoadingScreenMilestonesSampleRateModule (ref)
		local var1 = nil
		
		return tryMilestoneOperationModule(function()
			-- upvalues: var1 (write), p3 (ref), getAddedWait (copy), p2 (ref), constantsModule (copy), fIntLoadingScreenMilestonesSampleRateModule (copy)
			var1 = if p3 then getAddedWait(p2) else nil
			p2.trackEnd(constantsModule.EVENT_NAME, {
				samplingRateOverride = fIntLoadingScreenMilestonesSampleRateModule
			})
		end), var1
	end,
	discardMilestoneTracker = function(p2)
		-- upvalues: tryMilestoneOperationModule (ref), constantsModule (ref)
		return tryMilestoneOperationModule(function()
			-- upvalues: p2 (ref), constantsModule (copy)
			p2.destroyEvent(constantsModule.EVENT_NAME)
		end)
	end
}