local enableInAppBugReporting = game:DefineFastFlag("EnableInAppBugReporting", false)

return function()
	-- upvalues: enableInAppBugReporting (ref)
	return enableInAppBugReporting and game:GetEngineFeature("BugReporterProtocol")
end