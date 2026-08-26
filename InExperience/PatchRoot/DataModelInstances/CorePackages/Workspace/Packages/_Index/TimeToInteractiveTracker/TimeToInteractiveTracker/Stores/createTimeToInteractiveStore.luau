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

return function()
	-- upvalues: createSignal (ref), updateTTIEventMetadataModule (ref), trackTTIEventStartModule (ref), trackTTIEventEndModule (ref), trackMilestoneModule (ref), trackSubphaseModule (ref), trackRequestModule (ref), fFlagEnableTTIRecordWebViewMilestones (ref), recordWebViewMilestonesModule (ref), resetTTIEventModule (ref), destroyTTIEventModule (ref), constantsModule (ref), useTTIRenderAndMountedTrackingModule (ref)
	local var1, var2 = createSignal({})
	
	return {
		getEvents = var1,
		setEvents = var2,
		updateMetadata = updateTTIEventMetadataModule(var2),
		trackStart = trackTTIEventStartModule(var2),
		trackEnd = trackTTIEventEndModule(var2),
		trackMilestone = trackMilestoneModule(var1, var2),
		trackSubphase = trackSubphaseModule(var1, var2),
		trackRequest = trackRequestModule(var1, var2),
		recordWebViewMilestones = if fFlagEnableTTIRecordWebViewMilestones then recordWebViewMilestonesModule(var1, var2) else nil,
		resetEvent = resetTTIEventModule(var2),
		destroyEvent = destroyTTIEventModule(var2),
		Milestone = constantsModule,
		Hooks = {
			useTTIRenderAndMountedTracking = useTTIRenderAndMountedTrackingModule(trackMilestoneModule(var1, var2))
		}
	}
end