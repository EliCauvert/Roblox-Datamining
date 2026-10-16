local Parent = script:FindFirstAncestor("VirtualEvents").Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiResponseType = SduiSharedUtilitiesModule.SduiResponseType
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local GetEventDetailsUrlModule = require(script.Parent.getEventDetailsUrl)
local GetEventDetailsPageKeyModule = require(script.Parent.getEventDetailsPageKey)

return function(p1, LoadTimer) --[[ Line: 13 | Named "fetchEventDetailsPage" ]]
	-- upvalues: GetEventDetailsUrlModule (copy), Parent (copy), GetSduiApiStoreFunction (copy), SduiResponseType (copy), AppPage (copy), GetEventDetailsPageKeyModule (copy)
	GetSduiApiStoreFunction().fetchIfNeeded({
		responseType = SduiResponseType.Protobuf,
		url = GetEventDetailsUrlModule(p1),
		surfaceKey = AppPage.EventDetails,
		configKey = GetEventDetailsPageKeyModule(p1),
		loadTimer = LoadTimer,
		apiProto = require(Parent.ServiceContractsProto).apppageplatform.experienceevents.experience_event_details_page.ExperienceEventDetailsPageResponse
	})
end