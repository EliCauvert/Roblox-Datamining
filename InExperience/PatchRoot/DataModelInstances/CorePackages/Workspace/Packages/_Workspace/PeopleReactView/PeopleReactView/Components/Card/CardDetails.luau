local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local guiService = game:GetService("GuiService")
local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local formatUsername = require(parent.UserProfiles).Formatters.formatUsername
local foundationModule = require(parent.Foundation)
local buttonVariant = foundationModule.Enums.ButtonVariant
local controlState = foundationModule.Enums.ControlState
local iconName = foundationModule.Enums.IconName
local iconVariant = foundationModule.Enums.IconVariant
local inputSize = foundationModule.Enums.InputSize
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local iconButton = foundationModule.IconButton
local text = foundationModule.Text
local view = foundationModule.View
local connectButtonModule = require(peopleReactView.Components.Card.ConnectButton)
local personButtonConfigsModule = require(peopleReactView.Configs.PersonButtonConfigs)
local useGetPeopleServiceModule = require(peopleReactView.Hooks.useGetPeopleService)
local useInExperienceCombinedNameModule = require(peopleReactView.Hooks.useInExperienceCombinedName)
local useIsComponentInputEndedModule = require(peopleReactView.Hooks.useIsComponentInputEnded)
local rbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagAddIEMProfilePage = sharedFlagsModule.FFlagAddIEMProfilePage
local fFlagSideSheetOpenPeoplePage = sharedFlagsModule.FFlagSideSheetOpenPeoplePage

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), fFlagAddIEMProfilePage (ref), useGetPeopleServiceModule (ref), useInExperienceCombinedNameModule (ref), useIsComponentInputEndedModule (ref), controlState (ref), fFlagSideSheetOpenPeoplePage (ref), personButtonConfigsModule (ref), signalsReactModule (ref), iconName (ref), iconVariant (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), rbxAnalyticsService (ref), guiService (ref), connectButtonModule (ref), view (ref), stateLayerAffordance (ref), iconButton (ref), buttonVariant (ref), inputSize (ref), text (ref), formatUsername (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = if fFlagAddIEMProfilePage then useGetPeopleServiceModule("PeopleAnalyticsManager") else nil
	local var3 = if fFlagAddIEMProfilePage then useGetPeopleServiceModule("SettingsHubService") else nil
	local var4 = useInExperienceCombinedNameModule(p1.person.UserId, p1.person.DisplayName)
	local var5 = useIsComponentInputEndedModule(var1)
	local var6, var7 = reactModule.useState(false)
	local var8 = reactModule.useCallback(function(p2)
		-- upvalues: var7 (ref), controlState (copy)
		var7(if p2 ~= controlState.Hover then p2 == controlState.Pressed else true)
	end, {})
	local var9 = nil
	local var10 = nil
	local var11 = nil
	local var12 = nil
	
	if not fFlagSideSheetOpenPeoplePage then
		local var13 = useGetPeopleServiceModule("FriendStatusStore")
		local var14 = useGetPeopleServiceModule("Constants")
		local var15 = personButtonConfigsModule(p1.person.UserId)
		var9 = reactModule.useMemo(function()
			-- upvalues: var15 (ref), var14 (ref)
			return var15[var14.PERSON_BUTTONS.ADD_FRIEND]
		end, { var15 })
		local var16 = signalsReactModule.useSignalState(var13.getFriendStatus(p1.person.UserId))
		local var17 = signalsReactModule.useSignalState(var13.getIsFriendButtonGrayedOut(p1.person.UserId))
		var10 = reactModule.useMemo(function()
			-- upvalues: var16 (ref), iconName (copy), iconVariant (copy), var17 (ref)
			return if var16 then {
				name = iconName.PersonCheck,
				variant = iconVariant.Filled
			} elseif var17 then { name = iconName.Clock, variant = iconVariant.Filled } else {
				name = iconName.PersonPlus,
				variant = iconVariant.Regular
			}
		end, { var16, var17 })
		var11 = signalsReactModule.useSignalState(var13.getIsFriendButtonDisabled(p1.person.UserId))
		var12 = reactModule.useCallback(function()
			-- upvalues: var9 (write), var14 (ref)
			var9.onActivated(var14.ANALYTICS.ENTRY_POINT.PEOPLE_CARD)
		end, { var9.onActivated })
	end
	return reactModule.createElement(view, {
		tag = "row size-full-1400 align-y-center padding-x-small radius-medium",
		LayoutOrder = p1.layoutOrder,
		stateLayer = {
			affordance = if var6 or var5 then stateLayerAffordance.None else stateLayerAffordance.Background
		},
		onActivated = if fFlagAddIEMProfilePage then if fFlagAddIEMProfilePage then reactModule.useCallback(function()
			-- upvalues: var3 (ref), p1 (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), rbxAnalyticsService (copy), var2 (ref), guiService (copy)
			local var18 = var3.hubRef()
			
			if var18 then
				var18:SwitchToReactPage(var18.PlayerProfilePage, {
					userId = p1.person.UserId,
					inspectAvatar = function()
						-- upvalues: rbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), rbxAnalyticsService (copy), var2 (copy), guiService (copy), p1 (copy), var18 (ref)
						var2:trackInspectButton(game.GameId, if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then rbxAnalyticsService:GetPlaySessionId() else nil, "player_profile")
						guiService:InspectPlayerFromUserIdWithCtx(p1.person.UserId, "playerProfile")
						var18:SetVisibility(false)
					end,
					closePage = function()
						-- upvalues: var18 (ref)
						var18:CloseReactPage()
					end
				})
			end
		end, {}) else nil else nil,
		ref = var1
	}, {
		NameContainer = reactModule.createElement(view, { tag = "col fill auto-y", LayoutOrder = 1 }, {
			Name = reactModule.createElement(text, {
				tag = "size-full-0 auto-y content-emphasis text-title-medium text-align-x-left text-truncate-end padding-right-small",
				LayoutOrder = 1,
				Text = var4
			}),
			Handle = reactModule.createElement(text, {
				tag = "size-full-0 auto-y content-default text-body-medium text-align-x-left text-truncate-end padding-right-small",
				LayoutOrder = 2,
				Text = formatUsername(p1.person.Name)
			})
		}),
		ConnectButtonBackground = if fFlagSideSheetOpenPeoplePage then if p1.isCompactCardLayout then nil else reactModule.createElement(connectButtonModule, {
			layoutOrder = 2,
			person = p1.person,
			onStateChanged = var8
		}) else reactModule.createElement(view, {
			LayoutOrder = 2,
			AutomaticSize = Enum.AutomaticSize.XY,
			stateLayer = { affordance = stateLayerAffordance.None },
			onStateChanged = var8
		}, {
			ConnectButton = reactModule.createElement(iconButton, {
				icon = var10,
				variant = if var11 then buttonVariant.Utility else buttonVariant.Standard,
				size = inputSize.Medium,
				isDisabled = var11,
				Visible = var9.shouldShow(),
				onActivated = var12
			})
		})
	})
end)