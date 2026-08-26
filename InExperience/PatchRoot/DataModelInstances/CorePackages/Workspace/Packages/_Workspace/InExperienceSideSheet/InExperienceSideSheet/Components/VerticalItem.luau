local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local parent = inExperienceSideSheet.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local analyticsConstantsModule = require(inExperienceSideSheet.Analytics.AnalyticsConstants)
local sidesheetAnalyticsModule = require(inExperienceSideSheet.Analytics.SidesheetAnalytics)
local toggleSideSheetModule = require(inExperienceSideSheet.Utils.toggleSideSheet)
local fFlagSideSheetFocusNav = require(parent.SharedFlags).FFlagSideSheetFocusNav

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), toggleSideSheetModule (ref), sidesheetAnalyticsModule (ref), analyticsConstantsModule (ref), fFlagSideSheetFocusNav (ref), view (ref), text (ref)
	local var1 = if fFlagSideSheetFocusNav then reactModule.useRef(nil) else nil
	
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-small size-full-0 auto-y radius-medium",
		LayoutOrder = p1.layoutOrder,
		onActivated = reactModule.useCallback(function()
			-- upvalues: p1 (ref), toggleSideSheetModule (copy), sidesheetAnalyticsModule (copy), analyticsConstantsModule (copy)
			p1.onActivated()
			toggleSideSheetModule(false)
			sidesheetAnalyticsModule.logSidesheetClosed(analyticsConstantsModule.Source.ItemSelected)
		end, { p1.onActivated }),
		selection = if fFlagSideSheetFocusNav and p1.disableGamepadDirections then {
			NextSelectionRight = if p1.disableGamepadDirections.right then var1 else nil,
			NextSelectionLeft = if p1.disableGamepadDirections.left then var1 else nil
		} else nil,
		ref = if fFlagSideSheetFocusNav then if fFlagSideSheetFocusNav then reactModule.useCallback(function(p2)
			-- upvalues: var1 (ref), p1 (ref)
			if var1 then
				var1.current = p2
			end
			if p2 and p1.firstIntegrationToFocusCallback then
				p1.firstIntegrationToFocusCallback(p2)
			end
		end, { p1.firstIntegrationToFocusCallback }) else nil else nil
	}, {
		IconContainer = reactModule.createElement(view, {
			tag = "align-x-center align-y-center size-1000 auto-xy",
			LayoutOrder = 1
		}, { Icon = p1.icon({ visible = true }) }),
		Label = reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "auto-xy padding-y-small text-title-medium text-align-x-left text-truncate-split content-emphasis",
			Text = p1.label
		})
	})
end)