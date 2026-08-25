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
local personButtonConfigsModule = require(peopleReactView.Configs.PersonButtonConfigs)
local useGetPeopleServiceModule = require(peopleReactView.Hooks.useGetPeopleService)
local useInExperienceCombinedNameModule = require(peopleReactView.Hooks.useInExperienceCombinedName)
local useIsComponentInputEndedModule = require(peopleReactView.Hooks.useIsComponentInputEnded)
local rbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local fFlagAddIEMProfilePage = require(parent.SharedFlags).FFlagAddIEMProfilePage

return reactModule.memo(function(p0)
	-- upvalues: reactModule (ref), useGetPeopleServiceModule (ref), fFlagAddIEMProfilePage (ref), personButtonConfigsModule (ref), useInExperienceCombinedNameModule (ref), signalsReactModule (ref), iconName (ref), iconVariant (ref), useIsComponentInputEndedModule (ref), controlState (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), rbxAnalyticsService (ref), guiService (ref), view (ref), stateLayerAffordance (ref), text (ref), formatUsername (ref), iconButton (ref), buttonVariant (ref), inputSize (ref)
	local var11 = reactModule.useRef(nil)
	local var12 = useGetPeopleServiceModule("FriendStatusStore")
	local var13 = useGetPeopleServiceModule("Constants")
	local var14 = if fFlagAddIEMProfilePage then useGetPeopleServiceModule("PeopleAnalyticsManager") else nil
	local var15 = if fFlagAddIEMProfilePage then useGetPeopleServiceModule("SettingsHubService") else nil
	local var16 = personButtonConfigsModule(p0.person.UserId)
	local var17 = reactModule.useMemo(function()
		-- upvalues: var16 (ref), var13 (ref)
		return var16[var13.PERSON_BUTTONS.ADD_FRIEND]
	end, { var16 })
	local var18 = useInExperienceCombinedNameModule(p0.person.UserId, p0.person.DisplayName)
	local var19 = signalsReactModule.useSignalState(var12.getFriendStatus(p0.person.UserId))
	local var20 = signalsReactModule.useSignalState(var12.getIsFriendButtonGrayedOut(p0.person.UserId))
	local var21 = reactModule.useMemo(function()
		-- upvalues: var19 (ref), iconName (copy), iconVariant (copy), var20 (ref)
		return if var19 then {
			name = iconName.PersonCheck,
			variant = iconVariant.Filled
		} elseif var20 then { name = iconName.Clock, variant = iconVariant.Filled } else {
			name = iconName.PersonPlus,
			variant = iconVariant.Regular
		}
	end, { var19, var20 })
	local var22 = useIsComponentInputEndedModule(var11)
	local var23 = signalsReactModule.useSignalState(var12.getIsFriendButtonDisabled(p0.person.UserId))
	local var24, var25 = reactModule.useState(false)
	
	return reactModule.createElement(view, {
		tag = "row size-full-1400 align-y-center padding-x-small radius-medium",
		LayoutOrder = p0.layoutOrder,
		stateLayer = {
			affordance = if var24 or var22 then stateLayerAffordance.None else stateLayerAffordance.Background
		},
		onActivated = if fFlagAddIEMProfilePage then if fFlagAddIEMProfilePage then reactModule.useCallback(function()
			-- upvalues: var15 (ref), p0 (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), rbxAnalyticsService (copy), var14 (ref), guiService (copy)
			local var26 = var15.hubRef()
			
			if var26 then
				var26:SwitchToReactPage(var26.PlayerProfilePage, {
					userId = p0.person.UserId,
					inspectAvatar = function()
						-- upvalues: rbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), rbxAnalyticsService (copy), var14 (copy), guiService (copy), p0 (copy), var26 (ref)
						var14:trackInspectButton(game.GameId, if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then rbxAnalyticsService:GetPlaySessionId() else nil, "player_profile")
						guiService:InspectPlayerFromUserIdWithCtx(p0.person.UserId, "playerProfile")
						var26:SetVisibility(false)
					end,
					closePage = function()
						-- upvalues: var26 (ref)
						var26:CloseReactPage()
					end
				})
			end
		end, {}) else nil else nil,
		ref = var11
	}, {
		NameContainer = reactModule.createElement(view, { tag = "col fill auto-y", LayoutOrder = 1 }, {
			Name = reactModule.createElement(text, {
				tag = "size-full-0 auto-y content-emphasis text-title-medium text-align-x-left text-truncate-end padding-right-small",
				LayoutOrder = 1,
				Text = var18
			}),
			Handle = reactModule.createElement(text, {
				tag = "size-full-0 auto-y content-default text-body-medium text-align-x-left text-truncate-end padding-right-small",
				LayoutOrder = 2,
				Text = formatUsername(p0.person.Name)
			})
		}),
		ConnectButtonBackground = reactModule.createElement(view, {
			LayoutOrder = 2,
			AutomaticSize = Enum.AutomaticSize.XY,
			stateLayer = { affordance = stateLayerAffordance.None },
			onStateChanged = reactModule.useCallback(function(p1)
				-- upvalues: var25 (ref), controlState (copy)
				var25(if p1 ~= controlState.Hover then p1 == controlState.Pressed else true)
			end, {})
		}, {
			ConnectButton = reactModule.createElement(iconButton, {
				icon = var21,
				variant = if var23 then buttonVariant.Utility else buttonVariant.Standard,
				size = inputSize.Medium,
				isDisabled = var23,
				Visible = var17.shouldShow(),
				onActivated = reactModule.useCallback(function()
					-- upvalues: var17 (ref), var13 (ref)
					var17.onActivated(var13.ANALYTICS.ENTRY_POINT.PEOPLE_CARD)
				end, { var17.onActivated })
			})
		})
	})
end)