local GameJoinCard = script:FindFirstAncestor("GameJoinCard")
local Parent = GameJoinCard.Parent
local ReactModule = require(Parent.React)
local UserCtaAction = require(Parent.UserCtaCommon).Enums.UserCtaAction
local InputSize = require(Parent.Foundation).Enums.InputSize
local AgeCheckUpsellCTAModule = require(GameJoinCard.Components.AgeCheckUpsellCTA)
local GameJoinCardButtonAction = require(GameJoinCard.Analytics.AnalyticsConstants).GameJoinCardButtonAction
local UseGameJoinCardAnalyticsModule = require(GameJoinCard.Analytics.useGameJoinCardAnalytics)
local _ = require(script.Parent.Types)
local GetTelemetryFieldsModule = require(script.Parent.getTelemetryFields)

return {
	[UserCtaAction.UnlockExperience] = function(p1)
		-- upvalues: UserCtaAction (copy), InputSize (copy), ReactModule (copy), AgeCheckUpsellCTAModule (copy), UseGameJoinCardAnalyticsModule (copy), GameJoinCardButtonAction (copy), GetTelemetryFieldsModule (copy)
		return {
			keepOpenOnActivate = true,
			id = UserCtaAction.UnlockExperience,
			inputSize = InputSize.Medium,
			width = UDim.new(1, 0),
			text = p1.localized[UserCtaAction.UnlockExperience],
			render = function(p2, LayoutOrder)
				-- upvalues: ReactModule (upval), AgeCheckUpsellCTAModule (upval)
				return ReactModule.createElement(AgeCheckUpsellCTAModule, {
					onUnlockPressed = p2.onActivated,
					LayoutOrder = LayoutOrder,
					focusRef = p2.focusRef
				})
			end,
			onActivated = function()
				-- upvalues: UseGameJoinCardAnalyticsModule (upval), GameJoinCardButtonAction (upval), GetTelemetryFieldsModule (upval), p1 (copy)
				UseGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(GameJoinCardButtonAction.AgeCheckUnlock, GetTelemetryFieldsModule(p1))
				p1.joinAgeCheckUpsellFlow()
			end
		}
	end
}