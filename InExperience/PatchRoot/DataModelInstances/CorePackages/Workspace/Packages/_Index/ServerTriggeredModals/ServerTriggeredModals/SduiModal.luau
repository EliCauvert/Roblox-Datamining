local serverTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local parent = serverTriggeredModals.Parent
local serverDrivenUiModule = require(parent.ServerDrivenUi)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local reactModule = require(parent.React)
local reportModalImpressionModule = require(serverTriggeredModals.reportModalImpression)
local sendModalImpressionEventModule = require(serverTriggeredModals.sendModalImpressionEvent)
local roactServiceTagsModule = require(parent.RoactServiceTags)
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local appPage = robloxAppEnumsModule.AppPage
local useSduiContext = serverDrivenUiModule.useSduiContext
local sduiComponent = serverDrivenUiModule.SduiComponent

return reactModule.memo(function(p0) --[[ line: 22 ]]
	-- upvalues: useRoactService (ref), roactServiceTagsModule (ref), useSduiContext (ref), appPage (ref), reactModule (ref), reportModalImpressionModule (ref), sendModalImpressionEventModule (ref), sduiComponent (ref)
	local var7 = useRoactService(roactServiceTagsModule.RoactNetworking)
	local var8 = useSduiContext({ appPage = appPage.Home, dataUpdatedTimestamp = os.time() })
	local modalId = p0.modalId
	local modalType = p0.modalType
	reactModule.useEffect(function() --[[ line: 31 ]]
		-- upvalues: reportModalImpressionModule (copy), var7 (ref), modalId (ref), modalType (ref), sendModalImpressionEventModule (copy)
		reportModalImpressionModule(var7, modalId, modalType)
		sendModalImpressionEventModule(modalId, modalType)
	end, {})
	
	return reactModule.createElement(sduiComponent, {
		debugName = "SduiModal",
		componentConfig = p0.sduiComponentConfig,
		sduiContext = var8
	})
end)