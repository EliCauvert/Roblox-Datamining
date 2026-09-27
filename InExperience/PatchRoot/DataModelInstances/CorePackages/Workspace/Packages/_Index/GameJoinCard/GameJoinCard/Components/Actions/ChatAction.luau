local gameJoinCard = script:FindFirstAncestor("GameJoinCard")
local parent = gameJoinCard.Parent
local foundationModule = require(parent.Foundation)
local socialCommonModule = require(parent.SocialCommon)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local userCtaAction = require(parent.UserCtaCommon).Enums.UserCtaAction
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local chatEntryPointNames = socialCommonModule.Enums.ChatEntryPointNames
local enteredChatFromEntryPoint = socialCommonModule.Actions.EnteredChatFromEntryPoint
local notificationType = robloxAppEnumsModule.NotificationType
local fFlagGameJoinCardChatEntryPointModule = require(gameJoinCard.Flags.FFlagGameJoinCardChatEntryPoint)
local gameJoinCardButtonAction = require(gameJoinCard.Analytics.AnalyticsConstants).GameJoinCardButtonAction
local useGameJoinCardAnalyticsModule = require(gameJoinCard.Analytics.useGameJoinCardAnalytics)
local _ = require(script.Parent.Types)
local getTelemetryFieldsModule = require(script.Parent.getTelemetryFields)

return {
	[userCtaAction.Chat] = function(p1)
		-- upvalues: userCtaAction (ref), buttonVariant (ref), inputSize (ref), useGameJoinCardAnalyticsModule (ref), gameJoinCardButtonAction (ref), getTelemetryFieldsModule (ref), fFlagGameJoinCardChatEntryPointModule (ref), enteredChatFromEntryPoint (ref), chatEntryPointNames (ref), notificationType (ref)
		return {
			id = userCtaAction.Chat,
			variant = buttonVariant.Standard,
			inputSize = inputSize.Medium,
			width = UDim.new(1, 0),
			text = p1.localized[userCtaAction.Chat],
			onActivated = function()
				-- upvalues: p1 (ref), useGameJoinCardAnalyticsModule (copy), gameJoinCardButtonAction (copy), getTelemetryFieldsModule (copy), fFlagGameJoinCardChatEntryPointModule (copy), enteredChatFromEntryPoint (copy), chatEntryPointNames (copy), notificationType (copy)
				if p1.userId == "" then return end
				useGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(gameJoinCardButtonAction.Chat, getTelemetryFieldsModule(p1))
				
				if fFlagGameJoinCardChatEntryPointModule then
					p1.dispatch(enteredChatFromEntryPoint(chatEntryPointNames.GameJoinCard))
				end
				p1.guiService:BroadcastNotification(p1.userId, notificationType.LAUNCH_CONVERSATION)
			end
		}
	end
}