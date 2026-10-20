local EnableInAppBugReporting = game:DefineFastFlag("EnableInAppBugReporting", false)

return function()
	-- upvalues: EnableInAppBugReporting (copy)
	return EnableInAppBugReporting and game:GetEngineFeature("BugReporterProtocol")
end