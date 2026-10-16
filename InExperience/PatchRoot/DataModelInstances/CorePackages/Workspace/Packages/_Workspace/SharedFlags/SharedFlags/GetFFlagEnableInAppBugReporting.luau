local EnableInAppBugReporting = game:DefineFastFlag("EnableInAppBugReporting", false)

return function() --[[ Line: 3 ]]
	-- upvalues: EnableInAppBugReporting (copy)
	return EnableInAppBugReporting and game:GetEngineFeature("BugReporterProtocol")
end