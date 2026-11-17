local ServerTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local Parent = ServerTriggeredModals.Parent
local ReactModule = require(Parent.React)
local SduiFeatureEntryPoint = require(Parent.SduiSharedUtilities).SduiFeatureEntryPoint
local LoggerModule = require(ServerTriggeredModals.Logger)
local ReportPromptImpressionModule = require(ServerTriggeredModals.reportPromptImpression)
local SendModalImpressionEventFunction = require(Parent.ServerTriggeredModalImpressions).sendModalImpressionEvent
local FFlagPromptsActionEventLoggingModule = require(ServerTriggeredModals.Flags.FFlagPromptsActionEventLogging)

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), ReportPromptImpressionModule (copy), LoggerModule (copy), SendModalImpressionEventFunction (copy), SduiFeatureEntryPoint (copy), FFlagPromptsActionEventLoggingModule (copy)
	local ModalId = p1.modalId
	local ModalType = p1.modalType
	ReactModule.useEffect(function()
		-- upvalues: ModalId (copy), ModalType (copy), ReportPromptImpressionModule (upval), LoggerModule (upval), SendModalImpressionEventFunction (upval)
		if ModalId and ModalType then
			ReportPromptImpressionModule(ModalType, ModalId):catch(function()
				-- upvalues: LoggerModule (upval)
				LoggerModule:warning("Failed to report prompt impression")
			end)
			SendModalImpressionEventFunction(ModalId, ModalType)
		end
	end, { ModalId, ModalType })
	
	return ReactModule.createElement(SduiFeatureEntryPoint, {
		shouldDisplayLoading = false,
		shouldDisplayError = false,
		configKey = p1.configKey,
		identifier = p1.modalId,
		appPage = p1.appPage,
		additionalAnalyticsData = if FFlagPromptsActionEventLoggingModule then { promptInstanceId = ModalId or nil } else nil
	})
end)