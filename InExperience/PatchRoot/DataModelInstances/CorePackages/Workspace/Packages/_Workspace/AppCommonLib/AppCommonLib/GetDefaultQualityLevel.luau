local isVRAppBuildModule = require(script.Parent.IsVRAppBuild)

return function()
	-- upvalues: isVRAppBuildModule (ref)
	return if isVRAppBuildModule() then Enum.QualityLevel.Level07 else Enum.QualityLevel.Automatic
end