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

local function showRsvpSuccessToast(p0, p1, p2, p3)
	-- upvalues: getSduiPageEntrySnackbarStore (ref), foundationModule (ref)
	getSduiPageEntrySnackbarStore().show(p1, {
		title = p0.dependencies.localization:Format("Feature.VirtualEvents.Label.ReminderSetForEventTime"):gsub("{(.-)}", { eventName = p2, eventTime = p3 }),
		icon = foundationModule.Enums.IconName.CircleCheck
	})
end

return function(p4, p5, p6, _)
	-- upvalues: sduiErrorType (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagSduiEventDetailsSupport (ref), virtualEventsModule (ref), getActionTelemetryFieldValue (ref), getExperienceEventInfoStore (ref), setCentralOverlay (ref), centralOverlayType (ref), showRsvpSuccessToast (ref)
	local var7 = if p4 then p4.actionParams else nil
	
	if var7 == nil then
		p6.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, { name = "RsvpToEvent", message = "Missing actionParams" }, p6.appPage)
		
		return
	end
	assert(var7, "actionParams must exist")
	local eventId = var7.eventId
	
	if eventId == nil then
		p6.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = "RsvpToEvent",
			message = "Missing eventId",
			propName = "eventId"
		}, p6.appPage)
		
		return
	end
	local userRsvp = var7.userRsvp
	
	if fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport then
		virtualEventsModule.fireVirtualEventRSVP({
			virtualEventId = tostring(eventId),
			universeId = tostring(getActionTelemetryFieldValue(p4, p5, "universeId", "")),
			channel = tostring(getActionTelemetryFieldValue(p4, p5, "channel", "")),
			status = if userRsvp then "going" else "notGoing"
		})
	end
	local var8 = getExperienceEventInfoStore(false)
	local var9 = var8.patchRsvpStatus(eventId, userRsvp)
	
	if (fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport) and var9 then
		local entryPointKey = var7.entryPointKey or p6.configKey
		var9:andThen(function(p7)
			-- upvalues: userRsvp (ref), entryPointKey (ref), var7 (ref), p6 (ref), setCentralOverlay (copy), centralOverlayType (copy), var8 (ref), eventId (ref), showRsvpSuccessToast (copy)
			if userRsvp ~= true or not entryPointKey then return end
			local notificationsModalIdentifier = var7.notificationsModalIdentifier
			
			if p7 and p7.shouldSeeNotificationsUpsellModal == true and notificationsModalIdentifier then
				p6.dependencies.dispatch(setCentralOverlay(centralOverlayType.SduiOverlay, {
					configKey = p6.configKey,
					identifier = notificationsModalIdentifier,
					appPage = p6.appPage
				}))
				
				return
			end
			local experienceEventInfo = var8.getExperienceEventInfo(eventId)
			local var12 = experienceEventInfo and (experienceEventInfo.data and experienceEventInfo.data(false))
			
			if not var12 then return end
			local title = var12.title
			local formattedStartDate = var8.calculateDerivedField("formattedStartDate", var12, false, p6.dependencies.localization)
			
			if title and formattedStartDate and var12.userRsvp then
				showRsvpSuccessToast(p6, entryPointKey, title, formattedStartDate)
			end
		end):catch(function()
			return nil
		end)
	end
end