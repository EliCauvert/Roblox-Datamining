local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local AnalyticsConstantsModule = require(InExperienceSideSheet.Analytics.AnalyticsConstants)
local SidesheetAnalyticsModule = require(InExperienceSideSheet.Analytics.SidesheetAnalytics)
local ToggleSideSheetModule = require(InExperienceSideSheet.Utils.toggleSideSheet)
local FFlagSideSheetFocusNav = require(Parent.SharedFlags).FFlagSideSheetFocusNav

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), ToggleSideSheetModule (copy), SidesheetAnalyticsModule (copy), AnalyticsConstantsModule (copy), FFlagSideSheetFocusNav (copy), View (copy), Text (copy)
	local UseRefResult = if FFlagSideSheetFocusNav then ReactModule.useRef(nil) else nil
	local UseResult = if FFlagSideSheetFocusNav then ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), p1 (copy)
		if UseRefResult then
			UseRefResult.current = Current
		end
		if Current and p1.firstIntegrationToFocusCallback then
			p1.firstIntegrationToFocusCallback(Current)
		end
	end, { p1.firstIntegrationToFocusCallback }) else nil
	
	return ReactModule.createElement(View, {
		tag = "row align-y-center gap-small size-full-0 auto-y radius-medium",
		LayoutOrder = p1.layoutOrder,
		onActivated = ReactModule.useCallback(function()
			-- upvalues: p1 (copy), ToggleSideSheetModule (upval), SidesheetAnalyticsModule (upval), AnalyticsConstantsModule (upval)
			p1.onActivated()
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
			tag = "align-x-center align-y-center size-1000 auto-xy",
			LayoutOrder = 1
		}, { Icon = p1.icon({ visible = true }) }),
		Label = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			tag = "auto-xy padding-y-small text-title-medium text-align-x-left text-truncate-split content-emphasis",
			Text = p1.label
		})
	})
end)