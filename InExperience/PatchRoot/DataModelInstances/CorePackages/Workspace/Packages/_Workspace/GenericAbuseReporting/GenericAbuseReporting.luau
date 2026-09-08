local _ = require(script.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)

return {
	Components = {
		ReportCompleteDialog = require(script.Dialogs.ReportCompleteDialog),
		ReportFailedDialog = require(script.Dialogs.ReportFailedDialog)
	},
	Enums = {
		AbuseCategory = require(script.Enums.AbuseCategory),
		AbuseEntrypoint = require(script.Enums.AbuseEntrypoint),
		AbuseVector = require(script.Enums.AbuseVector)
	},
	Thunks = {
		OpenDynamicAbuseReport = require(script.Thunks.OpenDynamicAbuseReport)
	},
	UXFlows = {
		DefaultTwoStepReportFlow = require(script.UXFlow.ReportWithReasonAndComment.AREntrypoint),
		DefaultReportDialog = require(script.UXFlow.ReportWithReasonAndComment.ReportWithReasonAndComment),
		DefaultDualDropdownDialog = require(script.UXFlow.DualDropdownReport.DualDropdownReport),
		DefaultDualDropdownDialogV2 = require(script.UXFlow.DualDropdownReport.DualDropdownReportV2),
		DynamicReportContainer = require(script.UXFlow.DynamicReport.DynamicReportContainer),
		DynamicReportInExpContainer = require(script.UXFlow.DynamicReportV2InExp.DynamicReportV2InExpContainer)
	},
	["jest.config"] = script["jest.config"]
}