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

return reactModule.memo(function(p0) --[[ line: 30 | named "VerticalItem" ]]
	-- upvalues: reactModule (ref), toggleSideSheetModule (ref), sidesheetAnalyticsModule (ref), analyticsConstantsModule (ref), fFlagSideSheetFocusNav (ref), view (ref), text (ref)
	local var6 = if fFlagSideSheetFocusNav then reactModule.useRef(nil) else nil
	
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-small size-full-0 auto-y radius-medium",
		LayoutOrder = p0.layoutOrder,
		onActivated = reactModule.useCallback(function() --[[ line: 31 ]]
			-- upvalues: p0 (ref), toggleSideSheetModule (copy), sidesheetAnalyticsModule (copy), analyticsConstantsModule (copy)
			p0.onActivated()
			toggleSideSheetModule(false)
			sidesheetAnalyticsModule.logSidesheetClosed(analyticsConstantsModule.Source.ItemSelected)
		end, { p0.onActivated }),
		selection = if fFlagSideSheetFocusNav and p0.disableGamepadDirections then {
			NextSelectionRight = if p0.disableGamepadDirections.right then var6 else nil,
			NextSelectionLeft = if p0.disableGamepadDirections.left then var6 else nil
		} else nil,
		ref = if fFlagSideSheetFocusNav then if fFlagSideSheetFocusNav then reactModule.useCallback(function(p1) --[[ line: 39 ]]
			-- upvalues: var6 (ref), p0 (ref)
			if var6 then
				var6.current = p1
			end
			if p1 and p0.firstIntegrationToFocusCallback then
				p0.firstIntegrationToFocusCallback(p1)
			end
		end, { p0.firstIntegrationToFocusCallback }) else nil else nil
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