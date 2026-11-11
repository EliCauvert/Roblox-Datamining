local Squads = script:FindFirstAncestor("Squads")
local Parent = Squads.Parent
local LoggerModule = require(Squads.Logger)
local DependenciesModule = require(Squads.dependencies)
local React = DependenciesModule.React
local Foundation = DependenciesModule.Foundation
local UseLocalizationFunction = DependenciesModule.Hooks.useLocalization
local UseSelectorFunction = DependenciesModule.Hooks.useSelector
local UseDispatchFunction = DependenciesModule.Hooks.useDispatch
local UseCurrentSquadIdFunction = require(Parent.SquadsCore.Hooks).useCurrentSquadId
local ButtonSize = Foundation.Enums.ButtonSize
local ButtonVariant = Foundation.Enums.ButtonVariant
local Image = Foundation.Image
local EnumsModule = require(Parent.SquadsCore.Enums)
local GetRbxthumbWithTypeSizeAndOptionsFunction = require(Parent.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions
local Constants = require(Parent.UserLib).Utils.Constants
local CreateExperienceInviteModule = require(Squads.Thunks.CreateExperienceInvite)
local SquadExternalContractContext = require(Parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local EventNamesModule = require(Parent.SquadsCore.EventNames)
local SquadToastActionsAndStates = EnumsModule.SquadToastActionsAndStates
local SquadExperienceInviteSource = EnumsModule.SquadExperienceInviteSource
local SquadRegroupEntryPoint = EnumsModule.SquadRegroupEntryPoint
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local RegroupTextTruncationFix = game:DefineFastFlag("RegroupTextTruncationFix", false)

return function(p1)
	-- upvalues: UseDispatchFunction (copy), React (copy), SquadExternalContractContext (copy), UseLocalizationFunction (copy), UseSelectorFunction (copy), UseCurrentSquadIdFunction (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), Constants (copy), Foundation (copy), Image (copy), RegroupTextTruncationFix (copy), ButtonSize (copy), ButtonVariant (copy), LoggerModule (copy), CreateExperienceInviteModule (copy), SquadExperienceInviteSource (copy), EventNamesModule (copy), RbxAnalyticsService (copy), SquadToastActionsAndStates (copy), SquadRegroupEntryPoint (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseContextResult = React.useContext(SquadExternalContractContext)
	local UseLocalizationResult = UseLocalizationFunction({
		Title = "Notifications.SquadRegroupPrompt.ToastLabel.ContinuePlayingTogether",
		Body = "Notifications.SquadRegroupPrompt.ToastLabel.JoinANewServer",
		Join = "Notifications.SquadRegroupPrompt.ToastAction.Join"
	})
	local UseSelectorResult = UseSelectorFunction((React.useCallback(function(p2)
		return p2.Squad and (p2.Squad.Squad and p2.Squad.Squad.currentExperienceInvite)
	end, {})))
	local UseCurrentSquadIdResult = UseCurrentSquadIdFunction()
	local UseSelectorResult1 = UseSelectorFunction((React.useCallback(function(p2)
		-- upvalues: p1 (copy)
		return p2 and (p2.Squad and (p2.Squad.Presence and (p2.Squad.Presence.byUserId and p2.Squad.Presence.byUserId[tostring(p1.localUserId)])))
	end, { p1.localUserId })))
	local RootPlaceId = UseSelectorResult1 and UseSelectorResult1.rootPlaceId or nil
	local UniverseId = UseSelectorResult1 and (UseSelectorResult1.universeId or UseSelectorResult1.gameId) or nil
	local RbxthumbWithTypeSizeAndOptions = if UniverseId == nil then nil else GetRbxthumbWithTypeSizeAndOptionsFunction(tostring(UniverseId), Constants.RbxthumbTypes.GameIcon, 150, false)
	
	return React.createElement(Foundation.View, {
		tag = "align-y-center row auto-none size-full radius-medium gap-medium gui-object-defaults padding-x-xlarge padding-y-medium"
	}, {
		Thumbnail = if RbxthumbWithTypeSizeAndOptions then React.createElement(Image, {
			tag = "radius-small bg-surface-100 size-1000",
			LayoutOrder = 1,
			Image = RbxthumbWithTypeSizeAndOptions
		}) else nil,
		TextContainer = React.createElement(Foundation.View, {
			tag = "auto-y fill col gap-xsmall align-x-left gui-object-defaults",
			LayoutOrder = 2
		}, {
			Title = React.createElement(Foundation.Text, {
				LayoutOrder = 1,
				tag = {
					["auto-y text-align-x-left text-no-wrap text-title-medium content-emphasis"] = true,
					["size-full-0 text-truncate-end"] = RegroupTextTruncationFix
				},
				Text = UseLocalizationResult.Title
			}),
			Body = React.createElement(Foundation.Text, {
				LayoutOrder = 2,
				tag = {
					["auto-y content-default text-body-medium text-align-x-left text-no-wrap gui-object-defaults"] = true,
					["size-full-0 text-truncate-end"] = RegroupTextTruncationFix
				},
				Text = UseLocalizationResult.Body
			})
		}),
		JoinButton = React.createElement(Foundation.Button, {
			LayoutOrder = 3,
			text = UseLocalizationResult.Join,
			size = ButtonSize.Medium,
			variant = ButtonVariant.Standard,
			isDisabled = UseSelectorResult ~= nil,
			onActivated = React.useCallback(function()
				-- upvalues: RootPlaceId (copy), LoggerModule (upval), UseDispatchResult (copy), CreateExperienceInviteModule (upval), UseContextResult (copy), SquadExperienceInviteSource (upval), EventNamesModule (upval), UseCurrentSquadIdResult (copy), p1 (copy), UseSelectorResult1 (copy), RbxAnalyticsService (upval), SquadToastActionsAndStates (upval), SquadRegroupEntryPoint (upval)
				if RootPlaceId == nil then
					LoggerModule:warning("SquadRegroupEventReceiver: Join clicked but rootPlaceId is missing from local presence")
					
					return
				else
					UseDispatchResult(CreateExperienceInviteModule(tostring(RootPlaceId), UseContextResult, SquadExperienceInviteSource.Regroup)):andThen(function(Result)
						-- upvalues: UseContextResult (upval), EventNamesModule (upval), UseCurrentSquadIdResult (upval), p1 (upval), UseSelectorResult1 (upval), RbxAnalyticsService (upval), SquadToastActionsAndStates (upval), SquadRegroupEntryPoint (upval)
						UseContextResult.fireSquadAnalytics(EventNamesModule.SquadRegroupButtonClicked, {
							clientTimestamp = os.time(),
							squadId = UseCurrentSquadIdResult,
							initiatorId = p1.localUserId,
							gameInstanceId = UseSelectorResult1.gameId,
							rootPlaceId = UseSelectorResult1.rootPlaceId,
							placeId = UseSelectorResult1.placeId,
							universeId = UseSelectorResult1.universeId,
							playSessionId = RbxAnalyticsService:GetPlaySessionId(),
							experienceInviteId = Result,
							button = SquadToastActionsAndStates.RegroupJoin,
							entryPoint = SquadRegroupEntryPoint.SquadLobbyButton
						})
					end)
				end
			end, {
				UseDispatchResult, CreateExperienceInviteModule, RootPlaceId, UseContextResult,
				UseCurrentSquadIdResult, p1.localUserId, UseSelectorResult1
			})
		})
	})
end