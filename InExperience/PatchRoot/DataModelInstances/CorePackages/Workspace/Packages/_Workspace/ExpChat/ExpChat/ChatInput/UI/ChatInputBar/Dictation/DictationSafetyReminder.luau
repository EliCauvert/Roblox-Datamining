local expChat = script:FindFirstAncestor("ExpChat")
local dictationSafetyReminderSignalModule = require(expChat.Parent.InterventionShared.dictationSafetyReminderSignal)
local fFlagExpChatDictationGrafanaMetricsModule = require(expChat.Flags.FFlagExpChatDictationGrafanaMetrics)
local dictationAnalyticsModule = require(script.Parent.DictationAnalytics)

return require(script.Parent.createDictationSafetyReminder)({
	onTriggered = function()
		-- upvalues: dictationAnalyticsModule (ref), fFlagExpChatDictationGrafanaMetricsModule (ref), dictationSafetyReminderSignalModule (ref)
		dictationAnalyticsModule.fire(dictationAnalyticsModule.Events.SafetyReminderTriggered, {
			[dictationAnalyticsModule.Properties.SttMode] = dictationAnalyticsModule.Modes.Continuous
		})
		
		if fFlagExpChatDictationGrafanaMetricsModule then
			dictationAnalyticsModule.reportSafetyReminderCounter()
		end
		dictationSafetyReminderSignalModule:fire()
	end
})