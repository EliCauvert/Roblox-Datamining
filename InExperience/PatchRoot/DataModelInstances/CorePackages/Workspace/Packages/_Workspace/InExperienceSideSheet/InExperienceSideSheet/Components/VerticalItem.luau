local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local parent = inExperienceSideSheet.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local analyticsConstantsModule = require(inExperienceSideSheet.Analytics.AnalyticsConstants)
local sidesheetAnalyticsModule = require(inExperienceSideSheet.Analytics.SidesheetAnalytics)
local toggleSideSheetModule = require(inExperienceSideSheet.Utils.toggleSideSheet)

return reactModule.memo(function(p0) --[[ line: 22 | named "VerticalItem" ]]
	-- upvalues: reactModule (ref), toggleSideSheetModule (ref), sidesheetAnalyticsModule (ref), analyticsConstantsModule (ref), view (ref), text (ref)
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-small size-full-0 auto-y radius-medium",
		LayoutOrder = p0.layoutOrder,
		onActivated = reactModule.useCallback(function() --[[ line: 23 ]]
			-- upvalues: p0 (ref), toggleSideSheetModule (copy), sidesheetAnalyticsModule (copy), analyticsConstantsModule (copy)
			p0.onActivated()
			toggleSideSheetModule(false)
			sidesheetAnalyticsModule.logSidesheetClosed(analyticsConstantsModule.Source.ItemSelected)
		end, { p0.onActivated })
	}, {
		IconContainer = reactModule.createElement(view, {
			tag = "align-x-center align-y-center size-1000 auto-xy",
			LayoutOrder = 1
		}, { Icon = p0.icon({ visible = true }) }),
		Label = reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "auto-xy padding-y-small text-title-medium text-align-x-left text-truncate-split content-emphasis",
			Text = p0.label
		})
	})
end)