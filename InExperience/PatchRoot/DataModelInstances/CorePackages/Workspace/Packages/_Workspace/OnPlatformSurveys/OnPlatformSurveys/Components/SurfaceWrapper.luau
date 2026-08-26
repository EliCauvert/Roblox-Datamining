local onPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local parent = onPlatformSurveys.Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local surfaceModule = require(onPlatformSurveys.Enums.Surface)
local surveyModalModule = require(onPlatformSurveys.Components.SurveyModal)

return reactModule.memo(function(p1)
	-- upvalues: surfaceModule (ref), reactModule (ref), surveyModalModule (ref), view (ref)
	return if p1.surface == surfaceModule.Modal then reactModule.createElement(surveyModalModule, {
		isOpen = p1.isOpen,
		onClose = p1.onClose,
		title = p1.title,
		footer = p1.footer,
		children = p1.children
	}) else reactModule.createElement(view, { tag = "size-full-0 auto-y" }, p1.children)
end)