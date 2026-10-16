local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local FoundationModule = require(Parent.Foundation)
local VirtualEventsModule = require(Parent.VirtualEvents)
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local GetActionTelemetryFieldValueFunction = SduiCoreSystemModule.getActionTelemetryFieldValue
local GetExperienceEventInfoStoreFunction = require(Parent.DataHydration).ExperienceEvents.getExperienceEventInfoStore
local GetSduiPageEntrySnackbarStoreFunction = require(Parent.SduiSharedUtilities).getSduiPageEntrySnackbarStore

local function showRsvpSuccessToast(p1, EntryPointKey, EventName, EventTime) --[[ Line: 23 ]]
	-- upvalues: GetSduiPageEntrySnackbarStoreFunction (copy), FoundationModule (copy)
	GetSduiPageEntrySnackbarStoreFunction().show(EntryPointKey, {
		title = p1.dependencies.localization:Format("Feature.VirtualEvents.Label.ReminderSetForEventTime"):gsub("{(.-)}", { eventName = EventName, eventTime = EventTime }),
		icon = FoundationModule.Enums.IconName.CircleCheck
	})
end

return function(p1, p2, p3, _) --[[ Line: 42 ]]
	-- upvalues: SduiErrorType (copy), VirtualEventsModule (copy), GetActionTelemetryFieldValueFunction (copy), GetExperienceEventInfoStoreFunction (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), showRsvpSuccessToast (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p3.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, { name = "RsvpToEvent", message = "Missing actionParams" }, p3.appPage)
		
		return
	end
	assert(ActionParams, "actionParams must exist")
	local EventId = ActionParams.eventId
	
	if EventId == nil then
		p3.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = "RsvpToEvent",
			message = "Missing eventId",
			propName = "eventId"
		}, p3.appPage)
		
		return
	end
	local UserRsvp = ActionParams.userRsvp
	VirtualEventsModule.fireVirtualEventRSVP({
		virtualEventId = tostring(EventId),
		universeId = tostring(GetActionTelemetryFieldValueFunction(p1, p2, "universeId", "")),
		channel = tostring(GetActionTelemetryFieldValueFunction(p1, p2, "channel", "")),
		status = if UserRsvp then "going" else "notGoing"
	})
	local ExperienceEventInfoStore = GetExperienceEventInfoStoreFunction(false)
	local PatchRsvpStatusResult = ExperienceEventInfoStore.patchRsvpStatus(EventId, UserRsvp)
	
	if PatchRsvpStatusResult then
		local EntryPointKey = ActionParams.entryPointKey or p3.configKey
		PatchRsvpStatusResult:andThen(function(Result) --[[ Line: 84 ]]
			-- upvalues: UserRsvp (copy), EntryPointKey (copy), ActionParams (copy), p3 (copy), SetCentralOverlayFunction (upval), CentralOverlayType (upval), ExperienceEventInfoStore (copy), EventId (copy), showRsvpSuccessToast (upval)
			if UserRsvp ~= true or not EntryPointKey then return end
			local NotificationsModalIdentifier = ActionParams.notificationsModalIdentifier
			
			if Result and Result.shouldSeeNotificationsUpsellModal == true and NotificationsModalIdentifier then
				p3.dependencies.dispatch(SetCentralOverlayFunction(CentralOverlayType.SduiOverlay, {
					configKey = p3.configKey,
					identifier = NotificationsModalIdentifier,
					appPage = p3.appPage
				}))
				
				return
			end
			local ExperienceEventInfo = ExperienceEventInfoStore.getExperienceEventInfo(EventId)
			local DataResult = ExperienceEventInfo and (ExperienceEventInfo.data and ExperienceEventInfo.data(false))
			
			if not DataResult then return end
			local Title = DataResult.title
			local FormattedStartDate = ExperienceEventInfoStore.calculateDerivedField("formattedStartDate", DataResult, false, p3.dependencies.localization)
			
			if Title and FormattedStartDate and DataResult.userRsvp then
				showRsvpSuccessToast(p3, EntryPointKey, Title, FormattedStartDate)
			end
		end):catch(function() --[[ Line: 122 ]]
			return nil
		end)
	end
end