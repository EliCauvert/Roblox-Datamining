local Parent = script.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local AppCommonLibModule = require(Parent.AppCommonLib)
local FFlagKeepSideSheetOpenBesideMenu = require(Parent.SharedFlags).FFlagKeepSideSheetOpenBesideMenu

return function(Component)
	-- upvalues: AppCommonLibModule (copy), FFlagKeepSideSheetOpenBesideMenu (copy), Parent (copy), ReactModule (copy)
	return if AppCommonLibModule.IsVRAppBuild() or AppCommonLibModule.isTenFootInterface() then Component else ReactModule.createElement("ScreenGui", {
		Enabled = true,
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Global,
		DisplayOrder = if FFlagKeepSideSheetOpenBesideMenu then require(Parent.InExperienceSideSheetStore.Constants).PurchasePromptDisplayOrder else 10
	}, { Component = Component })
end