local OnPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local Parent = OnPlatformSurveys.Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local SurfaceModule = require(OnPlatformSurveys.Enums.Surface)
local SurveyModalModule = require(OnPlatformSurveys.Components.SurveyModal)

return ReactModule.memo(function(p1) --[[ Line: 24 | Named "SurfaceWrapper" ]]
	-- upvalues: SurfaceModule (copy), ReactModule (copy), SurveyModalModule (copy), View (copy)
	return if p1.surface == SurfaceModule.Modal then ReactModule.createElement(SurveyModalModule, {
		isOpen = p1.isOpen,
		onClose = p1.onClose,
		title = p1.title,
		footer = p1.footer,
		children = p1.children
	}) else ReactModule.createElement(View, { tag = "size-full-0 auto-y" }, p1.children)
end)