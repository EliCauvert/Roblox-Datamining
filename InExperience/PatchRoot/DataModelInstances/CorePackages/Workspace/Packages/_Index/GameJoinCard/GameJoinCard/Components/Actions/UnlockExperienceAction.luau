local gameJoinCard = script:FindFirstAncestor("GameJoinCard")
local parent = gameJoinCard.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local userCtaAction = require(parent.UserCtaCommon).Enums.UserCtaAction
local inputSize = foundationModule.Enums.InputSize
local ageCheckUpsellCTAModule = require(gameJoinCard.Components.AgeCheckUpsellCTA)
local gameJoinCardButtonAction = require(gameJoinCard.Analytics.AnalyticsConstants).GameJoinCardButtonAction
local useGameJoinCardAnalyticsModule = require(gameJoinCard.Analytics.useGameJoinCardAnalytics)
local _ = require(script.Parent.Types)
local getTelemetryFieldsModule = require(script.Parent.getTelemetryFields)

return {
	[userCtaAction.UnlockExperience] = function(p1)
		-- upvalues: userCtaAction (ref), inputSize (ref), reactModule (ref), ageCheckUpsellCTAModule (ref), useGameJoinCardAnalyticsModule (ref), gameJoinCardButtonAction (ref), getTelemetryFieldsModule (ref)
		return {
			keepOpenOnActivate = true,
			id = userCtaAction.UnlockExperience,
			inputSize = inputSize.Medium,
			width = UDim.new(1, 0),
			text = p1.localized[userCtaAction.UnlockExperience],
			render = function(p2, p3)
				-- upvalues: reactModule (copy), ageCheckUpsellCTAModule (copy)
				return reactModule.createElement(ageCheckUpsellCTAModule, { onUnlockPressed = p2.onActivated, LayoutOrder = p3 })
			end,
			onActivated = function()
				-- upvalues: useGameJoinCardAnalyticsModule (copy), gameJoinCardButtonAction (copy), getTelemetryFieldsModule (copy), p1 (ref)
				useGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(gameJoinCardButtonAction.AgeCheckUnlock, getTelemetryFieldsModule(p1))
				p1.joinAgeCheckUpsellFlow()
			end
		}
	end
}