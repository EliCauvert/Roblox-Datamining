local GameJoinCard = script:FindFirstAncestor("GameJoinCard")
local Parent = GameJoinCard.Parent
local FoundationModule = require(Parent.Foundation)
local UserCtaAction = require(Parent.UserCtaCommon).Enums.UserCtaAction
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local GameJoinCardButtonAction = require(GameJoinCard.Analytics.AnalyticsConstants).GameJoinCardButtonAction
local UseGameJoinCardAnalyticsModule = require(GameJoinCard.Analytics.useGameJoinCardAnalytics)
local _ = require(script.Parent.Types)
local GetTelemetryFieldsModule = require(script.Parent.getTelemetryFields)
local LogGamePlayIntentModule = require(script.Parent.logGamePlayIntent)

return {
	[UserCtaAction.JoinExperience] = function(p1) --[[ Line: 18 ]]
		-- upvalues: UserCtaAction (copy), ButtonVariant (copy), InputSize (copy), UseGameJoinCardAnalyticsModule (copy), GameJoinCardButtonAction (copy), GetTelemetryFieldsModule (copy), LogGamePlayIntentModule (copy)
		local Experience = p1.experience
		
		return {
			id = UserCtaAction.JoinExperience,
			variant = ButtonVariant.Emphasis,
			inputSize = InputSize.Medium,
			width = UDim.new(1, 0),
			isLoading = Experience.isLoading,
			isDisabled = if Experience.isInExperience == nil then nil else not Experience.isInExperience,
			text = p1.localized[UserCtaAction.JoinExperience],
			onActivated = function() --[[ Line: 28 ]]
				-- upvalues: p1 (copy), UseGameJoinCardAnalyticsModule (upval), GameJoinCardButtonAction (upval), GetTelemetryFieldsModule (upval), LogGamePlayIntentModule (upval), Experience (copy)
				if p1.userId ~= "" then
					UseGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(GameJoinCardButtonAction.JoinGame, GetTelemetryFieldsModule(p1))
				end
				LogGamePlayIntentModule(p1)
				Experience.joinExperience()
			end
		}
	end
}