local Parent = script.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local GuiService = game:GetService("GuiService")
local AppCommonLibModule = require(Parent.AppCommonLib)

return function(Component)
	-- upvalues: AppCommonLibModule (copy), GuiService (copy), ReactModule (copy)
	return if AppCommonLibModule.IsVRAppBuild() or GuiService:IsTenFootInterface() then Component else ReactModule.createElement("ScreenGui", {
		Enabled = true,
		DisplayOrder = 10,
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Global
	}, { Component = Component })
end