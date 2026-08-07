local isVRAppBuildModule = require(script.Parent.IsVRAppBuild)

return function() --[[ line: 3 ]]
	-- upvalues: isVRAppBuildModule (ref)
	return if isVRAppBuildModule() then Enum.QualityLevel.Level07 else Enum.QualityLevel.Automatic
end