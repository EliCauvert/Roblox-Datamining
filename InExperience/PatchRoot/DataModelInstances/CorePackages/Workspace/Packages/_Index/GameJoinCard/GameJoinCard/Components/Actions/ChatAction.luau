local GameJoinCard = script:FindFirstAncestor("GameJoinCard")
local Parent = GameJoinCard.Parent
local FoundationModule = require(Parent.Foundation)
local SocialCommonModule = require(Parent.SocialCommon)
local UserCtaAction = require(Parent.UserCtaCommon).Enums.UserCtaAction
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local ChatEntryPointNames = SocialCommonModule.Enums.ChatEntryPointNames
local EnteredChatFromEntryPointFunction = SocialCommonModule.Actions.EnteredChatFromEntryPoint
local NotificationType = require(Parent.RobloxAppEnums).NotificationType
local FFlagGameJoinCardChatEntryPointModule = require(GameJoinCard.Flags.FFlagGameJoinCardChatEntryPoint)
local GameJoinCardButtonAction = require(GameJoinCard.Analytics.AnalyticsConstants).GameJoinCardButtonAction
local UseGameJoinCardAnalyticsModule = require(GameJoinCard.Analytics.useGameJoinCardAnalytics)
local _ = require(script.Parent.Types)
local GetTelemetryFieldsModule = require(script.Parent.getTelemetryFields)

return {
	[UserCtaAction.Chat] = function(p1)
		-- upvalues: UserCtaAction (copy), ButtonVariant (copy), InputSize (copy), UseGameJoinCardAnalyticsModule (copy), GameJoinCardButtonAction (copy), GetTelemetryFieldsModule (copy), FFlagGameJoinCardChatEntryPointModule (copy), EnteredChatFromEntryPointFunction (copy), ChatEntryPointNames (copy), NotificationType (copy)
		return {
			id = UserCtaAction.Chat,
			variant = ButtonVariant.Standard,
			inputSize = InputSize.Medium,
			width = UDim.new(1, 0),
			text = p1.localized[UserCtaAction.Chat],
			onActivated = function()
				-- upvalues: p1 (copy), UseGameJoinCardAnalyticsModule (upval), GameJoinCardButtonAction (upval), GetTelemetryFieldsModule (upval), FFlagGameJoinCardChatEntryPointModule (upval), EnteredChatFromEntryPointFunction (upval), ChatEntryPointNames (upval), NotificationType (upval)
				if p1.userId == "" then return end
				UseGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(GameJoinCardButtonAction.Chat, GetTelemetryFieldsModule(p1))
				
				if FFlagGameJoinCardChatEntryPointModule then
					p1.dispatch(EnteredChatFromEntryPointFunction(ChatEntryPointNames.GameJoinCard))
				end
				p1.guiService:BroadcastNotification(p1.userId, NotificationType.LAUNCH_CONVERSATION)
			end
		}
	end
}