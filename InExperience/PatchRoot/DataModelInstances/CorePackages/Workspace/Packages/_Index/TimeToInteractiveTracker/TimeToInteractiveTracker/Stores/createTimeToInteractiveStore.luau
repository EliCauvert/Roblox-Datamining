local TimeToInteractiveTracker = script:FindFirstAncestor("TimeToInteractiveTracker")
local Parent = TimeToInteractiveTracker.Parent
local CreateSignalFunction = require(Parent.Signals).createSignal
local FFlagEnableTTIRecordWebViewMilestones = require(Parent.SharedFlags).FFlagEnableTTIRecordWebViewMilestones
local FFlagTTITrackerDropEventsOnAppHideModule = require(TimeToInteractiveTracker.Utils.FFlagTTITrackerDropEventsOnAppHide)
local GetAppLifecycleObserverServiceModule = require(TimeToInteractiveTracker.Utils.getAppLifecycleObserverService)
local UpdateTTIEventMetadataModule = require(script.Parent.Actions.updateTTIEventMetadata)
local TrackTTIEventStartModule = require(script.Parent.Actions.trackTTIEventStart)
local TrackTTIEventEndModule = require(script.Parent.Actions.trackTTIEventEnd)
local TrackMilestoneModule = require(script.Parent.Actions.trackMilestone)
local TrackSubphaseModule = require(script.Parent.Actions.trackSubphase)
local TrackRequestModule = require(script.Parent.Actions.trackRequest)
local RecordWebViewMilestonesModule = require(script.Parent.Actions.recordWebViewMilestones)
local ResetTTIEventModule = require(script.Parent.Actions.resetTTIEvent)
local DestroyTTIEventModule = require(script.Parent.Actions.destroyTTIEvent)
local DropInFlightTTIEventsModule = require(script.Parent.Actions.dropInFlightTTIEvents)
local ConstantsModule = require(TimeToInteractiveTracker.Milestones.constants)
local UseTTIRenderAndMountedTrackingModule = require(TimeToInteractiveTracker.Hooks.useTTIRenderAndMountedTracking)
local _ = require(script.Parent.types)

return function()
	-- upvalues: CreateSignalFunction (copy), FFlagTTITrackerDropEventsOnAppHideModule (copy), GetAppLifecycleObserverServiceModule (copy), DropInFlightTTIEventsModule (copy), UpdateTTIEventMetadataModule (copy), TrackTTIEventStartModule (copy), TrackTTIEventEndModule (copy), TrackMilestoneModule (copy), TrackSubphaseModule (copy), TrackRequestModule (copy), FFlagEnableTTIRecordWebViewMilestones (copy), RecordWebViewMilestonesModule (copy), ResetTTIEventModule (copy), DestroyTTIEventModule (copy), ConstantsModule (copy), UseTTIRenderAndMountedTrackingModule (copy)
	local Signal, Signal2 = CreateSignalFunction({})
	
	if FFlagTTITrackerDropEventsOnAppHideModule then
		local AppLifecycleObserverServiceModule = GetAppLifecycleObserverServiceModule()
		
		if AppLifecycleObserverServiceModule then
			AppLifecycleObserverServiceModule.OnHide:Connect(DropInFlightTTIEventsModule(Signal2))
		end
	end
	return {
		getEvents = Signal,
		setEvents = Signal2,
		updateMetadata = UpdateTTIEventMetadataModule(Signal2),
		trackStart = TrackTTIEventStartModule(Signal2),
		trackEnd = TrackTTIEventEndModule(Signal2),
		trackMilestone = TrackMilestoneModule(Signal, Signal2),
		trackSubphase = TrackSubphaseModule(Signal, Signal2),
		trackRequest = TrackRequestModule(Signal, Signal2),
		recordWebViewMilestones = if FFlagEnableTTIRecordWebViewMilestones then RecordWebViewMilestonesModule(Signal, Signal2) else nil,
		resetEvent = ResetTTIEventModule(Signal2),
		destroyEvent = DestroyTTIEventModule(Signal2),
		Milestone = ConstantsModule,
		Hooks = {
			useTTIRenderAndMountedTracking = UseTTIRenderAndMountedTrackingModule(TrackMilestoneModule(Signal, Signal2))
		}
	}
end