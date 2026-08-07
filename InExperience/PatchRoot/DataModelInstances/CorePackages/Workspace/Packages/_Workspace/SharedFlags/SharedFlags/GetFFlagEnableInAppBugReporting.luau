local enableInAppBugReporting = game:DefineFastFlag("EnableInAppBugReporting", false)

return function() --[[ line: 3 ]]
	-- upvalues: enableInAppBugReporting (ref)
	return enableInAppBugReporting and game:GetEngineFeature("BugReporterProtocol")
end