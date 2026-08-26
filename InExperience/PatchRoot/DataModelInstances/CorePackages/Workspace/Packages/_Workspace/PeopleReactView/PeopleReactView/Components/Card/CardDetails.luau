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

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), useGetPeopleServiceModule (ref), fFlagAddIEMProfilePage (ref), personButtonConfigsModule (ref), useInExperienceCombinedNameModule (ref), signalsReactModule (ref), iconName (ref), iconVariant (ref), useIsComponentInputEndedModule (ref), controlState (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), rbxAnalyticsService (ref), guiService (ref), view (ref), stateLayerAffordance (ref), text (ref), formatUsername (ref), iconButton (ref), buttonVariant (ref), inputSize (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = useGetPeopleServiceModule("FriendStatusStore")
	local var3 = useGetPeopleServiceModule("Constants")
	local var4 = if fFlagAddIEMProfilePage then useGetPeopleServiceModule("PeopleAnalyticsManager") else nil
	local var5 = if fFlagAddIEMProfilePage then useGetPeopleServiceModule("SettingsHubService") else nil
	local var6 = personButtonConfigsModule(p1.person.UserId)
	local var7 = reactModule.useMemo(function()
		-- upvalues: var6 (ref), var3 (ref)
		return var6[var3.PERSON_BUTTONS.ADD_FRIEND]
	end, { var6 })
	local var8 = useInExperienceCombinedNameModule(p1.person.UserId, p1.person.DisplayName)
	local var9 = signalsReactModule.useSignalState(var2.getFriendStatus(p1.person.UserId))
	local var10 = signalsReactModule.useSignalState(var2.getIsFriendButtonGrayedOut(p1.person.UserId))
	local var11 = reactModule.useMemo(function()
		-- upvalues: var9 (ref), iconName (copy), iconVariant (copy), var10 (ref)
		return if var9 then {
			name = iconName.PersonCheck,
			variant = iconVariant.Filled
		} elseif var10 then { name = iconName.Clock, variant = iconVariant.Filled } else {
			name = iconName.PersonPlus,
			variant = iconVariant.Regular
		}
	end, { var9, var10 })
	local var12 = useIsComponentInputEndedModule(var1)
	local var13 = signalsReactModule.useSignalState(var2.getIsFriendButtonDisabled(p1.person.UserId))
	local var14, var15 = reactModule.useState(false)
	
	return reactModule.createElement(view, {
		tag = "row size-full-1400 align-y-center padding-x-small radius-medium",
		LayoutOrder = p1.layoutOrder,
		stateLayer = {
			affordance = if var14 or var12 then stateLayerAffordance.None else stateLayerAffordance.Background
		},
		onActivated = if fFlagAddIEMProfilePage then if fFlagAddIEMProfilePage then reactModule.useCallback(function()
			-- upvalues: var5 (ref), p1 (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), rbxAnalyticsService (copy), var4 (ref), guiService (copy)
			local var16 = var5.hubRef()
			
			if var16 then
				var16:SwitchToReactPage(var16.PlayerProfilePage, {
					userId = p1.person.UserId,
					inspectAvatar = function()
						-- upvalues: rbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), rbxAnalyticsService (copy), var4 (copy), guiService (copy), p1 (copy), var16 (ref)
						var4:trackInspectButton(game.GameId, if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then rbxAnalyticsService:GetPlaySessionId() else nil, "player_profile")
						guiService:InspectPlayerFromUserIdWithCtx(p1.person.UserId, "playerProfile")
						var16:SetVisibility(false)
					end,
					closePage = function()
						-- upvalues: var16 (ref)
						var16:CloseReactPage()
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
				Text = var8
			}),
			Handle = reactModule.createElement(text, {
				tag = "size-full-0 auto-y content-default text-body-medium text-align-x-left text-truncate-end padding-right-small",
				LayoutOrder = 2,
				Text = formatUsername(p1.person.Name)
			})
		}),
		ConnectButtonBackground = reactModule.createElement(view, {
			LayoutOrder = 2,
			AutomaticSize = Enum.AutomaticSize.XY,
			stateLayer = { affordance = stateLayerAffordance.None },
			onStateChanged = reactModule.useCallback(function(p2)
				-- upvalues: var15 (ref), controlState (copy)
				var15(if p2 ~= controlState.Hover then p2 == controlState.Pressed else true)
			end, {})
		}, {
			ConnectButton = reactModule.createElement(iconButton, {
				icon = var11,
				variant = if var13 then buttonVariant.Utility else buttonVariant.Standard,
				size = inputSize.Medium,
				isDisabled = var13,
				Visible = var7.shouldShow(),
				onActivated = reactModule.useCallback(function()
					-- upvalues: var7 (ref), var3 (ref)
					var7.onActivated(var3.ANALYTICS.ENTRY_POINT.PEOPLE_CARD)
				end, { var7.onActivated })
			})
		})
	})
end)