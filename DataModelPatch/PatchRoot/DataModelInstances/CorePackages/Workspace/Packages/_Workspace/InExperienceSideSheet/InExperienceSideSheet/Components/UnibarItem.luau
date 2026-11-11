local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local IconHostModule = require(script.Parent.IconHost)
local AnalyticsConstantsModule = require(InExperienceSideSheet.Analytics.AnalyticsConstants)
local SidesheetAnalyticsModule = require(InExperienceSideSheet.Analytics.SidesheetAnalytics)
local ToggleSideSheetModule = require(InExperienceSideSheet.Utils.toggleSideSheet)
local FFlagSideSheetFocusNav = require(Parent.SharedFlags).FFlagSideSheetFocusNav

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), ToggleSideSheetModule (copy), SidesheetAnalyticsModule (copy), AnalyticsConstantsModule (copy), FFlagSideSheetFocusNav (copy), View (copy), IconHostModule (copy)
	local UseRefResult = if FFlagSideSheetFocusNav then ReactModule.useRef(nil) else nil
	
	return ReactModule.createElement(View, { tag = "auto-xy", LayoutOrder = p1.layoutOrder }, {
		IconHost = ReactModule.createElement(IconHostModule, { icon = p1.icon, notification = p1.notification }),
		ActivationOverlay = ReactModule.createElement(View, {
			tag = "size-full radius-circle",
			ZIndex = 10,
			onActivated = ReactModule.useCallback(function()
				-- upvalues: p1 (copy), ToggleSideSheetModule (upval), SidesheetAnalyticsModule (upval), AnalyticsConstantsModule (upval)
				p1.onActivated()
				ToggleSideSheetModule(false)
				SidesheetAnalyticsModule.logSidesheetClosed(AnalyticsConstantsModule.Source.ItemSelected)
			end, { p1.onActivated }),
			selection = if FFlagSideSheetFocusNav and p1.disableGamepadDirections then {
				NextSelectionLeft = if p1.disableGamepadDirections.left then UseRefResult else nil
			} else nil,
			ref = UseRefResult
		})
	})
end)