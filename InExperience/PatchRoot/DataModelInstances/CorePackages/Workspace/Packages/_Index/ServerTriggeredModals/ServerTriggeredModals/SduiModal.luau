local serverTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local parent = serverTriggeredModals.Parent
local serverDrivenUiModule = require(parent.ServerDrivenUi)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local reactModule = require(parent.React)
local reportModalImpressionModule = require(serverTriggeredModals.reportModalImpression)
local sendModalImpressionEvent = require(parent.ServerTriggeredModalImpressions).sendModalImpressionEvent
local roactServiceTagsModule = require(parent.RoactServiceTags)
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local appPage = robloxAppEnumsModule.AppPage
local useSduiContext = serverDrivenUiModule.useSduiContext
local sduiComponent = serverDrivenUiModule.SduiComponent

return reactModule.memo(function(p0)
	-- upvalues: useRoactService (ref), roactServiceTagsModule (ref), useSduiContext (ref), appPage (ref), reactModule (ref), reportModalImpressionModule (ref), sendModalImpressionEvent (ref), sduiComponent (ref)
	local var6 = useRoactService(roactServiceTagsModule.RoactNetworking)
	local var7 = useSduiContext({ appPage = appPage.Home, dataUpdatedTimestamp = os.time() })
	local modalId = p0.modalId
	local modalType = p0.modalType
	reactModule.useEffect(function()
		-- upvalues: reportModalImpressionModule (copy), var6 (ref), modalId (ref), modalType (ref), sendModalImpressionEvent (copy)
		reportModalImpressionModule(var6, modalId, modalType)
		sendModalImpressionEvent(modalId, modalType)
	end, {})
	
	return reactModule.createElement(sduiComponent, {
		debugName = "SduiModal",
		componentConfig = p0.sduiComponentConfig,
		sduiContext = var7
	})
end)