local ExpChat = script:FindFirstAncestor("ExpChat")
local DictationSafetyReminderSignalModule = require(ExpChat.Parent.InterventionShared.dictationSafetyReminderSignal)
local FFlagExpChatDictationGrafanaMetricsModule = require(ExpChat.Flags.FFlagExpChatDictationGrafanaMetrics)
local DictationAnalyticsModule = require(script.Parent.DictationAnalytics)

return require(script.Parent.createDictationSafetyReminder)({
	onTriggered = function()
		-- upvalues: DictationAnalyticsModule (copy), FFlagExpChatDictationGrafanaMetricsModule (copy), DictationSafetyReminderSignalModule (copy)
		DictationAnalyticsModule.fire(DictationAnalyticsModule.Events.SafetyReminderTriggered, {
			[DictationAnalyticsModule.Properties.SttMode] = DictationAnalyticsModule.Modes.Continuous
		})
		
		if FFlagExpChatDictationGrafanaMetricsModule then
			DictationAnalyticsModule.reportSafetyReminderCounter()
		end
		DictationSafetyReminderSignalModule:fire()
	end
})