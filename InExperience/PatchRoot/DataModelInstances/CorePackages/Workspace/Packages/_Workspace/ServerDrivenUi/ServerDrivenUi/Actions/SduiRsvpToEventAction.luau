local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local FoundationModule = require(Parent.Foundation)
local VirtualEventsModule = require(Parent.VirtualEvents)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local ExecuteActionFunction = SduiCoreSystemModule.executeAction
local GetActionTelemetryFieldValueFunction = SduiCoreSystemModule.getActionTelemetryFieldValue
local GetSduiActionHandlerRegistryFunction = SduiCoreSystemModule.getSduiActionHandlerRegistry
local GetExperienceEventInfoStoreFunction = require(Parent.DataHydration).ExperienceEvents.getExperienceEventInfoStore
local GetSduiPageEntrySnackbarStoreFunction = require(Parent.SduiSharedUtilities).getSduiPageEntrySnackbarStore
local FFlagEventRsvpPushUpsellEnabled = require(Parent.SharedFlags).FFlagEventRsvpPushUpsellEnabled
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local EventRsvpPushUpsellDelayMs = game:DefineFastInt("EventRsvpPushUpsellDelayMs", 1500)
local config = {
	[AppPage.ExperienceDetail] = true,
	[AppPage.GameDetail] = true,
	[AppPage.EventDetails] = true
}

local function showRsvpSuccessToast(p1, EntryPointKey, Title, FormattedStartDate)
	-- upvalues: GetSduiPageEntrySnackbarStoreFunction (copy), FoundationModule (copy)
	GetSduiPageEntrySnackbarStoreFunction().show(EntryPointKey, {
		title = p1.dependencies.localization:Format("Feature.VirtualEvents.Label.ReminderSetForEventTime"):gsub("{(.-)}", { eventName = Title, eventTime = FormattedStartDate }),
		icon = FoundationModule.Enums.IconName.CircleCheck
	})
end

local function requestPushUpsell(p1, p2, EventId, UniverseId, Callback: (any) -> ())
	-- upvalues: GetSduiActionHandlerRegistryFunction (copy), SduiActionType (copy), ExecuteActionFunction (copy)
	if GetSduiActionHandlerRegistryFunction().getActionHandlerConfig(SduiActionType.FetchPrompts) == nil then
		Callback(false)
		
		return
	end
	local ClientAttributes = { eventId = EventId }
	
	if UniverseId ~= "" then
		ClientAttributes.universeId = UniverseId
	end
	ExecuteActionFunction({
		actionType = SduiActionType.FetchPrompts,
		actionParams = {
			entryPoint = "AppEventRsvpGoing",
			includePushPermissionClientAttributes = true,
			clientAttributes = ClientAttributes,
			onSettled = Callback
		}
	}, p1, p2)
end

local function ignoreSettled(_) end

local function _(p1)
	-- upvalues: Parent (copy), FFlagSignalsNavP3Dispatch (copy)
	local NavigationRoduxModule = require(Parent.NavigationRodux)
	local CurrentPage = nil
	p1.dependencies.dispatch(function(p2)
		-- upvalues: CurrentPage (ref), FFlagSignalsNavP3Dispatch (upval), NavigationRoduxModule (copy)
		CurrentPage = if FFlagSignalsNavP3Dispatch then NavigationRoduxModule.GetLegacyNavigationStore(false).getCurrentPage(false) else NavigationRoduxModule.Selectors.selectCurrentLegacyPage(p2:getState())
	end)
	
	return CurrentPage
end

local function isStillOnRsvpPage(p1, p2, p3): boolean
	-- upvalues: Parent (copy), FFlagSignalsNavP3Dispatch (copy), AppPage (copy)
	local NavigationRoduxModule = require(Parent.NavigationRodux)
	local CurrentPage = nil
	p1.dependencies.dispatch(function(p4)
		-- upvalues: CurrentPage (ref), FFlagSignalsNavP3Dispatch (upval), NavigationRoduxModule (copy)
		CurrentPage = if FFlagSignalsNavP3Dispatch then NavigationRoduxModule.GetLegacyNavigationStore(false).getCurrentPage(false) else NavigationRoduxModule.Selectors.selectCurrentLegacyPage(p4:getState())
	end)
	local CurrentPage1 = CurrentPage
	
	if CurrentPage1 == nil then
		return false
	elseif p2 == nil or p2.rnKey == nil or CurrentPage1.rnKey ~= p2.rnKey then
		local ExtraProps = CurrentPage1.extraProps
		
		return CurrentPage1.name == AppPage.EventDetails and (ExtraProps ~= nil and tostring(ExtraProps.eventId or ExtraProps.virtualEventId) == p3)
	else
		return true
	end
end

local function handleGoingWithPushUpsell(p1, EventId, EntryPointKey, IsShouldSeeNotificationsUpsellModal, p2, p3, p4, p5)
	-- upvalues: GetActionTelemetryFieldValueFunction (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), requestPushUpsell (copy), showRsvpSuccessToast (copy), EventRsvpPushUpsellDelayMs (copy), isStillOnRsvpPage (copy), ignoreSettled (copy)
	local NotificationsModalIdentifier = (p3 and p3.actionParams or {}).notificationsModalIdentifier
	local Text = tostring(GetActionTelemetryFieldValueFunction(p3, p4, "universeId", ""))
	
	local function _()
		-- upvalues: p5 (copy), SetCentralOverlayFunction (upval), CentralOverlayType (upval), NotificationsModalIdentifier (copy)
		p5.dependencies.dispatch(SetCentralOverlayFunction(CentralOverlayType.SduiOverlay, {
			configKey = p5.configKey,
			identifier = NotificationsModalIdentifier,
			appPage = p5.appPage
		}))
	end
	
	local _ = function()
		-- upvalues: p1 (copy), EventId (copy)
		local ExperienceEventInfo = p1.getExperienceEventInfo(EventId)
		
		return ExperienceEventInfo and (ExperienceEventInfo.data and ExperienceEventInfo.data(false))
	end
	
	if not IsShouldSeeNotificationsUpsellModal or not NotificationsModalIdentifier then
		local ExperienceEventInfo = p1.getExperienceEventInfo(EventId)
		local DataResult = ExperienceEventInfo and (ExperienceEventInfo.data and ExperienceEventInfo.data(false))
		
		if not DataResult then return end
		local Title = DataResult.title
		local FormattedStartDate = p1.calculateDerivedField("formattedStartDate", DataResult, false, p5.dependencies.localization)
		
		if Title and FormattedStartDate and DataResult.userRsvp then
			showRsvpSuccessToast(p5, EntryPointKey, Title, FormattedStartDate)
			task.delay(EventRsvpPushUpsellDelayMs / 1000, function()
				-- upvalues: p1 (copy), EventId (copy), isStillOnRsvpPage (upval), p5 (copy), p2 (copy), requestPushUpsell (upval), p4 (copy), Text (copy), ignoreSettled (upval)
				local ExperienceEventInfo = p1.getExperienceEventInfo(EventId)
				local DataResult = ExperienceEventInfo and (ExperienceEventInfo.data and ExperienceEventInfo.data(false))
				
				if not DataResult or not DataResult.userRsvp then return end
				if isStillOnRsvpPage(p5, p2, (tostring(EventId))) then
					requestPushUpsell(p4, p5, tostring(EventId), Text, ignoreSettled)
					
					return
				end
			end)
			
			return
		end
		return
	elseif not pcall(requestPushUpsell, p4, p5, tostring(EventId), Text, function(p6)
		-- upvalues: p5 (copy), SetCentralOverlayFunction (upval), CentralOverlayType (upval), NotificationsModalIdentifier (copy)
		if not p6 then
			p5.dependencies.dispatch(SetCentralOverlayFunction(CentralOverlayType.SduiOverlay, {
				configKey = p5.configKey,
				identifier = NotificationsModalIdentifier,
				appPage = p5.appPage
			}))
		end
	end) then
		p5.dependencies.dispatch(SetCentralOverlayFunction(CentralOverlayType.SduiOverlay, {
			configKey = p5.configKey,
			identifier = NotificationsModalIdentifier,
			appPage = p5.appPage
		}))
	end
end

return function(p1, p2, p3, _)
	-- upvalues: SduiErrorType (copy), VirtualEventsModule (copy), GetActionTelemetryFieldValueFunction (copy), FFlagEventRsvpPushUpsellEnabled (copy), config (copy), Parent (copy), FFlagSignalsNavP3Dispatch (copy), GetExperienceEventInfoStoreFunction (copy), handleGoingWithPushUpsell (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), showRsvpSuccessToast (copy)
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
	local v1 = nil
	
	if FFlagEventRsvpPushUpsellEnabled and UserRsvp == true and config[p3.appPage] then
		local NavigationRoduxModule = require(Parent.NavigationRodux)
		local CurrentPage = nil
		p3.dependencies.dispatch(function(p4)
			-- upvalues: CurrentPage (ref), FFlagSignalsNavP3Dispatch (upval), NavigationRoduxModule (copy)
			CurrentPage = if FFlagSignalsNavP3Dispatch then NavigationRoduxModule.GetLegacyNavigationStore(false).getCurrentPage(false) else NavigationRoduxModule.Selectors.selectCurrentLegacyPage(p4:getState())
		end)
		v1 = CurrentPage
	else
		v1 = nil
	end
	local ExperienceEventInfoStore = GetExperienceEventInfoStoreFunction(false)
	local PatchRsvpStatusResult = ExperienceEventInfoStore.patchRsvpStatus(EventId, UserRsvp)
	
	if PatchRsvpStatusResult then
		local EntryPointKey = ActionParams.entryPointKey or p3.configKey
		PatchRsvpStatusResult:andThen(function(Result)
			-- upvalues: UserRsvp (copy), EntryPointKey (copy), FFlagEventRsvpPushUpsellEnabled (upval), config (upval), p3 (copy), handleGoingWithPushUpsell (upval), ExperienceEventInfoStore (copy), EventId (copy), v1 (copy), p1 (copy), p2 (copy), ActionParams (copy), SetCentralOverlayFunction (upval), CentralOverlayType (upval), showRsvpSuccessToast (upval)
			if UserRsvp ~= true or not EntryPointKey then return end
			local IsShouldSeeNotificationsUpsellModal: boolean = Result and Result.shouldSeeNotificationsUpsellModal == true
			
			if FFlagEventRsvpPushUpsellEnabled and config[p3.appPage] then
				handleGoingWithPushUpsell(ExperienceEventInfoStore, EventId, EntryPointKey, IsShouldSeeNotificationsUpsellModal, v1, p1, p2, p3)
				
				return
			end
			local NotificationsModalIdentifier = ActionParams.notificationsModalIdentifier
			
			if IsShouldSeeNotificationsUpsellModal and NotificationsModalIdentifier then
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
		end):catch(function()
			return nil
		end)
	end
end