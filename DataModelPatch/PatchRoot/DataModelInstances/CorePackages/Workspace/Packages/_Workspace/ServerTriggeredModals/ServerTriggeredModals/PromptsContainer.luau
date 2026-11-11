local ServerTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local Parent = ServerTriggeredModals.Parent
local ReactModule = require(Parent.React)
local SduiFeatureEntryPoint = require(Parent.SduiSharedUtilities).SduiFeatureEntryPoint
local LoggerModule = require(ServerTriggeredModals.Logger)
local ReportPromptImpressionModule = require(ServerTriggeredModals.reportPromptImpression)
local SendModalImpressionEventModule = require(ServerTriggeredModals.sendModalImpressionEvent)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEnableHomepagePromptsForModalsAndBanners = SharedFlagsModule.FFlagEnableHomepagePromptsForModalsAndBanners
local FFlagPromptsHandlerEnabled = SharedFlagsModule.FFlagPromptsHandlerEnabled

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), ReportPromptImpressionModule (copy), LoggerModule (copy), SendModalImpressionEventModule (copy), SduiFeatureEntryPoint (copy), FFlagEnableHomepagePromptsForModalsAndBanners (copy), FFlagPromptsHandlerEnabled (copy)
	local ModalId = p1.modalId
	local ModalType = p1.modalType
	ReactModule.useEffect(function()
		-- upvalues: ModalId (copy), ModalType (copy), ReportPromptImpressionModule (upval), LoggerModule (upval), SendModalImpressionEventModule (upval)
		if ModalId and ModalType then
			ReportPromptImpressionModule(ModalType, ModalId):catch(function()
				-- upvalues: LoggerModule (upval)
				LoggerModule:warning("Failed to report prompt impression")
			end)
			SendModalImpressionEventModule(ModalId, ModalType)
		end
	end, { ModalId, ModalType })
	
	return ReactModule.createElement(SduiFeatureEntryPoint, {
		shouldDisplayLoading = false,
		shouldDisplayError = false,
		configKey = p1.configKey,
		identifier = if FFlagEnableHomepagePromptsForModalsAndBanners or FFlagPromptsHandlerEnabled then p1.modalId else nil,
		appPage = p1.appPage
	})
end)