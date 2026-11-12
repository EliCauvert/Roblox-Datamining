local TimeToInteractiveTracker = script:FindFirstAncestor("TimeToInteractiveTracker")
local Parent = TimeToInteractiveTracker.Parent
local CreateSignalFunction = require(Parent.Signals).createSignal
local FFlagEnableTTIRecordWebViewMilestones = require(Parent.SharedFlags).FFlagEnableTTIRecordWebViewMilestones
local FFlagTTITrackerDropEventsOnAppHideModule = require(TimeToInteractiveTracker.Utils.FFlagTTITrackerDropEventsOnAppHide)
local GetAppLifecycleObserverServiceModule = require(TimeToInteractiveTracker.Utils.getAppLifecycleObserverService)
local FFlagTTITrackerDropEventsOnJoinAttemptModule = require(TimeToInteractiveTracker.Utils.FFlagTTITrackerDropEventsOnJoinAttempt)
local GetOnNewJoinAttemptModule = require(TimeToInteractiveTracker.Utils.getOnNewJoinAttempt)
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
local DiscardOlderNavigationStartsModule = require(script.Parent.Actions.discardOlderNavigationStarts)
local ConstantsModule = require(TimeToInteractiveTracker.Milestones.constants)
local NavigationEventPrefixModule = require(TimeToInteractiveTracker.Utils.navigationEventPrefix)
local UseTTIRenderAndMountedTrackingModule = require(TimeToInteractiveTracker.Hooks.useTTIRenderAndMountedTracking)
local _ = require(script.Parent.types)

return function()
	-- upvalues: CreateSignalFunction (copy), TrackTTIEventEndModule (copy), FFlagTTITrackerDropEventsOnAppHideModule (copy), GetAppLifecycleObserverServiceModule (copy), DropInFlightTTIEventsModule (copy), FFlagTTITrackerDropEventsOnJoinAttemptModule (copy), GetOnNewJoinAttemptModule (copy), UpdateTTIEventMetadataModule (copy), TrackTTIEventStartModule (copy), TrackMilestoneModule (copy), TrackSubphaseModule (copy), TrackRequestModule (copy), FFlagEnableTTIRecordWebViewMilestones (copy), RecordWebViewMilestonesModule (copy), ResetTTIEventModule (copy), DestroyTTIEventModule (copy), DiscardOlderNavigationStartsModule (copy), ConstantsModule (copy), NavigationEventPrefixModule (copy), UseTTIRenderAndMountedTrackingModule (copy)
	local Signal, Signal2 = CreateSignalFunction({})
	local t = {}
	local TrackTTIEventEndModuleResult, TrackTTIEventEndModuleResult2 = TrackTTIEventEndModule(Signal2, t)
	
	if FFlagTTITrackerDropEventsOnAppHideModule then
		local AppLifecycleObserverServiceModule = GetAppLifecycleObserverServiceModule()
		
		if AppLifecycleObserverServiceModule then
			AppLifecycleObserverServiceModule.OnHide:Connect(DropInFlightTTIEventsModule(Signal2))
		end
	end
	if FFlagTTITrackerDropEventsOnJoinAttemptModule then
		local OnNewJoinAttemptModule = GetOnNewJoinAttemptModule()
		
		if OnNewJoinAttemptModule then
			OnNewJoinAttemptModule:Connect(DropInFlightTTIEventsModule(Signal2))
		end
	end
	return {
		getEvents = Signal,
		setEvents = Signal2,
		updateMetadata = UpdateTTIEventMetadataModule(Signal2),
		trackStart = TrackTTIEventStartModule(Signal2, t),
		trackEnd = TrackTTIEventEndModuleResult,
		trackEndAtNextFrame = TrackTTIEventEndModuleResult2,
		trackMilestone = TrackMilestoneModule(Signal, Signal2),
		trackSubphase = TrackSubphaseModule(Signal, Signal2),
		trackRequest = TrackRequestModule(Signal, Signal2),
		recordWebViewMilestones = if FFlagEnableTTIRecordWebViewMilestones then RecordWebViewMilestonesModule(Signal, Signal2) else nil,
		resetEvent = ResetTTIEventModule(Signal2),
		destroyEvent = DestroyTTIEventModule(Signal2),
		discardOlderNavigationStarts = DiscardOlderNavigationStartsModule(Signal2, t),
		Milestone = ConstantsModule,
		NAVIGATION_EVENT_PREFIX = NavigationEventPrefixModule,
		Hooks = {
			useTTIRenderAndMountedTracking = UseTTIRenderAndMountedTrackingModule(TrackMilestoneModule(Signal, Signal2))
		}
	}
end