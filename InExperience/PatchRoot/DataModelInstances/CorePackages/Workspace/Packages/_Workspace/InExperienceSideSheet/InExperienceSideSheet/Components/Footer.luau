local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local parent = inExperienceSideSheet.Parent
local chromeModule = require(parent.Chrome)
local reactModule = require(parent.React)
local _ = require(parent.Signals)
local foundationModule = require(parent.Foundation)
local divider = foundationModule.Divider
local view = foundationModule.View
local sessionActionButtonsModule = require(inExperienceSideSheet.Components.SessionActionButtons)
local sideSheetWidgetListModule = require(inExperienceSideSheet.Components.SideSheetWidgetList)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSideSheetFocusNav = sharedFlagsModule.FFlagSideSheetFocusNav
local fFlagEnableSideSheetWidgets = sharedFlagsModule.FFlagEnableSideSheetWidgets or require(parent.PioneerUtils).isPioneerLaunch()

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), view (ref), fFlagSideSheetFocusNav (ref), fFlagEnableSideSheetWidgets (ref), sideSheetWidgetListModule (ref), chromeModule (ref), divider (ref), sessionActionButtonsModule (ref)
	return reactModule.createElement(view, {
		tag = {
			["col size-full-0 auto-y padding-bottom-medium padding-right-xlarge"] = true,
			["padding-left-small"] = fFlagSideSheetFocusNav or fFlagEnableSideSheetWidgets
		},
		LayoutOrder = p1.layoutOrder
	}, {
		Widgets = if fFlagEnableSideSheetWidgets then reactModule.createElement(sideSheetWidgetListModule, {
			layoutOrder = 1,
			integrationsGetter = p1.integrationsGetter,
			placement = chromeModule.Enums.SideSheetPlacement.FixedFooterTop
		}) else nil,
		FooterDivider = reactModule.createElement(view, {
			tag = "size-full-0 auto-y padding-bottom-medium",
			LayoutOrder = if fFlagEnableSideSheetWidgets then 2 else 1
		}, { Divider = reactModule.createElement(divider) }),
		SessionActionButtons = reactModule.createElement(sessionActionButtonsModule, {
			layoutOrder = if fFlagEnableSideSheetWidgets then 3 else 2
		})
	})
end)