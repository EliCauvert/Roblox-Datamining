local parent = script:FindFirstAncestor("VirtualEvents").Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local sduiResponseType = sduiSharedUtilitiesModule.SduiResponseType
local getSduiApiStore = sduiSharedUtilitiesModule.getSduiApiStore
local getEventDetailsUrlModule = require(script.Parent.getEventDetailsUrl)
local getEventDetailsPageKeyModule = require(script.Parent.getEventDetailsPageKey)

return function(p0, p1) --[[ line: 13 | named "fetchEventDetailsPage" ]]
	-- upvalues: getEventDetailsUrlModule (ref), parent (ref), getSduiApiStore (ref), sduiResponseType (ref), appPage (ref), getEventDetailsPageKeyModule (ref)
	getSduiApiStore().fetchIfNeeded({
		responseType = sduiResponseType.Protobuf,
		url = getEventDetailsUrlModule(p0),
		surfaceKey = appPage.EventDetails,
		configKey = getEventDetailsPageKeyModule(p0),
		loadTimer = p1,
		apiProto = require(parent.ServiceContractsProto).apppageplatform.experienceevents.experience_event_details_page.ExperienceEventDetailsPageResponse
	})
end