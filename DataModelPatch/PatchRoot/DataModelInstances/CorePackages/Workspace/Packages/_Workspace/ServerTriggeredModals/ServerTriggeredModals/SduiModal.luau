local ServerTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local Parent = ServerTriggeredModals.Parent
local ServerDrivenUiModule = require(Parent.ServerDrivenUi)
local ReactModule = require(Parent.React)
local ReportModalImpressionModule = require(ServerTriggeredModals.reportModalImpression)
local SendModalImpressionEventModule = require(ServerTriggeredModals.sendModalImpressionEvent)
local RoactServiceTagsModule = require(Parent.RoactServiceTags)
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UseSduiContextFunction = ServerDrivenUiModule.useSduiContext
local SduiComponent = ServerDrivenUiModule.SduiComponent

return ReactModule.memo(function(p1)
	-- upvalues: UseRoactServiceFunction (copy), RoactServiceTagsModule (copy), UseSduiContextFunction (copy), AppPage (copy), ReactModule (copy), ReportModalImpressionModule (copy), SendModalImpressionEventModule (copy), SduiComponent (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactServiceTagsModule.RoactNetworking)
	local UseSduiContextResult = UseSduiContextFunction({ appPage = AppPage.Home, dataUpdatedTimestamp = os.time() })
	local ModalId = p1.modalId
	local ModalType = p1.modalType
	ReactModule.useEffect(function()
		-- upvalues: ReportModalImpressionModule (upval), UseRoactServiceResult (copy), ModalId (copy), ModalType (copy), SendModalImpressionEventModule (upval)
		ReportModalImpressionModule(UseRoactServiceResult, ModalId, ModalType)
		SendModalImpressionEventModule(ModalId, ModalType)
	end, {})
	
	return ReactModule.createElement(SduiComponent, {
		debugName = "SduiModal",
		componentConfig = p1.sduiComponentConfig,
		sduiContext = UseSduiContextResult
	})
end)