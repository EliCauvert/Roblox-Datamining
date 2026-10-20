local _ = require(script:FindFirstAncestor("BugReporting").Parent.SystemInfoProtocol)

return {
	BugReporterErrorType = {
		FailedToCaptureScreenshot = "FailedToCaptureScreenshot",
		FailedToUploadScreenshot = "FailedToUploadScreenshot",
		FailedToUploadDeviceLogs = "FailedToUploadDeviceLogs",
		InvalidBugReportMetadata = "InvalidBugReportMetadata",
		FailedToUploadBugReport = "FailedToUploadBugReport",
		UnexpectedResponseBody = "UnexpectedResponseBody",
		UnexpectedResponseCode = "UnexpectedResponseCode"
	},
	BugReporterCounterName = {
		ReportInitiated = "ReportInitiated",
		ReportOpened = "ReportOpened",
		ReportSubmitted = "ReportSubmitted",
		ReportSucceeded = "ReportSucceeded",
		ReportAbandoned = "ReportAbandoned",
		ScreenshotCaptured = "ScreenshotCaptured",
		ScreenshotUploaded = "ScreenshotUploaded"
	}
}