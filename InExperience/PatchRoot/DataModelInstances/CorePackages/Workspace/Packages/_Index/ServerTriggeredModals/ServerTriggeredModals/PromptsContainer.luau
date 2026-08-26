local serverTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local parent = serverTriggeredModals.Parent
local reactModule = require(parent.React)
local sduiFeatureEntryPoint = require(parent.SduiSharedUtilities).SduiFeatureEntryPoint
local loggerModule = require(serverTriggeredModals.Logger)
local reportPromptImpressionModule = require(serverTriggeredModals.reportPromptImpression)
local sendModalImpressionEvent = require(parent.ServerTriggeredModalImpressions).sendModalImpressionEvent
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnableHomepagePromptsForModalsAndBanners = sharedFlagsModule.FFlagEnableHomepagePromptsForModalsAndBanners
local fFlagPromptsHandlerEnabled = sharedFlagsModule.FFlagPromptsHandlerEnabled

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), reportPromptImpressionModule (ref), loggerModule (ref), sendModalImpressionEvent (ref), sduiFeatureEntryPoint (ref), fFlagEnableHomepagePromptsForModalsAndBanners (ref), fFlagPromptsHandlerEnabled (ref)
	local modalId = p1.modalId
	local modalType = p1.modalType
	reactModule.useEffect(function()
		-- upvalues: modalId (ref), modalType (ref), reportPromptImpressionModule (copy), loggerModule (copy), sendModalImpressionEvent (copy)
		if modalId and modalType then
			reportPromptImpressionModule(modalType, modalId):catch(function()
				-- upvalues: loggerModule (copy)
				loggerModule:warning("Failed to report prompt impression")
			end)
			sendModalImpressionEvent(modalId, modalType)
		end
	end, { modalId, modalType })
	
	return reactModule.createElement(sduiFeatureEntryPoint, {
		shouldDisplayLoading = false,
		shouldDisplayError = false,
		configKey = p1.configKey,
		identifier = if fFlagEnableHomepagePromptsForModalsAndBanners or fFlagPromptsHandlerEnabled then p1.modalId else nil,
		appPage = p1.appPage
	})
end)