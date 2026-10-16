local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local _ = require(Parent.Chrome)
local ReactModule = require(Parent.React)
local _ = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local View = require(Parent.Foundation).View
local VerticalItemModule = require(InExperienceSideSheet.Components.VerticalItem)
local GetDidSideSheetOpenWithPeoplePageModule = require(InExperienceSideSheet.Utils.getDidSideSheetOpenWithPeoplePage)
local ShouldShowInviteFriendsInSideSheetModule = require(InExperienceSideSheet.Utils.shouldShowInviteFriendsInSideSheet)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagAddInviteFriendsIntegration = SharedFlagsModule.FFlagAddInviteFriendsIntegration
local FFlagHidePeoplePageInviteFriends = SharedFlagsModule.FFlagHidePeoplePageInviteFriends
local FFlagSideSheetFocusNav = SharedFlagsModule.FFlagSideSheetFocusNav
local FFlagSideSheetOpenPeoplePage = require(InExperienceSideSheet.Flags).FFlagSideSheetOpenPeoplePage

return ReactModule.memo(function(p1) --[[ Line: 31 | Named "VerticalList" ]]
	-- upvalues: SignalsReactModule (copy), FFlagSideSheetOpenPeoplePage (copy), GetDidSideSheetOpenWithPeoplePageModule (copy), FFlagHidePeoplePageInviteFriends (copy), FFlagAddInviteFriendsIntegration (copy), ShouldShowInviteFriendsInSideSheetModule (copy), ReactModule (copy), VerticalItemModule (copy), FFlagSideSheetFocusNav (copy), View (copy)
	local UseSignalStateResult = if FFlagSideSheetOpenPeoplePage then SignalsReactModule.useSignalState(GetDidSideSheetOpenWithPeoplePageModule) else false
	local Inverted = not (FFlagHidePeoplePageInviteFriends and FFlagAddInviteFriendsIntegration)
	local Elements = {}
	local LayoutOrder = 0
	
	for _, value in SignalsReactModule.useSignalState(p1.integrationsGetter) do
		if ShouldShowInviteFriendsInSideSheetModule(value.id, UseSignalStateResult, Inverted) then
			LayoutOrder += 1
			Elements[value.id] = ReactModule.createElement(VerticalItemModule, {
				label = value.integration.label,
				layoutOrder = LayoutOrder,
				onActivated = value.activated,
				icon = value.component,
				disableGamepadDirections = if FFlagSideSheetFocusNav then { left = true, right = not p1.allowRightFocusEscape } else nil,
				firstIntegrationToFocusCallback = if FFlagSideSheetFocusNav and LayoutOrder == 1 then p1.firstIntegrationToFocusCallback else nil
			})
		end
	end
	return ReactModule.createElement(View, {
		tag = "col gap-small size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder
	}, Elements)
end)