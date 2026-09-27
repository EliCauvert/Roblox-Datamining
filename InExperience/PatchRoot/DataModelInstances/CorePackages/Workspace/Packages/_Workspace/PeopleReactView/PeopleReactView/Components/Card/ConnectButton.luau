local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local foundationModule = require(parent.Foundation)
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local iconVariant = foundationModule.Enums.IconVariant
local inputSize = foundationModule.Enums.InputSize
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local iconButton = foundationModule.IconButton
local view = foundationModule.View
local personButtonConfigsModule = require(peopleReactView.Configs.PersonButtonConfigs)
local useGetPeopleServiceModule = require(peopleReactView.Hooks.useGetPeopleService)

return reactModule.memo(function(p1)
	-- upvalues: useGetPeopleServiceModule (ref), personButtonConfigsModule (ref), reactModule (ref), signalsReactModule (ref), iconName (ref), iconVariant (ref), view (ref), stateLayerAffordance (ref), iconButton (ref), buttonVariant (ref), inputSize (ref)
	local var1 = useGetPeopleServiceModule("FriendStatusStore")
	local var2 = useGetPeopleServiceModule("Constants")
	local var3 = personButtonConfigsModule(p1.person.UserId)
	local var4 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), var2 (ref)
		return var3[var2.PERSON_BUTTONS.ADD_FRIEND]
	end, { var3, var2.PERSON_BUTTONS.ADD_FRIEND })
	local var5 = signalsReactModule.useSignalState(var1.getFriendStatus(p1.person.UserId))
	local var6 = signalsReactModule.useSignalState(var1.getIsFriendButtonGrayedOut(p1.person.UserId))
	local var7 = signalsReactModule.useSignalState(var1.getIsFriendButtonDisabled(p1.person.UserId))
	
	return reactModule.createElement(view, {
		tag = "auto-xy",
		LayoutOrder = p1.layoutOrder,
		stateLayer = { affordance = stateLayerAffordance.None },
		onStateChanged = p1.onStateChanged
	}, {
		ConnectButton = reactModule.createElement(iconButton, {
			icon = reactModule.useMemo(function()
				-- upvalues: var5 (ref), iconName (copy), iconVariant (copy), var6 (ref)
				return if var5 then {
					name = iconName.PersonCheck,
					variant = iconVariant.Filled
				} elseif var6 then { name = iconName.Clock, variant = iconVariant.Filled } else {
					name = iconName.PersonPlus,
					variant = iconVariant.Regular
				}
			end, { var5, var6 }),
			variant = if var7 then buttonVariant.Utility else buttonVariant.Standard,
			size = p1.size or inputSize.Medium,
			isDisabled = var7,
			Visible = var4.shouldShow(),
			onActivated = reactModule.useCallback(function()
				-- upvalues: var4 (ref), var2 (ref)
				var4.onActivated(var2.ANALYTICS.ENTRY_POINT.PEOPLE_CARD)
			end, { var4.onActivated, var2.ANALYTICS.ENTRY_POINT.PEOPLE_CARD })
		})
	})
end)