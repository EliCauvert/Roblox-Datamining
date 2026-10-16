local PeopleReactView = script:FindFirstAncestor("PeopleReactView")
local Parent = PeopleReactView.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local FoundationModule = require(Parent.Foundation)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local IconVariant = FoundationModule.Enums.IconVariant
local InputSize = FoundationModule.Enums.InputSize
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local IconButton = FoundationModule.IconButton
local View = FoundationModule.View
local PersonButtonConfigsModule = require(PeopleReactView.Configs.PersonButtonConfigs)
local UseGetPeopleServiceModule = require(PeopleReactView.Hooks.useGetPeopleService)

return ReactModule.memo(function(p1) --[[ Line: 28 | Named "ConnectButton" ]]
	-- upvalues: UseGetPeopleServiceModule (copy), PersonButtonConfigsModule (copy), ReactModule (copy), SignalsReactModule (copy), IconName (copy), IconVariant (copy), View (copy), StateLayerAffordance (copy), IconButton (copy), ButtonVariant (copy), InputSize (copy)
	local FriendStatusStore = UseGetPeopleServiceModule("FriendStatusStore")
	local Constants = UseGetPeopleServiceModule("Constants")
	local PersonButtonConfigsModuleResult = PersonButtonConfigsModule(p1.person.UserId)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 34 ]]
		-- upvalues: PersonButtonConfigsModuleResult (copy), Constants (copy)
		return PersonButtonConfigsModuleResult[Constants.PERSON_BUTTONS.ADD_FRIEND]
	end, {
		PersonButtonConfigsModuleResult,
		Constants.PERSON_BUTTONS.ADD_FRIEND
	})
	local UseSignalStateResult = SignalsReactModule.useSignalState(FriendStatusStore.getFriendStatus(p1.person.UserId))
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(FriendStatusStore.getIsFriendButtonGrayedOut(p1.person.UserId))
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(FriendStatusStore.getIsFriendButtonDisabled(p1.person.UserId))
	
	return ReactModule.createElement(View, {
		tag = "auto-xy",
		LayoutOrder = p1.layoutOrder,
		stateLayer = { affordance = StateLayerAffordance.None },
		onStateChanged = p1.onStateChanged
	}, {
		ConnectButton = ReactModule.createElement(IconButton, {
			icon = ReactModule.useMemo(function() --[[ Line: 42 ]]
				-- upvalues: UseSignalStateResult (copy), IconName (upval), IconVariant (upval), UseSignalStateResult1 (copy)
				return if UseSignalStateResult then {
					name = IconName.PersonCheck,
					variant = IconVariant.Filled
				} elseif UseSignalStateResult1 then { name = IconName.Clock, variant = IconVariant.Filled } else {
					name = IconName.PersonPlus,
					variant = IconVariant.Regular
				}
			end, { UseSignalStateResult, UseSignalStateResult1 }),
			variant = if UseSignalStateResult2 then ButtonVariant.Utility else ButtonVariant.Standard,
			size = p1.size or InputSize.Medium,
			isDisabled = UseSignalStateResult2,
			Visible = UseMemoResult.shouldShow(),
			onActivated = ReactModule.useCallback(function() --[[ Line: 63 ]]
				-- upvalues: UseMemoResult (copy), Constants (copy)
				UseMemoResult.onActivated(Constants.ANALYTICS.ENTRY_POINT.PEOPLE_CARD)
			end, {
				UseMemoResult.onActivated,
				Constants.ANALYTICS.ENTRY_POINT.PEOPLE_CARD
			})
		})
	})
end)