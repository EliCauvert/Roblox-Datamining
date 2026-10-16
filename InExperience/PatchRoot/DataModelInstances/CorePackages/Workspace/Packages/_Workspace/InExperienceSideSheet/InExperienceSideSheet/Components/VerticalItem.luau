local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local AnalyticsConstantsModule = require(InExperienceSideSheet.Analytics.AnalyticsConstants)
local SidesheetAnalyticsModule = require(InExperienceSideSheet.Analytics.SidesheetAnalytics)
local ClosePeoplePageOpenedWithSideSheetModule = require(InExperienceSideSheet.Utils.closePeoplePageOpenedWithSideSheet)
local ToggleSideSheetModule = require(InExperienceSideSheet.Utils.toggleSideSheet)
local FFlagSideSheetOpenPeoplePage = require(InExperienceSideSheet.Flags).FFlagSideSheetOpenPeoplePage
local FFlagSideSheetFocusNav = require(Parent.SharedFlags).FFlagSideSheetFocusNav

return ReactModule.memo(function(p1) --[[ Line: 33 | Named "VerticalItem" ]]
	-- upvalues: ReactModule (copy), FFlagSideSheetOpenPeoplePage (copy), ClosePeoplePageOpenedWithSideSheetModule (copy), ToggleSideSheetModule (copy), SidesheetAnalyticsModule (copy), AnalyticsConstantsModule (copy), FFlagSideSheetFocusNav (copy), View (copy), Text (copy)
	local UseRefResult = if FFlagSideSheetFocusNav then ReactModule.useRef(nil) else nil
	local UseResult = if FFlagSideSheetFocusNav then ReactModule.useCallback(function(Current) --[[ Line: 45 ]]
		-- upvalues: UseRefResult (copy), p1 (copy)
		if UseRefResult then
			UseRefResult.current = Current
		end
		if Current and p1.firstIntegrationToFocusCallback then
			p1.firstIntegrationToFocusCallback(Current)
		end
	end, { p1.firstIntegrationToFocusCallback }) else nil
	
	return ReactModule.createElement(View, {
		tag = "row align-y-center gap-none size-full-1000 padding-left-xsmall radius-medium",
		LayoutOrder = p1.layoutOrder,
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
			NextSelectionRight = if p1.disableGamepadDirections.right then UseRefResult else nil,
			NextSelectionLeft = if p1.disableGamepadDirections.left then UseRefResult else nil
		} else nil,
		ref = if FFlagSideSheetFocusNav then UseResult else nil
	}, {
		IconContainer = ReactModule.createElement(View, {
			tag = "align-x-center align-y-center size-1000",
			LayoutOrder = 1
		}, { Icon = p1.icon({ visible = true }) }),
		Label = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			tag = "auto-xy padding-x-small text-label-medium text-align-x-left text-truncate-split content-emphasis",
			Text = p1.label
		})
	})
end)