local onPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local parent = onPlatformSurveys.Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local surfaceModule = require(onPlatformSurveys.Enums.Surface)
local surveyModalModule = require(onPlatformSurveys.Components.SurveyModal)

return reactModule.memo(function(p0) --[[ line: 24 | named "SurfaceWrapper" ]]
	-- upvalues: surfaceModule (ref), reactModule (ref), surveyModalModule (ref), view (ref)
	return if p0.surface == surfaceModule.Modal then reactModule.createElement(surveyModalModule, {
		isOpen = p0.isOpen,
		onClose = p0.onClose,
		title = p0.title,
		footer = p0.footer,
		children = p0.children
	}) else reactModule.createElement(view, { tag = "size-full-0 auto-y" }, p0.children)
end)