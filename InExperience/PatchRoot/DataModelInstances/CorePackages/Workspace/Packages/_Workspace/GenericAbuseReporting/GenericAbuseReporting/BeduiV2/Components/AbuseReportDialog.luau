local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local buttonVariant = foundationModule.Enums.ButtonVariant
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local iconButton = foundationModule.IconButton
local inputSize = foundationModule.Enums.InputSize
local sheet = foundationModule.Sheet
local view = foundationModule.View
local abuseReportTooltipModule = require(genericAbuseReporting.BeduiV2.Components.AbuseReportTooltip)
local _ = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local _ = require(genericAbuseReporting.Enums.AbuseVector)
local useFocusNavigationRefsModule = require(genericAbuseReporting.BeduiV2.Hooks.FocusNavigation.useFocusNavigationRefs)

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), useFocusNavigationRefsModule (ref), focusNavigableSurfaceIdentifierEnum (ref), sheet (ref), view (ref), iconButton (ref), inputSize (ref), foundationModule (ref), buttonVariant (ref), abuseReportTooltipModule (ref)
	local abuseReportFlow = p1.abuseReportFlow
	local config = abuseReportFlow.config
	local currentPageElement = abuseReportFlow.currentPageElement
	local canGoBack = abuseReportFlow.canGoBack
	local var1, var2 = reactModule.useState(if config.display.titleDisclosure then config.display.titleDisclosure.openByDefault else false)
	local var3 = useFocusNavigationRefsModule(focusNavigableSurfaceIdentifierEnum.CentralOverlay, function()
		-- upvalues: var2 (ref)
		var2(false)
	end)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), p1 (ref)
		if var1 then
			p1.takeoverFocus(true)
			
			return
		end
		p1.takeoverFocus(false)
	end, { p1.takeoverFocus, var1 })
	local var4 = reactModule.useCallback(function()
		-- upvalues: var2 (ref)
		var2(function(p2)
			return not p2
		end)
	end, {})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Header = reactModule.createElement(sheet.Header, nil, reactModule.createElement(view, {
			tag = "size-full-0 auto-y row align-y-center gap-small flex-between"
		}, {
			reactModule.createElement(view, { tag = "auto-xy row align-y-center gap-small" }, {
				BackIcon = if canGoBack then reactModule.createElement(iconButton, {
					LayoutOrder = 1,
					size = inputSize.Medium,
					icon = foundationModule.Enums.IconName.ChevronLargeLeft,
					variant = buttonVariant.Utility,
					onActivated = abuseReportFlow.goBack
				}) else nil
			}),
			AbuseReportTooltip = if config.display.titleDisclosure then reactModule.createElement(abuseReportTooltipModule, {
				layoutOrder = 3,
				tooltipTitle = config.display.titleDisclosure.tooltipTitle,
				tooltipText = config.display.titleDisclosure.tooltipText,
				buttonLabel = config.display.titleDisclosure.buttonLabel,
				isOpen = var1,
				onClose = var4,
				ref = var3
			}, reactModule.createElement(iconButton, {
				LayoutOrder = 3,
				size = inputSize.Medium,
				icon = foundationModule.Enums.IconName.CircleI,
				variant = buttonVariant.Utility,
				onActivated = var4
			})) else nil
		})),
		Content = currentPageElement
	})
end)