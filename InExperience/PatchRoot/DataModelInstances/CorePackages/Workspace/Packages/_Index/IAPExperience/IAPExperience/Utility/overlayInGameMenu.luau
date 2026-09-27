local parent = script.Parent.Parent.Parent
local reactModule = require(parent.React)
local appCommonLibModule = require(parent.AppCommonLib)

return function(p1)
	-- upvalues: appCommonLibModule (ref), reactModule (ref)
	return if appCommonLibModule.IsVRAppBuild() or appCommonLibModule.isTenFootInterface() then p1 else reactModule.createElement("ScreenGui", {
		Enabled = true,
		DisplayOrder = 10,
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Global
	}, { Component = p1 })
end