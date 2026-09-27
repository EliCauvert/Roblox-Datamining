local gameJoinCard = script:FindFirstAncestor("GameJoinCard")
local parent = gameJoinCard.Parent
local foundationModule = require(parent.Foundation)
local userCtaAction = require(parent.UserCtaCommon).Enums.UserCtaAction
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local gameJoinCardButtonAction = require(gameJoinCard.Analytics.AnalyticsConstants).GameJoinCardButtonAction
local useGameJoinCardAnalyticsModule = require(gameJoinCard.Analytics.useGameJoinCardAnalytics)
local _ = require(script.Parent.Types)
local getTelemetryFieldsModule = require(script.Parent.getTelemetryFields)
local logGamePlayIntentModule = require(script.Parent.logGamePlayIntent)

return {
	[userCtaAction.JoinExperience] = function(p1)
		-- upvalues: userCtaAction (ref), buttonVariant (ref), inputSize (ref), useGameJoinCardAnalyticsModule (ref), gameJoinCardButtonAction (ref), getTelemetryFieldsModule (ref), logGamePlayIntentModule (ref)
		local experience = p1.experience
		
		return {
			id = userCtaAction.JoinExperience,
			variant = buttonVariant.Emphasis,
			inputSize = inputSize.Medium,
			width = UDim.new(1, 0),
			isLoading = experience.isLoading,
			isDisabled = if experience.isInExperience ~= nil then nil else not experience.isInExperience,
			text = p1.localized[userCtaAction.JoinExperience],
			onActivated = function()
				-- upvalues: p1 (ref), useGameJoinCardAnalyticsModule (copy), gameJoinCardButtonAction (copy), getTelemetryFieldsModule (copy), logGamePlayIntentModule (copy), experience (ref)
				if p1.userId ~= "" then
					useGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(gameJoinCardButtonAction.JoinGame, getTelemetryFieldsModule(p1))
				end
				logGamePlayIntentModule(p1)
				experience.joinExperience()
			end
		}
	end
}