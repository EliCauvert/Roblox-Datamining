local squads = script:FindFirstAncestor("Squads")
local parent = squads.Parent
local loggerModule = require(squads.Logger)
local dependenciesModule = require(squads.dependencies)
local react = dependenciesModule.React
local foundation = dependenciesModule.Foundation
local useLocalization = dependenciesModule.Hooks.useLocalization
local useSelector = dependenciesModule.Hooks.useSelector
local useDispatch = dependenciesModule.Hooks.useDispatch
local useCurrentSquadId = require(parent.SquadsCore.Hooks).useCurrentSquadId
local buttonSize = foundation.Enums.ButtonSize
local buttonVariant = foundation.Enums.ButtonVariant
local image = foundation.Image
local enumsModule = require(parent.SquadsCore.Enums)
local getRbxthumbWithTypeSizeAndOptions = require(parent.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions
local constants = require(parent.UserLib).Utils.Constants
local createExperienceInviteModule = require(squads.Thunks.CreateExperienceInvite)
local useIsExperienceInviteRetryBlocked = require(parent.SquadsCore.Hooks).useIsExperienceInviteRetryBlocked
local squadExternalContractContext = require(parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local eventNamesModule = require(parent.SquadsCore.EventNames)
local squadToastActionsAndStates = enumsModule.SquadToastActionsAndStates
local squadExperienceInviteSource = enumsModule.SquadExperienceInviteSource
local squadRegroupEntryPoint = enumsModule.SquadRegroupEntryPoint
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local regroupTextTruncationFix = game:DefineFastFlag("RegroupTextTruncationFix", false)
local fFlagSquadsPresenceStoreMigration = require(parent.SquadsCore.Flags).FFlagSquadsPresenceStoreMigration
local fFlagSquadExperienceInviteRetryAfter = require(parent.SquadsCore.Flags).FFlagSquadExperienceInviteRetryAfter
local var1 = if fFlagSquadsPresenceStoreMigration then require(parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil

return function(p1)
	-- upvalues: useDispatch (ref), react (ref), squadExternalContractContext (ref), useLocalization (ref), useSelector (ref), useCurrentSquadId (ref), fFlagSquadExperienceInviteRetryAfter (ref), useIsExperienceInviteRetryBlocked (ref), fFlagSquadsPresenceStoreMigration (ref), var1 (ref), getRbxthumbWithTypeSizeAndOptions (ref), constants (ref), foundation (ref), image (ref), regroupTextTruncationFix (ref), buttonSize (ref), buttonVariant (ref), loggerModule (ref), createExperienceInviteModule (ref), squadExperienceInviteSource (ref), eventNamesModule (ref), rbxAnalyticsService (ref), squadToastActionsAndStates (ref), squadRegroupEntryPoint (ref)
	local var2 = useDispatch()
	local var3 = react.useContext(squadExternalContractContext)
	local var4 = useLocalization({
		Title = "Notifications.SquadRegroupPrompt.ToastLabel.ContinuePlayingTogether",
		Body = "Notifications.SquadRegroupPrompt.ToastLabel.JoinANewServer",
		Join = "Notifications.SquadRegroupPrompt.ToastAction.Join"
	})
	local var5 = useSelector(react.useCallback(function(p2)
		return p2.Squad and (p2.Squad.Squad and p2.Squad.Squad.currentExperienceInvite)
	end, {}))
	local var6 = useCurrentSquadId()
	local var7 = if fFlagSquadExperienceInviteRetryAfter then useIsExperienceInviteRetryBlocked(var6) else false
	local var8 = if fFlagSquadsPresenceStoreMigration then var1(tostring(p1.localUserId)) else useSelector(react.useCallback(function(p2)
		-- upvalues: p1 (ref)
		return p2 and (p2.Squad and (p2.Squad.Presence and (p2.Squad.Presence.byUserId and p2.Squad.Presence.byUserId[tostring(p1.localUserId)])))
	end, { p1.localUserId }))
	local var9 = if not fFlagSquadsPresenceStoreMigration then if var8 and var8.rootPlaceId ~= "" then var8.rootPlaceId else nil elseif var8 then var8.rootPlaceId else nil
	local var10 = if not fFlagSquadsPresenceStoreMigration then if var8 and var8.universeId ~= "" then var8.universeId elseif var8 and var8.gameId ~= "" then var8.gameId else nil else var8 and (var8.universeId or (var8.gameId or nil))
	local var11 = if var10 ~= nil then nil else getRbxthumbWithTypeSizeAndOptions(tostring(var10), constants.RbxthumbTypes.GameIcon, 150, false)
	
	return react.createElement(foundation.View, {
		tag = "align-y-center row auto-none size-full radius-medium gap-medium gui-object-defaults padding-x-xlarge padding-y-medium"
	}, {
		Thumbnail = if var11 then react.createElement(image, {
			tag = "radius-small bg-surface-100 size-1000",
			LayoutOrder = 1,
			Image = var11
		}) else nil,
		TextContainer = react.createElement(foundation.View, {
			tag = "auto-y fill col gap-xsmall align-x-left gui-object-defaults",
			LayoutOrder = 2
		}, {
			Title = react.createElement(foundation.Text, {
				LayoutOrder = 1,
				tag = {
					["auto-y text-align-x-left text-no-wrap text-title-medium content-emphasis"] = true,
					["size-full-0 text-truncate-end"] = regroupTextTruncationFix
				},
				Text = var4.Title
			}),
			Body = react.createElement(foundation.Text, {
				LayoutOrder = 2,
				tag = {
					["auto-y content-default text-body-medium text-align-x-left text-no-wrap gui-object-defaults"] = true,
					["size-full-0 text-truncate-end"] = regroupTextTruncationFix
				},
				Text = var4.Body
			})
		}),
		JoinButton = react.createElement(foundation.Button, {
			LayoutOrder = 3,
			text = var4.Join,
			size = buttonSize.Medium,
			variant = buttonVariant.Standard,
			isDisabled = if var5 == nil then var7 else true,
			onActivated = react.useCallback(function()
				-- upvalues: var9 (ref), loggerModule (copy), var2 (ref), createExperienceInviteModule (copy), var3 (ref), squadExperienceInviteSource (copy), eventNamesModule (copy), var6 (ref), p1 (ref), fFlagSquadsPresenceStoreMigration (copy), var8 (ref), rbxAnalyticsService (copy), squadToastActionsAndStates (copy), squadRegroupEntryPoint (copy)
				if var9 == nil then
					loggerModule:warning("SquadRegroupEventReceiver: Join clicked but rootPlaceId is missing from local presence")
					
					return
				end
				var2(createExperienceInviteModule(tostring(var9), var3, squadExperienceInviteSource.Regroup)):andThen(function(p2)
					-- upvalues: var3 (copy), eventNamesModule (copy), var6 (copy), p1 (copy), fFlagSquadsPresenceStoreMigration (copy), var8 (copy), rbxAnalyticsService (copy), squadToastActionsAndStates (copy), squadRegroupEntryPoint (copy)
					var3.fireSquadAnalytics(eventNamesModule.SquadRegroupButtonClicked, {
						clientTimestamp = os.time(),
						squadId = var6,
						initiatorId = p1.localUserId,
						gameInstanceId = if fFlagSquadsPresenceStoreMigration then var8 and var8.gameId else var8.gameId,
						rootPlaceId = if fFlagSquadsPresenceStoreMigration then var8 and var8.rootPlaceId else var8.rootPlaceId,
						placeId = if fFlagSquadsPresenceStoreMigration then var8 and var8.placeId else var8.placeId,
						universeId = if fFlagSquadsPresenceStoreMigration then var8 and var8.universeId else var8.universeId,
						playSessionId = rbxAnalyticsService:GetPlaySessionId(),
						experienceInviteId = p2,
						button = squadToastActionsAndStates.RegroupJoin,
						entryPoint = squadRegroupEntryPoint.SquadLobbyButton
					})
				end)
			end, {
				var2, createExperienceInviteModule, var9, var3, var6, p1.localUserId, var8
			})
		})
	})
end