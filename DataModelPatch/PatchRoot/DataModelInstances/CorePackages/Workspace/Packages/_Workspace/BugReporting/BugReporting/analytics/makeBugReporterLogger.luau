local Parent = script:FindFirstAncestor("BugReporting").Parent
local DashModule = require(Parent.Dash)
local MutedErrorFunction = require(Parent.Loggers).mutedError
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local TutilsModule = require(Parent.tutils)
local _ = require(script.Parent.Parent.BugReporterTypes)
local config = {
	eventName = "BugReporter_MilestoneDetails",
	description = "Milestone events related to in-app bug reporting",
	links = "",
	backends = {
		LoggingProtocolModule.TelemetryBackends.Points,
		LoggingProtocolModule.TelemetryBackends.EventIngest
	},
	throttlingPercentage = game:DefineFastInt("BugReporterMilestoneHundredthsPercent", 0),
	lastUpdated = { 25, 2, 18 }
}
local config1 = {
	eventName = "BugReporter_ErrorDetails",
	description = "Error details related to in-app bug reporting",
	links = "",
	backends = {
		LoggingProtocolModule.TelemetryBackends.Points,
		LoggingProtocolModule.TelemetryBackends.EventIngest
	},
	throttlingPercentage = game:DefineFastInt("BugReporterErrorHundredthsPercent", 0),
	lastUpdated = { 25, 2, 18 }
}
local config2 = {
	eventName = "BugReporter_ErrorCounter",
	throttlingPercentage = 0,
	description = "Error related to in-app bug reporting",
	backends = { LoggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 25, 2, 18 }
}
local config3 = {
	ReportInitiated = {
		eventName = "BugReporter_Counter_ReportInitiated",
		throttlingPercentage = 0,
		description = "Counter tracking when the in-app bug reporting flow has be initiated",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 25, 2, 18 }
	},
	ReportOpened = {
		eventName = "BugReporter_Counter_ReportOpened",
		throttlingPercentage = 0,
		description = "Counter tracking when the in-app bug reporting UI has opened",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 25, 2, 18 }
	},
	ReportSubmitted = {
		eventName = "BugReporter_Counter_ReportSubmitted",
		throttlingPercentage = 0,
		description = "Counter tracking when a in-app bug report has been submitted",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 25, 2, 18 }
	},
	ReportSucceeded = {
		eventName = "BugReporter_Counter_ReportSucceeded",
		throttlingPercentage = 0,
		description = "Counter tracking when a in-app bug report has been sent successfully",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 25, 2, 18 }
	},
	ReportAbandoned = {
		eventName = "BugReporter_Counter_ReportAbandoned",
		throttlingPercentage = 0,
		description = "Counter tracking when the in-app bug report flow has been abandoned before completion",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 25, 2, 18 }
	},
	ScreenshotCaptured = {
		eventName = "BugReporter_Counter_ScreenshotCaptured",
		throttlingPercentage = 0,
		description = "Counter tracking when a screenshot has been captured for an in-app bug report",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 25, 2, 18 }
	},
	ScreenshotUploaded = {
		eventName = "BugReporter_Counter_ScreenshotUploaded",
		throttlingPercentage = 0,
		description = "Counter tracking when a screenshot has been uploaded for an in-app bug report",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 25, 2, 18 }
	}
}

return function(p1, Trigger)
	-- upvalues: config2 (copy), config1 (copy), DashModule (copy), TutilsModule (copy), config (copy), config3 (copy), MutedErrorFunction (copy)
	assert(p1, "loggingProtocol must exist")
	assert(Trigger, "trigger must exist")
	
	return {
		reportError = function(ErrorType, p2)
			-- upvalues: p1 (copy), config2 (upval), Trigger (copy), config1 (upval), DashModule (upval), TutilsModule (upval)
			p1:logRobloxTelemetryCounter(config2, 1, { errorType = ErrorType, trigger = Trigger })
			p1:logRobloxTelemetryEvent(config1, { "addOSInfo", "addSessionId", "addSessionInfo" }, DashModule.assign({ errorType = ErrorType, trigger = Trigger }, p2 or {}))
			
			if not _G.__TEST_SUITE_PACKAGE__ and not _G.__TESTEZ_RUNNING_TEST__ then
				warn(`Bug reporter ui error: {Trigger} {ErrorType}\n{TutilsModule.toString(p2)}`)
			end
		end,
		reportMilestone = function(Milestone, p2)
			-- upvalues: p1 (copy), config (upval), DashModule (upval), Trigger (copy)
			p1:logRobloxTelemetryEvent(config, { "addOSInfo", "addSessionId", "addSessionInfo" }, DashModule.assign({ trigger = Trigger, milestone = Milestone }, p2 or {}))
		end,
		reportCounter = function(p2, p3)
			-- upvalues: config3 (upval), MutedErrorFunction (upval), p1 (copy), DashModule (upval), Trigger (copy)
			local Entry = config3[p2]
			
			if Entry == nil then
				MutedErrorFunction(`Bug reporter logging error: No counter config found for {p2}`)
				
				return
			else
				p1:logRobloxTelemetryCounter(Entry, 1, DashModule.assign({ trigger = Trigger }, p3 or {}))
			end
		end
	}
end