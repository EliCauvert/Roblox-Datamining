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

return {
	[userCtaAction.UnlockExperience] = function(p1)
		-- upvalues: userCtaAction (ref), buttonVariant (ref), inputSize (ref), useGameJoinCardAnalyticsModule (ref), gameJoinCardButtonAction (ref), getTelemetryFieldsModule (ref)
		return {
			id = userCtaAction.UnlockExperience,
			variant = buttonVariant.Emphasis,
			inputSize = inputSize.Medium,
			width = UDim.new(1, 0),
			text = p1.localized[userCtaAction.UnlockExperience],
			onActivated = function()
				-- upvalues: useGameJoinCardAnalyticsModule (copy), gameJoinCardButtonAction (copy), getTelemetryFieldsModule (copy), p1 (ref)
				useGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(gameJoinCardButtonAction.AgeCheckUnlock, getTelemetryFieldsModule(p1))
				p1.joinAgeCheckUpsellFlow()
			end
		}
	end
}