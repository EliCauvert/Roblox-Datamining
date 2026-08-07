local timeToInteractiveTracker = script:FindFirstAncestor("TimeToInteractiveTracker")
local parent = timeToInteractiveTracker.Parent
local createSignal = require(parent.Signals).createSignal
local fFlagEnableTTIRecordWebViewMilestones = require(parent.SharedFlags).FFlagEnableTTIRecordWebViewMilestones
local updateTTIEventMetadataModule = require(script.Parent.Actions.updateTTIEventMetadata)
local trackTTIEventStartModule = require(script.Parent.Actions.trackTTIEventStart)
local trackTTIEventEndModule = require(script.Parent.Actions.trackTTIEventEnd)
local trackMilestoneModule = require(script.Parent.Actions.trackMilestone)
local trackSubphaseModule = require(script.Parent.Actions.trackSubphase)
local trackRequestModule = require(script.Parent.Actions.trackRequest)
local recordWebViewMilestonesModule = require(script.Parent.Actions.recordWebViewMilestones)
local resetTTIEventModule = require(script.Parent.Actions.resetTTIEvent)
local destroyTTIEventModule = require(script.Parent.Actions.destroyTTIEvent)
local constantsModule = require(timeToInteractiveTracker.Milestones.constants)
local useTTIRenderAndMountedTrackingModule = require(timeToInteractiveTracker.Hooks.useTTIRenderAndMountedTracking)
local _ = require(script.Parent.types)

return function() --[[ line: 28 ]]
	-- upvalues: createSignal (ref), updateTTIEventMetadataModule (ref), trackTTIEventStartModule (ref), trackTTIEventEndModule (ref), trackMilestoneModule (ref), trackSubphaseModule (ref), trackRequestModule (ref), fFlagEnableTTIRecordWebViewMilestones (ref), recordWebViewMilestonesModule (ref), resetTTIEventModule (ref), destroyTTIEventModule (ref), constantsModule (ref), useTTIRenderAndMountedTrackingModule (ref)
	local var12, var13 = createSignal({})
	
	return {
		getEvents = var12,
		setEvents = var13,
		updateMetadata = updateTTIEventMetadataModule(var13),
		trackStart = trackTTIEventStartModule(var13),
		trackEnd = trackTTIEventEndModule(var13),
		trackMilestone = trackMilestoneModule(var12, var13),
		trackSubphase = trackSubphaseModule(var12, var13),
		trackRequest = trackRequestModule(var12, var13),
		recordWebViewMilestones = if fFlagEnableTTIRecordWebViewMilestones then recordWebViewMilestonesModule(var12, var13) else nil,
		resetEvent = resetTTIEventModule(var13),
		destroyEvent = destroyTTIEventModule(var13),
		Milestone = constantsModule,
		Hooks = {
			useTTIRenderAndMountedTracking = useTTIRenderAndMountedTrackingModule(trackMilestoneModule(var12, var13))
		}
	}
end