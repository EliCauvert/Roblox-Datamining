local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local parent = inExperienceSideSheet.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local divider = foundationModule.Divider
local view = foundationModule.View
local sessionActionButtonsModule = require(inExperienceSideSheet.Components.SessionActionButtons)
local fFlagSideSheetFocusNav = require(parent.SharedFlags).FFlagSideSheetFocusNav

return reactModule.memo(function(p0)
	-- upvalues: reactModule (ref), view (ref), fFlagSideSheetFocusNav (ref), divider (ref), sessionActionButtonsModule (ref)
	return reactModule.createElement(view, {
		tag = {
			["col size-full-0 auto-y padding-right-xlarge padding-bottom-medium"] = true,
			["padding-left-small"] = fFlagSideSheetFocusNav
		},
		LayoutOrder = p0.layoutOrder
	}, {
		FooterDivider = reactModule.createElement(view, {
			tag = "size-full-0 auto-y padding-bottom-medium",
			LayoutOrder = 1
		}, { Divider = reactModule.createElement(divider) }),
		SessionActionButtons = reactModule.createElement(sessionActionButtonsModule, { layoutOrder = 2 })
	})
end)