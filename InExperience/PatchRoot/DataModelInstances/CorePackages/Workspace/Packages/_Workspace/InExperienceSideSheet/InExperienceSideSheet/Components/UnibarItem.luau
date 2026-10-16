local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local IconHostModule = require(script.Parent.IconHost)
local AnalyticsConstantsModule = require(InExperienceSideSheet.Analytics.AnalyticsConstants)
local SidesheetAnalyticsModule = require(InExperienceSideSheet.Analytics.SidesheetAnalytics)
local ClosePeoplePageOpenedWithSideSheetModule = require(InExperienceSideSheet.Utils.closePeoplePageOpenedWithSideSheet)
local ToggleSideSheetModule = require(InExperienceSideSheet.Utils.toggleSideSheet)
local FFlagSideSheetOpenPeoplePage = require(InExperienceSideSheet.Flags).FFlagSideSheetOpenPeoplePage
local FFlagSideSheetFocusNav = require(Parent.SharedFlags).FFlagSideSheetFocusNav

return ReactModule.memo(function(p1) --[[ Line: 33 | Named "UnibarItem" ]]
	-- upvalues: ReactModule (copy), FFlagSideSheetOpenPeoplePage (copy), ClosePeoplePageOpenedWithSideSheetModule (copy), ToggleSideSheetModule (copy), SidesheetAnalyticsModule (copy), AnalyticsConstantsModule (copy), FFlagSideSheetFocusNav (copy), View (copy), IconHostModule (copy)
	local UseRefResult = if FFlagSideSheetFocusNav then ReactModule.useRef(nil) else nil
	
	return ReactModule.createElement(View, { tag = "auto-xy", LayoutOrder = p1.layoutOrder }, {
		IconHost = ReactModule.createElement(IconHostModule, { icon = p1.icon, notification = p1.notification }),
		ActivationOverlay = ReactModule.createElement(View, {
			tag = "size-full radius-circle",
			ZIndex = 10,
			onActivated = ReactModule.useCallback(function() --[[ Line: 34 ]]
				-- upvalues: p1 (copy), FFlagSideSheetOpenPeoplePage (upval), ClosePeoplePageOpenedWithSideSheetModule (upval), ToggleSideSheetModule (upval), SidesheetAnalyticsModule (upval), AnalyticsConstantsModule (upval)
				p1.onActivated()
				
				if FFlagSideSheetOpenPeoplePage then
					ClosePeoplePageOpenedWithSideSheetModule()
				end
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