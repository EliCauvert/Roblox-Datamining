local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local parent = inExperienceSideSheet.Parent
local _ = require(parent.Chrome)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local view = foundationModule.View
local verticalItemModule = require(inExperienceSideSheet.Components.VerticalItem)
local getDidSideSheetOpenWithPeoplePageModule = require(inExperienceSideSheet.Utils.getDidSideSheetOpenWithPeoplePage)
local shouldShowInviteFriendsInSideSheetModule = require(inExperienceSideSheet.Utils.shouldShowInviteFriendsInSideSheet)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagAddInviteFriendsIntegration = sharedFlagsModule.FFlagAddInviteFriendsIntegration
local fFlagHidePeoplePageInviteFriends = sharedFlagsModule.FFlagHidePeoplePageInviteFriends
local fFlagSideSheetFocusNav = sharedFlagsModule.FFlagSideSheetFocusNav
local fFlagSideSheetOpenPeoplePage = require(inExperienceSideSheet.Flags).FFlagSideSheetOpenPeoplePage

return reactModule.memo(function(p1)
	-- upvalues: signalsReactModule (ref), fFlagSideSheetOpenPeoplePage (ref), getDidSideSheetOpenWithPeoplePageModule (ref), fFlagHidePeoplePageInviteFriends (ref), fFlagAddInviteFriendsIntegration (ref), shouldShowInviteFriendsInSideSheetModule (ref), reactModule (ref), verticalItemModule (ref), fFlagSideSheetFocusNav (ref), view (ref)
	local var1 = signalsReactModule.useSignalState(p1.integrationsGetter)
	local var2 = if fFlagSideSheetOpenPeoplePage then signalsReactModule.useSignalState(getDidSideSheetOpenWithPeoplePageModule) else false
	local var3 = not (fFlagHidePeoplePageInviteFriends and fFlagAddInviteFriendsIntegration)
	local t = {}
	local var4 = 0
	
	for i, v in var1 do
		if shouldShowInviteFriendsInSideSheetModule(v.id, var2, var3) then
			var4 += 1
			t[v.id] = reactModule.createElement(verticalItemModule, {
				label = v.integration.label,
				layoutOrder = var4,
				onActivated = v.activated,
				icon = v.component,
				disableGamepadDirections = if fFlagSideSheetFocusNav then { left = true, right = not p1.allowRightFocusEscape } else nil,
				firstIntegrationToFocusCallback = if fFlagSideSheetFocusNav and var4 == 1 then p1.firstIntegrationToFocusCallback else nil
			})
		end
	end
	return reactModule.createElement(view, {
		tag = "col gap-small size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder
	}, t)
end)