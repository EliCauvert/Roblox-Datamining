local Parent = script.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local AppCommonLibModule = require(Parent.AppCommonLib)

return function(Component) --[[ Line: 6 ]]
	-- upvalues: AppCommonLibModule (copy), ReactModule (copy)
	return if AppCommonLibModule.IsVRAppBuild() or AppCommonLibModule.isTenFootInterface() then Component else ReactModule.createElement("ScreenGui", {
		Enabled = true,
		DisplayOrder = 10,
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Global
	}, { Component = Component })
end