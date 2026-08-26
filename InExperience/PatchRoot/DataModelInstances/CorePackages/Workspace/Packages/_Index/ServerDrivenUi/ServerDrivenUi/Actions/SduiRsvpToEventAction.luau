local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local dataHydrationModule = require(parent.DataHydration)
local foundationModule = require(parent.Foundation)
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local sharedFlagsModule = require(parent.SharedFlags)
local virtualEventsModule = require(parent.VirtualEvents)
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType
local setCentralOverlay = require(parent.CentralOverlay).Actions.SetCentralOverlay
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local getActionTelemetryFieldValue = sduiCoreSystemModule.getActionTelemetryFieldValue
local getExperienceEventInfoStore = dataHydrationModule.ExperienceEvents.getExperienceEventInfoStore
local getSduiPageEntrySnackbarStore = sduiSharedUtilitiesModule.getSduiPageEntrySnackbarStore
local fFlagSduiExperienceDetailsSupport = sharedFlagsModule.FFlagSduiExperienceDetailsSupport
local fFlagSduiEventDetailsSupport = sharedFlagsModule.FFlagSduiEventDetailsSupport

local function showRsvpSuccessToast(p1, p2, p3, p4)
	-- upvalues: getSduiPageEntrySnackbarStore (ref), foundationModule (ref)
	getSduiPageEntrySnackbarStore().show(p2, {
		title = p1.dependencies.localization:Format("Feature.VirtualEvents.Label.ReminderSetForEventTime"):gsub("{(.-)}", { eventName = p3, eventTime = p4 }),
		icon = foundationModule.Enums.IconName.CircleCheck
	})
end

return function(p1, p2, p3, _)
	-- upvalues: sduiErrorType (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagSduiEventDetailsSupport (ref), virtualEventsModule (ref), getActionTelemetryFieldValue (ref), getExperienceEventInfoStore (ref), setCentralOverlay (ref), centralOverlayType (ref), showRsvpSuccessToast (ref)
	local var1 = if p1 then p1.actionParams else nil
	
	if var1 == nil then
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, { name = "RsvpToEvent", message = "Missing actionParams" }, p3.appPage)
		
		return
	end
	assert(var1, "actionParams must exist")
	local eventId = var1.eventId
	
	if eventId == nil then
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = "RsvpToEvent",
			message = "Missing eventId",
			propName = "eventId"
		}, p3.appPage)
		
		return
	end
	local userRsvp = var1.userRsvp
	
	if fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport then
		virtualEventsModule.fireVirtualEventRSVP({
			virtualEventId = tostring(eventId),
			universeId = tostring(getActionTelemetryFieldValue(p1, p2, "universeId", "")),
			channel = tostring(getActionTelemetryFieldValue(p1, p2, "channel", "")),
			status = if userRsvp then "going" else "notGoing"
		})
	end
	local var2 = getExperienceEventInfoStore(false)
	local var3 = var2.patchRsvpStatus(eventId, userRsvp)
	
	if (fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport) and var3 then
		local entryPointKey = var1.entryPointKey or p3.configKey
		var3:andThen(function(p4)
			-- upvalues: userRsvp (ref), entryPointKey (ref), var1 (ref), p3 (ref), setCentralOverlay (copy), centralOverlayType (copy), var2 (ref), eventId (ref), showRsvpSuccessToast (copy)
			if userRsvp ~= true or not entryPointKey then return end
			local notificationsModalIdentifier = var1.notificationsModalIdentifier
			
			if p4 and p4.shouldSeeNotificationsUpsellModal == true and notificationsModalIdentifier then
				p3.dependencies.dispatch(setCentralOverlay(centralOverlayType.SduiOverlay, {
					configKey = p3.configKey,
					identifier = notificationsModalIdentifier,
					appPage = p3.appPage
				}))
				
				return
			end
			local experienceEventInfo = var2.getExperienceEventInfo(eventId)
			local var4 = experienceEventInfo and (experienceEventInfo.data and experienceEventInfo.data(false))
			
			if not var4 then return end
			local title = var4.title
			local formattedStartDate = var2.calculateDerivedField("formattedStartDate", var4, false, p3.dependencies.localization)
			
			if title and formattedStartDate and var4.userRsvp then
				showRsvpSuccessToast(p3, entryPointKey, title, formattedStartDate)
			end
		end):catch(function()
			return nil
		end)
	end
end