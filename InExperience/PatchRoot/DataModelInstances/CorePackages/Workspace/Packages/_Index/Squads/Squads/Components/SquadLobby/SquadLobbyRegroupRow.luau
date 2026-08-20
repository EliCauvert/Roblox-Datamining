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
local var8 = if fFlagSquadsPresenceStoreMigration then require(parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil

return function(p0) --[[ line: 41 | named "SquadLobbyRegroupRow" ]]
	-- upvalues: useDispatch (ref), react (ref), squadExternalContractContext (ref), useLocalization (ref), useSelector (ref), useCurrentSquadId (ref), fFlagSquadExperienceInviteRetryAfter (ref), useIsExperienceInviteRetryBlocked (ref), fFlagSquadsPresenceStoreMigration (ref), var8 (ref), getRbxthumbWithTypeSizeAndOptions (ref), constants (ref), foundation (ref), image (ref), regroupTextTruncationFix (ref), buttonSize (ref), buttonVariant (ref), loggerModule (ref), createExperienceInviteModule (ref), squadExperienceInviteSource (ref), eventNamesModule (ref), rbxAnalyticsService (ref), squadToastActionsAndStates (ref), squadRegroupEntryPoint (ref)
	local var9 = useDispatch()
	local var10 = react.useContext(squadExternalContractContext)
	local var11 = useLocalization({
		Title = "Notifications.SquadRegroupPrompt.ToastLabel.ContinuePlayingTogether",
		Body = "Notifications.SquadRegroupPrompt.ToastLabel.JoinANewServer",
		Join = "Notifications.SquadRegroupPrompt.ToastAction.Join"
	})
	local var12 = useSelector(react.useCallback(function(p1) --[[ line: 50 ]]
		return p1.Squad and (p1.Squad.Squad and p1.Squad.Squad.currentExperienceInvite)
	end, {}))
	local var13 = useCurrentSquadId()
	local var14 = if fFlagSquadExperienceInviteRetryAfter then useIsExperienceInviteRetryBlocked(var13) else false
	local var15 = if fFlagSquadsPresenceStoreMigration then var8(tostring(p0.localUserId)) else useSelector(react.useCallback(function(p2) --[[ line: 59 ]]
		-- upvalues: p0 (ref)
		return p2 and (p2.Squad and (p2.Squad.Presence and (p2.Squad.Presence.byUserId and p2.Squad.Presence.byUserId[tostring(p0.localUserId)])))
	end, { p0.localUserId }))
	local var16 = if not fFlagSquadsPresenceStoreMigration then if var15 and var15.rootPlaceId ~= "" then var15.rootPlaceId else nil elseif var15 then var15.rootPlaceId else nil
	local var17 = if not fFlagSquadsPresenceStoreMigration then if var15 and var15.universeId ~= "" then var15.universeId elseif var15 and var15.gameId ~= "" then var15.gameId else nil else var15 and (var15.universeId or (var15.gameId or nil))
	local var18 = if var17 ~= nil then nil else getRbxthumbWithTypeSizeAndOptions(tostring(var17), constants.RbxthumbTypes.GameIcon, 150, false)
	
	return react.createElement(foundation.View, {
		tag = "align-y-center row auto-none size-full radius-medium gap-medium gui-object-defaults padding-x-xlarge padding-y-medium"
	}, {
		Thumbnail = if var18 then react.createElement(image, {
			tag = "radius-small bg-surface-100 size-1000",
			LayoutOrder = 1,
			Image = var18
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
				Text = var11.Title
			}),
			Body = react.createElement(foundation.Text, {
				LayoutOrder = 2,
				tag = {
					["auto-y content-default text-body-medium text-align-x-left text-no-wrap gui-object-defaults"] = true,
					["size-full-0 text-truncate-end"] = regroupTextTruncationFix
				},
				Text = var11.Body
			})
		}),
		JoinButton = react.createElement(foundation.Button, {
			LayoutOrder = 3,
			text = var11.Join,
			size = buttonSize.Medium,
			variant = buttonVariant.Standard,
			isDisabled = if var12 == nil then var14 else true,
			onActivated = react.useCallback(function() --[[ line: 129 ]]
				-- upvalues: var16 (ref), loggerModule (copy), var9 (ref), createExperienceInviteModule (copy), var10 (ref), squadExperienceInviteSource (copy), eventNamesModule (copy), var13 (ref), p0 (ref), fFlagSquadsPresenceStoreMigration (copy), var15 (ref), rbxAnalyticsService (copy), squadToastActionsAndStates (copy), squadRegroupEntryPoint (copy)
				if var16 == nil then
					loggerModule:warning("SquadRegroupEventReceiver: Join clicked but rootPlaceId is missing from local presence")
					
					return
				end
				var9(createExperienceInviteModule(tostring(var16), var10, squadExperienceInviteSource.Regroup)):andThen(function(p3) --[[ line: 141 ]]
					-- upvalues: var10 (copy), eventNamesModule (copy), var13 (copy), p0 (copy), fFlagSquadsPresenceStoreMigration (copy), var15 (copy), rbxAnalyticsService (copy), squadToastActionsAndStates (copy), squadRegroupEntryPoint (copy)
					var10.fireSquadAnalytics(eventNamesModule.SquadRegroupButtonClicked, {
						clientTimestamp = os.time(),
						squadId = var13,
						initiatorId = p0.localUserId,
						gameInstanceId = if fFlagSquadsPresenceStoreMigration then var15 and var15.gameId else var15.gameId,
						rootPlaceId = if fFlagSquadsPresenceStoreMigration then var15 and var15.rootPlaceId else var15.rootPlaceId,
						placeId = if fFlagSquadsPresenceStoreMigration then var15 and var15.placeId else var15.placeId,
						universeId = if fFlagSquadsPresenceStoreMigration then var15 and var15.universeId else var15.universeId,
						playSessionId = rbxAnalyticsService:GetPlaySessionId(),
						experienceInviteId = p3,
						button = squadToastActionsAndStates.RegroupJoin,
						entryPoint = squadRegroupEntryPoint.SquadLobbyButton
					})
				end)
			end, {
				var9, createExperienceInviteModule, var16, var10, var13, p0.localUserId, var15
			})
		})
	})
end