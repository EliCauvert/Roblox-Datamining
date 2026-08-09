local serverTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local parent = serverTriggeredModals.Parent
local reactModule = require(parent.React)
local sduiFeatureEntryPoint = require(parent.SduiSharedUtilities).SduiFeatureEntryPoint
local loggerModule = require(serverTriggeredModals.Logger)
local reportPromptImpressionModule = require(serverTriggeredModals.reportPromptImpression)
local sendModalImpressionEventModule = require(serverTriggeredModals.sendModalImpressionEvent)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnableHomepagePromptsForModalsAndBanners = sharedFlagsModule.FFlagEnableHomepagePromptsForModalsAndBanners
local fFlagPromptsHandlerEnabled = sharedFlagsModule.FFlagPromptsHandlerEnabled

return reactModule.memo(function(p0) --[[ line: 46 | named "PromptsContainer" ]]
	-- upvalues: reactModule (ref), reportPromptImpressionModule (ref), loggerModule (ref), sendModalImpressionEventModule (ref), sduiFeatureEntryPoint (ref), fFlagEnableHomepagePromptsForModalsAndBanners (ref), fFlagPromptsHandlerEnabled (ref)
	local modalId = p0.modalId
	local modalType = p0.modalType
	reactModule.useEffect(function() --[[ line: 50 ]]
		-- upvalues: modalId (ref), modalType (ref), reportPromptImpressionModule (copy), loggerModule (copy), sendModalImpressionEventModule (copy)
		if modalId and modalType then
			reportPromptImpressionModule(modalType, modalId):catch(function() --[[ line: 52 ]]
				-- upvalues: loggerModule (copy)
				loggerModule:warning("Failed to report prompt impression")
			end)
			sendModalImpressionEventModule(modalId, modalType)
		end
	end, { modalId, modalType })
	
	return reactModule.createElement(sduiFeatureEntryPoint, {
		shouldDisplayLoading = false,
		shouldDisplayError = false,
		configKey = p0.configKey,
		identifier = if fFlagEnableHomepagePromptsForModalsAndBanners or fFlagPromptsHandlerEnabled then p0.modalId else nil,
		appPage = p0.appPage
	})
end)