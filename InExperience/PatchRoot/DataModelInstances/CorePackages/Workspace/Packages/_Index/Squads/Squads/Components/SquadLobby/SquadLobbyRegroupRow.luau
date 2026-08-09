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

return function(p0) --[[ line: 35 | named "SquadLobbyRegroupRow" ]]
	-- upvalues: useDispatch (ref), react (ref), squadExternalContractContext (ref), useLocalization (ref), useSelector (ref), useCurrentSquadId (ref), getRbxthumbWithTypeSizeAndOptions (ref), constants (ref), foundation (ref), image (ref), regroupTextTruncationFix (ref), buttonSize (ref), buttonVariant (ref), loggerModule (ref), createExperienceInviteModule (ref), squadExperienceInviteSource (ref), eventNamesModule (ref), rbxAnalyticsService (ref), squadToastActionsAndStates (ref), squadRegroupEntryPoint (ref)
	local var8 = useDispatch()
	local var9 = react.useContext(squadExternalContractContext)
	local var10 = useLocalization({
		Title = "Notifications.SquadRegroupPrompt.ToastLabel.ContinuePlayingTogether",
		Body = "Notifications.SquadRegroupPrompt.ToastLabel.JoinANewServer",
		Join = "Notifications.SquadRegroupPrompt.ToastAction.Join"
	})
	local var11 = useSelector(react.useCallback(function(p1) --[[ line: 44 ]]
		return p1.Squad and (p1.Squad.Squad and p1.Squad.Squad.currentExperienceInvite)
	end, {}))
	local var12 = useCurrentSquadId()
	local var13 = useSelector(react.useCallback(function(p2) --[[ line: 50 ]]
		-- upvalues: p0 (ref)
		return p2 and (p2.Squad and (p2.Squad.Presence and (p2.Squad.Presence.byUserId and p2.Squad.Presence.byUserId[tostring(p0.localUserId)])))
	end, { p0.localUserId }))
	local var14 = if var13 then var13.rootPlaceId else nil
	local universeId = var13 and (var13.universeId or (var13.gameId or nil))
	local var16 = if universeId ~= nil then nil else getRbxthumbWithTypeSizeAndOptions(tostring(universeId), constants.RbxthumbTypes.GameIcon, 150, false)
	
	return react.createElement(foundation.View, {
		tag = "align-y-center row auto-none size-full radius-medium gap-medium gui-object-defaults padding-x-xlarge padding-y-medium"
	}, {
		Thumbnail = if var16 then react.createElement(image, {
			tag = "radius-small bg-surface-100 size-1000",
			LayoutOrder = 1,
			Image = var16
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
				Text = var10.Title
			}),
			Body = react.createElement(foundation.Text, {
				LayoutOrder = 2,
				tag = {
					["auto-y content-default text-body-medium text-align-x-left text-no-wrap gui-object-defaults"] = true,
					["size-full-0 text-truncate-end"] = regroupTextTruncationFix
				},
				Text = var10.Body
			})
		}),
		JoinButton = react.createElement(foundation.Button, {
			LayoutOrder = 3,
			text = var10.Join,
			size = buttonSize.Medium,
			variant = buttonVariant.Standard,
			isDisabled = var11 ~= nil,
			onActivated = react.useCallback(function() --[[ line: 111 ]]
				-- upvalues: var14 (ref), loggerModule (copy), var8 (ref), createExperienceInviteModule (copy), var9 (ref), squadExperienceInviteSource (copy), eventNamesModule (copy), var12 (ref), p0 (ref), var13 (ref), rbxAnalyticsService (copy), squadToastActionsAndStates (copy), squadRegroupEntryPoint (copy)
				if var14 == nil then
					loggerModule:warning("SquadRegroupEventReceiver: Join clicked but rootPlaceId is missing from local presence")
					
					return
				end
				var8(createExperienceInviteModule(tostring(var14), var9, squadExperienceInviteSource.Regroup)):andThen(function(p3) --[[ line: 123 ]]
					-- upvalues: var9 (copy), eventNamesModule (copy), var12 (copy), p0 (copy), var13 (copy), rbxAnalyticsService (copy), squadToastActionsAndStates (copy), squadRegroupEntryPoint (copy)
					var9.fireSquadAnalytics(eventNamesModule.SquadRegroupButtonClicked, {
						clientTimestamp = os.time(),
						squadId = var12,
						initiatorId = p0.localUserId,
						gameInstanceId = var13.gameId,
						rootPlaceId = var13.rootPlaceId,
						placeId = var13.placeId,
						universeId = var13.universeId,
						playSessionId = rbxAnalyticsService:GetPlaySessionId(),
						experienceInviteId = p3,
						button = squadToastActionsAndStates.RegroupJoin,
						entryPoint = squadRegroupEntryPoint.SquadLobbyButton
					})
				end)
			end, {
				var8, createExperienceInviteModule, var14, var9, var12, p0.localUserId, var13
			})
		})
	})
end