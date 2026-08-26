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

return reactModule.memo(function(p1)
	-- upvalues: useRoactService (ref), roactServiceTagsModule (ref), useSduiContext (ref), appPage (ref), reactModule (ref), reportModalImpressionModule (ref), sendModalImpressionEvent (ref), sduiComponent (ref)
	local var1 = useRoactService(roactServiceTagsModule.RoactNetworking)
	local var2 = useSduiContext({ appPage = appPage.Home, dataUpdatedTimestamp = os.time() })
	local modalId = p1.modalId
	local modalType = p1.modalType
	reactModule.useEffect(function()
		-- upvalues: reportModalImpressionModule (copy), var1 (ref), modalId (ref), modalType (ref), sendModalImpressionEvent (copy)
		reportModalImpressionModule(var1, modalId, modalType)
		sendModalImpressionEvent(modalId, modalType)
	end, {})
	
	return reactModule.createElement(sduiComponent, {
		debugName = "SduiModal",
		componentConfig = p1.sduiComponentConfig,
		sduiContext = var2
	})
end)