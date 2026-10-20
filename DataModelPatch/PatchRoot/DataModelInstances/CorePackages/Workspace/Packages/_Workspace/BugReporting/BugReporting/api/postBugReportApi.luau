local Parent = script:FindFirstAncestor("BugReporting").Parent
local MutedErrorFunction = require(Parent.Loggers).mutedError
local PromiseModule = require(Parent.Promise)
local TModule = require(Parent.t)
local TutilsModule = require(Parent.tutils)
local HttpModule = require(Parent.Http)
local StatusCodes = HttpModule.StatusCodes
local FormatBugReportContentModule = require(script.Parent.formatBugReportContent)
local SharedConstantsModule = require(script.Parent.Parent.SharedConstants)
local BugReporterErrorType = require(script.Parent.Parent.BugReporterTypes).BugReporterErrorType
local InAppBugReporterMaxTitleLength = game:DefineFastInt("InAppBugReporterMaxTitleLength", 100)
local StrictInterfaceResult = TModule.strictInterface({
	userId = TModule.number,
	userDisplayName = TModule.string,
	screenshotId = TModule.string,
	description = TModule.string,
	logUrl = TModule.string,
	systemInfo = TModule.interface({
		manufacturer = TModule.string,
		deviceName = TModule.string,
		baseOs = TModule.string,
		systemVersion = TModule.string,
		appVersion = TModule.string,
		networkType = TModule.string
	}),
	additionalInfo = TModule.strictInterface({
		screen = TModule.string,
		locale = TModule.string,
		clientChannel = TModule.string,
		coreScriptVersion = TModule.string
	})
})
local InterfaceResult = TModule.interface({
	responseBody = TModule.strictInterface({ issue = TModule.interface({ id = TModule.string }) }),
	responseCode = TModule.number
})
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "feedback/v1/issues",
	base = HttpModule.Url.APIS_URL
})

return function(Callback, p1)
	-- upvalues: StrictInterfaceResult (copy), InAppBugReporterMaxTitleLength (copy), MutedErrorFunction (copy), FormatBugReportContentModule (copy), SharedConstantsModule (copy), NewResult (copy), StatusCodes (copy), PromiseModule (copy), BugReporterErrorType (copy), InterfaceResult (copy), TutilsModule (copy)
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(p1)
	
	if not _G.__TEST_SUITE_PACKAGE__ and not _G.__TESTEZ_RUNNING_TEST__ and not StrictInterfaceResultResult then
		MutedErrorFunction(StrictInterfaceResultResult2)
	end
	local FormatBugReportContentModuleResult = FormatBugReportContentModule(p1, InAppBugReporterMaxTitleLength)
	
	return Callback(NewResult(), "POST", {
		postBody = {
			channel = SharedConstantsModule.ISSUE_CHANNEL,
			title = FormatBugReportContentModuleResult.title,
			description = FormatBugReportContentModuleResult.description,
			attachmentUniformResourceNames = {
				`{SharedConstantsModule.SCREENSHOT_URN_PREFIX}:{p1.screenshotId}`
			}
		}
	}):andThen(function(Result)
		-- upvalues: StatusCodes (upval), PromiseModule (upval), BugReporterErrorType (upval), InterfaceResult (upval), TutilsModule (upval)
		if Result.responseCode == StatusCodes.OK then
			local InterfaceResultResult, InterfaceResultResult2 = InterfaceResult(Result)
			
			return if InterfaceResultResult then PromiseModule.resolve(Result.responseBody) else PromiseModule.reject({
				type = BugReporterErrorType.UnexpectedResponseBody,
				message = `Unexpected response body: {InterfaceResultResult2} \n{TutilsModule.toString(Result.responseBody)}`
			})
		else
			return PromiseModule.reject({
				type = BugReporterErrorType.UnexpectedResponseCode,
				message = `Unexpected response code: {Result.responseCode}`
			})
		end
	end, function(p2)
		-- upvalues: PromiseModule (upval), BugReporterErrorType (upval)
		return PromiseModule.reject({
			type = BugReporterErrorType.FailedToUploadBugReport,
			message = `Request failure {p2.StatusCode} {p2.StatusMessage}`
		})
	end)
end