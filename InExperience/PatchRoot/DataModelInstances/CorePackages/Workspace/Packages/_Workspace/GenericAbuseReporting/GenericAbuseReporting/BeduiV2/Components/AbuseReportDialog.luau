local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FocusNavigableSurfaceIdentifierEnum = require(Parent.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum
local IconButton = FoundationModule.IconButton
local InputSize = FoundationModule.Enums.InputSize
local Sheet = FoundationModule.Sheet
local View = FoundationModule.View
local AbuseReportTooltipModule = require(GenericAbuseReporting.BeduiV2.Components.AbuseReportTooltip)
local _ = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local _ = require(GenericAbuseReporting.Enums.AbuseVector)
local UseFocusNavigationRefsModule = require(GenericAbuseReporting.BeduiV2.Hooks.FocusNavigation.useFocusNavigationRefs)

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), UseFocusNavigationRefsModule (copy), FocusNavigableSurfaceIdentifierEnum (copy), Sheet (copy), View (copy), IconButton (copy), InputSize (copy), FoundationModule (copy), ButtonVariant (copy), AbuseReportTooltipModule (copy)
	local AbuseReportFlow = p1.abuseReportFlow
	local Config = AbuseReportFlow.config
	local CurrentPageElement = AbuseReportFlow.currentPageElement
	local CanGoBack = AbuseReportFlow.canGoBack
	local UseStateResult, UseStateResult2 = ReactModule.useState(Config.display.titleDisclosure and Config.display.titleDisclosure.openByDefault or false)
	local UseFocusNavigationRefsModuleResult = UseFocusNavigationRefsModule(FocusNavigableSurfaceIdentifierEnum.CentralOverlay, function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), p1 (copy)
		if UseStateResult then
			p1.takeoverFocus(true)
			
			return
		else
			p1.takeoverFocus(false)
		end
	end, { p1.takeoverFocus, UseStateResult })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(function(p2): boolean
			return not p2
		end)
	end, {})
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Header = ReactModule.createElement(Sheet.Header, nil, ReactModule.createElement(View, {
			tag = "row flex-between align-y-center gap-small size-full-0 auto-y"
		}, {
			ReactModule.createElement(View, { tag = "row align-y-center gap-small auto-xy" }, {
				BackIcon = if CanGoBack then ReactModule.createElement(IconButton, {
					LayoutOrder = 1,
					size = InputSize.Medium,
					icon = FoundationModule.Enums.IconName.ChevronLargeLeft,
					variant = ButtonVariant.Utility,
					onActivated = AbuseReportFlow.goBack
				}) else nil
			}),
			AbuseReportTooltip = if Config.display.titleDisclosure then ReactModule.createElement(AbuseReportTooltipModule, {
				layoutOrder = 3,
				tooltipTitle = Config.display.titleDisclosure.tooltipTitle,
				tooltipText = Config.display.titleDisclosure.tooltipText,
				buttonLabel = Config.display.titleDisclosure.buttonLabel,
				isOpen = UseStateResult,
				onClose = UseResult,
				ref = UseFocusNavigationRefsModuleResult
			}, ReactModule.createElement(IconButton, {
				LayoutOrder = 3,
				size = InputSize.Medium,
				icon = FoundationModule.Enums.IconName.CircleI,
				variant = ButtonVariant.Utility,
				onActivated = UseResult
			})) else nil
		})),
		Content = CurrentPageElement
	})
end)