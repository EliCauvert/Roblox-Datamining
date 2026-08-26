local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local parent = inExperienceSideSheet.Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local iconHostModule = require(script.Parent.IconHost)
local analyticsConstantsModule = require(inExperienceSideSheet.Analytics.AnalyticsConstants)
local sidesheetAnalyticsModule = require(inExperienceSideSheet.Analytics.SidesheetAnalytics)
local toggleSideSheetModule = require(inExperienceSideSheet.Utils.toggleSideSheet)
local fFlagSideSheetFocusNav = require(parent.SharedFlags).FFlagSideSheetFocusNav

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), toggleSideSheetModule (ref), sidesheetAnalyticsModule (ref), analyticsConstantsModule (ref), fFlagSideSheetFocusNav (ref), view (ref), iconHostModule (ref)
	local var1 = if fFlagSideSheetFocusNav then reactModule.useRef(nil) else nil
	
	return reactModule.createElement(view, { tag = "auto-xy", LayoutOrder = p1.layoutOrder }, {
		IconHost = reactModule.createElement(iconHostModule, { icon = p1.icon, notification = p1.notification }),
		ActivationOverlay = reactModule.createElement(view, {
			tag = "size-full radius-circle",
			ZIndex = 10,
			onActivated = reactModule.useCallback(function()
				-- upvalues: p1 (ref), toggleSideSheetModule (copy), sidesheetAnalyticsModule (copy), analyticsConstantsModule (copy)
				p1.onActivated()
				toggleSideSheetModule(false)
				sidesheetAnalyticsModule.logSidesheetClosed(analyticsConstantsModule.Source.ItemSelected)
			end, { p1.onActivated }),
			selection = if fFlagSideSheetFocusNav and p1.disableGamepadDirections then {
				NextSelectionLeft = if p1.disableGamepadDirections.left then var1 else nil
			} else nil,
			ref = var1
		})
	})
end)