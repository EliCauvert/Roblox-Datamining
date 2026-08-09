local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local parent = inExperienceSideSheet.Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local iconHostModule = require(script.Parent.IconHost)
local analyticsConstantsModule = require(inExperienceSideSheet.Analytics.AnalyticsConstants)
local sidesheetAnalyticsModule = require(inExperienceSideSheet.Analytics.SidesheetAnalytics)
local toggleSideSheetModule = require(inExperienceSideSheet.Utils.toggleSideSheet)

return reactModule.memo(function(p0) --[[ line: 24 | named "UnibarItem" ]]
	-- upvalues: reactModule (ref), toggleSideSheetModule (ref), sidesheetAnalyticsModule (ref), analyticsConstantsModule (ref), view (ref), iconHostModule (ref)
	return reactModule.createElement(view, { tag = "auto-xy", LayoutOrder = p0.layoutOrder }, {
		IconHost = reactModule.createElement(iconHostModule, { icon = p0.icon, notification = p0.notification }),
		ActivationOverlay = reactModule.createElement(view, {
			tag = "size-full radius-circle",
			ZIndex = 10,
			onActivated = reactModule.useCallback(function() --[[ line: 25 ]]
				-- upvalues: p0 (ref), toggleSideSheetModule (copy), sidesheetAnalyticsModule (copy), analyticsConstantsModule (copy)
				p0.onActivated()
				toggleSideSheetModule(false)
				sidesheetAnalyticsModule.logSidesheetClosed(analyticsConstantsModule.Source.ItemSelected)
			end, { p0.onActivated })
		})
	})
end)