local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local GuiService = game:GetService("GuiService")
local PeopleReactView = script:FindFirstAncestor("PeopleReactView")
local Parent = PeopleReactView.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local FormatUsernameFunction = require(Parent.UserProfiles).Formatters.formatUsername
local FoundationModule = require(Parent.Foundation)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local ControlState = FoundationModule.Enums.ControlState
local IconName = FoundationModule.Enums.IconName
local IconVariant = FoundationModule.Enums.IconVariant
local InputSize = FoundationModule.Enums.InputSize
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local IconButton = FoundationModule.IconButton
local Text = FoundationModule.Text
local View = FoundationModule.View
local PersonButtonConfigsModule = require(PeopleReactView.Configs.PersonButtonConfigs)
local UseGetPeopleServiceModule = require(PeopleReactView.Hooks.useGetPeopleService)
local UseInExperienceCombinedNameModule = require(PeopleReactView.Hooks.useInExperienceCombinedName)
local UseIsComponentInputEndedModule = require(PeopleReactView.Hooks.useIsComponentInputEnded)
local RbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local FFlagAddIEMProfilePage = require(Parent.SharedFlags).FFlagAddIEMProfilePage

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), UseGetPeopleServiceModule (copy), FFlagAddIEMProfilePage (copy), PersonButtonConfigsModule (copy), UseInExperienceCombinedNameModule (copy), SignalsReactModule (copy), IconName (copy), IconVariant (copy), UseIsComponentInputEndedModule (copy), ControlState (copy), RbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), RbxAnalyticsService (copy), GuiService (copy), View (copy), StateLayerAffordance (copy), Text (copy), FormatUsernameFunction (copy), IconButton (copy), ButtonVariant (copy), InputSize (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local FriendStatusStore = UseGetPeopleServiceModule("FriendStatusStore")
	local Constants = UseGetPeopleServiceModule("Constants")
	local PeopleAnalyticsManager = if FFlagAddIEMProfilePage then UseGetPeopleServiceModule("PeopleAnalyticsManager") else nil
	local SettingsHubService = if FFlagAddIEMProfilePage then UseGetPeopleServiceModule("SettingsHubService") else nil
	local PersonButtonConfigsModuleResult = PersonButtonConfigsModule(p1.person.UserId)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: PersonButtonConfigsModuleResult (copy), Constants (copy)
		return PersonButtonConfigsModuleResult[Constants.PERSON_BUTTONS.ADD_FRIEND]
	end, { PersonButtonConfigsModuleResult })
	local UseInExperienceCombinedNameModuleResult = UseInExperienceCombinedNameModule(p1.person.UserId, p1.person.DisplayName)
	local UseSignalStateResult = SignalsReactModule.useSignalState(FriendStatusStore.getFriendStatus(p1.person.UserId))
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(FriendStatusStore.getIsFriendButtonGrayedOut(p1.person.UserId))
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult (copy), IconName (upval), IconVariant (upval), UseSignalStateResult1 (copy)
		return if UseSignalStateResult then {
			name = IconName.PersonCheck,
			variant = IconVariant.Filled
		} elseif UseSignalStateResult1 then { name = IconName.Clock, variant = IconVariant.Filled } else {
			name = IconName.PersonPlus,
			variant = IconVariant.Regular
		}
	end, { UseSignalStateResult, UseSignalStateResult1 })
	local UseIsComponentInputEndedModuleResult = UseIsComponentInputEndedModule(UseRefResult)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(FriendStatusStore.getIsFriendButtonDisabled(p1.person.UserId))
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseResult = if FFlagAddIEMProfilePage then ReactModule.useCallback(function()
		-- upvalues: SettingsHubService (copy), p1 (copy), RbxAnalyticsServiceExposePlaySessionIdEngineFeature (upval), RbxAnalyticsService (upval), PeopleAnalyticsManager (copy), GuiService (upval)
		local HubRefResult = SettingsHubService.hubRef()
		
		if HubRefResult then
			HubRefResult:SwitchToReactPage(HubRefResult.PlayerProfilePage, {
				userId = p1.person.UserId,
				inspectAvatar = function()
					-- upvalues: RbxAnalyticsServiceExposePlaySessionIdEngineFeature (upval), RbxAnalyticsService (upval), PeopleAnalyticsManager (upval), GuiService (upval), p1 (upval), HubRefResult (copy)
					PeopleAnalyticsManager:trackInspectButton(game.GameId, if RbxAnalyticsServiceExposePlaySessionIdEngineFeature then RbxAnalyticsService:GetPlaySessionId() else nil, "player_profile")
					GuiService:InspectPlayerFromUserIdWithCtx(p1.person.UserId, "playerProfile")
					HubRefResult:SetVisibility(false)
				end,
				closePage = function()
					-- upvalues: HubRefResult (copy)
					HubRefResult:CloseReactPage()
				end
			})
		end
	end, {}) else nil
	
	return ReactModule.createElement(View, {
		tag = "row size-full-1400 align-y-center padding-x-small radius-medium",
		LayoutOrder = p1.layoutOrder,
		stateLayer = {
			affordance = if UseStateResult or UseIsComponentInputEndedModuleResult then StateLayerAffordance.None else StateLayerAffordance.Background
		},
		onActivated = if FFlagAddIEMProfilePage then UseResult else nil,
		ref = UseRefResult
	}, {
		NameContainer = ReactModule.createElement(View, { tag = "col fill auto-y", LayoutOrder = 1 }, {
			Name = ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y content-emphasis text-title-medium text-align-x-left text-truncate-end padding-right-small",
				LayoutOrder = 1,
				Text = UseInExperienceCombinedNameModuleResult
			}),
			Handle = ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y content-default text-body-medium text-align-x-left text-truncate-end padding-right-small",
				LayoutOrder = 2,
				Text = FormatUsernameFunction(p1.person.Name)
			})
		}),
		ConnectButtonBackground = ReactModule.createElement(View, {
			LayoutOrder = 2,
			AutomaticSize = Enum.AutomaticSize.XY,
			stateLayer = { affordance = StateLayerAffordance.None },
			onStateChanged = ReactModule.useCallback(function(Hover)
				-- upvalues: UseStateResult2 (copy), ControlState (upval)
				UseStateResult2(Hover == ControlState.Hover or Hover == ControlState.Pressed)
			end, {})
		}, {
			ConnectButton = ReactModule.createElement(IconButton, {
				icon = UseMemoResult1,
				variant = if UseSignalStateResult2 then ButtonVariant.Utility else ButtonVariant.Standard,
				size = InputSize.Medium,
				isDisabled = UseSignalStateResult2,
				Visible = UseMemoResult.shouldShow(),
				onActivated = ReactModule.useCallback(function()
					-- upvalues: UseMemoResult (copy), Constants (copy)
					UseMemoResult.onActivated(Constants.ANALYTICS.ENTRY_POINT.PEOPLE_CARD)
				end, { UseMemoResult.onActivated })
			})
		})
	})
end)