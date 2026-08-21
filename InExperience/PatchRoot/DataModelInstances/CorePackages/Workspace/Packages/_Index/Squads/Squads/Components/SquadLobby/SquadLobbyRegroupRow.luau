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
local squadExternalContractContext = require(parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local eventNamesModule = require(parent.SquadsCore.EventNames)
local squadToastActionsAndStates = enumsModule.SquadToastActionsAndStates
local squadExperienceInviteSource = enumsModule.SquadExperienceInviteSource
local squadRegroupEntryPoint = enumsModule.SquadRegroupEntryPoint
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local regroupTextTruncationFix = game:DefineFastFlag("RegroupTextTruncationFix", false)
local fFlagSquadsPresenceStoreMigration = require(parent.SquadsCore.Flags).FFlagSquadsPresenceStoreMigration
local var8 = if fFlagSquadsPresenceStoreMigration then require(parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil

return function(p0) --[[ line: 39 | named "SquadLobbyRegroupRow" ]]
	-- upvalues: useDispatch (ref), react (ref), squadExternalContractContext (ref), useLocalization (ref), useSelector (ref), useCurrentSquadId (ref), fFlagSquadsPresenceStoreMigration (ref), var8 (ref), getRbxthumbWithTypeSizeAndOptions (ref), constants (ref), foundation (ref), image (ref), regroupTextTruncationFix (ref), buttonSize (ref), buttonVariant (ref), loggerModule (ref), createExperienceInviteModule (ref), squadExperienceInviteSource (ref), eventNamesModule (ref), rbxAnalyticsService (ref), squadToastActionsAndStates (ref), squadRegroupEntryPoint (ref)
	local var9 = useDispatch()
	local var10 = react.useContext(squadExternalContractContext)
	local var11 = useLocalization({
		Title = "Notifications.SquadRegroupPrompt.ToastLabel.ContinuePlayingTogether",
		Body = "Notifications.SquadRegroupPrompt.ToastLabel.JoinANewServer",
		Join = "Notifications.SquadRegroupPrompt.ToastAction.Join"
	})
	local var12 = useSelector(react.useCallback(function(p1) --[[ line: 48 ]]
		return p1.Squad and (p1.Squad.Squad and p1.Squad.Squad.currentExperienceInvite)
	end, {}))
	local var13 = useCurrentSquadId()
	local var14 = if fFlagSquadsPresenceStoreMigration then var8(tostring(p0.localUserId)) else useSelector(react.useCallback(function(p2) --[[ line: 54 ]]
		-- upvalues: p0 (ref)
		return p2 and (p2.Squad and (p2.Squad.Presence and (p2.Squad.Presence.byUserId and p2.Squad.Presence.byUserId[tostring(p0.localUserId)])))
	end, { p0.localUserId }))
	local var15 = if not fFlagSquadsPresenceStoreMigration then if var14 and var14.rootPlaceId ~= "" then var14.rootPlaceId else nil elseif var14 then var14.rootPlaceId else nil
	local var16 = if not fFlagSquadsPresenceStoreMigration then if var14 and var14.universeId ~= "" then var14.universeId elseif var14 and var14.gameId ~= "" then var14.gameId else nil else var14 and (var14.universeId or (var14.gameId or nil))
	local var17 = if var16 ~= nil then nil else getRbxthumbWithTypeSizeAndOptions(tostring(var16), constants.RbxthumbTypes.GameIcon, 150, false)
	
	return react.createElement(foundation.View, {
		tag = "align-y-center row auto-none size-full radius-medium gap-medium gui-object-defaults padding-x-xlarge padding-y-medium"
	}, {
		Thumbnail = if var17 then react.createElement(image, {
			tag = "radius-small bg-surface-100 size-1000",
			LayoutOrder = 1,
			Image = var17
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
			isDisabled = var12 ~= nil,
			onActivated = react.useCallback(function() --[[ line: 124 ]]
				-- upvalues: var15 (ref), loggerModule (copy), var9 (ref), createExperienceInviteModule (copy), var10 (ref), squadExperienceInviteSource (copy), eventNamesModule (copy), var13 (ref), p0 (ref), fFlagSquadsPresenceStoreMigration (copy), var14 (ref), rbxAnalyticsService (copy), squadToastActionsAndStates (copy), squadRegroupEntryPoint (copy)
				if var15 == nil then
					loggerModule:warning("SquadRegroupEventReceiver: Join clicked but rootPlaceId is missing from local presence")
					
					return
				end
				var9(createExperienceInviteModule(tostring(var15), var10, squadExperienceInviteSource.Regroup)):andThen(function(p3) --[[ line: 136 ]]
					-- upvalues: var10 (copy), eventNamesModule (copy), var13 (copy), p0 (copy), fFlagSquadsPresenceStoreMigration (copy), var14 (copy), rbxAnalyticsService (copy), squadToastActionsAndStates (copy), squadRegroupEntryPoint (copy)
					var10.fireSquadAnalytics(eventNamesModule.SquadRegroupButtonClicked, {
						clientTimestamp = os.time(),
						squadId = var13,
						initiatorId = p0.localUserId,
						gameInstanceId = if fFlagSquadsPresenceStoreMigration then var14 and var14.gameId else var14.gameId,
						rootPlaceId = if fFlagSquadsPresenceStoreMigration then var14 and var14.rootPlaceId else var14.rootPlaceId,
						placeId = if fFlagSquadsPresenceStoreMigration then var14 and var14.placeId else var14.placeId,
						universeId = if fFlagSquadsPresenceStoreMigration then var14 and var14.universeId else var14.universeId,
						playSessionId = rbxAnalyticsService:GetPlaySessionId(),
						experienceInviteId = p3,
						button = squadToastActionsAndStates.RegroupJoin,
						entryPoint = squadRegroupEntryPoint.SquadLobbyButton
					})
				end)
			end, {
				var9, createExperienceInviteModule, var15, var10, var13, p0.localUserId, var14
			})
		})
	})
end