local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local parent = inExperienceSideSheet.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local divider = foundationModule.Divider
local view = foundationModule.View
local isPioneerLaunch = require(parent.PioneerUtils).isPioneerLaunch
local sessionActionButtonsModule = require(inExperienceSideSheet.Components.SessionActionButtons)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSideSheetFocusNav = sharedFlagsModule.FFlagSideSheetFocusNav
local fFlagEnableSideSheetWidgets = sharedFlagsModule.FFlagEnableSideSheetWidgets or isPioneerLaunch()

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), view (ref), fFlagSideSheetFocusNav (ref), fFlagEnableSideSheetWidgets (ref), divider (ref), sessionActionButtonsModule (ref)
	return reactModule.createElement(view, {
		tag = {
			["col size-full-0 auto-y padding-bottom-xlarge padding-right-xlarge"] = true,
			["padding-left-small"] = fFlagSideSheetFocusNav or fFlagEnableSideSheetWidgets
		},
		LayoutOrder = p1.layoutOrder
	}, {
		FooterDivider = reactModule.createElement(view, {
			tag = "size-full-0 auto-y padding-y-medium",
			LayoutOrder = 1
		}, { Divider = reactModule.createElement(divider) }),
		SessionActionButtons = reactModule.createElement(sessionActionButtonsModule, { layoutOrder = 2 })
	})
end)