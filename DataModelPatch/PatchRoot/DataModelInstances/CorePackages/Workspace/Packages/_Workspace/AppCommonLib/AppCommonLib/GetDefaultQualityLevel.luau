local IsVRAppBuildModule = require(script.Parent.IsVRAppBuild)

return function()
	-- upvalues: IsVRAppBuildModule (copy)
	return if IsVRAppBuildModule() then Enum.QualityLevel.Level07 else Enum.QualityLevel.Automatic
end